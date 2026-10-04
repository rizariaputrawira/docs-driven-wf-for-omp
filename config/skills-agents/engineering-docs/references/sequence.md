# Information sequence and lifecycle actions

## Lifecycle phases
Phases identify information roles, not numbered execution gates or a mandated lifecycle. Existing project-delivery/native Plan Mode remains authoritative.

| Phase | Information role |
|---|---|
| 0 | Inspect/classify evidence, owners, obligations, uncertainty, data and trust risk |
| 1 | Business/product/game vision, audience, outcomes, scope and constraints |
| 2 | Behavior, quality/security/platform requirements, stories and acceptance |
| 3 | Architecture concerns, context/views and consequential decisions |
| 4 | Detailed data/state/sequence/error/dependency/integration/platform and interface design |
| 5 | Cross-cutting security formalization: allocated threats/controls/residual-risk ownership |
| 6 | Verification planning and actual execution/evidence when due |
| 7 | Implementation support and source-linked review, without a documentation execution queue |
| 8 | Release/deployment/configuration/migration/rollback/store preparation |
| 9 | Operation/observability/recovery/incident/service information where applicable |
| 10 | Reader-specific user/admin/task/reference information |
| 11 | Release assurance, approvals, risk disposition and scoped observed evidence |
| 12 | Maintenance against verified changes, incidents, source/platform/policy triggers |

Security starts at phases 0 and 2, not phase 5. Behavior/quality/security/story/test-strategy work may proceed in parallel after stable product facts. Detailed/API/data/threat/deployment/platform design may proceed in parallel after sufficient relevant architecture boundary inputs. Iteration feeds update triggers rather than reciprocal prerequisites. Missing inputs permit explicitly provisional drafts, not approval/active constraints or verified completion.

## Dependency rules
Catalog dependencies are true information prerequisites, not mandatory files. `srs -> brief` means meaningful originating need/scope is required, possibly an existing README purpose or GDD section, not a command to create a brief/PRD. `technical-design -> architecture-description` means relevant structural/constraint information, not every view. Threat analysis needs classification/trust; controls need security invariants/threat assumptions; cases need acceptance; observed reports need actual case/method basis. Design planning does not wait for downstream release test success. Requirements can be approved before implementation verification.

Graph direction is concept -> prerequisite. Known IDs only, no self edges or cycles. Family defaults are not a blanket waterfall: artifact edges carry purpose-specific minimum input. Informational references/downstream evidence/feedback are related links or update triggers, not prerequisites. The selected manifest `depends-on` captures actual necessary owner-entry information; creation graph does not automatically load all references into context. Equivalent existing sections/evidence can satisfy an edge without selecting another file. Report each input as sufficient/missing/provisional and parallel opportunities; do not store current-agent/current-wave/execution-state.

For implementation planning, choose a real production-quality end-to-end tracer through the required producer/consumer boundary and verify its acceptance before expansion. A scaffold, disconnected layer or reduced criterion is not that tracer. Name exact consumes/produces interfaces, necessary prerequisite evidence and unresolved one-way choices; parallelize only genuinely independent work. Sequence here remains an information view, never a GSD executor or manifest task queue. For consequential multi-slice plans load the single `skill://plan-review/references/coverage-checklist.md` before native proposal/reapproval; do not duplicate its checklist or create another approval gate.

## Eight native actions
Use `/skill:engineering-docs <action>` arguments, not custom slash commands or a shell CLI. Plan Mode stays read-only and returns proposed writes through native approval.

| Action | Procedure | Observable completion |
|---|---|---|
| setup | Inspect instructions/owners; classify evidence; select applicable information and omissions; propose/update canonical manifest only when authorized; preserve unrelated entries/content on rerun | Minimal typed manifest or proposed Plan Mode changes, each selection/omission reason and exact unresolved facts; no mass document creation |
| status | Read manifest and actual selected sources/evidence; separate declared status from observed state | Read-only phase/document/required/declared/observed/action table and coverage gaps |
| next | Inspect selected missing/stale/blocked knowledge, security risk and sufficient prerequisites | Read-only prioritized document work with rationale, blockers and independent/parallel work, not runtime waves |
| sequence | Resolve selected information dependencies and phase roles | Read-only selected lifecycle/prerequisite view, not full catalog or waterfall |
| create <document> | Resolve exact ID/name/alias, information need, owner and supplied facts; extend existing section before new file; unknown alias errors with relevant supported concepts | Authorized content at canonical source, substantive acceptance/update basis; incomplete/draft/blocked unknowns explicit, no guessed facts |
| context <task> | Follow [context-routing](context-routing.md#resolution-procedure) and exact packet fields | Read-only bounded authoritative packet with loaded invariants/gaps/conflicts/exclusions |
| audit [scope] | Follow [audit](audit.md#audit-procedure), expected->manifest->source->code/test/evidence | Read-only source-grounded prioritized findings with inspected/unavailable coverage and independent security disposition |
| maintain <change> | Inspect actual change/verification evidence, resolve affected owners/classification/manifest/trace; update only affected sources when authorized | Updated affected canonical facts/links plus scoped audit; absent execution evidence yields proposed unverified impact, never activation/verified claim |

## Create and maintain boundaries
A requested name without unmet information need is not a creation trigger: explain the existing canonical coverage and leave it intact. Unknown aliases never imply custom concepts; custom concept needs explicit purpose/owner after actual need is established. Required external composition unavailable blocks dependent design content, not unrelated authorized documentation. If facts cannot finish an existing draft, name exact missing inputs and preserve draft/incomplete/blocked state; do not mark it complete.

For a material change resolve context before work, preserve existing approvals, and assess documentation impact after observed verification. Maintain only affected requirements/contracts/design/security/release/test/evidence; keep shared mobile owner singular and distinct platform deltas. A worker completion report or missing runtime evidence supports proposed impact, not verified implementation. Audit changed trace/security scope after authorized updates; this is not a replacement delivery framework or automatic tool/skill installation.
