# Skill payload provenance

## Canonical OMP-native payload

All managed skills have one source folder, `config/agent/skills/`, and deploy to `~/.omp/agent/skills/` in flat `<folder>/SKILL.md` layout. The balanced payload contains **36 skill directories/entrypoints and unique public names, 213 skill files and 234 explicit mappings**. The fifteen-skill engineering suite remains **109 regular assets**, including fifteen entrypoints, fifteen SOURCES files, seven engineering-docs templates and 22 full license notices. No discovery provider/profile or installer pruning was added.

Native user/project skill discovery remains available. Managed `customDirectories` is empty and Agents user/project skill-source discovery is disabled, so retired `.agent`/`.agents` copies cannot reenter through those configured sources. External runtime/providers may still exist. These source settings do not prove native resolution, application-wide isolation or OS enforcement. Model, approval, agent, plugin and MCP settings remain unchanged.

## Legacy independent snapshots and package selection

The original portable snapshot captured three local roots without merging distinct copies:

- Historical `config/agent/skills/` from `~/.omp/agent/skills/`.
- Retired `config/skills-agents/` from `~/.agents/skills/`.
- Retired `config/skills-agent/` from `~/.agent/skills/`.

That historical capture contained 64 directories and 253 files, with no symlinked skill entries/files and no separate LICENSE/COPYING notices. Unchanged snapshots retain their attribution and licensing caveat: local presence or a license link does not establish redistribution rights.

The earlier root consolidation removed nine byte-identical singular/plural trees, retired singular Impeccable 4.2.2 in favor of plural 4.3.1, then removed the plural root and six native/plural same-name duplicate packages. Its historical result retained 53 public names; the balanced semantic consolidation below supersedes that catalog, without aliases or symlinks.

The newest versioned Impeccable package is retained complete: **4.5.0 with engine 0.1.11**. The upstream `skill-v4.5.0` tag resolves to commit `508d7e8955de3b3caf2d8676e85206723d41a887`, whose repository `LICENSE` is Apache-2.0, copyright 2025 Paul Bakaus; its root `NOTICE` was not present at that revision. The complete upstream license is now included at `config/agent/skills/impeccable/LICENSE`, mapped for deployment. The local `SKILL.md` is marked as modified for OMP-native permissions, authorization, routing and workflow. Older **4.3.1 and 4.2.2** packages are retired. The older **0.1.5 Linux binary is not copied** into the newest package. Duplicate `design-taste-frontend` copies were byte-identical. Other unversioned differing copies have no defensible release-recency claim; their differences are only bare-invocation startup greetings or a course link, and the native variants are retained.

Historical path selection: the native `taste-skill` folder declaring `design-taste-frontend` moved to the matching canonical folder; the separately named plural `taste-skill` temporarily retained a distinct public name. The latter is now retired. Surviving alias-folder paths such as `output-skill` declaring `full-output-enforcement` remain unchanged.

The newest Impeccable launcher's first-run download may require permitted network access, a writable cache, curl/wget and SHA-256 tooling; an available compatible binary avoids it. Failure/refusal uses the source-defined direct-context fallback through permitted tools, with limits reported. No engine or service was invoked for this consolidation.

## Pinned third-party source and license provenance

Each adapted skill's SOURCES.md maps exact upstream paths/revisions to local files, adopted mechanisms, modifications, removed incompatibilities and applicable full notice. Impeccable's package pin and notice are recorded below. These are adapted/authored payloads, not claims that unchanged historical snapshots are licensed.

