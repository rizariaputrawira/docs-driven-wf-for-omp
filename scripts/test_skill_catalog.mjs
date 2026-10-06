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
  assert.equal(fields.length, 2, `malformed inventory row: ${line}`);
  const [source, destination] = fields;
  assert.ok(source.startsWith("config/") && !source.split("/").includes(".."), `invalid source: ${source}`);
  assert.equal(destination, `.omp/${source.slice("config/".length)}`, `wrong home destination: ${source}`);
  assert.ok(existsSync(join(root, source)) && statSync(join(root, source)).isFile(), `missing source: ${source}`);
  return { source, destination };
});
assert.equal(new Set(rows.map(row => row.source)).size, rows.length, "duplicate inventory source");
assert.equal(new Set(rows.map(row => row.destination)).size, rows.length, "duplicate inventory destination");
assert.deepEqual(rows.filter(row => row.source.startsWith("config/agent/skills/")).map(row => row.source).sort(), entries, "skill inventory must exactly equal every asset");
const retired = new Set(text("scripts/retired-skills.txt").trim().split(/\s+/));
const identities = new Map();
for (const path of entries.filter(path => /^config\/agent\/skills\/[^/]+\/SKILL\.md$/.test(path))) {
  const frontmatter = text(path).match(/^---\r?\n([\s\S]*?)\r?\n---(?:\r?\n|$)/);
  assert.ok(frontmatter, `${path}: missing frontmatter`);
  let parsed;
  try { parsed = Bun.YAML.parse(frontmatter[1]); }
  catch (error) { throw new Error(`${path}: invalid YAML: ${error.message}`); }
  assert.ok(parsed && typeof parsed === "object" && !Array.isArray(parsed), `${path}: frontmatter must be a mapping`);
  for (const field of ["name", "description"]) assert.ok(typeof parsed[field] === "string" && parsed[field].trim(), `${path}: nonempty ${field} required`);
  assert.match(parsed.name, /^[a-z0-9]+(?:-[a-z0-9]+)*$/, `${path}: invalid public name`);
  assert.ok(!identities.has(parsed.name), `duplicate identity: ${parsed.name}`);
  assert.equal(parsed.name, path.split("/")[3], `${path}: canonical folder must match identity`);
  assert.ok(!retired.has(parsed.name), `${path}: retired entrypoint active`);
  identities.set(parsed.name, dirname(join(root, path)));
}
assert.equal(identities.size, 36, "approved catalog has 36 unique public skills");

