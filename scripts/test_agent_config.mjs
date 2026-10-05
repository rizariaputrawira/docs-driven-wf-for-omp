import assert from "node:assert/strict";
import { readdirSync, readFileSync } from "node:fs";

const configPath = "config/agent/config.yml";
const agentDir = "config/agent/agents";
const roles = {
  scout: "smol", routine: "routine", task: "task", reviewer: "task",
  "security-reviewer": "task", slow: "slow", advisor: "advisor",
};
function parseYaml(text, path) {
  try {
    const parsed = Bun.YAML.parse(text);
    assert.ok(parsed && typeof parsed === "object" && !Array.isArray(parsed), "expected YAML mapping");
    return parsed;
  } catch (error) { throw new Error(`${path}: ${error.message}`); }
}
function frontmatter(text, path) {
  const match = /^---\r?\n([\s\S]*?)\r?\n---(?:\r?\n|$)/.exec(text);
  assert.ok(match, `${path}: missing/malformed frontmatter`);
  return parseYaml(match[1], path);
}
function validate(config, definitions) {
  const names = new Set();
  for (const [path, text] of definitions) {
    const data = frontmatter(text, path);
    assert.ok(Object.hasOwn(roles, data.name), `${path}: unmapped agent ${data.name}`);
    assert.ok(!names.has(data.name), `${path}: duplicate agent ${data.name}`);
    names.add(data.name);
    const alias = `@${roles[data.name]}`;
    assert.deepEqual(Array.isArray(data.model) ? data.model : [data.model], [alias], `${path}: model alias`);
    const expectedEffort = data.name === "advisor" ? "high" : "medium";
    assert.equal(data.thinkingLevel ?? config.defaultThinkingLevel, expectedEffort, `${path}: thinking level`);
    assert.equal(config.task?.agentModelOverrides?.[data.name], alias, `${configPath}: ${data.name} override`);
    const model = ["slow", "advisor"].includes(data.name) ? "gpt-6.1-sol" : "gpt-6-luna";
    assert.equal(config.modelRoles?.[roles[data.name]], `openai-codex/${model}:${expectedEffort}`, `${configPath}: ${roles[data.name]} selector`);
  }
  for (const name of Object.keys(roles)) assert.ok(names.has(name), `${agentDir}/${name}.md: missing definition`);
  assert.deepEqual(Object.keys(config.task.agentModelOverrides).sort(), Object.keys(roles).sort(), `${configPath}: managed override names`);
}
const config = parseYaml(readFileSync(configPath, "utf8"), configPath);
const definitions = readdirSync(agentDir).filter((name) => name.endsWith(".md"))
  .map((name) => [`${agentDir}/${name}`, readFileSync(`${agentDir}/${name}`, "utf8")]);
validate(config, definitions);
function rejects(name, mutate, expected) {
  const cfg = structuredClone(config);
  const defs = definitions.map(([path, text]) => [path, text]);
  mutate(cfg, defs);
  assert.throws(() => validate(cfg, defs), expected, name);
}
rejects("missing definition", (_, defs) => defs.splice(defs.findIndex(([path]) => path.endsWith("/slow.md")), 1), /slow\.md: missing/);
rejects("malformed frontmatter", (_, defs) => { defs[0][1] = "---\nname: [\n---\n"; }, /config\/agent\/agents\//);
rejects("duplicate definition", (_, defs) => defs.push(defs[0]), /duplicate agent/);
rejects("unmapped definition", (_, defs) => defs.push([`${agentDir}/unknown.md`, "---\nname: unknown\n---\n"]), /unknown\.md: unmapped/);
for (const name of ["slow", "advisor"]) {
  rejects(`${name} alias`, (cfg) => { cfg.task.agentModelOverrides[name] = "@task"; }, new RegExp(`${name} override`));
  rejects(`${name} effort`, (_, defs) => {
    const row = defs.find(([path]) => path.endsWith(`/${name}.md`));
    row[1] = row[1].replace(/thinkingLevel: \w+/, `thinkingLevel: ${name === "advisor" ? "medium" : "high"}`);
  }, /thinking level/);
  rejects(`${name} concrete selector`, (cfg) => { cfg.modelRoles[name] = "openai-codex/gpt-6-luna:medium"; }, new RegExp(`${name} selector`));
}
console.log("Agent configuration contract: seven definitions, native overrides and selectors agree; 10 negative cases passed. Static configuration is not dispatch proof.");
