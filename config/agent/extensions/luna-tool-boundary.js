export default function lunaToolBoundary(pi) {
  pi.on("before_subagent_spawn", (event) => {
    const name = String(event.agent?.name ?? event.agent?.id ?? "").toLowerCase();
    if (name === "advisor" || name === "slow") return undefined;
    const models = {
      scout: "@smol",
      routine: "@routine",
      task: "@task",
      reviewer: "@task",
      "security-reviewer": "@task",
    };
    return { model: models[name] ?? "@task", note: "Worker model follows its assigned role" };
  });

  pi.on("tool_call", (event, ctx) => {
    const current = ctx.models.current();
    if (current?.provider === "openai-codex" &&
        ["gpt-6-luna", "gpt-6-sol", "gpt-6.1-sol"].includes(current?.id)) return undefined;

    const main = ctx.agent?.kind === "main";
    const input = event.input;
    const path = input && typeof input.path === "string" ? input.path : "";

    if (main && ["task", "wait", "ask", "todo"].includes(event.toolName)) return undefined;
    if (event.toolName === "advise" || event.toolName === "yield") return undefined;
    if (main && event.toolName === "read") {
      if (/^agent:\/\/[A-Za-z0-9][A-Za-z0-9.-]*(?:\/(?:[A-Za-z0-9_-]+|\d+))*$/.test(path)) return undefined;
      if (/^local:\/\/[a-z0-9]+(?:-[a-z0-9]+)*-plan\.md(?::[0-9]+(?:-[0-9]+)?)?$/.test(path)) return undefined;
    }
    if (main && event.toolName === "write") {
      if (/^agent:\/\/[A-Za-z0-9.-]+$/.test(path)) return undefined;
      if (/^local:\/\/[a-z0-9]+(?:-[a-z0-9]+)*-plan\.md$/.test(path)) return undefined;
      if (path === "xd://propose") return undefined;
    }
    if (main && event.toolName === "edit" && typeof input?.input === "string") {
      const headers = [...input.input.matchAll(/^\[([^\]\r\n]+)#([0-9A-Fa-f]{4})\]$/gm)];
      if (headers.length === 1 && /^local:\/\/[a-z0-9]+(?:-[a-z0-9]+)*-plan\.md$/.test(headers[0][1]) &&
          !/^\s*(?:REM|MV\s)/m.test(input.input)) return undefined;
    }

    return {
      block: true,
      reason: "This model cannot use workspace tools. Delegate substantive work to Luna or Sol and use its results.",
    };
  });
}
