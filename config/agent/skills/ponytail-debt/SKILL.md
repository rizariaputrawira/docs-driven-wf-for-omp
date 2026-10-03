---
name: ponytail-debt
description: "Harvest every ponytail: shortcut comment into one debt ledger, so deferrals get tracked instead of forgotten. One-shot report."
homepage: https://github.com/DietrichGebert/ponytail
license: MIT
---

Every deliberate ponytail shortcut is marked with a `ponytail:` comment naming
its ceiling and upgrade path. This collects them into one ledger so a deferral
can't quietly become permanent.

## Scan

Search the repo for comment markers, skipping dependencies, VCS metadata, and build output. Each hit is one ledger row.

## Output

One row per marker, grouped by file:

`<file>:<line>, <what was simplified>. ceiling: <the limit named>. upgrade: <the trigger to revisit>.`

Flag `ponytail:` comments that name no upgrade path or trigger with a `no-trigger` tag.

End with `<N> markers, <M> with no trigger.` Nothing found: `No ponytail: debt. Clean ledger.`

## Boundaries

Reads and reports only, changes nothing. To persist it, ask and it writes the
ledger to a file. One-shot. "stop ponytail-debt" or "normal mode" to revert.