// Exact original public identities, not a prose-wording snapshot.
const originals = ["animate", "animate-expo", "apple-design", "ask-sonner", "brainstorming", "brandkit", "break-ui", "code-review", "commit-message", "design-taste-frontend", "diagnosing-bugs", "domain-modeling", "emil-design-eng", "engineering-docs", "github-triage", "handoff-to-another-harness", "image-to-code", "imagegen-frontend-mobile", "imagegen-frontend-web", "impeccable", "improve-animations", "mobile-native", "full-output-enforcement", "pick-ui-library", "plan-review", "ponytail", "project-delivery", "prototype", "resume-from-handoff", "retro", "review-animations", "security-audit", "security-intake", "security-review", "stitch-design-taste", "tdd", "unpublished-changes", "upstream-update-review", "work-with-pr", "write-swift", "writing-for-agents"].sort();
const inventoryNames = [...text("docs/capability-inventory.md").split("## Exact baseline discovery metadata")[0].matchAll(/^\| ([a-z0-9-]+) \(`/gm)].map(match => match[1]).sort();
const decisionNames = [...text("docs/capabilities.md").split("## Plugin machinery")[0].matchAll(/^\| ([a-z0-9-]+) \|/gm)].map(match => match[1]).sort();
assert.deepEqual(inventoryNames, originals, "every original skill must have one inventory row");
assert.deepEqual(decisionNames, originals, "every original skill must have one decision row");
for (const folder of readdirSync(skillsRoot)) assert.ok(!retired.has(folder), `retired folder remains discoverable: ${folder}`);

// Immutable retained notice receipt from the approved pre-move baseline (25 assets).
const notices = {
  "config/agent/extensions/LICENSE.antislop": "9fd83fb1fda52ca0094b96e2ed5a3d6c42a81b95a6c6326553f5bbe570f443de",
  "config/agent/skills/writing-for-agents/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/writing-for-agents/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/tdd/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/tdd/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/security-review/LICENSE.anthropic": "a9ac868c004c4cce26430b3117767b46397ba4fa25026b1e5ea6694b463baf4b",
  "config/agent/skills/security-intake/LICENSE.skillspector": "62362df4f604c9e583a6aaa6ec0c3b83884feae797c8c2bee550024ff7cf082c",
  "config/agent/skills/security-audit/LICENSE.cloudflare": "21c9c8cbae1f717f735ff3a4174200f9de9bc907ab9093b4453cc6da565f0ae4",
  "config/agent/skills/retrospective/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/resume-from-handoff/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/project-delivery/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/project-delivery/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/project-delivery/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/code-simplicity/LICENSE.ponytail": "fb1bc6909ac3ef82d5c22106e32ef682b0cff66788fa915fb9b53b15c9d2f3ab",
  "config/agent/skills/plan-review/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/ui-design/LICENSE": "02bb8c3b4e70190e3986c0404ad2fd8d639b4f534252d82379cc1b502b6d1812",
  "config/agent/skills/handoff-to-another-harness/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/engineering-docs/LICENSE.gsd": "3a160aec61eeb28e75e8017346ee190db07986a09c4bd72555cc706f1d99e27e",
  "config/agent/skills/domain-modeling/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/diagnosing-bugs/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/diagnosing-bugs/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/code-review/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/code-review/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5",
  "config/agent/skills/brainstorming/LICENSE.superpowers": "a37e0e9697144819e1d965176ac4ae5bc3fa02d11e7812036bbcadf6dafe2400",
  "config/agent/skills/brainstorming/LICENSE.matt": "0e7ac423bf2c6e223b7c5b156f8cf72da49d748e56a1641402c31f22ad07dbb5"
};
const mappedNotices = rows.map(row => row.source).filter(path => /\/(?:LICENSE(?:\.[^/]+)?|NOTICE(?:\.[^/]+)?|COPYING(?:\.[^/]+)?)$/i.test(path)).sort();
assert.deepEqual(mappedNotices, Object.keys(notices).sort(), "exact retained notice mappings");
for (const [path, hash] of Object.entries(notices)) {
  assert.equal(createHash("sha256").update(readFileSync(join(root, path))).digest("hex"), hash, `notice changed: ${path}`);
}

// Active prose only: fenced code is example payload, not a routing directive.
// The original-metadata appendix is explicitly historical; source/provenance URLs
// retain immutable upstream identities and are not public-routing aliases.
function activeProse(path) {
  let content = text(path).replace(/^\s*(`{3,}|~{3,})[^\n]*\n[\s\S]*?^\s*\1\s*$/gm, "");
  if (path === "docs/capability-inventory.md") content = content.split("## Exact baseline discovery metadata")[0];
  return content;
}
const guidance = new Set([
  ...rows.map(row => row.source).filter(path => path.endsWith(".md")),
  "README.md", "SKILL-USAGE.md", "config/SKILL-SOURCES.md", ...walk(join(root, "docs")).filter(path => path.endsWith(".md")),
]);
for (const path of guidance) {
  const content = activeProse(path);
  for (const match of content.matchAll(/skill:\/\/([a-z0-9-]+)(\/[^\s`\])<>"',;]*)?/g)) {
    const [, name, suffix = ""] = match;
    assert.ok(!retired.has(name), `${path}: retired routing URI ${match[0]}`);
    const base = identities.get(name);
    assert.ok(base, `${path}: unknown URI ${match[0]}`);
    const target = resolve(base, suffix ? decodeURIComponent(suffix.slice(1).split(/[?#]/)[0]) : "SKILL.md");
    assert.ok(target.startsWith(base + sep), `${path}: URI escapes owner ${match[0]}`);
    assert.ok(existsSync(target) && statSync(target).isFile(), `${path}: missing full URI target ${match[0]}`);
  }
}
// Resolve actual lazy Markdown links in changed skill owners, and the catalog/docs.
const changedOwners = new Set(["ui-design", "web-motion", "expo-motion", "ui-prototyping", "ui-stress-test", "mobile-web", "brand-concepts", "stitch-design-input", "code-simplicity", "retrospective", "swift-development", "image-to-code"]);
for (const path of guidance) {
  if (path.startsWith("config/agent/skills/") && !changedOwners.has(path.split("/")[3])) continue;
  if (path.endsWith("/SOURCES.md")) continue; // immutable source mappings, not local lazy routing
  for (const match of activeProse(path).matchAll(/!?\[[^\]\n]*\]\(([^\s)]+)(?:\s+"[^"]*")?\)/g)) {
    const href = match[1];
    if (/^(?:[a-z][a-z0-9+.-]*:|#|\/)/i.test(href)) continue;
    const targetPath = decodeURIComponent(href.split(/[?#]/)[0]);
    if (!targetPath) continue;
    const target = resolve(dirname(join(root, path)), targetPath);
    assert.ok(target.startsWith(root + sep), `${path}: link outside source tree: ${href}`);
    assert.ok(existsSync(target), `${path}: missing local reference: ${href}`);
  }
}
console.log(`Skill catalog: ${identities.size} public skills, ${entries.length} exactly mapped assets, ${rows.length} mappings, ${mappedNotices.length} unchanged notices; active URI and lazy-reference targets resolve.`);
