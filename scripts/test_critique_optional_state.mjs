import assert from "node:assert/strict";
import { accessSync, chmodSync, constants, mkdtempSync, mkdirSync, readFileSync, readdirSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { dirname, isAbsolute, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { spawnSync } from "node:child_process";

// Execute the maintained recipe, not a second implementation or source-string oracle.
const repo = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const skill = join(repo, "config/agent/skills/ui-design");
const playbook = readFileSync(join(skill, "reference/critique.md"), "utf8");
const recipes = [...playbook.matchAll(/^   ```python\n([\s\S]*?)^   ```/gm)];
assert.equal(recipes.length, 1, "critique Setup must expose one executable optional-state recipe");
const recipe = recipes[0][1].replace(/^   /gm, "");
const python = process.env.PYTHON3 || (process.platform === "win32" ? "py" : "python3");
const pythonArgs = process.platform === "win32" && !process.env.PYTHON3 ? ["-3", "-"] : ["-"];
const engine = process.env.IMPECCABLE_BIN;
assert.ok(engine && isAbsolute(engine), "Set IMPECCABLE_BIN to an existing absolute engine 0.1.11 binary; this test never downloads it");
accessSync(engine, constants.X_OK);
assert.notEqual(resolve(engine), join(skill, "scripts/impeccable"), "IMPECCABLE_BIN must be the engine, not the launcher");
const root = mkdtempSync(join(tmpdir(), "omp-critique-optional-"));
const critiqueDir = join(root, ".impeccable", "critique");
const ignore = join(critiqueDir, "ignore.md");
function inspect(options = {}) {
  return spawnSync(python, pythonArgs, { cwd: root, input: recipe, encoding: "utf8", ...options });
}
function success(result) {
  assert.ifError(result.error);
  assert.equal(result.status, 0, result.stderr);
  assert.equal(result.stderr, "");
  return result.stdout;
}
function failure(result, diagnostic) {
  assert.ifError(result.error);
  assert.notEqual(result.status, 0);
  assert.equal(result.stdout, "");
  assert.match(result.stderr, diagnostic);
}
function storage(args, meta) {
  const env = { ...process.env, IMPECCABLE_BIN: engine };
  delete env.IMPECCABLE_CONTEXT_DIR;
  delete env.IMPECCABLE_CRITIQUE_META;
  if (meta) env.IMPECCABLE_CRITIQUE_META = JSON.stringify(meta);
  return spawnSync(process.platform === "win32" ? "cmd.exe" : "sh",
    process.platform === "win32"
      ? ["/d", "/c", join(skill, "scripts/impeccable.cmd"), "critique-storage", ...args]
      : [join(skill, "scripts/impeccable"), "critique-storage", ...args],
    { cwd: root, env, encoding: "utf8" });
}
try {
  writeFileSync(join(root, "index.html"), "<main>Critique fixture</main>\n");
  // No .impeccable, no critique directory, and no ignore file are distinct normal cases.
  assert.equal(success(inspect()), "");
  assert.deepEqual(readdirSync(root), ["index.html"]);
  mkdirSync(join(root, ".impeccable"));
  assert.equal(success(inspect()), "");
  assert.deepEqual(readdirSync(join(root, ".impeccable")), []);
  mkdirSync(critiqueDir);
  assert.equal(success(inspect()), "");
  assert.deepEqual(readdirSync(critiqueDir), []);

  const guidance = "ignore only the documented false positive\nUnicode: café\n";
  writeFileSync(ignore, guidance);
  assert.equal(success(inspect()), guidance);
  assert.deepEqual(readdirSync(critiqueDir), ["ignore.md"]);

  // Canonical storage, not discovery, creates snapshots and retains earlier history.
  rmSync(join(root, ".impeccable"), { recursive: true });
  mkdirSync(join(root, ".git")); // Bound project-root resolution to this disposable fixture.
  const slug = success(storage(["slug", "index.html"])).trim();
  assert.ok(slug);
  assert.equal(success(inspect()), "");
  assert.throws(() => readdirSync(join(root, ".impeccable")), { code: "ENOENT" });
  const latest = storage(["latest", "index.html", "--json"]);
  assert.ifError(latest.error);
  assert.equal(latest.status, 2, latest.stderr);
  assert.equal(latest.stderr, "");
  assert.deepEqual(JSON.parse(success(storage(["trend", "index.html", "5"]))), []);
  const body = join(root, "report-body.md");
  const firstBody = "# First critique\n\nA retained report.\n";
  writeFileSync(body, firstBody);
  const meta = { target: "homepage", total_score: 28, max_score: 40, na_heuristics: "", p0_count: 0, p1_count: 1 };
  const first = success(storage(["write", "index.html", body], meta)).trim();
  assert.equal(dirname(first), critiqueDir);
  const firstSnapshot = readFileSync(first, "utf8");
  assert.ok(firstSnapshot.includes(firstBody.trim()));
  writeFileSync(body, "# Second critique\n\nA new report.\n");
  const second = success(storage(["write", "index.html", body], { ...meta, total_score: 32 })).trim();
  assert.equal(dirname(second), critiqueDir);
  assert.notEqual(second, first, "canonical writes must not overwrite history");
  assert.equal(readFileSync(first, "utf8"), firstSnapshot);
  assert.ok(readFileSync(second, "utf8").includes("# Second critique"));
  const trend = JSON.parse(success(storage(["trend", "index.html", "5"])));
  assert.equal(trend.length, 2);
  assert.deepEqual(trend.map(entry => Number(entry.total_score)).sort((a, b) => a - b), [28, 32]);
  const snapshots = readdirSync(critiqueDir).sort();
  assert.equal(success(inspect()), "");
  assert.deepEqual(readdirSync(critiqueDir).sort(), snapshots);

  // Invalid file/parent types must never collapse into absence.
  mkdirSync(ignore);
  failure(inspect(), /not a regular file/);
  rmSync(ignore, { recursive: true });
  rmSync(critiqueDir, { recursive: true });
  writeFileSync(critiqueDir, "not a directory");
  failure(inspect(), /NotADirectoryError|Not a directory|WinError 267/);
  failure(storage(["write", "index.html", body], meta), /Not a directory|not a directory|os error 20/);
  rmSync(critiqueDir);
  mkdirSync(critiqueDir);

  if (process.platform !== "win32") {
    // Root bypasses mode bits: run the exact recipe unprivileged in that case.
    chmodSync(root, 0o755);
    chmodSync(join(root, ".impeccable"), 0o755);
    chmodSync(critiqueDir, 0o755);
    const credentials = process.getuid?.() === 0 ? { uid: 65534, gid: 65534 } : {};
    writeFileSync(ignore, guidance);
    chmodSync(ignore, 0o000);
    try {
      failure(inspect(credentials), /PermissionError|Permission denied/);
    } finally {
      chmodSync(ignore, 0o644);
    }
    rmSync(ignore);
    chmodSync(critiqueDir, 0o000);
    try {
      failure(inspect(credentials), /PermissionError|Permission denied/);
    } finally {
      chmodSync(critiqueDir, 0o755);
    }
  } else {
    console.log("NOT VERIFIED: Windows ACL lookup/read denial; POSIX mode-bit fixtures do not prove Windows permission behavior.");
  }
} finally {
  rmSync(root, { recursive: true, force: true });
}
console.log("Optional critique state: executable documented recipe, absent parents/file, existing ignore, canonical persistence/history, invalid types and platform permission fixtures passed. Not an OMP consumer/model-obedience smoke.");
