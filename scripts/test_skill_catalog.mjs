import assert from "node:assert/strict";
import { createHash } from "node:crypto";
import { readFileSync, readdirSync, statSync, existsSync } from "node:fs";
import { join, relative, resolve, sep, dirname } from "node:path";

const root = resolve(import.meta.dir, "..");
const skillsRoot = join(root, "config/agent/skills");
const text = path => readFileSync(join(root, path), "utf8");
const portable = path => relative(root, path).split(sep).join("/");
function walk(dir) {
  return readdirSync(dir).sort().flatMap(name => {
    const path = join(dir, name);
    return statSync(path).isDirectory() ? walk(path) : [portable(path)];
  });
}
const entries = walk(skillsRoot).sort();
const rows = text("config/files.tsv").trimEnd().split(/\r?\n/).map(line => {
  const fields = line.split("\t");
  assert.equal(fields.length, 2, `malformed inventory: ${line}`);
  const [source, destination] = fields;
  assert.ok(source.startsWith("config/") && !source.split("/").includes(".."), `unsafe source: ${source}`);
  const expectedDestination = source.startsWith("config/privacy/") ? `.omp/${source.slice("config/privacy/".length)}` : `.omp/${source.slice(7)}`;
  assert.equal(destination, expectedDestination, `destination mismatch: ${source}`);
  assert.ok(existsSync(join(root, source)) && statSync(join(root, source)).isFile(), `missing source: ${source}`);
  return { source, destination };
});
assert.equal(new Set(rows.map(r => r.source)).size, rows.length, "duplicate source");
assert.equal(new Set(rows.map(r => r.destination)).size, rows.length, "duplicate destination");
assert.deepEqual(rows.filter(r => r.source.startsWith("config/agent/skills/")).map(r => r.source).sort(), entries, "all skill assets must be exactly mapped");
const aliases = {
  "impeccable": "ui-design",
  "animate": "ui-web-motion",
  "animate-expo": "ui-expo-motion",
  "ponytail": "code-simplicity",
  "write-swift": "swift-development",
  "mobile-native": "ui-mobile-web",
  "prototype": "ui-prototyping",
  "break-ui": "ui-stress-test",
  "brandkit": "brand-concepts",
  "retro": "workflow-retrospective",
  "engineering-docs": "docs-engineering",
  "tdd": "code-tdd",
  "commit-message": "git-commit-message",
  "writing-for-agents": "agent-guidance"
};
const canonicalNames = new Set([
  "agent-guidance",
  "brand-concepts",
  "code-debugging",
  "code-review",
  "code-simplicity",
  "code-tdd",
  "docs-domain-modeling",
  "docs-engineering",
  "docs-plan-review",
  "git-change-status",
  "git-commit-message",
  "git-pr-work",
  "git-triage",
  "security-audit",
  "security-intake",
  "security-review",
  "stitch-design-input",
  "swift-development",
  "ui-design",
  "ui-expo-motion",
  "ui-gesture-design",
  "ui-image-generation",
  "ui-image-to-code",
  "ui-library-selection",
  "ui-mobile-web",
  "ui-prototyping",
  "ui-sonner",
  "ui-stress-test",
  "ui-web-motion",
  "workflow-brainstorming",
  "workflow-delivery",
  "workflow-handoff",
  "workflow-handoff-read",
  "workflow-retrospective",
  "workflow-upstream-review"
]);
const hiddenCanonical = new Set(["ui-prototyping", "ui-library-selection"]);
const retired = new Set(text("scripts/retired-skills.txt").trim().split(/\s+/));
const identities = new Map();
for (const path of entries.filter(p => /^config\/agent\/skills\/[^/]+\/SKILL\.md$/.test(p))) {
  const fm = text(path).match(/^---\r?\n([\s\S]*?)\r?\n---(?:\r?\n|$)/);
  assert.ok(fm, `${path}: frontmatter required`);
  const parsed = Bun.YAML.parse(fm[1]);
  assert.ok(parsed && typeof parsed === "object" && !Array.isArray(parsed), `${path}: mapping required`);
  for (const key of ["name", "description"]) assert.ok(typeof parsed[key] === "string" && parsed[key].trim(), `${path}: nonempty ${key}`);
  assert.match(parsed.name, /^[a-z0-9]+(?:-[a-z0-9]+)*$/);
  assert.equal(parsed.name, path.split("/")[3], `${path}: name/folder mismatch`);
  assert.ok(!identities.has(parsed.name), `duplicate name: ${parsed.name}`);
  assert.ok(!retired.has(parsed.name), `retired skill active: ${parsed.name}`);
  const hidden = parsed.hide === true || parsed["disable-model-invocation"] === true;
  if (Object.hasOwn(aliases, parsed.name)) {
    assert.equal(parsed["disable-model-invocation"], true, `${path}: alias must be hidden`);
    const body = text(path).slice(fm[0].length);
    const targets = [...body.matchAll(/skill:\/\/([a-z0-9-]+)/g)].map(m => m[1]);
    assert.deepEqual(targets, [aliases[parsed.name]], `${path}: one exact canonical destination`);
    assert.ok(canonicalNames.has(targets[0]), `${path}: alias chain/unknown destination`);
    assert.ok(body.length < 600, `${path}: alias must not duplicate a procedure`);
    assert.deepEqual(walk(dirname(join(root, path))).map(p => p.split("/").at(-1)), ["SKILL.md"], `${path}: alias has independent assets`);
  } else {
    assert.ok(canonicalNames.has(parsed.name), `unexpected canonical: ${parsed.name}`);
    assert.equal(hidden, hiddenCanonical.has(parsed.name), `${path}: changed canonical exposure`);
    assert.ok(/^(ui|code|docs|workflow|git|security|agent)-/.test(parsed.name) || ["swift-development", "stitch-design-input", "brand-concepts"].includes(parsed.name), `${path}: functional family required`);
  }
  identities.set(parsed.name, { base: dirname(join(root, path)), hidden });
}
assert.deepEqual([...identities.keys()].sort(), [...canonicalNames, ...Object.keys(aliases)].sort(), "complete intended discovery set");
for (const path of entries.filter(p => p.endsWith("/SKILL.md"))) assert.match(path, /^config\/agent\/skills\/[^/]+\/SKILL\.md$/, `nested public entrypoint: ${path}`);

