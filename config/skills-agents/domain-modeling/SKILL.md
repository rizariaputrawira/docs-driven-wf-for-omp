---
name: domain-modeling
description: Use when defining project terminology, resolving ambiguous domain concepts, or recording a consequential architecture decision.
---

# Domain Modeling

1. Read an existing `GLOSSARY.md` or domain map and relevant ADRs, if present.
2. Compare user terminology with code and established project language. Use concrete counterexamples to resolve genuine ambiguity; research evidence before asking about facts the repo can answer.
3. Create or update a glossary only after terms are settled, in the repository's existing location (default root `GLOSSARY.md` if absent).
4. Record an ADR in the existing ADR location (default `docs/adr/`) only for a hard-to-reverse, surprising, genuinely contested choice.
5. Do not create files merely because this skill ran. If writing is not authorized or Plan Mode is active, offer wording in chat or the plan instead.

Inspired by [Matt Pocock's domain-modeling](https://github.com/mattpocock/skills/blob/main/skills/engineering/domain-modeling/SKILL.md). Upstream [MIT license](https://github.com/mattpocock/skills/blob/main/LICENSE).
