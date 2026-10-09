import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { classify } from "./check-omp-compat.mjs";

const config = Bun.YAML.parse(readFileSync("config/agent/config.yml", "utf8"));
const record = Bun.YAML.parse(readFileSync("config/agent/omp-compatibility.yml", "utf8"));
const c = structuredClone(config);
const verifiedRecord = {
  ...record,
  last_verified: {
    omp_version: "18.8.7",
    revision: "f261ed9faf16b61880b544f599876bface4ded0d",
    date: "2026-10-09",
    evidence: "synthetic classifier fixture; not a production verification receipt",
    mode: "known-patched",
    behavior: { luna_direct: "PASS", luna_slow_luna: "PASS", plan_mode_luna: "PASS" },
  },
};

const unverifiedRecord = structuredClone(record);
unverifiedRecord.last_verified = null;
assert.ok(record.critical_upstream_paths.includes("packages/coding-agent/src/prompts/system/system-prompt.md"));
assert.equal(classify({ version: "18.8.7", record: unverifiedRecord, config: c, promptMode: "known-patched" }).status, "NOT VERIFIED", "version match alone is not verification");
assert.equal(classify({ version: "18.8.8", record: verifiedRecord, config: c, promptMode: "known-patched" }).status, "NOT VERIFIED", "unknown version cannot inherit baseline verification");
assert.equal(classify({ version: "18.8.7", record: verifiedRecord, config: c, promptMode: "unknown" }).status, "REVIEW REQUIRED", "unknown prompt semantics must fail closed");
assert.equal(classify({ version: "18.8.7", record: verifiedRecord, config: c, promptMode: "known-patched", criticalChanges: [record.critical_upstream_paths[0]] }).status, "REVIEW REQUIRED");
assert.equal(classify({ version: "18.8.7", record: verifiedRecord, config: c, promptMode: "known-patched" }).status, "VERIFIED");

const nativeRecord = structuredClone(verifiedRecord);
nativeRecord.last_verified.mode = "native-compatible";
assert.equal(classify({ version: "18.8.7", record: nativeRecord, config: c, promptMode: "native-compatible" }).status, "VERIFIED", "native-compatible prompt needs its own verified receipt");
assert.equal(classify({ version: "18.8.7", record: nativeRecord, config: c, promptMode: "known-patched" }).status, "NOT VERIFIED", "a stale append must not mask a native-compatible baseline");

const broken = structuredClone(c);
broken.modelRoles.default = "openai-codex/gpt-6.1-sol:medium";
assert.equal(classify({ version: "18.8.7", record: verifiedRecord, config: broken, promptMode: "known-patched" }).status, "INCOMPATIBLE");
const fallbackEnabled = structuredClone(c);
fallbackEnabled.retry.modelFallback = true;
assert.equal(classify({ version: "18.8.7", record: verifiedRecord, config: fallbackEnabled, promptMode: "known-patched" }).status, "INCOMPATIBLE");
const incompleteRecord = structuredClone(record);
incompleteRecord.critical_behavior = ["luna-direct"];
assert.equal(classify({ version: "18.8.7", record: incompleteRecord, config: c, promptMode: "known-patched" }).status, "INCOMPATIBLE");
console.log("OMP compatibility classifier: known-patched/native-compatible modes, unknown semantics, critical drift, prompt overrides, Candidate C mismatch, fallback and receipt boundaries passed.");
