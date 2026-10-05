---
name: plan-review
description: Use for read-only coverage and integration review of a consequential multi-slice plan before native proposal or reapproval; trivial edits bypass it.
---

# Plan Review

Input: an accessible proposed/approved plan and relevant canonical requirement/design/decision sources. This procedure reviews the plan's ability to deliver; it does not implement, run verification, write or approve a plan. Native approval remains the only execution authority.

1. Read the exact plan, its source basis and relevant current canonical acceptance/constraints. Read affected code/callers only as needed to establish real interfaces, prerequisites and integration routes. A plan title, requirement ID or source-loaded worker advice is not semantic coverage. Missing material sources produce an incomplete review, not a pass.
2. Load [coverage checklist](references/coverage-checklist.md). Work backward from each requested outcome. Produce `criterion → deliverable → integration → observable proof`, with exact anchors and covered/partial/uncovered/unknown status. Include negative/failure behavior and every consumer boundary, not just artifact creation.
3. Test declared and implicit dependencies, producer/consumer contracts, mutable-state ownership and one-way decisions. Compare fixed approved decisions with plan actions, and identify both unapproved additions and silent reductions. Check that current actionable feedback is in the executable plan or has an explicit disposition there.
4. Report blockers, warnings and info with the failed invariant, exact observed evidence and needed decision or proof. Suggested remedies are optional routes, not reviewer-owned scope. A blocker means required delivery/authorization/safety/proof cannot be established; a warning identifies a concrete nonfatal risk; info is advisory preference. Do not soften missing acceptance into a warning to avoid conflict.
5. State inspected/unavailable/out-of-scope sources and what remains unresolved. “No blocker found in inspected scope” is not implementation proof or approval. Do not execute planned checks or infer that a command passes.

For meaningful independent checking, the delivery owner may dispatch a fresh read-only source-inspecting worker using actual available task/tool schemas and this exact procedure. Advice-only `advisor` and the diff-only reviewer schema cannot substitute for that role. No mandatory worker for trivial work, fixed review-loop cap, model tier, GSD gate engine or new tracking schema.

Provenance and notice: [SOURCES.md](SOURCES.md).
