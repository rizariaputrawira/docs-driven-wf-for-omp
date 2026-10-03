---
name: diagnosing-bugs
description: Use for difficult bugs, flaky failures, performance regressions, or requests to diagnose before fixing.
---

# Diagnosing Bugs

1. Treat the reported symptom as ground truth. Construct a specific, repeatable, red-capable feedback loop using the cheapest available real interface.
2. Reproduce and minimize only as necessary. State falsifiable candidate causes and test distinguishing predictions with `debug` or targeted inspection.
3. Fix the root cause, then prove the original path is green. Retain a regression test only at a meaningful consumer-visible seam.
4. If a runnable loop is inaccessible, report what was attempted and request the missing artifact or access rather than presenting hypotheses as fact.
5. Redact secrets and remove temporary instrumentation.

Inspired by [Matt Pocock's diagnosing-bugs](https://github.com/mattpocock/skills/blob/main/skills/engineering/diagnosing-bugs/SKILL.md). Upstream [MIT license](https://github.com/mattpocock/skills/blob/main/LICENSE).
