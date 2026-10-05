# Skill payload provenance

## Canonical OMP-native payload

All managed skills have one source folder, `config/agent/skills/`, and one deployment folder, `~/.omp/agent/skills/`, using the flat `<folder>/SKILL.md` layout. This follows OMP's native user-skill convention, not an arbitrary singular/plural folder preference. The current payload contains **53 skill directories, 53 entrypoints/unique public names and 219 skill files**. `config/files.tsv` contains **240 explicit mappings** in total. The selected fifteen-skill suite retains **109 explicitly deployed regular assets**, including fifteen entrypoints, fifteen SOURCES files, seven preserved engineering-docs templates and 22 full license notices.

Native user/project skill discovery remains available. Managed `customDirectories` is empty and Agents user/project skill-source discovery is disabled, so retired `.agent`/`.agents` copies cannot reenter through those configured sources. External runtime/providers may still exist. These source settings do not prove native resolution, application-wide isolation or OS enforcement. Model, approval, agent, plugin and MCP settings remain unchanged.

## Legacy independent snapshots and package selection

The original portable snapshot captured three local roots without merging distinct copies:

- Historical `config/agent/skills/` from `~/.omp/agent/skills/`.
- Retired `config/skills-agents/` from `~/.agents/skills/`.
- Retired `config/skills-agent/` from `~/.agent/skills/`.

That historical capture contained 64 directories and 253 files, with no symlinked skill entries/files and no separate LICENSE/COPYING notices. Unchanged snapshots retain their attribution and licensing caveat: local presence or a license link does not establish redistribution rights.

The first consolidation removed nine byte-identical complete singular/plural trees and retired singular Impeccable 4.2.2 in favor of plural 4.3.1. No singular-root-only inventoried files were found. The final consolidation removes the plural root and six remaining native/plural same-name duplicate complete packages. All 53 genuinely distinct public names remain, with one entrypoint per name and no obsolete compatibility aliases or symlinks.

The newest versioned Impeccable package is retained complete: **4.5.0 with engine 0.1.11**. Older **4.3.1 and 4.2.2** packages are retired. The older **0.1.5 Linux binary is not copied** into the newest package. Duplicate `design-taste-frontend` copies were byte-identical. Other unversioned differing copies have no defensible release-recency claim; their differences are only bare-invocation startup greetings or a course link, and the native variants are retained.

The native folder formerly named `taste-skill` declared `design-taste-frontend`; it moves to `config/agent/skills/design-taste-frontend/` before the separately named plural `taste-skill` package takes `config/agent/skills/taste-skill/`. Both public names remain distinct. Other existing native alias-folder names are preserved, including `output-skill` declaring `full-output-enforcement`.

The newest Impeccable launcher's first-run download may require permitted network access, a writable cache, curl/wget and SHA-256 tooling; an available compatible binary avoids it. Failure/refusal uses the source-defined direct-context fallback through permitted tools, with limits reported. No engine or service was invoked for this consolidation.

## Documentation-driven suite provenance

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

`config/agent/skills/engineering-docs/` is the sole active documentation owner. Its initial 25 production files come only from staging SKILL/references/templates. Staging bodies, frozen tests/reports and old smoke/ALL51 receipts remain historical, not acceptance of this replacement suite. The 129-concept registry, manifest/trace semantics and seven template contracts are preserved.

## Updates, deployment and evidence limits

An upstream updater targeting `.agent/skills/` or `.agents/skills/` can recreate retired roots. Choose the native destination and update a complete package plus its explicit `config/files.tsv` inventory, not piecemeal entrypoints/references or mixed-version launcher/binary files. The installer remains non-pruning and preserves pre-existing destination data: old installed directories are not automatically deleted. No live-home migration was performed. Inspect retained data before any separately authorized cleanup; do not treat consolidation as permission for blanket destructive deletion.

Tests, reports, recovery receipts, credentials, histories, generated state and assessment fixtures are excluded from deployment. OMP/model credentials and optional external integrations remain machine-local prerequisites; installation does not enable services. The earlier documentation-driven cutover changed passive skill payload, conditional AGENTS routing and the existing security-reviewer output/procedure. This consolidation additionally aligns skill-source discovery with the native folder; it does not alter model/approval policy or unrelated runtime configuration.

Root README records the actually exercised historical compatibility/workflow acceptance results and the current one-native-folder verification, with their limits. The former 372/373-entry results and later 304-mapping two-root counts remain historical. Current POSIX integration passed 240 entries; private-home install/doctor/reinstall and OMP 18.5.0 passive native discovery checks passed, with 53 expected public names and retired-root sentinels excluded. Authenticated workflows, agent dispatch, approval/OS enforcement, engine/service execution and Windows/PowerShell behavior were not established. No live-home deployment occurred.
