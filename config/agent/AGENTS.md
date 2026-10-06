# Portable OMP user guidance

## Engineering workflow

Ordinary work starts with direct Luna or a bounded existing worker, then proportionate verification and done. It requires no engineering-docs setup, project-delivery, plan-review, baseline, manifest, extra approval or new documents unless the actual task boundary needs them. Update materially affected existing owners rather than manufacturing a delivery pipeline.

Apply this routing only when the documentation-driven suite is available, enabled and matches the current request. Explicit skill disablement/filtering wins. Missing or disabled suite assets must not stop ordinary native OMP work or trigger automatic file-load/setup. Continue native permissions, approval and relevant context checks; block only explicitly requested unavailable suite-specific proof. Renewed explicit authorization to load a known file is distinct from automatic reactivation.

When the guard applies, material authoritative-context dependencies use `engineering-docs`; new applications and explicit substantial/end-to-end documentation-dependent delivery use `project-delivery`. Context retrieval alone is not full delivery. Consequential multi-slice plan review can apply without manufacturing a documentation baseline. Other owners include `diagnosing-bugs` for difficult causes, `code-review` for requested review, `impeccable` for UI, `ponytail` for coding simplicity, and `writing-for-agents` for guidance work. Specialists are selected by actual trigger, not mandatory phases.

| Current task trigger | Procedure owner to read on demand |
|---|---|
| Material documentation/context dependency | `skill://engineering-docs`, context branch before dependent work. No manifest is required for safe provisional inspection; no automatic setup. |
| Unresolved consequential behavior | `skill://brainstorming` |
| Active domain terminology, relationships or consequential ADR work | `skill://domain-modeling` |
| New applications, explicit substantial/end-to-end documentation-dependent delivery or authorized continuation | `skill://project-delivery`, with `resume` for actual continuation; prepare/review the selected documentation baseline before app code and reconcile all affected owners at completion |
| Consequential multi-slice plan coverage/integration check | `skill://plan-review` before native proposal/reapproval, not a second approval ritual |
| Requested/approved test-first or red-green-refactor | `skill://tdd`. Ordinary regression coverage alone does not force TDD. |
| Difficult, flaky or performance diagnosis | `skill://diagnosing-bugs` |
| Ordinary patch, WIP, spec/correctness or correction review | `skill://code-review` |
| Check whether managed upstream/third-party sources have useful newer changes (all or named source) | `skill://upstream-update-review`, read-only recommendations; adoption is separate |
| External bundle adoption/update | `skill://security-intake` |
| Focused security diff/base/head review | `skill://security-review` |
| Explicit bounded deep security audit | `skill://security-audit` |
| Explicit pause/export/transfer | `skill://handoff-to-another-harness` |
| Read/load a handoff only | `skill://resume-from-handoff`, selected snapshot only, never continuation |
| Guidance changes or separately authorized behavioral skill assessment | `skill://writing-for-agents` |
| Requested retrospective | `skill://retro` |

Descriptions are triggers, not loaded procedures. Use actual `read` and the installed task/tool schemas. Independent security discovery/refutation needs fresh source-inspecting read-only reviewers and effective dispatched-definition provenance, not advice-only advisor assertions or a same-named substitute. Instructions create no permissions, model binding or sandbox. For explicitly requested upgrade proof, read `skill://engineering-docs/references/omp-compatibility.md`; absent native convenience support permits a known canonical file read only for an explicitly requested enabled suite, never to defeat disablement. No dispatcher/plugin/autoload hook is added.

## Permission and model ownership

Keep these mechanisms distinct:

- **Instructional prohibition:** role/task prose defines authorized scope; it is not enforcement.
- **Built-in admission:** agent frontmatter requests meaningful built-in tool selection, not a universal sandbox. Ambient custom, extension or MCP tools may still be admitted outside native restrictions. Mutating LSP operations require explicit scope discipline.
- **Native Plan Mode restriction:** native child tool restrictions exclude LSP/MCP/injected tools and share the parent's session-local root. This is a runtime tool restriction, not OS isolation.
- **Extension interception:** the retained `luna-tool-boundary.js` tool hook gates exact live model/provider identities, not reviewer identity. Its restricted-main plan/coordination exceptions are separate from native Plan Mode.
- **Model policy:** native OMP owns invocation model → settings override → agent frontmatter → live parent/default selection. `@default` means the live parent. Alias resolution, invalid selectors and credential fallback are native behavior; configured selectors cannot guarantee unconditional authenticated identity.
- **OS isolation:** task isolation remains disabled. No containment is established by instructions, tool names or the hook.
- **Native approval:** native approval is the sole approval interaction. A review, draft plan or worker report grants no implementation authority.

Global delegation/routing discipline belongs to PERSONALITY; conditional procedure selection belongs here. Skills supply procedures, bounded agents perform assignments, task-specific plans/canonical documents own project decisions, and native configuration supplies requested model policy.

## UI and design workflow

For UI/design work, first inspect the actual project, user brief, product and brand context, and target surface. Treat the user's explicit direction and project evidence as the source of truth.

Use Impeccable as the primary workflow. For new or replacement surfaces, follow its context-loading and new-work path. For existing surfaces, audit the incumbent and refine in place unless redesign was requested. Route evaluation and refinement requests to the matching Impeccable command guidance; do not run a command merely because the skill is available.

Load only applicable complementary guidance: Emil for component polish, meaningful motion, and interaction details; Taste for landing pages, portfolios, and redesigns. Outside Taste's scope, use only relevant anti-slop checks, not landing-page prescriptions. Impeccable governs workflow and scope; apply compatible complements selectively rather than stacking full checklists.

Before implementation, reconcile recommendations with the brief, existing design system, platform, accessibility needs, and technical constraints. Resolve compatible guidance without asking. If a materially consequential conflict remains unresolved, ask one concise question before committing to that direction.

Only an explicit OpenDesign request or explicit requirement for external generated/refined design artifacts enters `skill://impeccable/reference/open-design.md`; ordinary UI work does not. Follow that canonical availability, project, handoff and artifact-review contract without replacing the brief with aesthetic defaults. For direct workspace edits, preserve incumbent behavior and inspect the rendered surface after changes.

Verify the actual resulting UI at relevant narrow and wide states, including the changed interaction and accessibility or reduced-motion implications where applicable. Report only observed verification, and distinguish missing runtime access from completed verification.

## Interactive design brief fallback

If the interactive brief card is not visibly available, present the same unresolved choices in chat as concise labeled options. Reuse known answers, never ask again for settled details, and do not make card visibility a blocker.
