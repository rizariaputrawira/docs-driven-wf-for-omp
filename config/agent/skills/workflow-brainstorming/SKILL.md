---
name: workflow-brainstorming
description: "Use before unresolved creative or behavioral design work, or for an explicit decision stress-test."
---

# Brainstorming

Turn uncertainty into an evidence-backed design whose scope the user can recognize and approve. An existing approved design is context, not a reason to repeat the interview. Skill text grants no tools, runtime keywords, reasoning mode or permission.

## Establish intent and evidence

1. Announce the provisional path: **spike**, **bounded**, or **architectural**. Bounded requires an existing affected flow that can actually be inspected. When two paths fit, choose the heavier; newly discovered complexity upgrades the path.
2. Read the current request, relevant project guidance and existing requirement/design owners. Trace the affected flow and real callers. Discover repo/tool-provided facts rather than asking the user. Use source navigation and, for an existing UI, available read-only DOM/screenshot evidence when it resolves a real visual choice. Missing material context blocks dependent decisions, not unrelated safe inspection.
3. Write back the intended outcome, audience/use, constraints and observable success in a short note. Distinguish supplied facts from assumptions; invite correction. Ask only for consequential missing intent. Do not re-interview facts the request already supplies.
4. Carry that understanding into every proposed choice. Ordinary workflow-brainstorming asks one material question at a time. An explicit **stress-test** instead loads [ready-frontier rounds](references/stress-test.md); its batched questions do not become the default interview.

## Approval boundary

Before implementation, obtain actual native/user approval for the selected path and exact scope. Until then, remain in authorized read-only research and design discussion; do not write production code, scaffold, install dependencies or change external state. Documentation writes also require authority. Plan Mode returns proposed content through an allowed channel and never writes checkout files. A skill is not a second approval engine: use the current native proposal/approval mechanism where it owns the decision.

### Spike

Present a feasibility question and a two- or three-sentence safe probe, including permitted effects and evidence. Wait for approval, then investigate within that boundary. Report the result, uncertainty and recommendation; label any authorized artifacts throwaway. Exploration approval does not permit retaining, shipping or expanding them.

### Bounded

Trace the existing path and answer discoverable facts first. Present a compact in-chat design: outcome/non-goals, behavior and affected boundaries, errors/compatibility, and observable verification. Stop for approval before implementation. No new spec or plan file is required solely by this classification. After approval, use ordinary OMP development; test-first applies only when requested or approved.

### Architectural

Map load-bearing choices, ownership and prerequisite decisions. Offer two or three genuinely viable approaches with trade-offs and a recommendation. Present reviewable sections covering system boundary, interfaces, data/control flow, errors/security/migration where applicable, and acceptance/evidence. If oversized, agree independently deliverable subprojects without silently discarding requested acceptance.

Reuse the existing canonical spec/requirement owner. When no sufficient convention exists, the default new spec is `docs/specs/YYYY-MM-DD-<topic>.md` using the actual known date; preserve existing artifact locations. A conversational design approval permits only the stage presented, not unseen implementation content. Write the agreed design only when authorized, self-review contradictions, missing acceptance, ambiguity and scope, then obtain approval of the material written basis before dependent implementation. Native Plan Mode carries these stages without a duplicate written-document approval ritual.

When substantial delivery/planning is actually requested, load `skill://workflow-delivery` for the approved transition rather than upstream writing-plans or an executor. Do not load implementation procedures before their boundary is authorized.

## Finish

Restate the selected scope, acceptance, unresolved assumptions and authorized next stage. Completion is a reported spike result or a reviewable design with the actual approval status—not merely presenting options. Changed material requirements or scope require native reapproval. No automatic commits, mandatory delegation, visual-companion service or keyword-trigger assertions are part of this procedure.