// Legal notices are protected bytes, not incidental prose snapshots.
const retainedNotices = {
  "config/agent/extensions/LICENSE.antislop": "9fd83fb1fda52ca0094b96e2ed5a3d6c42a81b95a6c6326553f5bbe570f443de",
  "config/agent/skills/agent-guidance/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/agent-guidance/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/code-tdd/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/code-tdd/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/security-review/LICENSE.anthropic": "a9ac868c004c4cce26430b3117767b46397ba4fa25026b1e5ea6694b463baf4b",
  "config/agent/skills/security-intake/LICENSE.skillspector": "62362df4f604c9e583a6aaa6ec0c3b83884feae797c8c2bee550024ff7cf082c",
  "config/agent/skills/security-audit/LICENSE.cloudflare": "21c9c8cbae1f717f735ff3a4174200f9de9bc907ab9093b4453cc6da565f0ae4",
  "config/agent/skills/workflow-retrospective/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/workflow-handoff-read/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/workflow-delivery/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/workflow-delivery/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/workflow-delivery/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/code-simplicity/LICENSE.ponytail": "fb1bc6909ac3ef82d5c22106e32ef682b0cff66788fa915fb9b53b15c9d2f3ab",
  "config/agent/skills/docs-plan-review/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/ui-design/LICENSE": "02bb8c3b4e70190e3986c0404ad2fd8d639b4f534252d82379cc1b502b6d1812",
  "config/agent/skills/workflow-handoff/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/docs-engineering/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/docs-domain-modeling/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/code-debugging/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/code-debugging/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/code-review/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/code-review/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/workflow-brainstorming/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/workflow-brainstorming/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5"
};
for (const [path, hash] of Object.entries(retainedNotices)) {
  assert.ok(rows.some(r => r.source === path), `unmapped retained notice: ${path}`);
  assert.equal(createHash("sha256").update(readFileSync(join(root, path))).digest("hex"), hash, `retained notice changed: ${path}`);
}
const newNoticeHashes = {
  "LICENSE.emil": "4ff5bdb7887ec1435c9cab0e8d1a7caee704d894d65c2a008ccc68b1cc2f260b",
  "LICENSE.taste": "4575a543ab88dad12ccea7d97e563d0bce5b448b06072e65d3264497dad326df"
};
for (const path of entries.filter(p => /\/LICENSE\.(emil|taste)$/.test(p))) {
  const name = path.split("/").at(-1);
  assert.equal(createHash("sha256").update(readFileSync(join(root, path))).digest("hex"), newNoticeHashes[name], `incomplete/new notice: ${path}`);
  const sources = `${dirname(path)}/SOURCES.md`;
  assert.ok(rows.some(r => r.source === sources), `notice source scope not deployed: ${path}`);
}
const mappedNotices = rows.filter(r => /\/(?:LICENSE(?:\.[^/]+)?|NOTICE(?:\.[^/]+)?|COPYING(?:\.[^/]+)?)$/i.test(r.source));
assert.equal(mappedNotices.length, Object.keys(retainedNotices).length + entries.filter(p => /\/LICENSE\.(emil|taste)$/.test(p)).length, "notice mappings accounted for");

