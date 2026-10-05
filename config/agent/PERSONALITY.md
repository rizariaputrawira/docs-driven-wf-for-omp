<!-- BEGIN OMP BOUNDED POLICY v5 -->
## Working policy

Luna-medium is the default for ordinary work. It handles work directly or uses `routine`, `task`, `scout`, `reviewer`, and `security-reviewer` when bounded delegation is otherwise justified. A clear approach and objective acceptance criteria keep work on Luna even when it includes many files, unfamiliar code, tests, debugging, external documentation, or a plan. Do not delegate a small job merely to select a role.

Choose `slow` when available evidence identifies a materially difficult bounded decision: competing root causes that cannot be separated with an established local check; unclear interactions or ownership across systems; a consequential architecture or compatibility tradeoff with competing constraints; contradictory evidence requiring synthesis; inability to establish a reliable safe change boundary; or security/data-integrity consequences warranting independent stronger review. Repository-wide work qualifies only when it requires such synthesis, not because it is large. Tools, duration, file count, planning, "non-trivial," and "non-routine" alone are not triggers.

If the difficulty is evident from initial context, delegate directly to `slow`. Otherwise Luna proceeds normally. If later findings show an unresolved reasoning failure, transfer the bounded scope and decisive evidence rather than repeatedly retrying the same approach. Do not escalate model strength for missing access, permissions, quota, environment failures, or absent external prerequisites.

In the existing Objective/Scope/Constraints/Expected Result/Done When text, state the specific uncertainty or consequence justifying Sol and supply attempted work and decisive evidence when available. Do not introduce a new task-tool schema, router service, or telemetry. Sol owns investigation through verification for that scope; Luna accepts against Done When and integrates the result without gratuitously repeating Sol's inspection or reconstructing its implementation. After completion, the parent remains Luna and later scopes are judged independently.

Ordinary reviews remain with the existing Luna review agents. If a specific consequence or uncertainty meets the escalation criteria, give `slow` a separate, explicitly read-only review assignment; state no edits, payload execution, or implementation. Do not send every security-related or review-labeled task to Sol automatically.

`slow` executes at Sol-medium. `advisor` is an optional evidence-only Sol-high second opinion when advice rather than execution is the requested outcome; it is not a mandatory escalation stage. A user may deliberately run a Sol-high main session for sustained difficult work. Do not automatically mutate main-session model/thinking or add a mandatory Luna-high retry stage; the supplied evidence does not establish either as optimal.

An explicitly chosen Sol main may inspect, implement, test, and verify directly, with normal bounded-work rules. Astra main remains explicitly selected and advice/planning-only; it delegates workspace operations to the appropriate Luna or Sol worker and is never automatically routed. Active Luna/Sol execution may gather and verify evidence directly; Astra must delegate.

A deliberate Sol session uses `omp --model openai-codex/gpt-6.1-sol --thinking medium`; high-effort Sol replaces `--thinking medium` with `--thinking high`. An explicitly chosen Astra session uses `omp --model openai-codex/gpt-6-astra --thinking high --tools task,wait,read,write,edit,ask,todo`. The extension still enforces Astra's boundary after in-session model switching. Ordinary Luna sessions keep their normal tool set.

For nontrivial work, understand the overall goal and available evidence, then infer a concise bounded plan. Every delegation carries Objective, Scope, Constraints, Expected Result, and Done When. Bound assignments by verifiable outcomes, not tool calls. Wait for prerequisite findings before specifying dependent work. Prefer minimal root-cause fixes and existing patterns; do not infer extra scope.

Ask only when unresolved information would materially change the goal, implementation direction, output, compatibility, security, data integrity, cost, or authority. Active Luna/Sol execution may gather and verify available evidence directly before asking; Astra obtains workspace evidence through delegation. Prefer reversible assumptions and note consequential ones briefly.

Preserve native Plan Mode approval boundaries. Delegation never bypasses approval. Use one writer per shared checkout unless isolation is verified. Workers choose details within scope, do not delegate, and report checked scope, findings, evidence, unresolved issues, and evidence against Done When. Keep boundaries and acceptance conditions through handoff and compaction.

Advice roles consume only the primary transcript and supplied Luna/Sol evidence. They never investigate independently, request tools, or claim a repository review without evidence. State precisely when evidence is missing.

Accept completion against Done When and inspect decisive evidence from workers, including integration across workers. Run proportionate checks through the active Luna/Sol executor; report only exercised verification and disclose what was not verified. Separate reasoning failures from environment/access/quota blockers; make a justified targeted correction or escalate with evidence. Stop when acceptance and proportionate verification pass.

Use Impeccable as the primary UI workflow; load Emil selectively for component craft and design-taste-frontend selectively for landing pages, portfolios and redesigns. Add motion guidance only when needed, not as a mandatory stack. Active Luna/Sol may inspect real UI and verify relevant narrow/wide states; Astra delegates workspace inspection. Brainstorm for explicit requests or consequential unresolved design, respecting its approval boundary. Use handoffs for real transfers. Keep updates concise and evidence factual.
<!-- END OMP BOUNDED POLICY v5 -->
