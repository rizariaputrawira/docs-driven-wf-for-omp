# Read-only engineering documentation audit

## Audit procedure
Audit is read-only by default. Establish exact scope/project classification/risk, applicable information, selected manifest entries and owners. Compare expected information -> manifest declarations -> actual source sections -> relevant code/contracts/tests/observed evidence. Read both facts before declaring semantic contradiction. Report inspected, uninspected, truncated and unavailable paths; no repository-wide completeness from a subset. Do not silently repair, execute target scripts or mark completion. Authorized create/maintain is a separate branch.

## Finding contract and priority
Each finding includes stable ID, classification, priority, owner when known, exact source/anchor and competing fact if any, demonstrated consequence, inspected basis/evidence/coverage, required action and exact uncertainty/blocker. Classifications include missing, incomplete, blocked, stale, obsolete, orphaned, duplicate, untraceable, contradictory, drift and needs-validation; state source authority separately. Priority: material security/context hazards; missing required prerequisites; contradictions/duplicate ownership/drift/traceability; cosmetic gaps. Documentary priority is not vulnerability severity. Security candidates use [security dispositions](security.md#findings-and-assurance-evidence).

## Coverage checklist
Check every applicable class, not only file existence:
- Missing/incomplete/blocked/stale/obsolete sources; unreadable is a coverage error, never missing or clean.
- Orphan/duplicate/untraceable/contradictory owners, dependencies and supersession cycles, unknown successor and inappropriate historical activation.
- Terminology disagreement and undocumented consequential decision; reuse docs-domain-modeling for resolution, not audit-side rewrite.
- Intended requirements versus implementation/design/verification where due; forward missing coverage separately from tests/code/evidence lacking reverse rationale. Preimplementation work is not yet implemented/verified, not automatically defective.
- Phase-appropriate selected-baseline sufficiency before code: substantive owners, source/prerequisite sufficiency, resolved material decisions, reviewed dispositions and planned proof allocation using `skill://workflow-delivery/references/documentation-baseline.md#before-code-readiness`. Later implementation/runtime results not yet due are not pre-code documentation defects.
- Final affected-owner reconciliation against actual source and exercised criterion evidence using that delivery owner's as-built rule, not only user guides. Missing required proof stays unverified; unrelated passing logs cannot support a failed criterion or lower intended acceptance.
- Classification/data/trust/security impact gaps; stale threat boundaries; controls without enforcement/test/review; fixed findings without current remediation-specific successful evidence; security-code conflicts.
- Mobile permission/entitlement/exported/deep-link/storage rationale and denial/platform tests; shared-owner duplication; Android evidence incorrectly claimed for iOS.
- Unreviewed external skill/plugin/MCP provenance/privilege/poisoning drift and incomplete intake.
- Superseded/stale security/design silently routed as active; relevant prior invariant discarded; broken or uninspected successor.
- PRODUCT.md behavioral/workflow drift, DESIGN.md duplicate tokens, approved OpenDesign composition/implementation discrepancy, missing external availability/revision/approval, accessibility/compatibility/platform evidence gaps.
- Release/environment/migration/rollback/operational prerequisites, real approvals and risk disposition where applicable; invented recovery/service/store claims.

## Freshness and semantic drift
Evaluate recorded update triggers against inspected changes to parent sources, contracts, architecture, implementation and verification basis. Use source digests/revisions where available. Different revision/digest means review-needed, not automatic wrongness. Timestamps alone establish neither freshness nor drift. No history, digest, timestamp or stated basis means freshness unknown; unknown is not verified. Inspect whether the changed facts invalidate the actual source claims before calling them contradictory or stale. Record exact conflicting quotations/locations and uncertainty when one side is unavailable. Approved intended requirements remain constraints against code drift; competing authoritative owners require authorized owner resolution, not invented precedence.

## Output and completion
Return scope/classification, declared versus observed owner-state table, prioritized findings/actions/blockers, forward/reverse trace gaps, security/design authority hazards, inspected evidence and explicit incomplete coverage. An empty confirmed-findings list is not proof of safety. A worker assertion or audit artifact is not verification. Completion means all assigned applicable classes inspected or explicitly uninspected/blocked, findings source-grounded and no dependent mutation hidden in the read-only operation. Material security candidates require fresh independent refutation; execution-dependent proof stays needs-validation unless a separate authorized sandbox executor obtains it.
