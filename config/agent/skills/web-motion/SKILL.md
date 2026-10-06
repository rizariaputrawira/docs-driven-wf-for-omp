---
name: web-motion
description: Build web motion, suggest opportunities, name an effect, audit/plan existing motion, or explicitly review a bounded motion diff. Select the matching mode. Not native Expo motion.
---

# Web motion

Select only the matching branch. Arguments are conversational guidance, not a CLI or dispatcher. A bare invocation offers `build`, `opportunities`, and `vocabulary` without writes. Clarify once if intent would materially change authority.

| Intent | Action and on-demand reference | Boundary |
|---|---|---|
| Implement a known effect or transition | `build`: [construction](references/build.md), [principles](references/principles.md) | Write only within current authorized scope; reuse actual components and dependencies. |
| What could animate? Suggestions only, or feel more alive without a construction request | `opportunities`: [proposal filter](references/opportunities.md), [principles](references/principles.md) | Inspect and report only. No implementation, dependency installs, plans directory or worktrees. |
| What is this effect called? | `vocabulary`: [full glossary](references/vocabulary.md) | Terms and definitions only, with labeled approximations. No code or plan writes. |
| Audit, plan, or authorized execution of existing motion across a surface | [complete lifecycle procedure](references/existing-motion.md); audit dimensions and planning template load within that mode | Audit is read-only. Plans use only an already authorized channel. Execution needs distinct exact authority and executor capability. |
| Explicitly review a bounded motion diff | [complete diff-review procedure](references/diff-review.md); review standards load within that mode | Explicit request only by instruction; findings cite actual diff/evidence. Verdict is not native approval and review makes no edits. |
Read-only branches never escalate into build without a new requested and authorized implementation. Audit, planning and review are never automatic defaults. For native Reanimated/Expo implementation use `skill://expo-motion`.

Detailed recipes remain in [RECIPES.md](RECIPES.md). Source provenance and legacy licensing caveats are recorded in the repository's `config/SKILL-SOURCES.md`, which is not deployed as a skill asset.
