---
name: brainstorming
description: "Use before creative or behavioral work to turn an idea into an evidence-backed, user-approved design. Supports OMP's ultrathink, orchestration, repository intelligence, and browser capabilities without implementation before approval."
---

# Brainstorming Ideas Into Designs

Turn an idea into a design that the user explicitly approves before any implementation begins. Match process to uncertainty; extract evidence from the actual project rather than guessing.

## Invocation and OMP thinking

Use either:

```text
/skill:brainstorming <idea>
```

or an ordinary request that names this skill. For OMP's maximum automatic reasoning effort, `ultrathink` must appear as standalone lowercase prose in the **user's actual prompt**:

```text
ultrathink /skill:brainstorming explore <idea>
```

Skill content cannot activate a magic keyword retroactively. `ultrathink` improves reasoning depth; it never bypasses an approval gate.

`orchestrate` and `workflowz` are likewise user-prompt keywords. Use them only when the brainstorm has substantial independent research, review, or migration slices; they are unnecessary for ordinary bounded work.

<HARD-GATE>
Until the user explicitly approves the proposed design, do NOT invoke an implementation skill, edit production files, write code, scaffold a project, make a consequential external change, or silently start implementation.
</HARD-GATE>

## Phase 1 — Establish evidence

Before the first substantive question:

1. State the provisional classification: **spike**, **bounded**, or **architectural**.
2. Inspect only enough existing context to ground the next decision:
   - Project rules and current state first.
   - Use `glob` to map unknown structure; `read` selected files in full; `grep` for exact usage.
   - When language-server support is available, use LSP definitions, references, and symbols for code relationships. Do not infer call sites from filenames.
   - For existing UI, inspect the running surface with the browser's DOM/ARIA tools and a screenshot. Use native computer inspection only when it is already enabled, read-only, and clearer than browser inspection.
3. State facts separately from assumptions and name the uncertainty that the next question resolves.

Do not perform a broad audit, create a plan document, or delegate merely to appear thorough.

## Phase 2 — Choose the path

Announce the classification before asking the first question. If two paths fit, take the heavier path. Hidden complexity upgrades the path; nothing downgrades it.

### Spike

Use for a feasibility question whose output is an answer, not retained code.

1. Inspect enough context to frame a safe probe.
2. Present the question and a 2–3 sentence probe plan.
3. Get approval.
4. Investigate as cheaply as correctness allows.
5. Report evidence, uncertainty, and a recommendation. Label every created artifact as throwaway.

Approval to explore a spike does not approve retaining, shipping, or extending its artifacts.

### Bounded

Use only for a well-scoped change to a flow that already exists and can be read in the repository.

1. Trace the affected flow and its actual call sites.
2. Ask one clarifying question at a time, only when its answer changes the design.
3. Present a short in-chat design containing:
   - outcome and explicit non-goals;
   - changed behavior and affected boundaries/files;
   - errors, edge cases, and compatibility implications;
   - exact verification evidence.
4. Stop for an explicit approval.
5. After approval, use OMP's normal development workflow.

### Architectural

Use for new projects or subsystems, cross-cutting changes, interface restructures, or work that decomposes into independent subproblems.

1. Map the current system, constraints, and independent subsystems. Identify load-bearing choices and their dependencies: resolve prerequisites before asking downstream questions.
2. Ask one question at a time about purpose, constraints, success criteria, and ownership; ask only when the answer could materially change the design. Research facts discoverable from the repository or available tools instead of asking the user.
3. If the prompt contains `orchestrate` and two or more **read-only, independent** research slices exist, delegate them in one parallel batch. Give each a precise question and a shared output contract. Verify important findings against primary repository evidence before relying on them.
4. Offer 2–3 viable approaches with trade-offs. Lead with the recommendation and why it best fits the evidence.
5. Present the preferred design in reviewable sections, scaled to complexity:
   - system boundary and non-goals;
   - components and interfaces;
   - data/control flow and state ownership;
   - error handling, security, migration, and rollback where applicable;
   - testing and observable acceptance criteria.
6. Get explicit approval of the design.
7. Write the approved design to `docs/superpowers/specs/YYYY-MM-DD-<topic>-design.md`, unless the user gives another location.
8. Self-review the document for placeholders, contradictions, ambiguity, unwanted scope, and unverifiable claims. Correct issues.
9. Ask the user to approve the written design before planning or implementing, except when OMP Plan Mode is active: follow its read-only rules and approval mechanism rather than adding a separate design-document gate.

For an oversized request, decompose it into independently deliverable subprojects. Brainstorm only the first one through this process.

## Phase 3 — Present decisions clearly

- Keep one open decision per message. Prefer concise multiple-choice options when they represent real trade-offs; otherwise ask an open question.
- Distinguish verified facts, decisions, assumptions, and open questions. Ask questions only after their prerequisites are resolved; stop when no material decision remains.
- Apply YAGNI aggressively: remove unrequested features, abstractions, integrations, and unrelated refactors.
- Approval is scoped. A later change in requirements requires a new or revised design.
- A simple task needs a short design, not no design.

For UI or spatial decisions, use the browser only when seeing the actual interface, a screenshot, or DOM state resolves the choice better than prose. Do not use the removed Superpowers visual-companion server. Use text, a compact table, or a Mermaid diagram for non-visual trade-offs.

## OMP tool discipline

- Use `todo` only when the work meets OMP's threshold for persistent multi-step tracking; keep the brainstorm itself concise.
- Use `task`/`eval` only for genuinely parallel, independent research. Never delegate the user interview, final recommendation, or approval decision.
- Use browser/computer inspection read-only during brainstorming. Do not click, type, publish, or mutate external state without separate authorization.
- Use normal OMP implementation tools only after approval. Do not invoke absent Superpowers skills, external spec-reviewer templates, or automatic commits.

## Transition

After approval, restate the approved scope, acceptance criteria, and next stage. Then proceed only with work authorized by that approval.
