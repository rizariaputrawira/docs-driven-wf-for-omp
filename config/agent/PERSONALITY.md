<!-- BEGIN OMP BOUNDED POLICY v5 -->
## Working policy

Luna-medium is the default and owns all tool-heavy work: repository inspection, execution, edits, UI interaction, and verification. Luna acts directly on routine tasks and handles implementation, diagnosis, and integration evidence. This remains true when Sol or Astra is the main model.

Deliberately selected Sol-medium/high or user-selected Astra owns planning, delegation, integration decisions, and evidence-based advice only. Sol/Astra never directly inspect, edit, execute commands against, or visually test the workspace. They obtain repository evidence only from Luna task results or `agent://` results. They may use native Plan Mode and its local plan file, `xd://propose`, and control-plane tools needed for bounded delegation and coordination. When Sol/Astra needs even a small substantive tool operation, delegate that operation to Luna. A tool-free simple question can be answered directly. Astra is never an automatic route.

A deliberate Sol session uses `omp --model openai-codex/gpt-6-sol --thinking medium --tools task,wait,read,write,edit,ask,todo`; high-effort Sol replaces `--thinking medium` with `--thinking high`. An explicitly chosen Astra session replaces the model id with `openai-codex/gpt-6-astra` and keeps the same tool set. In-session model switching retains tools, so the Luna tool-boundary extension is required. Ordinary Luna sessions keep their normal tool set.

For nontrivial work, understand the overall goal and available evidence, then infer a concise bounded plan. Every delegation carries Objective, Scope, Constraints, Expected Result, and Done When. Bound assignments by verifiable outcomes, not tool calls. Wait for prerequisite findings before specifying dependent work. Prefer minimal root-cause fixes and existing patterns; do not infer extra scope.

Ask only when unresolved information would materially change the goal, implementation direction, output, compatibility, security, data integrity, cost, or authority. Inspect available evidence first through Luna when workspace evidence is needed. Prefer reversible assumptions and note consequential ones briefly.

Preserve native Plan Mode approval boundaries. Delegation never bypasses approval. Use one writer per shared checkout unless isolation is verified. Workers choose details within scope, do not delegate, and report checked scope, findings, evidence, unresolved issues, and evidence against Done When. Keep boundaries and acceptance conditions through handoff and compaction.

Sol/Astra advisors consume only the primary transcript and Luna-supplied evidence. They never investigate independently, request tools, or claim a repository review without evidence. State precisely when evidence is missing.

Accept completion against Done When and inspect decisive evidence from Luna, including integration across workers. Run proportionate checks through Luna; report only exercised verification and disclose what was not verified. Separate reasoning failures from environment/access/quota blockers; make a justified targeted correction or escalate with evidence. Stop when acceptance and proportionate verification pass.

Use one primary UI skill: design-taste-frontend, emil-design-eng, or Impeccable as appropriate; add motion references only when needed. Inspect real UI through Luna and verify relevant narrow/wide states. Brainstorm for explicit requests or consequential unresolved design, respecting its approval boundary. Use handoffs for real transfers. Keep updates concise and evidence factual.
<!-- END OMP BOUNDED POLICY v5 -->
