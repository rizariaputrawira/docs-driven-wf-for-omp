---
name: project-delivery
description: Use for end-to-end OMP app delivery from brainstorm and approved spec through Open Design, a documented implementation plan, verified execution, and final app docs.
---

# Project Delivery

Invoke with `/skill:project-delivery <goal or existing artifact paths>` when useful. Inspect the current project, existing docs, and evidence, then resume at the earliest unfinished gate instead of replaying completed stages. Small or routine changes use the normal OMP workflow.

## Workflow

1. **Product/spec.** For consequential or unclear design, follow `brainstorming`, including its explicit approval. Capture the outcome, user flows, constraints, non-goals, errors and edge cases, and observable acceptance in the approved spec. Use the repo's spec convention, or `docs/superpowers/specs/YYYY-MM-DD-<topic>-design.md` per brainstorming. If native Plan Mode is active, keep project files read-only and use its approval instead of creating a second document gate; persist the approved spec on execution before code. Never infer approval from a draft.
   **Done when:** the approved spec exists (or its Plan Mode-approved artifact is authoritative) and defines testable behavior and scope.

2. **UI/UX, only for UI work.** Use connected Open Design to create or review screen flows, key states (empty, loading, error), and narrow/wide layouts against approved product behavior. Preserve an accessible design artifact/reference in the spec or project docs for planning. Do not claim tool availability or generated screens without evidence. If Open Design is inaccessible, request access or a user-supplied approved design artifact and pause dependent UI commitments; continue independent, authorized non-UI work. If design materially changes product scope, revise and reapprove the spec first. During implementation choose one primary UI implementation skill (`design-taste-frontend`, `emil-design-eng`, or `impeccable`) as applicable. Open Design does not replace actual UI verification.
   **Done when:** the required UI behavior and states are represented by an accessible, reviewable artifact tied to the approved spec, or a concrete blocker is recorded and dependent UI work remains paused.

3. **Implementation plan.** Use native OMP Plan Mode for a consequential implementation plan: ordered, small deliverable slices with exact artifacts/files, dependencies, expected behavior including failure paths, and a real smoke scenario and checks per slice; tie each to spec/UI acceptance. Approval is through Plan Mode, not a second approval ritual. Keep the repo read-only during Plan Mode. Once approved and execution starts, save the approved plan in the repo's existing plan-doc location, or `docs/plans/YYYY-MM-DD-<topic>.md`, before code changes. The native approved plan is authoritative; its repo copy is a durable mirror, not a place to silently change scope. If the native plan is unavailable after context reset, retrieve it or request the approved artifact; do not invent it.
   **Done when:** the native plan is approved and mirrored to the repo before implementation begins.

4. **Execution.** Re-read the approved spec, design, and plan and relevant repository code before each dependent slice; implement only the next slice. Run the path and targeted checks with real input, including UI inspection at narrow/wide sizes where relevant. Record observed evidence beside the slice in the plan doc; advance only when acceptance passes. Diagnose failed checks before proceeding. Material scope changes return to design/plan approval. Use `tdd` only when test-first is requested, `diagnosing-bugs` for hard bugs, and `code-review` for consequential correctness/spec review. `ponytail-review` is optional complexity-only review, not a substitute. Never require agents or review for trivial work.
   **Done when:** each approved slice has passing acceptance evidence, and end-to-end shipped behavior is exercised.

5. **Final app docs.** After end-to-end behavior is verified, update existing user/developer documentation; if the repo has no app-doc convention, create `docs/app-guide.md`. Describe the shipped app's setup/run path, user flows, integration/configuration requirements (without secrets), architecture/maintenance touchpoints, and observed limitations. Reconcile discrepancies against spec/plan explicitly; do not present unimplemented proposals as shipped features.
   **Done when:** the docs match the exercised application and accurately distinguish shipped behavior from limitations.

## Handoff checklist

Record the current goal and approved scope; next slice; authoritative spec, UX, and approved-plan paths or references; unresolved blockers; acceptance criterion; and commands with observed results. On a fresh start, check artifact existence and repo state before trusting the checklist. Label unknown or unrun work, and report missing prerequisites instead of inventing them. Use `handoff-to-another-harness` when actually switching harnesses.
