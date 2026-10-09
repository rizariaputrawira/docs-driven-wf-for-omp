import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import { classify } from "./check-omp-compat.mjs";

const config = Bun.YAML.parse(readFileSync("config/agent/config.yml", "utf8"));
const record = Bun.YAML.parse(readFileSync("config/agent/omp-compatibility.yml", "utf8"));
const c = structuredClone(config);
const verifiedRecord = {
  ...record,
  last_verified: {
    omp_version: "18.8.6",
    revision: "f068751e2f1dbdbc195977776d47a26db8697495",
    date: "2026-10-09",
    evidence: "synthetic classifier fixture; not a production verification receipt",
    behavior: { luna_direct: "PASS", luna_slow_luna: "PASS", plan_mode_luna: "PASS" },
  },
};

assert.ok(record.critical_upstream_paths.includes("packages/coding-agent/src/prompts/system/system-prompt.md"));
assert.equal(classify({ version: "18.8.6", record, config: c }).status, "NOT VERIFIED", "version match alone is not verification");
assert.equal(classify({ version: "18.8.7", record: verifiedRecord, config: c }).status, "NOT VERIFIED", "unknown version cannot inherit baseline verification");
assert.equal(classify({ version: "18.8.6", record: verifiedRecord, config: c, promptFiles: false }).status, "NOT VERIFIED");
assert.equal(classify({ version: "18.8.6", record: verifiedRecord, config: c, criticalChanges: [record.critical_upstream_paths[0]] }).status, "REVIEW REQUIRED");
assert.equal(classify({ version: "18.8.6", record: verifiedRecord, config: c }).status, "VERIFIED");
const broken = structuredClone(c);
broken.modelRoles.default = "openai-codex/gpt-6.1-sol:medium";
assert.equal(classify({ version: "18.8.6", record: verifiedRecord, config: broken }).status, "INCOMPATIBLE");
const fallbackEnabled = structuredClone(c);
fallbackEnabled.retry.modelFallback = true;
assert.equal(classify({ version: "18.8.6", record: verifiedRecord, config: fallbackEnabled }).status, "INCOMPATIBLE");
const incompleteRecord = structuredClone(record);
incompleteRecord.critical_behavior = ["luna-direct"];
assert.equal(classify({ version: "18.8.6", record: incompleteRecord, config: c }).status, "INCOMPATIBLE");
console.log("OMP compatibility classifier: version, critical drift, prompt override, Candidate C mismatch, fallback, record integrity and verified-receipt boundaries passed.");
