# Focused change-review procedure

## Establish the change, not a guessed branch

Record the supplied diff locator and base/head identities, worktree/untracked inclusion when supplied, requested change scope and unavailable portions. Read actual diff text and affected source rather than treating filenames as coverage. If a declared base/head is inaccessible, identify the missing comparison basis. Safe surrounding-source inspection may continue, but it cannot become a completed diff review.

Read current owning requirements, threat/security decisions and relevant existing secure patterns. State conflicts between intended behavior and implementation instead of treating code as permission to weaken an approved invariant. Distinguish newly introduced, worsened and pre-existing behavior. Pre-existing issues may be useful context but are labeled separately, never attributed to fictitious changed lines.

## Compare and trace

For each material change:

1. Name the lower-trust actor, starting capability, input/resource selector, protected principal/asset and expected invariant.
2. Trace the input through identity, normalization, authorization, parsing, state transitions and final security-relevant sink. Inspect direct callers, wrappers, middleware and framework defaults at the pinned version where source establishes them.
3. Compare sibling/batch/export/import/retry/error paths to the same effect. A gate's existence is insufficient: check the exact principal, tenant, object, operation and timing it binds.
4. Read the strongest preventing layer before drafting a candidate. Check default-denial, failed dependency, revoked/stale state, partial failure and recovery only where accepted by the interface.
5. Name the consequence supported by the trace. Do not elevate a same-principal operation to privilege gain, a crash to code execution, or a missing best practice to vulnerability.
6. Record unresolved deployment, provider, proxy, framework or runtime facts exactly. No assumed absence/presence of external controls, invented traffic or reproduction results.

Consider query/command/template/path/deserialization and output injection; identity/session/key lifecycle and tenant/object authorization; sensitive disclosure, retention, export and storage; irreversible business transitions; shared resource/cost and release identity. Read [attack classes](skill://security-audit/references/attack-classes.md) and only affected companion references for AI, availability or supply chain. Review actual trust use even in Markdown, tests, shell or client code; do not import blanket upstream exclusions or guesses that a language/framework makes defects impossible.

## Independent challenge and report

Follow the exact [shared candidate/disposition contract](skill://docs-engineering/references/security.md). A discovery terminal snapshot explicitly contains `candidates`, even `[]`. Give each assigned candidate's current basis to a distinct fresh source refuter, who rereads all decisive locations and strongest controls, not merely the author's excerpt. Refutation terminal output explicitly contains `decisions` for every assigned rule ID. Disproof stays recorded; absent proof stays needs-validation; absent independent output stays undisposed/incomplete.

Report scope/source basis, inspected and deferred paths, new/worsened decisions, separate pre-existing concerns, and root-cause-specific remediation recommendations. No automatic code changes, PR posting, CI action, commit or scanner. Confirmed source proof states source method and source-visible consequence, not an observed runtime exploit. Only a separately authorized and demonstrably contained executor can add named dummy-data runtime evidence; reviewers remain read-only.
