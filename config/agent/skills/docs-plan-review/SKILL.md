---
name: docs-plan-review
description: Use for read-only coverage and integration review of a consequential multi-slice plan before native proposal or reapproval; trivial edits bypass it.
---

# Plan Review

Input: an accessible proposed/approved plan and relevant canonical requirement/design/decision sources. This procedure reviews the plan's ability to deliver; it does not implement, run verification, write or approve a plan. Native approval remains the only execution authority.

1. Read the exact plan, its source basis and relevant current canonical acceptance/constraints. Read affected code/callers only as needed to establish real interfaces, prerequisites and integration routes. A plan title, requirement ID or source-loaded worker advice is not semantic coverage. Missing material sources produce an incomplete review, not a pass.
2. Load [coverage checklist](references/coverage-checklist.md). Work backward from each requested outcome. Produce `criterion → deliverable → integration → observable proof`, with exact anchors and covered/partial/uncovered/unknown status. Include negative/failure behavior and every consumer boundary, not just artifact creation.
3. Test declared and implicit dependencies, producer/consumer contracts, mutable-state ownership and one-way decisions. Compare fixed approved decisions with plan actions, and identify both unapproved additions and silent reductions. Check that current actionable feedback is in the executable plan or has an explicit disposition there.
4. Report blockers, warnings and info with the failed invariant, exact observed evidence and needed decision or proof. Suggested remedies are optional routes, not reviewer-owned scope. A blocker means required delivery/authorization/safety/proof cannot be established; a warning identifies a concrete nonfatal risk; info is advisory preference. Do not soften missing acceptance into a warning to avoid conflict.
5. State inspected/unavailable/out-of-scope sources and what remains unresolved. “No blocker found in inspected scope” is not implementation proof or approval. Do not execute planned checks or infer that a command passes.

For meaningful independent checking of consequential integration, recommend a fresh `slow` with an explicitly review-only assignment using actual task/tool schemas and this exact docs-plan-review procedure. Name the exact `local://<slug>-plan.md` and canonical source anchors; inspection only, no edits, check execution or implementation. Advisor is supplied-evidence advice only; reviewer retains patch focus. Main owns current-evidence routing and integration. Trivial work needs no mandatory worker or new role.

Native Plan Mode children share the parent's session-local root and restrict tools, excluding LSP/MCP/injected tools. A draft is not an automatic approved-plan handoff. These are runtime tool restrictions, not OS isolation; outside Plan Mode review-only instructions are not a hard sandbox. Native approval remains the sole approval interaction. No model category, routing registry, fixed review-loop cap or new tracking state.

Provenance and notice: [SOURCES.md](SOURCES.md).
