---
name: security-review
description: Use for a focused security review of a supplied diff or explicit base/head change boundary.
---

# Security change review

Adapted from Anthropic's pinned security-review command; see [SOURCES.md](SOURCES.md) and [LICENSE.anthropic](LICENSE.anthropic). This is passive OMP guidance, not the upstream CLI/CI action.

1. Establish the supplied diff and exact base/head or worktree basis, requested paths, relevant requirements and security invariants. If the diff/change basis is absent, state exactly what is missing and ask scoped questions; do not invent changed lines or quietly replace the request with a whole-codebase audit.
2. Read [change-review.md](references/change-review.md). Inspect every relevant changed path and surrounding callers, enforcement, framework behavior and alternative paths needed to understand its security consequence.
3. Load [the shared security lifecycle](skill://docs-engineering/references/security.md). Main owns orchestration/records; distinct fresh read-only `security-reviewer` instances perform discovery and refutation. Establish effective definition provenance before accepting suite results. `advisor`, model identity and a task-supplied schema alone cannot validate source or definition selection.
4. Discovery returns grounded candidates, including strongest controls and exact missing facts, never confirmation/severity. Fresh refutation reconstructs decisive current source and attempts to disprove every assigned root cause. Preserve rejected and needs-validation decisions.
5. Report the changed boundary, inspected/unavailable/out-of-scope coverage, accepted independent decisions and undisposed candidates, pre-existing concerns separately, and precise assurance limits. Source-confirmed is not runtime-exploited. A failed/malformed worker is not evidence that the change is safe.

All target inspection is read-only: no edit, execution, network fetch, credential-location inspection or delegation by reviewers. A simple authorization patch does not trigger a whole-codebase audit. Do not impose numerical confidence gates or universally exclude AI, availability, dependencies, tests, docs or client code; relevance comes from the actual attacker path and invariant.
