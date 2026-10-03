---
name: tdd
description: Use when the user asks for TDD, red-green-refactor, test-first development, or behavior-level regression coverage.
---

# Test-Driven Development

1. Work one vertical slice per cycle. Infer the test seam from the repository; ask only if materially ambiguous. Do not require advance approval of each test seam.
2. Write a failing test first against a public or consumer-visible boundary, using an independent, known-good expected value.
3. Make the minimal fix, rerun the test, and refactor only if needed.
4. Mock only external boundaries. Avoid permanent tests for tautologies, forwarding/wiring, or cases that cannot catch a plausible consumer-visible bug.

Inspired by [Matt Pocock's TDD skill](https://github.com/mattpocock/skills/blob/main/skills/engineering/tdd/SKILL.md), [test examples](https://github.com/mattpocock/skills/blob/main/skills/engineering/tdd/tests.md), and [mocking guidance](https://github.com/mattpocock/skills/blob/main/skills/engineering/tdd/mocking.md). Upstream [MIT license](https://github.com/mattpocock/skills/blob/main/LICENSE).
