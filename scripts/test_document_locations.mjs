import assert from "node:assert/strict";
import { readFileSync, readdirSync } from "node:fs";
import { resolve, join } from "node:path";

const root = resolve(import.meta.dir, "..");
const catalog = Bun.YAML.parse(readFileSync(resolve(root, "config/agent/skills/docs-engineering/references/catalog.yaml"), "utf8"));
const directories = new Set(["product", "requirements", "architecture", "decisions", "technical", "api", "security", "testing", "release", "operations", "user", "game", "mobile"]);

function validatePaths(artifacts) {
  const owners = new Map();
  for (const [id, artifact] of Object.entries(artifacts)) {
    assert.ok(["markdown", "yaml", "json", "native", "external-only"].includes(artifact.format), `${id}: unspecified native representation`);
    if (artifact.format === "external-only") {
      assert.equal(id, "approved-design-artifact", `${id}: standalone path cannot be waived`);
      assert.ok(!Object.hasOwn(artifact, "default-path"), `${id}: external artifact must not have a fake local copy`);
      continue;
    }
    const path = artifact["default-path"];
    assert.equal(typeof path, "string", `${id}: missing canonical path`);
    assert.ok(path.length && !/[\\\\\x00-\x1f\x7f:#?]/.test(path), `${id}: unsafe path`);
    assert.ok(!path.startsWith("/") && !path.startsWith("~") && !path.split("/").some(part => !part || part === "." || part === ".."), `${id}: unsafe path`);
    if (!["PRODUCT.md", "DESIGN.md", "docs/traceability.yaml"].includes(path)) {
      const parts = path.split("/");
      assert.equal(parts.length, 3, `${id}: canonical file must have exactly one approved area`);
      assert.equal(parts[0], "docs", `${id}: competing root`);
      assert.ok(directories.has(parts[1]), `${id}: unapproved area`);
      if (id === "adr") assert.equal(path, "docs/decisions/adr-NNN-<slug>.md");
      else assert.ok(!/[<>]/.test(path), `${id}: unresolved path pattern`);
    }
    const extension = { markdown: ".md", yaml: ".yaml", json: ".json", native: ".yaml" }[artifact.format];
    assert.ok(path.endsWith(extension), `${id}: path disagrees with representation`);
    assert.ok(!owners.has(path), `${id}: path also owned by ${owners.get(path)}`);
    owners.set(path, id);
  }
  return owners;
}

const owners = validatePaths(catalog.artifacts);
const expected = {
  glossary: "docs/product/glossary.md",
  srs: "docs/requirements/srs.md",
  stories: "docs/requirements/user-stories.md",
  adr: "docs/decisions/adr-NNN-<slug>.md",
  openapi: "docs/api/openapi.yaml",
  asyncapi: "docs/api/asyncapi.yaml",
  "product-context": "PRODUCT.md",
  "visual-design": "DESIGN.md",
  "traceability-map": "docs/traceability.yaml",
  postman: "docs/api/postman.json",
};
for (const [id, path] of Object.entries(expected)) assert.equal(catalog.artifacts[id]["default-path"], path, `${id}: compatibility path`);
assert.deepEqual(catalog.locations, { manifest: "docs/docs-engineering.yaml", navigator: "docs/README.md" });
assert.ok(!owners.has(catalog.locations.manifest) && !owners.has(catalog.locations.navigator), "infrastructure cannot compete with artifact owners");
const familyAreas = { "user-docs": "user" };
for (const [id, artifact] of Object.entries(catalog.artifacts)) {
  assert.equal(artifact.id, id, `${id}: identity drift`);
  assert.ok(Object.hasOwn(catalog.families, artifact.family), `${id}: unknown family`);
  if (artifact.format === "external-only" || ["product-context", "visual-design", "traceability-map", "adr", "openapi", "asyncapi", "api-design-rationale", "icd", "postman"].includes(id)) continue;
  assert.equal(artifact["default-path"].split("/")[1], familyAreas[artifact.family] ?? artifact.family, `${id}: path area drift`);
}

function files(directory) {
  return readdirSync(directory, { withFileTypes: true }).flatMap(entry => {
    const path = join(directory, entry.name);
    return entry.isDirectory() ? files(path) : [path];
  });
}
// A finite contract lint, not prose snapshots: prohibit a second path registry
// and the retired ambiguous/competing fallback patterns in managed guidance.
for (const path of files(resolve(root, "config/agent"))) {
  if (!/\.(?:md|yaml|yml)$/.test(path) || path.endsWith("/catalog.yaml")) continue;
  const content = readFileSync(path, "utf8");
  assert.ok(!/^\s*[\"']?default-path[\"']?\s*:/m.test(content), `${path}: second machine-readable path registry`);
  assert.ok(!content.includes("docs/<family>/<canonical-id>.md"), `${path}: unresolved family fallback`);
  for (const line of content.split(/\r?\n/)) {
    if (!/\bfallback\b/i.test(line)) continue;
    assert.ok(!/`(?:docs\/(?:adr|specs?)\/[^`]*|GLOSSARY\.md)`/.test(line), `${path}: competing document fallback`);
  }
}
// Check safety and collision boundaries independently of the current happy-path catalog.
for (const path of ["/docs/product/a.md", "../a.md", "docs/product/../a.md", "docs//a.md", "docs/qa/a.md", "specs/a.md", "C:/a.md", "docs/product/a\u0000.md", "docs/product/<guess>.md"]) {
  assert.throws(() => validatePaths({ unsafe: { "default-path": path, format: "markdown" } }), undefined, path);
}
assert.throws(() => validatePaths({ missing: { format: "markdown" } }));
assert.throws(() => validatePaths({ a: { "default-path": "docs/product/a.md", format: "markdown" }, b: { "default-path": "docs/product/a.md", format: "markdown" } }));
console.log(`Canonical locations: ${owners.size} artifact paths; complete, unique, contained taxonomy; unsafe and duplicate paths rejected.`);
