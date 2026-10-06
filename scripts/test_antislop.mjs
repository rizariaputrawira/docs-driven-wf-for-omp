import assert from "node:assert/strict";
import antislop from "../config/agent/extensions/antislop.js";

let beforeStart;
antislop({ on: (name, handler) => {
  assert.equal(name, "before_agent_start");
  beforeStart = handler;
} });
const base = Object.freeze(["native policy", "project policy", "another extension policy"]);
const positive = [
  "Build a website", "Improve the UI", "Write product copy for our export feature",
  "Rewrite this CTA to describe downloading the report", "Design a settings screen",
  "Build a React profile page", "Create a Vue login form", "Improve this Android screen",
  "Restyle this component", "Build an iOS onboarding screen", "Fix this navigation",
  "Build a backend API and a website for it",
  "Make this form work better on mobile", "Improve accessibility of this form",
  "What makes a good UI?", "How should I design a settings screen?",
];
let policy;
for (const prompt of positive) {
  const result = beforeStart({ type: "before_agent_start", prompt, systemPrompt: base });
  assert.deepEqual(Object.keys(result), ["systemPrompt"], prompt);
  assert.deepEqual(result.systemPrompt.slice(0, -1), base, prompt);
  assert.equal(result.systemPrompt.length, base.length + 1, prompt);
  policy ??= result.systemPrompt.at(-1);
  assert.equal(result.systemPrompt.at(-1), policy, prompt);
  assert.equal(beforeStart({ prompt, systemPrompt: Object.freeze(result.systemPrompt) }), undefined,
    `${prompt}: chained or repeated invocation must not append a second policy`);
}
const negative = [
  "Optimize a PostgreSQL query", "Build a backend API", "Create a backend component",
  "Fix database migrations", "Configure infrastructure with Terraform",
  "Build a CLI argument parser", "Update OMP configuration", "Write installer documentation",
  "Refactor this helper function", "Clean up code comments", "Configure React build tooling",
  "Configure mobile push notifications", "Review database storage layout",
  "Review documentation pages", "Fix CLI navigation", "Improve terminal screen rendering", "Continue", "",
];
for (const prompt of negative) {
  assert.equal(beforeStart({ prompt, systemPrompt: base }), undefined, prompt);
}
// A fresh preparation gets its own policy; a continuation keeps the prior override.
const first = beforeStart({ prompt: "Build a website", systemPrompt: base }).systemPrompt;
assert.equal(beforeStart({ prompt: "Continue", systemPrompt: first }), undefined);
assert.deepEqual(first.slice(0, -1), base);
assert.equal(first.filter((block) => block === policy).length, 1);
assert.deepEqual(beforeStart({ prompt: "Build a website", systemPrompt: base }).systemPrompt, first);
assert.equal(beforeStart({ prompt: "Fix database migrations", systemPrompt: base }), undefined);
console.log(`Anti Slop handler contract: ${positive.length} positive and ${negative.length} negative cases passed; native result shape, immutable prompt preservation, chained/repeated injection and fresh preparation verified. Not an authenticated OMP run.`);