function prose(path) {
  return text(path).replace(/^\s*(`{3,}|~{3,})[^\n]*\n[\s\S]*?^\s*\1\s*$/gm, "");
}
const guidance = new Set([...rows.map(r => r.source).filter(p => p.endsWith(".md")), "README.md", "SKILL-USAGE.md", "config/SKILL-SOURCES.md", ...walk(join(root, "docs")).filter(p => p.endsWith(".md"))]);
for (const path of guidance) {
  for (const m of prose(path).matchAll(/skill:\/\/([a-z0-9-]+)(\/[^\s`\])<>"',;]*)?/g)) {
    const [, name, suffix = ""] = m;
    const identity = identities.get(name);
    assert.ok(identity, `${path}: unknown URI ${m[0]}`);
    if (!Object.hasOwn(aliases, path.split("/")[3]) && !path.endsWith("SOURCES.md") && !["docs/migration.md", "docs/capability-inventory.md", "docs/verification.md", "config/SKILL-SOURCES.md"].includes(path)) assert.ok(!Object.hasOwn(aliases, name), `${path}: active URI uses compatibility rather than canonical owner ${name}`);
    const target = resolve(identity.base, suffix ? decodeURIComponent(suffix.slice(1).split(/[?#]/)[0]) : "SKILL.md");
    assert.ok(target.startsWith(identity.base + sep), `${path}: URI escapes owner`);
    assert.ok(existsSync(target) && statSync(target).isFile(), `${path}: missing URI target ${m[0]}`);
  }
  for (const m of prose(path).matchAll(/!?\[[^\]\n]*\]\(([^\s)]+)(?:\s+"[^"]*")?\)/g)) {
    const href = m[1];
    if (/^(?:[a-z][a-z0-9+.-]*:|#|\/)/i.test(href)) continue;
    const local = decodeURIComponent(href.split(/[?#]/)[0]);
    if (!local) continue;
    const target = resolve(dirname(join(root, path)), local);
    assert.ok(target.startsWith(root + sep), `${path}: reference outside repository: ${href}`);
    assert.ok(existsSync(target), `${path}: missing relative reference: ${href}`);
  }
}
const visible = [...identities.values()].filter(v => !v.hidden).length;
console.log(`Skill catalog: ${canonicalNames.size} canonical (${visible} model-visible, ${hiddenCanonical.size} explicit-only), ${Object.keys(aliases).length} hidden aliases, ${entries.length} mapped assets, ${rows.length} mappings, ${mappedNotices.length} notices; URI/relative references resolve.`);
