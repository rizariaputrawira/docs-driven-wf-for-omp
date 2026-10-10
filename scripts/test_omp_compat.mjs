import assert from "node:assert/strict";
import { createHash } from "node:crypto";
import { mkdtempSync, mkdirSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { classify, compareTrackedSources, HARD_CRITICAL_PATHS, WATCHED_PATHS, resolvePromptDiscovery } from "./check-omp-compat.mjs";

const config = Bun.YAML.parse(readFileSync("config/agent/config.yml", "utf8"));
const record = Bun.YAML.parse(readFileSync("config/agent/omp-compatibility.yml", "utf8"));
const managedAppend = readFileSync("config/agent/APPEND_SYSTEM.md", "utf8");
const managedHash = createHash("sha256").update(managedAppend).digest("hex");
const verifiedRecord = structuredClone(record);
assert.equal(verifiedRecord.last_verified.revision, verifiedRecord.source_reviewed.revision);
const good = (patch = {}) => classify({ version: "18.8.7", record: verifiedRecord, config, promptMode: "known-patched", ...patch });

assert.equal(good().status, "VERIFIED", "same version and matching receipts pass");
assert.equal(classify({ version: "unknown", record: verifiedRecord, config, promptMode: "known-patched" }).status, "NOT VERIFIED", "unknown OMP version is not a supported release");
assert.equal(classify({ version: "18.8.7", record: { ...verifiedRecord, last_verified: null }, config, promptMode: "known-patched" }).status, "NOT VERIFIED", "version alone cannot verify runtime behavior");
assert.equal(good({ hardCriticalChanges: [HARD_CRITICAL_PATHS[0]] }).status, "REVIEW REQUIRED", "changed hard-critical contract requires review");
const watched = good({ watchedChanges: [WATCHED_PATHS[0]] });
assert.equal(watched.status, "REVIEW REQUIRED", "watched source asks only for focused checks");
assert.match(watched.reason, /no implied routing-architecture invalidation/);
assert.equal(good({ promptMode: "unknown" }).status, "REVIEW REQUIRED");

const wrongMain = structuredClone(config);
wrongMain.modelRoles.default = "openai-codex/gpt-6.1-sol:medium";
assert.equal(good({ config: wrongMain }).status, "INCOMPATIBLE", "wrong main model is incompatible");
const wrongSlow = structuredClone(config);
wrongSlow.modelRoles.slow = "openai-codex/gpt-6-luna:medium";
assert.equal(good({ config: wrongSlow }).status, "INCOMPATIBLE", "wrong slow model is incompatible");
const fallbackEnabled = structuredClone(config);
fallbackEnabled.retry.modelFallback = true;
assert.equal(good({ config: fallbackEnabled }).status, "INCOMPATIBLE", "model fallback must remain disabled");
const driftedRecord = structuredClone(verifiedRecord);
driftedRecord.candidate_c.slow = "luna-medium";
assert.equal(good({ record: driftedRecord }).status, "INCOMPATIBLE", "compatibility receipt drift fails closed");

const root = mkdtempSync(join(tmpdir(), "omp-prompt-discovery-"));
try {
  const cwd = join(root, "work");
  const agentDir = join(root, "home", ".omp", "agent");
  mkdirSync(cwd, { recursive: true });
  mkdirSync(agentDir, { recursive: true });
  const globalPath = join(agentDir, "APPEND_SYSTEM.md");
  writeFileSync(globalPath, managedAppend);
  const global = resolvePromptDiscovery({ cwd, agentDir, home: join(root, "home"), enabledProviders: [], disabledProviders: [], env: {}, appendHash: managedHash });
  assert.equal(global.mode, "known-patched", "global Candidate C append is effective and recognized");
  assert.equal(global.effectiveAppend, globalPath);

  mkdirSync(join(cwd, ".omp"), { recursive: true });
  const projectAppend = join(cwd, ".omp", "APPEND_SYSTEM.md");
  writeFileSync(projectAppend, "project append");
  const shadowed = resolvePromptDiscovery({ cwd, agentDir, home: join(root, "home"), enabledProviders: [], disabledProviders: [], env: {}, appendHash: managedHash });
  assert.equal(shadowed.mode, "unknown", "project append shadows the managed global clarification");
  assert.equal(shadowed.effectiveAppend, projectAppend);
  assert.match(shadowed.reason, /project-level/);
  rmSync(projectAppend);

  for (const name of ["SYSTEM.md", "SYSTEM_TEMPLATE.md"]) {
    const override = join(cwd, ".omp", name);
    writeFileSync(override, "native prompt override");
    const result = resolvePromptDiscovery({ cwd, agentDir, home: join(root, "home"), enabledProviders: [], disabledProviders: [], env: {}, appendHash: managedHash });
    assert.equal(result.mode, "incompatible", `${name} overrides stock native prompt`);
    assert.ok(result.overrides.includes(override));
    rmSync(override);
  }

  const claudeAppend = join(root, "home", ".claude", "APPEND_SYSTEM.md");
  mkdirSync(join(root, "home", ".claude"), { recursive: true });
  writeFileSync(claudeAppend, "foreign user append");
  rmSync(globalPath);
  const enabledClaude = resolvePromptDiscovery({ cwd, agentDir, home: join(root, "home"), enabledProviders: ["claude"], disabledProviders: [], env: {}, appendHash: managedHash });
  assert.equal(enabledClaude.effectiveAppend, claudeAppend, "enabled foreign user providers participate in native discovery");
  const disabledClaude = resolvePromptDiscovery({ cwd, agentDir, home: join(root, "home"), enabledProviders: ["claude"], disabledProviders: ["claude"], env: {}, appendHash: managedHash });
  assert.equal(disabledClaude.mode, "native-compatible", "disabled foreign providers are excluded from user discovery");

  writeFileSync(globalPath, "unknown append");
  const unknownHash = resolvePromptDiscovery({ cwd, agentDir, home: join(root, "home"), enabledProviders: [], disabledProviders: [], env: {}, appendHash: managedHash });
  assert.equal(unknownHash.mode, "unknown", "unrecognized append hash never passes");
} finally {
  rmSync(root, { recursive: true, force: true });
}

const sameCalls = [];
const unchanged = await compareTrackedSources("base", "candidate", [HARD_CRITICAL_PATHS[0]], async url => {
  sameCalls.push(url);
  return new Response("same exact upstream source");
});
assert.deepEqual(unchanged, { hardCriticalChanges: [], watchedChanges: [] });
assert.equal(sameCalls.length, 2, "exact tracked file comparison fetches only baseline/candidate file content");
assert.ok(sameCalls.every(url => url.includes("raw.githubusercontent.com") && !url.includes("/compare/")), "GitHub compare endpoint and its changed-file truncation are not required");

const changedHard = await compareTrackedSources("base", "candidate", [HARD_CRITICAL_PATHS[0]], async url => new Response(url.includes("/base/") ? "old" : "new"));
assert.deepEqual(changedHard.hardCriticalChanges, [HARD_CRITICAL_PATHS[0]]);
const changedWatched = await compareTrackedSources("base", "candidate", [WATCHED_PATHS[0]], async url => new Response(url.includes("/base/") ? "old" : "new"));
assert.deepEqual(changedWatched.watchedChanges, [WATCHED_PATHS[0]]);

console.log("OMP compatibility tests passed: exact prompt precedence/hash detection; config and receipt drift; source-level hard/watched classification; targeted raw-source comparison without GitHub compare API/truncation.");