| Source | Immutable revision | Distributed notice |
|---|---|---|
| [Matt Pocock](https://github.com/mattpocock/skills) | `d81f3a183412e71a5b1e84ca21bc1a35eea03a60` | Full MIT, LICENSE.matt in actual adaptations |
| [Superpowers](https://github.com/obra/superpowers) | `8ca22dba9a94f28898bbce59f2537ff4d87c747d` | Full MIT, LICENSE.superpowers in actual adaptations |
| [GSD](https://github.com/open-gsd/gsd-core) | `69f890fc36e6cfc90f2b1fcebb502ef76bbe8aa8` | Full MIT, LICENSE.gsd in actual adaptations |
| [NVIDIA SkillSpector](https://github.com/NVIDIA/SkillSpector) | `35270064e42230dbc566e4134c55b5d581355db3` | Full Apache-2.0, LICENSE.skillspector; modifications/NVIDIA attribution marked |
| [Anthropic security review](https://github.com/anthropics/claude-code-security-review) | `0c6a49f1fa56a1d472575da86a94dbc1edb78eda` | Full MIT, LICENSE.anthropic |
| [Cloudflare audit](https://github.com/cloudflare/security-audit-skill) | `c1c8a8c1471069fb0e188eeaff69b8e8db6564a8` | Full MIT, LICENSE.cloudflare |
| [pbakaus/impeccable `skill-v4.5.0`](https://github.com/pbakaus/impeccable/tree/508d7e8955de3b3caf2d8676e85206723d41a887) | `508d7e8955de3b3caf2d8676e85206723d41a887` | Full Apache-2.0 license and Paul Bakaus attribution, deployed at `config/agent/skills/impeccable/LICENSE`; adapted entrypoint carries a modification notice |

Titus `3b752711dabebdc5f3762555d23fd75fc1c9eb92` has no established covering grant: ownership/frontier ideas are independently implemented, with no copied/translated prose or templates. The Pi shortlist is bounded reference/rejection evidence only; see engineering-docs/SOURCES.md for versions/pages and necessity decisions. No package body/notice, scanner dependency, YARA rule, executable, CI action, installer, plugin or service is adopted from those sources.

`config/agent/skills/engineering-docs/` is the sole active documentation owner. Its initial 25 production files come only from staging SKILL/references/templates. Staging bodies, frozen tests/reports and old smoke/ALL51 receipts remain historical, not acceptance of this replacement suite. The 129-concept registry, manifest/trace semantics and seven template contracts are preserved.

## Balanced consolidation and licensing boundary

The map below records exact old package/public-name ownership. New animate build/opportunities/vocabulary/principles, Taste references and Emil component-craft are independently authored guidance. Common technical glossary terms and underlying capabilities are retained, not the legacy expressive prose. No new grant is inferred from local presence, source URLs or attribution.

Omitted copied material: legacy motion construction/finder prose, full glossary definitions, review standards/audit/plan templates, Taste/style/scroll recipes and nonexistent blocks instructions, and Emil philosophy/quotes/component-motion recipes. These are replaced by original procedures/definitions/examples, not copied or translated into new references. Exact v1 procedures, greetings, fabricated RNG/assets/telemetry, compulsory style/motion and the gain scoreboard are deliberately removed. Unchanged historical snapshots still carry unresolved licensing caveats; this consolidation is **not a blanket legal clearance** of legacy redistribution. No upstream package refresh/adoption beyond the recorded versioned Impeccable license retrieval is implied.

The retained Apple/platform/Sonner/Expo/image and other historical snapshot assets do not all have individually pinned source/license records in this checkout. Folder names, attribution, or an apparently preserved upstream notice do not establish permission. Resolve each asset's exact source and terms before relying on redistribution rights. The engineering SOURCES/LICENSE files remain mapped to their described adapted material.

Impeccable's `skill-v4.5.0` tag resolves to commit `508d7e8955de3b3caf2d8676e85206723d41a887`. The complete upstream Apache-2.0 `LICENSE` was retrieved from that commit; its Git blob SHA `bb3f6d23b1f8025514a62a12b51b47d73e3c9aa9` matches the deployed `config/agent/skills/impeccable/LICENSE` byte-for-byte. The pinned root `NOTICE` request returned HTTP 404. The local Impeccable `SKILL.md` states its adaptation and license; other retained snapshot packages/assets still require independent provenance review.

Ponytail snapshots identify [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) and declare MIT. The complete upstream notice is now deployed as `ponytail/LICENSE.ponytail`, including Copyright (c) 2026 DietrichGebert. License-only evidence was read on 2026-10-05 at immutable revision `dbdfc8de29fb91609ed2df2ae378782a956d8e86`: [LICENSE](https://raw.githubusercontent.com/DietrichGebert/ponytail/dbdfc8de29fb91609ed2df2ae378782a956d8e86/LICENSE). This pin identifies inspected license evidence, **not** the revision of the older unversioned local skill bodies. Local adaptations consolidate review/audit/debt/help, correct scope reduction and authority/persistence/intelligence/check rules; no upstream plugin/benchmark is adopted.

Existing-file changes to Impeccable, images/brand, Stitch, break-ui and prototype are local authority/brief corrections; no legacy content is moved into new assets. A later complexity-only correction removes break-ui's duplicated Rule 6 while retaining the existing general trust rule and all other procedures. Stitch DESIGN.md is an independently authored, explicitly labeled example, not canonical project truth. Shared motion guidance is lazy-loaded from animate rather than stacked automatically.

## Retired entrypoints: migration map

These 17 folders/public names are historical migration identifiers, not invocations or links to retained aliases. Installation is non-pruning: old native folders remain discoverable in existing homes until a separately authorized retirement moves them outside **all skill discovery roots**. Inspect and preserve customized contents first; do not blanket-delete directories. This task does not mutate a live home or claim 36-name discovery there.

| Retired folder under `.omp/agent/skills/` | Former public name | Surviving action/reference or removal |
|---|---|---|
| `emil-animate` | `emil-animate` | animate `build`: `skill://animate/references/build.md` |
| `emil-find-animation-opportunities` | `emil-find-animation-opportunities` | animate `opportunities`: `skill://animate/references/opportunities.md` |
| `emil-review-animations` | `emil-review-animations` | explicit review-animations: `skill://review-animations` |
| `find-animation-opportunities` | `find-animation-opportunities` | animate `opportunities`: `skill://animate/references/opportunities.md` |
| `animation-vocabulary` | `animation-vocabulary` | animate `vocabulary`: `skill://animate/references/vocabulary.md` |
| `taste-skill` | `taste-skill` | design-taste-frontend: `skill://design-taste-frontend` |
| `taste-skill-v1` | `design-taste-frontend-v1` | Exact v1 procedure removed; current selective `skill://design-taste-frontend`, not v1 compatibility |
| `gpt-tasteskill` | `gpt-taste` | Taste optional scroll: `skill://design-taste-frontend/references/scroll-storytelling.md` |
| `redesign-skill` | `redesign-existing-projects` | Impeccable workflow plus `skill://design-taste-frontend/references/redesign.md` |
| `brutalist-skill` | `industrial-brutalist-ui` | Taste opt-in industrial-print/tactical-crt: `skill://design-taste-frontend/references/style-directions.md` |
| `minimalist-skill` | `minimalist-ui` | Taste opt-in minimalist-editorial: `skill://design-taste-frontend/references/style-directions.md#minimalist-editorial` |
| `soft-skill` | `high-end-visual-design` | Taste opt-in high-end-editorial: `skill://design-taste-frontend/references/style-directions.md#high-end-editorial` |
| `ponytail-review` | `ponytail-review` | ponytail `review`: `skill://ponytail/references/complexity-review.md` |
| `ponytail-audit` | `ponytail-audit` | ponytail `audit`: `skill://ponytail/references/complexity-review.md` |
| `ponytail-debt` | `ponytail-debt` | ponytail `debt`: `skill://ponytail/references/debt-ledger.md` |
| `ponytail-help` | `ponytail-help` | ponytail `help`: inline `skill://ponytail` table |
| `ponytail-gain` | `ponytail-gain` | Removed uncited static scoreboard; no replacement or measured-saving claim |

## Updates, deployment and evidence limits

An upstream updater targeting `.agent/skills/` or `.agents/skills/` can recreate retired roots. Choose the native destination and update a complete package plus its explicit `config/files.tsv` inventory, not piecemeal entrypoints/references or mixed-version launcher/binary files. The installer remains non-pruning and preserves pre-existing destination data: old installed directories are not automatically deleted. No live-home migration was performed. Inspect retained data before any separately authorized cleanup; do not treat consolidation as permission for blanket destructive deletion.

Tests, reports, recovery receipts, credentials, histories, generated state and assessment fixtures are excluded from deployment. OMP/model credentials and optional external integrations remain machine-local prerequisites; installation does not enable services. The earlier documentation-driven cutover changed passive skill payload, conditional AGENTS routing and the existing security-reviewer output/procedure. This consolidation additionally aligns skill-source discovery with the native folder; it does not alter model/approval policy or unrelated runtime configuration.

Historical root-consolidation evidence: POSIX integration passed 240 entries and a private-home install/doctor/reinstall plus OMP 18.5.0 passive discovery observed 53 names. Earlier 372/373-entry and 304-mapping results also remain history. They do not establish acceptance of the balanced catalog. Current verification and limits are recorded in README. No live-home deployment, engine/service execution or Windows verification is inferred from these records.
