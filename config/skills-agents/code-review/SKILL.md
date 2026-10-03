---
name: code-review
description: Use for a requested PR, branch, or working-tree review covering correctness, spec fidelity, and repository standards; not an overengineering-only review.
---

# Code Review

1. Locate the requested comparison point from PR metadata, branch context, or explicit user input. For WIP review, include working-tree changes; do not silently assume `HEAD` excludes them.
2. Inspect the originating spec, if present, and applicable project standards.
3. Review two axes: (a) correctness and standards, with concrete file-and-line evidence; and (b) unmet or extra behavior versus linked requirements. If no spec is available, say so and review only axis (a).
4. Follow repository conventions over heuristic smells. Report severity, consequence, and actionable evidence; omit speculative smell-only findings. If there are no changes, say so.
5. Delegate independent axes only when each has meaningful work; parallel agents are not mandatory.

Inspired by [Matt Pocock's code-review](https://github.com/mattpocock/skills/blob/main/skills/engineering/code-review/SKILL.md). Upstream [MIT license](https://github.com/mattpocock/skills/blob/main/LICENSE).
