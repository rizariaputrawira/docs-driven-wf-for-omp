---
name: ui-web-motion
description: "Build web motion, suggest opportunities, name an effect, audit/plan existing motion, or explicitly review a bounded motion diff. Select the matching mode. Not native Expo motion. Also applies when explicitly requested as animate."
---

# Web motion

Select only the matching branch. Arguments are conversational guidance, not a CLI or dispatcher. A bare invocation offers `build`, `opportunities`, and `vocabulary` without writes. Clarify once if intent would materially change authority.

| Intent | Action and on-demand reference | Boundary |
|---|---|---|
| Implement a known effect or transition | `build`: [construction](references/build.md), [principles](references/principles.md) | Write only within current authorized scope; reuse actual components and dependencies. |
| What could animate? Suggestions only, or feel more alive without a construction request | `opportunities`: [proposal filter](references/opportunities.md), [principles](references/principles.md) | Inspect and report only. No implementation, dependency installs, plans directory or worktrees. |
| What is this effect called? | `vocabulary`: [full glossary](references/vocabulary.md) | Terms and definitions only, with labeled approximations. No code or plan writes. |
| Audit, plan, or execution of existing motion across a surface | [complete lifecycle procedure](references/existing-motion.md); audit dimensions and planning template load within that mode | Audit is read-only. Plans use only an already requested/authorized channel. Execution follows the request's scope and native tool boundaries. |
| Explicitly review a bounded motion diff | [complete diff-review procedure](references/diff-review.md); review standards load within that mode | Review is read-only. A combined review-and-fix request also authorizes the requested implementation under PERSONALITY; the review procedure itself makes no edits. |
Read-only branches never escalate into build without an implementation request or other applicable task authority. A direct combined request does not need a second request after review. Audit, planning and review are never automatic defaults. For native Reanimated/Expo implementation use `skill://ui-expo-motion`.

Detailed recipes remain in [RECIPES.md](RECIPES.md). Source provenance and legacy licensing caveats are recorded in the repository's `config/SKILL-SOURCES.md`, which is not deployed as a skill asset.
