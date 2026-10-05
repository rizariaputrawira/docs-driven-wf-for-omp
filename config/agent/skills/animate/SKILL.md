---
name: animate
description: Build web motion, propose animation opportunities without edits, or name an effect from its description. Use build for implementation, opportunities for suggestions or "feel more alive", and vocabulary for "what is it called". Not native Expo motion, whole-surface audits, or explicit diff reviews.
---

# Web motion

Select only the matching branch. Arguments are conversational guidance, not a CLI or dispatcher. A bare invocation offers `build`, `opportunities`, and `vocabulary` without writes. Clarify once if intent would materially change authority.

| Intent | Action and on-demand reference | Boundary |
|---|---|---|
| Implement a known effect or transition | `build`: [construction](references/build.md), [principles](references/principles.md) | Write only within current authorized scope; reuse actual components and dependencies. |
| What could animate? Suggestions only, or feel more alive without a construction request | `opportunities`: [proposal filter](references/opportunities.md), [principles](references/principles.md) | Inspect and report only. No implementation, dependency installs, plans directory or worktrees. |
| What is this effect called? | `vocabulary`: [full glossary](references/vocabulary.md) | Terms and definitions only, with labeled approximations. No code or plan writes. |

Read-only branches never escalate into build without a new requested and authorized implementation. For whole-surface existing-motion audit/planning use `skill://improve-animations`; for explicitly requested diff review use `skill://review-animations`; for native Reanimated/Expo implementation use `skill://animate-expo`.

Detailed recipes remain in [RECIPES.md](RECIPES.md). Source provenance and legacy licensing caveats are recorded in the repository's `config/SKILL-SOURCES.md`, which is not deployed as a skill asset.
