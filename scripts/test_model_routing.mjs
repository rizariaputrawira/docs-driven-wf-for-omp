import assert from "node:assert/strict";
import boundary from "../config/agent/extensions/luna-tool-boundary.js";

const hooks = new Map();
boundary({ on: (name, handler) => hooks.set(name, handler) });
const spawn = hooks.get("before_subagent_spawn");
const tool = hooks.get("tool_call");
assert.equal(typeof spawn, "function");
assert.equal(typeof tool, "function");

let cases = 0;
function check(name, run) {
  try {
    run();
    cases++;
  } catch (error) {
    error.message = `${name}: ${error.message}`;
    throw error;
  }
}

function context(provider, id, kind = "main") {
  return {
    models: { current: () => provider === undefined && id === undefined ? undefined : { provider, id } },
    agent: { kind },
  };
}
function call(modelContext, toolName, input = {}) {
  return tool({ toolName, input }, modelContext);
}
function blocked(modelContext, toolName, input) {
  const result = call(modelContext, toolName, input);
  assert.equal(result?.block, true);
  assert.equal(typeof result?.reason, "string");
}
const workspaceCalls = [
  ["read", { path: "README.md" }],
  ["bash", { command: "printf test" }],
  ["edit", { input: "[README.md#ABCD]\nPUT 1.=1:\n+updated" }],
];

check("worker identity role routing and normalized fallback", () => {
  for (const [name, model] of [["SCOUT", "@smol"], ["routine", "@routine"], ["TaSk", "@task"], ["reviewer", "@task"], ["security-reviewer", "@task"], ["unknown", "@task"]]) {
    assert.deepEqual(spawn({ agent: { name } }), { model, note: "Worker model follows its assigned role" });
  }
  assert.equal(spawn({ agent: { name: "", id: "scout" } })?.model, "@task");
  assert.equal(spawn({ agent: {} })?.model, "@task");
  assert.equal(spawn({})?.model, "@task");
  assert.equal(spawn({ agent: undefined })?.model, "@task");
  assert.equal(spawn({ agent: { name: "advisor" } }), undefined);
  assert.equal(spawn({ agent: { name: "slow" } }), undefined);
});

check("Luna and exact Sol identifiers permit main and worker workspace calls", () => {
  for (const id of ["gpt-6-luna", "gpt-6-sol", "gpt-6.1-sol"]) {
    for (const kind of ["main", "worker"]) {
      for (const [name, input] of workspaceCalls) assert.equal(call(context("openai-codex", id, kind), name, input), undefined);
    }
  }
});

check("Astra and unrecognized or incomplete model contexts are blocked with diagnostics", () => {
  for (const modelContext of [
    context("openai-codex", "gpt-6-astra"),
    context("openai-codex", "unknown-model"),
    context("openai-codex", "gpt-6-sol-preview"),
    context("openai-codex", "xgpt-6-sol"),
    context("other-provider", "gpt-6-sol"),
    context(undefined, undefined),
  ]) {
    for (const [name, input] of workspaceCalls) blocked(modelContext, name, input);
  }
});

check("restricted main keeps coordination, agent and local-plan exceptions only", () => {
  const restricted = context("openai-codex", "gpt-6-astra");
  for (const name of ["task", "wait", "ask", "todo", "advise", "yield"]) assert.equal(call(restricted, name), undefined);
  assert.equal(call(restricted, "read", { path: "agent://worker-1" }), undefined);
  assert.equal(call(restricted, "read", { path: "local://routing-plan.md" }), undefined);
  assert.equal(call(restricted, "write", { path: "agent://worker-1", content: "result" }), undefined);
  assert.equal(call(restricted, "write", { path: "local://routing-plan.md", content: "plan" }), undefined);
  assert.equal(call(restricted, "write", { path: "xd://propose", content: "proposal" }), undefined);
  blocked(restricted, "read", { path: "README.md" });
  blocked(restricted, "write", { path: "README.md", content: "x" });
  blocked(context("openai-codex", "gpt-6-astra", "worker"), "read", { path: "agent://worker-1" });
  blocked(context("openai-codex", "gpt-6-astra", "worker"), "write", { path: "local://routing-plan.md", content: "x" });
  blocked(context("openai-codex", "gpt-6-astra", "worker"), "write", { path: "xd://propose", content: "x" });
});

check("restricted main allows one safe plan edit and blocks mixed or destructive edits", () => {
  const restricted = context("openai-codex", "gpt-6-astra");
  assert.equal(call(restricted, "edit", { input: "[local://routing-plan.md#ABCD]\nPUT 1.=1:\n+approved" }), undefined);
  blocked(restricted, "edit", { input: "[local://routing-plan.md#ABCD]\nPUT 1.=1:\n+plan\n[README.md#ABCD]\nPUT 1.=1:\n+workspace" });
  blocked(restricted, "edit", { input: "[local://routing-plan.md#ABCD]\nREM" });
  blocked(restricted, "edit", { input: "[local://routing-plan.md#ABCD]\nMV moved.md" });
});

console.log(`Model routing boundaries: ${cases} named cases passed.`);
