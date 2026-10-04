---
name: project-delivery
description: Use for explicitly requested substantial or end-to-end delivery, or authorized continuation with resume; ordinary bounded changes use native OMP workflow.
---

# Project Delivery

Accept an explicit goal with existing artifact paths, or `resume [handoff-path]`. Loading this procedure is not execution authorization. Match documentation and review depth to the real boundary; a small change does not need a full-app pipeline. Use current native OMP permissions, tools and approval rather than introducing an engine or another approval ritual.

## Establish the current boundary

1. Read applicable project instructions, supplied facts and existing requirement/design/plan owners. Preserve unrelated user changes. For a material documentation dependency, load `skill://engineering-docs` and its context branch if the suite is enabled and available; do not auto-setup missing documentation. Safe provisional inspection can proceed without a manifest.
2. For `resume`, load [resumption](references/resumption.md) before dependent work. A read/load-only handoff request belongs to `skill://resume-from-handoff`, not this execution branch.
3. Separate already observed acceptance, partial implementation, remaining acceptance and missing evidence. Do not replay completed stages simply because this is a fresh session. Missing material context or authorization blocks its dependent mutation, not unrelated safe inspection.

## Delivery procedure

1. **Specify the outcome.** Load [specification](references/specification.md). Synthesize supplied facts and inspected sources; do not re-interview for known answers. Use `skill://brainstorming` only for unresolved consequential behavior. Extend the existing canonical requirement/design owner. Only absent a sufficient convention use `docs/specs/YYYY-MM-DD-<topic>.md`; do not relocate existing artifacts. In native Plan Mode keep checkout files read-only and return the proposed content through its allowed channel.
   **Exit:** observable acceptance, constraints, boundaries/errors and non-goals are explicit; consequential choices have actual authorization, not a draft's “approved” label.
2. **Resolve UI evidence only when affected.** Follow the managed AGENTS UI routing and its primary Impeccable workflow. Start with the approved project design and actual incumbent states; account for relevant empty/loading/error, accessibility and narrow/wide behavior. OpenDesign generation/refinement is a prerequisite only when the user or established project contract specifically requires it. Record that exact requirement before treating unavailable service access as a blocker. Do not demand MCP credentials or a new external artifact for ordinary approved in-place UI work. A scope-changing design requires native reapproval.
   **Exit:** the affected UI commitment has adequate accessible incumbent/approved evidence, or its specific dependent portion is blocked; unrelated authorized work remains reachable.
3. **Plan the complete deliverables.** Load [planning](references/planning.md). Tie every material acceptance criterion to a complete vertical slice and observable proof. Include exact producer/consumer interfaces, prerequisites, errors and irreversible choices. Start with a real end-to-end tracer, not an inert scaffold. For consequential multi-slice work load `skill://plan-review` before native proposal/reapproval; use a fresh source-inspecting read-only worker for meaningful independent checking. Trivial edits bypass that overhead. Use native approval once. When execution is authorized, retain the approved plan in the existing plan owner, or `docs/plans/YYYY-MM-DD-<topic>.md` if needed, before code. Its content mirror is not approval evidence.
   **Exit:** full acceptance is covered, dependencies are feasible and the exact execution scope has verified authorization.
4. **Implement the next authorized slice.** Read its plan and affected code/tests; preserve useful real partial progress. Use [implementation brief](references/implementation-brief.md) when dispatching through actual available OMP task interfaces; delegation is optional. One integration owner controls shared writes and final checks. Workers do not run verification unless explicitly assigned. Use `skill://tdd` only for requested/approved test-first, `skill://diagnosing-bugs` for difficult diagnosis and `skill://code-review` for requested/consequential correctness/spec review. For focused security or explicit audit load the distinct security owners, not a universal audit. Load [review feedback](references/review-feedback.md) when findings arrive. Material scope/security/one-way changes return to native reapproval before dependent mutation.
   **Exit:** the complete slice and all affected callers/docs/tests are implemented within the authorized boundary; actual evidence, gaps and feedback dispositions are recorded.
5. **Prove acceptance and reconcile docs.** Load [verification](references/verification.md). The integration owner assesses the shipped boundary after all workers land, using authorized actual checks. An incomplete worker report or source shape cannot satisfy behavioral acceptance. Record required failures/unrun checks rather than claim completion. Update existing user/developer docs to match exercised setup, flows, interfaces/configuration, maintenance touchpoints and limitations; create `docs/app-guide.md` only if a real need has no incumbent owner. Do not label proposed behavior shipped.
   **Exit:** every named acceptance criterion has relevant observed evidence, end-to-end consumers work, and docs accurately describe the result and unresolved limits.

## Reporting and interruption

Return the acceptance-to-evidence result, actual changes, observed checks/outcomes and unresolved blockers; distinguish source inspection from exercised behavior. Retain relevant unchanged observed evidence without gratuitous replay, but invalidate it when its material basis changes. Explicit pause/export uses `skill://handoff-to-another-harness`; requested learning extraction uses `skill://retro`. No automatic commits, worktrees, tracker publishing, job restarts, new state database or provider/model changes.

Provenance and notices: [SOURCES.md](SOURCES.md).
