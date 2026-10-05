# Complexity-only review and audit

Adapted from DietrichGebert's Ponytail review/audit snapshots, with native authority, scope and evidence corrections. See [full MIT notice](../LICENSE.ponytail). Both branches report findings only; no automatic fixes or coding-level changes.

## Review: real diff boundary

Require a supplied or discovered actual diff/base-head boundary. Inspect its changed code and necessary caller context with available symbol-aware tools. If no diff is available, identify the missing input rather than inventing changed lines or silently switching to repository audit.

Anchor each finding to the actual changed file/line: `file:Lline: tag what can be cut; replacement and reason`. Follow the requested output format. Possible line reductions must be supported by a concrete replacement; unknown totals remain unknown. No useful cuts is a valid lean result.

## Audit: explicit repository boundary

Sweep the requested repository or named subtree, not a guessed whole checkout. Inspect dependencies, native/stdlib overlap, single-use abstractions, delegation-only wrappers, dead flags/config and speculative flexibility. Confirm consumers before declaring code dead. A one-export file or single-implementation interface is a candidate, not automatic proof it should disappear.

Rank grounded cuts by impact with source paths, replacement and reason. Give possible line/dependency reductions only where supported; do not convert estimates into measurements. Report coverage and unknown totals. Apply nothing.

## Shared tags and boundaries

- `delete:` dead or unrequested speculative code; replacement may be nothing.
- `stdlib:` a hand-built facility with a correct standard-library equivalent; name the API.
- `native:` code/dependency replaced by a suitable platform feature; name the feature.
- `yagni:` flexibility or abstraction with no demonstrated need.
- `shrink:` equivalent correct logic in a smaller readable form; show the form.

This is unnecessary-complexity review, not correctness/security/performance assurance. Route unrelated defects to a requested appropriate review without expanding this pass or suppressing important caveats. Protect meaningful smoke and regression checks, boundary validation, data-integrity handling and accessibility. Do not count deleting required behavior as simplification. Never claim measured savings or invent a scoreboard.
