# Skill payload provenance

## Legacy independent snapshots

The original portable snapshot captured three local roots without merging distinct copies:

- `config/agent/skills/` from `~/.omp/agent/skills/`.
- `config/skills-agents/` from `~/.agents/skills/`.
- `config/skills-agent/` from `~/.agent/skills/`.

That historical capture contained 64 directories and 253 files, with no symlinked skill entries/files and no separate LICENSE/COPYING notices. Unchanged snapshots retain their attribution and licensing caveat: local presence or a license link does not establish redistribution rights. Distinct copies and discovery-root order remain unchanged outside the approved engineering cutover.

## Active documentation-driven cutover

The current payload contains **69 skill directories and 352 skill files** across those three roots. The selected fifteen-skill suite under `config/skills-agents/` contains **109 explicitly deployed regular assets**, including fifteen entrypoints, fifteen SOURCES files, seven preserved engineering-docs templates and 22 full license notices. `config/files.tsv` contains **373 mappings** in total. Ten canonical entrypoint destinations were retained for in-place replacement; five new capabilities were added. The non-pruning installer does not retire renamed skills, so no duplicate upstream wrappers/aliases were introduced.

Each changed/new skill's SOURCES.md maps exact upstream path/revision to local files, adopted mechanisms, modifications, removed incompatibilities and applicable full notice. These are pinned adapted/authored payloads, not claims that the unchanged legacy snapshots are newly licensed.

| Source | Immutable revision | Distributed notice |
|---|---|---|
| [Matt Pocock](https://github.com/mattpocock/skills) | `d81f3a183412e71a5b1e84ca21bc1a35eea03a60` | Full MIT, LICENSE.matt in actual adaptations |
| [Superpowers](https://github.com/obra/superpowers) | `8ca22dba9a94f28898bbce59f2537ff4d87c747d` | Full MIT, LICENSE.superpowers in actual adaptations |
| [GSD](https://github.com/open-gsd/gsd-core) | `69f890fc36e6cfc90f2b1fcebb502ef76bbe8aa8` | Full MIT, LICENSE.gsd in actual adaptations |
| [NVIDIA SkillSpector](https://github.com/NVIDIA/SkillSpector) | `35270064e42230dbc566e4134c55b5d581355db3` | Full Apache-2.0, LICENSE.skillspector; modifications/NVIDIA attribution marked |
| [Anthropic security review](https://github.com/anthropics/claude-code-security-review) | `0c6a49f1fa56a1d472575da86a94dbc1edb78eda` | Full MIT, LICENSE.anthropic |
| [Cloudflare audit](https://github.com/cloudflare/security-audit-skill) | `c1c8a8c1471069fb0e188eeaff69b8e8db6564a8` | Full MIT, LICENSE.cloudflare |

Titus `3b752711dabebdc5f3762555d23fd75fc1c9eb92` has no established covering grant: ownership/frontier ideas are independently implemented, with no copied/translated prose or templates. The Pi shortlist is bounded reference/rejection evidence only; see engineering-docs/SOURCES.md for versions/pages and necessity decisions. No package body/notice, scanner dependency, YARA rule, executable, CI action, installer, plugin or service is adopted from those sources.

`config/skills-agents/engineering-docs/` is the sole active documentation owner. Its initial 25 production files come only from staging SKILL/references/templates. Staging bodies, frozen tests/reports and old smoke/ALL51 receipts remain historical, not acceptance of this replacement suite. The 129-concept registry, manifest/trace semantics and seven template contracts are preserved.

Tests, reports, recovery receipts, credentials, histories, generated state and assessment fixtures are excluded from deployment. OMP/model credentials and optional external integrations remain machine-local prerequisites; installation neither enables services nor changes runtime/model/approval policy. The cutover changes passive skill payload, conditional AGENTS routing and the existing security-reviewer output/procedure only. Root README records actual exercised compatibility and its limits.
