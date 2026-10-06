---
name: security-audit
description: Use only for an explicitly bounded implementation-level security audit or deep security review.
---

# Bounded source-led security audit

Adapted from Cloudflare's pinned audit procedures; [SOURCES.md](SOURCES.md) records file mappings and removals, and [LICENSE.cloudflare](LICENSE.cloudflare) retains the full notice. This skill does not authorize a pen test, execution, new engine or report-file creation.

1. Establish explicit audit authorization, target/source basis, boundaries, requested outcome and available evidence. A focused diff belongs to `security-review`; external adoption belongs to `security-intake`. Loading a companion does not expand scope.
2. Read [reconnaissance](references/reconnaissance.md). Map actors, assets, ordinary authority, entry surfaces, strongest controls, trust crossings and lifecycle variants. Parent owns an evidence-backed coverage record, reusing existing security documentation when sufficient; no fixed fleet, six-phase engine or new task database.
3. Read [attack classes](references/attack-classes.md), then only applicable domain companions. Select by actual trust-sensitive boundary, not language/package names. Mark inspected, uninspected, unavailable and out-of-scope coverage explicitly.
4. Read [hunting](references/hunting.md). Main assigns coherent boundary investigations to available read-only source-inspecting `security-reviewer` instances. A reviewer does not execute, edit, network or delegate. A fresh source reader challenges coverage for parallel paths, unjustified exclusions and missing lifecycle variants; discoveries outside the authorized boundary are reported, not silently assigned.
5. Read [validation and reporting](references/validation-and-reporting.md) and [the shared lifecycle](skill://docs-engineering/references/security.md). Fresh independent refutation accounts for every candidate and strongest controls. Accept only complete terminal snapshots and semantically valid decisions after effective-definition provenance is established.
6. Report bounded independently decided results, rejected claims, precise needs-validation facts, undisposed candidates and actual coverage gaps. No report forest, automatic file writes, Node validators or upstream runtime contracts. Existing document owners receive records only with authorized writes.

Source confirmation requires complete independently reconstructed impact proof and is labeled `source`, never a runtime exploit. Unknown runtime/model/deployment facts remain needs-validation. Only a separately authorized executor with demonstrated OS containment can perform a named minimum dummy-data check; if unavailable, remain source-only. No live probing, availability stress, dependency install, shared services, real credentials, payload expansion or mock/scanner fallback.
