#!/usr/bin/env bun
import { existsSync, readFileSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { spawnSync } from "node:child_process";

const scriptDir = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(scriptDir, "..");
const sourceRecordPath = resolve(repoRoot, "config/agent/omp-compatibility.yml");
const installedRecordPath = resolve(scriptDir, "../omp-compatibility.yml");
const sourceMode = existsSync(sourceRecordPath);
const recordPath = sourceMode ? sourceRecordPath : installedRecordPath;
const agentDir = sourceMode ? resolve(repoRoot, "config/agent") : resolve(scriptDir, "..");
const configPath = resolve(agentDir, "config.yml");


function parseArgs(args) {
  const parsed = { candidate: undefined };
  for (let index = 0; index < args.length; index += 1) {
    if (args[index] === "--candidate" && args[index + 1]) parsed.candidate = args[++index];
    else throw new Error(`Unknown or incomplete argument: ${args[index]}`);
  }
  if (parsed.candidate && !/^\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?$/.test(parsed.candidate)) {
    throw new Error("--candidate must be an OMP version such as 18.8.6");
  }
  return parsed;
}

function validateConfig(config) {
  const roles = config?.modelRoles;
  const expected = {
    default: "openai-codex/gpt-6-luna:medium",
    plan: "openai-codex/gpt-6-luna:medium",
    smol: "openai-codex/gpt-6-luna:medium",
    routine: "openai-codex/gpt-6-luna:medium",
    task: "openai-codex/gpt-6-luna:medium",
    slow: "openai-codex/gpt-6.1-sol:medium",
    advisor: "openai-codex/gpt-6.1-sol:high",
  };
  for (const [role, selector] of Object.entries(expected)) {
    if (roles?.[role] !== selector) throw new Error(`required model role ${role} is ${String(roles?.[role])}, expected ${selector}`);
  }
  if (config?.advisor?.enabled !== false) throw new Error("global advisor must be disabled");
  if (config?.task?.eager !== "default") throw new Error("task.eager must remain default to preserve zero-worker behavior");
  if (config?.task?.maxConcurrency !== 3 || config?.task?.maxRecursionDepth !== 1) {
    throw new Error("task concurrency/depth differs from the required Candidate C bounds");
  }
  if (config?.modelRoleStorage !== "global") throw new Error("modelRoleStorage must remain global");
  if (config?.prewalk?.enabled !== false || config?.task?.prewalk !== false) throw new Error("prewalk must remain disabled");
  if (config?.retry?.modelFallback !== false || config?.retry?.usageAwareFallback !== false ||
      Object.keys(config?.retry?.fallbackChains ?? {}).length !== 0) {
    throw new Error("model fallback must remain disabled");
  }
  const overrides = {
    scout: "@smol", routine: "@routine", task: "@task", reviewer: "@task",
    "security-reviewer": "@task", slow: "@slow", advisor: "@advisor",
  };
  for (const [agent, selector] of Object.entries(overrides)) {
    if (config?.task?.agentModelOverrides?.[agent] !== selector) {
      throw new Error(`agent model override ${agent} differs from ${selector}`);
    }
  }
  if (config?.task?.agentAdvisor?.advisor !== "off") throw new Error("advisor agent must remain disabled");
}

function validateRecord(record) {
  if (record?.schema !== 1 || record.project !== "omp-docflow") throw new Error("unsupported OMP compatibility record");
  if (!/^\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?$/.test(record.source_reviewed?.omp_version ?? "")) {
    throw new Error("source_reviewed.omp_version is missing or invalid");
  }
  if (!/^[0-9a-f]{40}$/i.test(record.source_reviewed?.revision ?? "")) throw new Error("source_reviewed.revision must be a full Git commit");
  if (!Array.isArray(record.critical_upstream_paths) || record.critical_upstream_paths.length === 0 ||
      record.critical_upstream_paths.some(path => typeof path !== "string" || !path.startsWith("packages/"))) {
    throw new Error("critical_upstream_paths must be a non-empty list of official source paths");
  }
  if (new Set(record.critical_upstream_paths).size !== record.critical_upstream_paths.length) {
    throw new Error("critical_upstream_paths contains duplicates");
  }
  const capabilities = ["model-roles", "agent-model-overrides", "task-dispatch", "plan-mode", "prompt-customization", "tool-call-extension"];
  if (!capabilities.every(capability => record.required_capabilities?.includes(capability))) {
    throw new Error("required_capabilities omits a Candidate C dependency");
  }
  const behavior = ["luna-direct", "luna-slow-luna", "plan-mode-luna"];
  if (!behavior.every(invariant => record.critical_behavior?.includes(invariant))) {
    throw new Error("critical_behavior omits a Candidate C invariant");
  }
  const expectedRoles = { default: "luna-medium", plan: "luna-medium", slow: "sol-medium", advisor: "sol-high" };
  for (const [role, value] of Object.entries(expectedRoles)) {
    if (record.candidate_c?.[role] !== value) throw new Error(`compatibility record Candidate C ${role} must be ${value}`);
  }
}


export function classify({ version, record, config, criticalChanges = [], promptFiles = true }) {
  try {
    validateRecord(record);
    validateConfig(config);
  } catch (error) {
    return { status: "INCOMPATIBLE", reason: error.message, criticalChanges };
  }
  if (!promptFiles) {
    return { status: "NOT VERIFIED", reason: "APPEND_SYSTEM.md is absent or a SYSTEM.md/SYSTEM_TEMPLATE.md override is active", criticalChanges };
  }
  const baseline = record.last_verified;
  if (criticalChanges.length > 0) {
    return { status: "REVIEW REQUIRED", reason: "a tracked OMP interface changed since the verified baseline", criticalChanges };
  }
  if (!baseline || baseline.omp_version !== version || !/^[0-9a-f]{40}$/i.test(baseline.revision ?? "") ||
      !baseline.date || !baseline.evidence ||
      baseline.behavior?.luna_direct !== "PASS" || baseline.behavior?.luna_slow_luna !== "PASS" ||
      baseline.behavior?.plan_mode_luna !== "PASS") {
    return { status: "NOT VERIFIED", reason: "no matching version with all three Candidate C runtime receipts and evidence reference", criticalChanges };
  }
  return { status: "VERIFIED", reason: "version, tracked interface gate and recorded Candidate C runtime receipts match", criticalChanges };
}

async function resolveCommit(version) {
  const response = await fetch(`https://api.github.com/repos/can1357/oh-my-pi/commits/v${encodeURIComponent(version)}`, {
    headers: { accept: "application/vnd.github+json", "user-agent": "omp-docflow-compat-check" },
  });
  if (!response.ok) throw new Error(`official OMP tag lookup failed (${response.status})`);
  const commit = await response.json();
  if (!/^[0-9a-f]{40}$/i.test(commit.sha ?? "")) throw new Error("official OMP tag did not resolve to a commit");
  return commit.sha;
}

async function changedCriticalPaths(base, candidate, trackedPaths) {
  const response = await fetch(`https://api.github.com/repos/can1357/oh-my-pi/compare/${base}...${candidate}`, {
    headers: { accept: "application/vnd.github+json", "user-agent": "omp-docflow-compat-check" },
  });
  if (!response.ok) throw new Error(`official OMP compare failed (${response.status})`);
  const comparison = await response.json();
  if (!Array.isArray(comparison.files)) throw new Error("official OMP compare omitted changed-file evidence");
  if (comparison.files.length >= 300) throw new Error("official OMP compare may be truncated at 300 files");
  const changed = new Set(comparison.files.map(file => file.filename));
  return trackedPaths.filter(path => changed.has(path));
}

function loadYaml(path) {
  if (!existsSync(path)) throw new Error(`required file is missing: ${path}`);
  const parsed = Bun.YAML.parse(readFileSync(path, "utf8"));
  if (!parsed || typeof parsed !== "object" || Array.isArray(parsed)) throw new Error(`expected YAML mapping: ${path}`);
  return parsed;
}

function installedVersion() {
  const result = spawnSync("omp", ["--version"], { encoding: "utf8" });
  if (result.status !== 0) throw new Error(`cannot read installed OMP version: ${result.stderr.trim()}`);
  const match = /omp\/(\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?)/.exec(result.stdout);
  if (!match) throw new Error(`unrecognized OMP version output: ${result.stdout.trim()}`);
  return match[1];
}

function verifyEffectiveAgentDir() {
  if (sourceMode) return;
  const result = spawnSync("omp", ["config", "path"], { encoding: "utf8" });
  if (result.status !== 0) throw new Error(`cannot read effective OMP agent directory: ${result.stderr.trim()}`);
  const effectiveDir = resolve(result.stdout.trim());
  if (effectiveDir !== agentDir) throw new Error(`checker is outside the effective OMP agent directory (${effectiveDir})`);
}

function readEffectiveConfig() {
  function setting(key) {
    const result = spawnSync("omp", ["config", "get", key], { encoding: "utf8" });
    if (result.status !== 0) throw new Error(`cannot read effective OMP setting ${key}: ${result.stderr.trim()}`);
    const output = result.stdout.trim();
    try {
      return JSON.parse(output);
    } catch {
      return output;
    }
  }
  return {
    modelRoles: setting("modelRoles"),
    advisor: { enabled: setting("advisor.enabled") },
    task: {
      eager: setting("task.eager"),
      maxConcurrency: setting("task.maxConcurrency"),
      maxRecursionDepth: setting("task.maxRecursionDepth"),
      prewalk: setting("task.prewalk"),
      agentModelOverrides: setting("task.agentModelOverrides"),
      agentAdvisor: setting("task.agentAdvisor"),
    },
    modelRoleStorage: setting("modelRoleStorage"),
    prewalk: { enabled: setting("prewalk.enabled") },
    retry: {
      modelFallback: setting("retry.modelFallback"),
      usageAwareFallback: setting("retry.usageAwareFallback"),
      fallbackChains: setting("retry.fallbackChains"),
    },
  };
}


async function main() {
  let args;
  let record;
  let config;
  try {
    args = parseArgs(process.argv.slice(2));
    record = loadYaml(recordPath);
    config = loadYaml(configPath);
    validateConfig(config);
    validateRecord(record);
  } catch (error) {
    console.error(`OMP compatibility: INCOMPATIBLE\n${error.message}`);
    process.exitCode = 1;
    return;
  }
  let version;
  try {
    version = args.candidate ?? installedVersion();
  } catch (error) {
    console.log(`OMP compatibility: NOT VERIFIED\n${error.message}`);
    process.exitCode = 2;
    return;
  }
  let effectiveConfig;
  try {
    verifyEffectiveAgentDir();
    effectiveConfig = readEffectiveConfig();
  } catch (error) {
    console.log(`OMP compatibility: NOT VERIFIED\n${error.message}`);
    process.exitCode = 2;
    return;
  }
  try {
    validateConfig(effectiveConfig);
  } catch (error) {
    console.log(`OMP compatibility: INCOMPATIBLE\n${error.message}`);
    process.exitCode = 1;
    return;
  }
  const projectDir = process.cwd();
  const projectAppend = resolve(projectDir, "APPEND_SYSTEM.md");
  const appendPath = existsSync(projectAppend) ? projectAppend : resolve(agentDir, "APPEND_SYSTEM.md");
  const appendText = existsSync(appendPath) ? readFileSync(appendPath, "utf8") : "";
  const promptFiles = appendText.includes("PERSONALITY.md") &&
    appendText.includes("bounded decision consultation") &&
    !existsSync(resolve(agentDir, "SYSTEM.md")) &&
    !existsSync(resolve(agentDir, "SYSTEM_TEMPLATE.md")) &&
    !existsSync(resolve(projectDir, "SYSTEM.md")) &&
    !existsSync(resolve(projectDir, "SYSTEM_TEMPLATE.md"));
  let criticalChanges = [];
  const baseline = record.last_verified ?? record.source_reviewed;
  try {
    if (version !== baseline.omp_version) {
      const [baseCommit, candidateCommit] = await Promise.all([
        baseline.revision ? Promise.resolve(baseline.revision) : resolveCommit(baseline.omp_version),
        resolveCommit(version),
      ]);
      criticalChanges = await changedCriticalPaths(baseCommit, candidateCommit, record.critical_upstream_paths);
    }
  } catch (error) {
    console.log(`OMP compatibility: NOT VERIFIED\nVersion: ${version}\n${error.message}`);
    process.exitCode = 2;
    return;
  }
  const result = classify({ version, record, config: effectiveConfig, criticalChanges, promptFiles });
  console.log(`OMP compatibility: ${result.status}`);
  console.log(`Version: ${version}`);
  console.log(`Comparison baseline: ${baseline.omp_version} (${baseline.revision ?? "tag lookup"})`);
  if (result.criticalChanges.length) console.log(`Changed critical surfaces:\n${result.criticalChanges.map(path => `- ${path}`).join("\n")}`);
  console.log(result.reason);
  if (result.status === "INCOMPATIBLE") process.exitCode = 1;
  else if (result.status !== "VERIFIED") process.exitCode = 2;
}

if (import.meta.main) await main();
