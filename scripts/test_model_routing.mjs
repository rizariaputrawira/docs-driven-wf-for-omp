import assert from "node:assert/strict";
import boundary from "../config/agent/extensions/luna-tool-boundary.js";

const hooks = new Map();
boundary({ on: (name, handler) => hooks.set(name, handler) });
const tool = hooks.get("tool_call");
assert.equal(typeof tool, "function");
let cases = 0;
function check(name, run) {
  try { run(); cases++; }
  catch (error) { error.message = `${name}: ${error.message}`; throw error; }
}
function context(provider, id, kind = "main") {
  return {
    models: { current: () => provider === undefined && id === undefined ? undefined : { provider, id } },
    agent: { kind },
  };
}
function call(modelContext, toolName, input = {}) {
  return tool({ type: "tool_call", toolCallId: "contract-case", toolName, input }, modelContext);
}
function blocked(modelContext, toolName, input) {
  const result = call(modelContext, toolName, input);
  assert.equal(result?.block, true);
  assert.equal(typeof result?.reason, "string");
}
const patch = (body) => `*** Begin Patch\n${body}\n*** End Patch\n`;
const planEdit = patch("[local://routing-plan.md#ABCD]\nPUT 1.=1:\n+approved");
const workspaceCalls = [
  ["read", { path: "README.md" }], ["write", { path: "README.md", content: "x" }],
  ["bash", { command: "printf test" }], ["grep", { pattern: "x" }],
  ["glob", { path: "*.md" }], ["lsp", { action: "rename" }],
  ["eval", { language: "js", code: "1" }],
  ["edit", { input: patch("[README.md#ABCD]\nPUT 1.=1:\n+updated") }],
];
check("native slow/advisor spawn events produce no hook replacement or block", () => {
  for (const [agent, effort] of [["slow", "medium"], ["advisor", "high"]]) {
    const event = { type: "before_subagent_spawn", agent, invocationKind: "task", modelRole: agent,
      patterns: [`openai-codex/gpt-6.1-sol:${effort}`] };
    const results = [...hooks].filter(([name]) => name === event.type).map(([, handler]) => handler(event));
    assert.deepEqual(results.filter((result) => result !== undefined), []);
  }
});
check("exact Luna/Sol identities allow main/sub workspace operations", () => {
  for (const id of ["gpt-6-luna", "gpt-6-sol", "gpt-6.1-sol"])
    for (const kind of ["main", "sub"])
      for (const [name, input] of workspaceCalls) assert.equal(call(context("openai-codex", id, kind), name, input), undefined);
});
check("unsupported and incomplete identities block workspace operations", () => {
  for (const [provider, id] of [["openai-codex", "gpt-6-astra"], ["openai-codex", "unknown"],
    ["openai-codex", "gpt-6-sol-preview"], ["other-provider", "gpt-6-sol"],
    [undefined, undefined], [undefined, "gpt-6-luna"], ["openai-codex", undefined]])
    for (const kind of ["main", "sub"])
      for (const [name, input] of workspaceCalls) blocked(context(provider, id, kind), name, input);
});
const restricted = context("openai-codex", "gpt-6-astra");
check("restricted main keeps only existing coordination and URI exceptions", () => {
  for (const name of ["task", "wait", "ask", "todo"]) assert.equal(call(restricted, name), undefined);
  for (const path of ["agent://worker-1", "agent://worker-1/reports/0/data", "local://routing-plan.md", "local://routing-plan.md:2-4"])
    assert.equal(call(restricted, "read", { path }), undefined);
  for (const path of ["agent://worker-1", "local://routing-plan.md", "xd://propose"])
    assert.equal(call(restricted, "write", { path, content: "result" }), undefined);
  assert.equal(call(restricted, "edit", { input: planEdit }), undefined);
});
check("restricted sub lacks all main exceptions but retains advise/yield", () => {
  const sub = context("openai-codex", "gpt-6-astra", "sub");
  for (const name of ["task", "wait", "ask", "todo"]) blocked(sub, name);
  for (const path of ["agent://worker-1", "local://routing-plan.md", "xd://propose"]) {
    blocked(sub, "read", { path }); blocked(sub, "write", { path, content: "x" });
  }
  blocked(sub, "edit", { input: planEdit });
  for (const ctx of [restricted, sub]) for (const name of ["advise", "yield"]) assert.equal(call(ctx, name), undefined);
});
check("restricted main blocks other reads and traversal-like artifacts", () => {
  for (const path of ["README.md", "https://example.com", "history://1", "cfg://models", "local://notes.md",
    "local://../routing-plan.md", "local://routing-plan.md/../README.md", "agent://worker-1/../secret", "ssh://host/file"])
    blocked(restricted, "read", { path });
  blocked(restricted, "web_search", { query: "x" });
  blocked(restricted, "write", { path: "local://notes.md", content: "x" });
});
check("mixed/multiple/destructive and absent/non-string edits are blocked", () => {
  for (const body of [
    "[local://routing-plan.md#ABCD]\nPUT 1.=1:\n+x\n[README.md#ABCD]\nPUT 1.=1:\n+y",
    "[local://routing-plan.md#ABCD]\nPUT 1.=1:\n+x\n[local://other-plan.md#ABCD]\nPUT 1.=1:\n+y",
    "[local://routing-plan.md#ABCD]\nREM", "[local://routing-plan.md#ABCD]\nMV moved.md",
    "[local://../routing-plan.md#ABCD]\nPUT 1.=1:\n+x",
  ]) blocked(restricted, "edit", { input: patch(body) });
  for (const input of [undefined, {}, { input: null }, { input: 42 }]) blocked(restricted, "edit", input);
});
console.log(`Tool-boundary verification: ${cases} named cases passed (handler contract, not OS containment).`);
