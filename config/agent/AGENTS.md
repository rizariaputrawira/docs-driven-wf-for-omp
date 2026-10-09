# Portable OMP user guidance

## Engineering workflow

Ordinary work starts with Luna-medium main: direct work or selectively useful bounded Luna workers, then proportionate verification and done. Sol is consulted only for an identified consequential decision under [PERSONALITY](PERSONALITY.md#working-policy); size alone does not escalate. Ordinary work requires no docs-engineering setup, workflow-delivery, docs-plan-review, baseline, manifest, extra approval or new documents unless the actual task boundary needs them. Update materially affected existing owners rather than manufacturing a delivery pipeline.

Apply this routing only when the documentation-driven suite is available, enabled and matches the current request. Explicit skill disablement/filtering wins. Missing or disabled suite assets must not stop ordinary native OMP work or trigger automatic file-load/setup. Native permissions and relevant context checks remain in force; block only explicitly requested unavailable suite-specific proof. An explicit request to load a known file is distinct from automatic reactivation.

When the guard applies, material authoritative-context dependencies use `docs-engineering`; new applications and explicit substantial/end-to-end documentation-dependent delivery use `workflow-delivery`. Context retrieval alone is not full delivery. Consequential multi-slice plan review can apply without manufacturing a documentation baseline. Other owners include `code-debugging` for difficult causes, `code-review` for requested review, `ui-design` for UI, `code-simplicity` for coding simplicity, and `agent-guidance` for guidance work. Specialists are selected by actual trigger, not mandatory phases.

For documentation-relevant work in a project that has explicitly adopted docs-engineering, read `skill://docs-engineering/references/locations.md` and resolve canonical IDs through its catalog and `docs/docs-engineering.yaml`. This shared rule applies to document creation, lookup, review, coding/UI context, durable security records and handoff source references; do not guess alternate trees or create duplicate owners. `docs/README.md` is the human navigator; `PRODUCT.md` and `DESIGN.md` stay at project root. Temporary tool evidence and portable handoff snapshots are not canonical project documents. Handoff-read still reads only the selected snapshot, not its cited project files. Before adoption preserve existing locations; ordinary coding/UI and opening a project never trigger setup or migration.

| Current task trigger | Procedure owner to read on demand |
|---|---|
| Material documentation/context dependency | `skill://docs-engineering`, context branch before dependent work. No manifest is required for safe provisional inspection; no automatic setup. |
| Unresolved consequential behavior | `skill://workflow-brainstorming` |
| Active domain terminology, relationships or consequential ADR work | `skill://docs-domain-modeling` |
| New applications, explicit substantial/end-to-end documentation-dependent delivery or authorized continuation | `skill://workflow-delivery`, with `resume` for actual continuation; prepare/review the selected documentation baseline before app code and reconcile all affected owners at completion |
| Consequential multi-slice plan coverage/integration check | `skill://docs-plan-review` before native proposal/reapproval, not a second approval ritual |
| Requested/approved test-first or red-green-refactor | `skill://code-tdd`. Ordinary regression coverage alone does not force TDD. |
| Difficult, flaky or performance diagnosis | `skill://code-debugging` |
| Ordinary patch, WIP, spec/correctness or correction review | `skill://code-review` |
| Issue/PR queue triage | `skill://git-triage` |
| Bounded issue/change implementation and PR preparation | `skill://git-pr-work` |
| Local/published/released Git change status | `skill://git-change-status` |
| Check whether managed upstream/third-party sources have useful newer changes (all or named source) | `skill://workflow-upstream-review`, read-only recommendations; adoption is separate |
| External bundle adoption/update | `skill://security-intake` |
| Focused security diff/base/head review | `skill://security-review` |
| Explicit bounded deep security audit | `skill://security-audit` |
| Explicit pause/export/transfer | `skill://workflow-handoff` |
| Guidance changes or behavioral skill assessment | `skill://agent-guidance` |
| Requested workflow-retrospective | `skill://workflow-retrospective` |

Descriptions are triggers, not loaded procedures. Use actual `read` and the installed task/tool schemas. Independent security discovery/refutation needs fresh source-inspecting read-only reviewers and effective dispatched-definition provenance, not advice-only advisor assertions or a same-named substitute. Instructions create no permissions, model binding or sandbox. For explicitly requested upgrade proof, read `skill://docs-engineering/references/omp-compatibility.md`; absent native convenience support permits a known canonical file read only for an explicitly requested enabled suite, never to defeat disablement. No dispatcher/plugin/autoload hook is added.

Native config prompts matching force-push/reset/clean forms and denies matching recursive force-rm forms. Eval backends are disabled by default; the retained eval prompt policy applies if a backend is deliberately enabled. Use available native tools for ordinary work. Never use another interpreter/tool to evade bash-pattern policy; these rules are approval, not containment.

## Permission and model ownership

Keep these mechanisms distinct:

- **Instructional prohibition:** role/task prose defines authorized scope; it is not enforcement.
- **Built-in admission:** agent frontmatter requests meaningful built-in tool selection, not a universal sandbox. Ambient custom, extension or MCP tools may still be admitted outside native restrictions. Mutating LSP operations require explicit scope discipline.
- **Native Plan Mode restriction:** native child tool restrictions exclude LSP/MCP/injected tools and share the parent's session-local root. This is a runtime tool restriction, not OS isolation.
- **Extension interception:** the retained `luna-tool-boundary.js` tool hook gates exact live model/provider identities, not reviewer identity. Its restricted-main plan/coordination exceptions are separate from native Plan Mode.
- **Model policy:** native OMP owns invocation model → settings override → agent frontmatter → live parent/default selection. `@default` means the live parent. Alias resolution, invalid selectors and credential fallback are native behavior; configured selectors cannot guarantee unconditional authenticated identity.
- **OS isolation:** task isolation remains disabled. No containment is established by instructions, tool names or the hook.
- **Native approval:** native approval is the sole approval interaction. The task-authority rule in PERSONALITY governs ordinary requested work; a review, draft plan or worker report alone grants no additional scope.

Global delegation/routing discipline belongs to PERSONALITY; conditional procedure selection belongs here. Skills supply procedures, bounded agents perform assignments, task-specific plans/canonical documents own project decisions, and native configuration supplies requested model policy.

## Commit requests

When the user requests a commit or git-commit-message advice, MUST read `skill://git-commit-message` and apply it to draft the message before any Git mutation. This includes requests such as "commit", "commit and push", and "write a commit message".

The skill remains read-only and drafts only the message. An explicit commit/push request authorizes the corresponding Git action under the task-authority rule in PERSONALITY and native tool policy; a message-only request does not authorize Git mutation. If the skill is unavailable or explicitly disabled, report that limitation rather than silently bypassing it or re-enabling it.


## UI and design workflow

For UI/design work, first inspect the actual project, user brief, product and brand context, and target surface. Treat the user's explicit direction and project evidence as the source of truth.

Use `skill://ui-design` as the primary workflow. For new or replacement surfaces, follow its context-loading and new-work path. For existing surfaces, audit the incumbent and refine in place unless redesign was requested. Route evaluation and refinement requests to matching command guidance; do not run a command merely because the skill is available.

Load only applicable local references: `skill://ui-design/reference/local/component-craft.md` for focused component detail and `skill://ui-design/reference/local/marketing-sites.md` for landing pages, portfolios, and marketing redesigns. Outside marketing scope, use only relevant anti-slop checks, not landing-page prescriptions. `ui-design` governs workflow and scope; selectively load compatible references rather than stacking checklists. Web motion belongs to `skill://ui-web-motion`, Expo motion to `skill://ui-expo-motion`, and browser/PWA platform fixes to `skill://ui-mobile-web`. Load `skill://ui-gesture-design` only for explicitly requested specialist guidance, not automatically alongside UI or motion owners.

Before implementation, reconcile recommendations with the brief, existing design system, platform, accessibility needs, and technical constraints. Resolve compatible guidance without asking. If a materially consequential conflict remains unresolved, ask one concise question before committing to that direction.

Only an explicit OpenDesign request or explicit requirement for external generated/refined design artifacts enters `skill://ui-design/reference/open-design.md`; ordinary UI work does not. Follow that canonical availability, project, handoff and artifact-review contract without replacing the brief with aesthetic defaults. For direct workspace edits, preserve incumbent behavior and inspect the rendered surface after changes.

Verify the actual resulting UI at relevant narrow and wide states, including the changed interaction and accessibility or reduced-motion implications where applicable. Report only observed verification, and distinguish missing runtime access from completed verification.

## Interactive design brief fallback

If the interactive brief card is not visibly available, present the same unresolved choices in chat as concise labeled options. Reuse known answers, never ask again for settled details, and do not make card visibility a blocker.
