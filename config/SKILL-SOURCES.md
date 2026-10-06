# Skill payload provenance

## Canonical OMP-native payload

The pre-change catalog had **41 public names**, **223 skill files** and **245 mappings**. The integrated source catalog contains **36 public entrypoints**, **222 skill files** and **244 managed mappings** in `config/files.tsv`. These are source inventory counts, not native discovery or successful deployment claims; fresh integrated verification remains pending. The fifteen-skill engineering suite remains 109 regular assets. No discovery provider/profile or installer pruning was added.
Native user/project skill discovery remains available. Managed `customDirectories` is empty and Agents user/project skill-source discovery is disabled, so retired `.agent`/`.agents` copies cannot reenter through those configured sources. External runtime/providers may still exist. These source settings do not prove native resolution, application-wide isolation or OS enforcement. Model, agent, plugin and MCP settings remain unchanged; native bash/eval approval patterns are documented below.



## Legacy independent snapshots and package selection

The original portable snapshot captured three local roots without merging distinct copies:

- Historical `config/agent/skills/` from `~/.omp/agent/skills/`.
- Retired `config/skills-agents/` from `~/.agents/skills/`.
- Retired `config/skills-agent/` from `~/.agent/skills/`.

That historical capture contained 64 directories and 253 files, with no symlinked skill entries/files and no separate LICENSE/COPYING notices. Unchanged snapshots retain their attribution and licensing caveat: local presence or a license link does not establish redistribution rights.

The earlier root consolidation removed nine byte-identical singular/plural trees, retired singular Impeccable 4.2.2 in favor of plural 4.3.1, then removed the plural root and six native/plural same-name duplicate packages. Its historical result retained 53 public names; the balanced semantic consolidation below supersedes that catalog, without aliases or symlinks.

The complete upstream Impeccable package is retained at `config/agent/skills/ui-design/`: version **4.5.0 with engine 0.1.11**, pinned to `skill-v4.5.0` commit `508d7e8955de3b3caf2d8676e85206723d41a887`. Its repository `LICENSE` is Apache-2.0, copyright 2025 Paul Bakaus; root `NOTICE` was absent at that revision. The complete license is mapped for deployment. The local entrypoint is marked modified for OMP-native permissions, authorization, routing and workflow. Historical older package and copy details remain as recorded; they do not grant rights to unresolved snapshots.

Historical path selection: the native `taste-skill` folder declaring `design-taste-frontend` moved to the matching canonical folder; the separately named plural `taste-skill` temporarily retained a distinct public name. Both public routing entrypoints are now retired; the current independently authored marketing procedure is a local `ui-design` reference. The alias folder `output-skill` and its public `full-output-enforcement` entrypoint are retired with no replacement; `image-to-code-skill` is aligned to `image-to-code`.

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
| [pbakaus/impeccable `skill-v4.5.0`](https://github.com/pbakaus/impeccable/tree/508d7e8955de3b3caf2d8676e85206723d41a887) | `508d7e8955de3b3caf2d8676e85206723d41a887` | Full Apache-2.0 license and Paul Bakaus attribution, deployed at `config/agent/skills/ui-design/LICENSE`; adapted entrypoint carries a modification notice |
| [Anti Slop `v3.2.20`](https://github.com/miqdadbadjuber/anti-slop/tree/91f12ec67e9de6043cfd93b846404986ba73c3f4) | `91f12ec67e9de6043cfd93b846404986ba73c3f4` | Full MIT, Copyright (c) 2026 Miqdad Badjuber (antislop), deployed beside the adaptation as `config/agent/extensions/LICENSE.antislop` |

Titus `3b752711dabebdc5f3762555d23fd75fc1c9eb92` has no established covering grant: ownership/frontier ideas are independently implemented, with no copied/translated prose or templates. The Pi shortlist is bounded reference/rejection evidence only; see engineering-docs/SOURCES.md for versions/pages and necessity decisions. No package body/notice, scanner dependency, YARA rule, executable, CI action, installer, plugin or service is adopted from those sources.

### Anti Slop compact extension

The extension `agent/extensions/antislop.js` selectively adapts principles from upstream [`skills/antislop/SKILL.md`](https://github.com/miqdadbadjuber/anti-slop/blob/91f12ec67e9de6043cfd93b846404986ba73c3f4/skills/antislop/SKILL.md), `skills/antislop-ui/SKILL.md`, and `skills/antislop-copywriting/SKILL.md` at the immutable revision above: product truth, purpose/content-led composition, specificity, honest copy, anti-filler and functional completeness. Those paths are relative to that same repository/revision. Policy wording is locally rewritten as a compact adaptation, not claimed to be independent of those sources. Trigger detection, native OMP integration, duplicate prevention, conditional delivery reporting and regression tests are independently authored local code.

Also reviewed at that revision: `skills/antislop-human/SKILL.md`, `skills/antislop-layoutmobile/SKILL.md`, `skills/antislop-code/SKILL.md`, and the complete [`LICENSE`](https://github.com/miqdadbadjuber/anti-slop/blob/91f12ec67e9de6043cfd93b846404986ba73c3f4/LICENSE). Human/mobile procedures remain with existing UI owners; comment hygiene is deferred. No upstream skill/plugin/installer code is deployed. Six public skills, mode questions/global preferences, entry-file pointers/wizard, audit directories, self-update, marketplace integration, full rule catalog and rigid prose/style bans were intentionally not adopted. See [durable ownership decisions](../docs/capabilities.md#anti-slop-selective-merge).

Checked 2026-10-06: GitHub's latest release was `v3.2.20`. Current upstream main `388cbe3b6c37d5175b9f460015bb092ef9e34894` was [one README-only commit ahead](https://github.com/miqdadbadjuber/anti-slop/compare/91f12ec67e9de6043cfd93b846404986ba73c3f4...388cbe3b6c37d5175b9f460015bb092ef9e34894), with no changes to the six skill sources or license.

The native integration basis is official OMP v18.6.1 [`types.ts`](https://github.com/can1357/oh-my-pi/blob/2a2c6dcbbb558c0f8145f67f28b3370984f2bf60/packages/coding-agent/src/extensibility/extensions/types.ts) (`BeforeAgentStartEvent` / `BeforeAgentStartEventResult`) and [`runner.ts`](https://github.com/can1357/oh-my-pi/blob/2a2c6dcbbb558c0f8145f67f28b3370984f2bf60/packages/coding-agent/src/extensibility/extensions/runner.ts) (`emitBeforeAgentStart`), also checked at v18.6.3 commit `093275112f7adff207608673c0e33c7f3d16e27f`. The contract provides and accepts `systemPrompt: string[]`; handlers chain in order and returned policy applies to the request and continuations until the next preparation. This is source compatibility evidence, not authenticated runtime or model-compliance proof.

`config/agent/skills/engineering-docs/` is the sole active documentation owner. Its initial 25 production files come only from staging SKILL/references/templates. Staging bodies, frozen tests/reports and old smoke/ALL51 receipts remain historical, not acceptance of this replacement suite. The 129-concept registry, manifest/trace semantics and seven template contracts are preserved.

## Balanced consolidation and licensing boundary

The exact cutover map below records old package/public-name ownership. Web-motion build/opportunities/vocabulary/principles, the existing-motion audit/plan/execute procedure, diff-review procedure/standards, Taste marketing procedure/references and Emil component procedure/examples are independently authored current repository guidance. They are preserved as local references, not attributed as copied Paul Bakaus, Emil or Taste prose. Common technical glossary terms and underlying capabilities are retained, not the legacy expressive prose. No new grant is inferred from local presence, source URLs or attribution.

Omitted copied material: legacy motion construction/finder prose, full glossary definitions, review standards/audit/plan templates, Taste/style/scroll recipes and nonexistent blocks instructions, and Emil philosophy/quotes/component-motion recipes. These are replaced by original procedures/definitions/examples, not copied or translated into new references. Exact v1 procedures, greetings, fabricated RNG/assets/telemetry, compulsory style/motion and the gain scoreboard are deliberately removed. Unchanged historical snapshots still carry unresolved licensing caveats; this consolidation is **not a blanket legal clearance** of legacy redistribution. No upstream package refresh/adoption beyond the recorded versioned Impeccable license retrieval is implied.

The retained Apple/platform/Sonner/Expo/image and other historical snapshot assets do not all have individually pinned source/license records in this checkout. Folder names, attribution, or an apparently preserved upstream notice do not establish permission. Resolve each asset's exact source and terms before relying on redistribution rights. The engineering SOURCES/LICENSE files remain mapped to their described adapted material.

Impeccable's `skill-v4.5.0` tag resolves to commit `508d7e8955de3b3caf2d8676e85206723d41a887`. Its complete Apache-2.0 `LICENSE` was retrieved from that commit; the Git blob SHA `bb3f6d23b1f8025514a62a12b51b47d73e3c9aa9` matches the deployed license byte-for-byte. The pinned root `NOTICE` request returned HTTP 404. The public entrypoint is adapted and marked; the upstream package assets retain their technical/product identities. Main's pre-move baseline is `local://docflow-impeccable-baseline.json`; compare all mapped package files byte-for-byte after the cutover. This is not blanket legal clearance for unresolved historical snapshots.

Code-simplicity snapshots identify [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) and declare MIT. The complete upstream notice is retained at `config/agent/skills/code-simplicity/LICENSE.ponytail`, including Copyright (c) 2026 DietrichGebert. License-only evidence was read on 2026-10-05 at immutable revision `dbdfc8de29fb91609ed2df2ae378782a956d8e86`: [LICENSE](https://raw.githubusercontent.com/DietrichGebert/ponytail/dbdfc8de29fb91609ed2df2ae378782a956d8e86/LICENSE). This pin identifies inspected license evidence, not the revision of the older unversioned local skill bodies. The public capability rename preserves these provenance markers and does not adopt an upstream plugin/benchmark.

The approved moves preserve original technical package identities and licenses. Independently authored UI/motion reference material remains in local overlays and is not attributed to Impeccable or an upstream snapshot. Historical unpinned Apple/platform/Sonner/Expo/image sources remain unresolved; no license grant is inferred by moving or retaining a file.

| Original source asset(s) | Current maintained owner | Source / notice boundary |
|---|---|---|
| `impeccable/**` | `agent/skills/ui-design/**` (all 64 original package files) | Pinned Apache-2.0 package above; only adapted SKILL public metadata/routing changed. Original product/scripts/assets remain Impeccable. |
| `emil-design-eng/SKILL.md`, `references/component-craft.md` | `ui-design/reference/local/component-craft.md`, `component-craft/examples.md` | Independently authored current procedure/examples; not upstream Impeccable package authorship. |
| `design-taste-frontend/SKILL.md`, `references/*.md` | `ui-design/reference/local/marketing-sites.md`, `marketing-sites/*.md` | Independently authored current selective marketing procedure/references; no grant inferred from historical Taste snapshots. |
| `animate/SKILL.md`, `references/*.md`, `RECIPES.md` | `web-motion/SKILL.md`, `references/*.md`, `RECIPES.md` | Core trigger table consolidated; complete build/opportunities/vocabulary retained. RECIPES retains its historical source/license caveat. |
| `improve-animations/SKILL.md`, `AUDIT.md`, `PLAN-TEMPLATE.md` | `web-motion/references/existing-motion.md`, `audit.md`, `plan-template.md` | Complete locally authored audit/plan/execute procedure and evidence/authority preserved. |
| `review-animations/SKILL.md`, `STANDARDS.md` | `web-motion/references/diff-review.md`, `review-standards.md` | Complete locally authored findings/verdict procedure preserved; explicit-only instruction, no metadata access gate. |
| `ponytail/**` | `code-simplicity/**` | Unversioned adapted body caveat; full `LICENSE.ponytail` unchanged. Historical `ponytail:` input marker retained for debt discovery, not an alias. |
| `retro/**` | `retrospective/**` | Pinned GSD local mapping in `SOURCES.md`; immutable upstream identities and full `LICENSE.gsd` unchanged. |
| Expo, prototype, stress-test, mobile, brand, Stitch, Swift and image-to-code original packages | Corresponding complete renamed packages in [migration map](../docs/migration.md#public-name-migration) | Whole technical content retained; no new source/license grant. Existing snapshot uncertainties remain. |
| `output-skill/SKILL.md` | Retired; history only | Original local guidance duplicated baseline completeness; no notice asset removed or replacement introduced. |

All 25 pre-cutover distributed notice assets remain mapped, with `impeccable/LICENSE` → `ui-design/LICENSE`, `ponytail/LICENSE.ponytail` → `code-simplicity/LICENSE.ponytail`, and `retro/LICENSE.gsd` → `retrospective/LICENSE.gsd`; the other 22 paths are unchanged. The catalog checker records the exact retained paths and baseline hashes; Main must exercise it before accepting preservation.

The complexity-only cleanup consolidated repeated image/detail guidance and optional direction quotas in the image-to-code, web/mobile image and brand-concepts snapshots. Impeccable's existing `scripts/live-browser.js` has marked local modifications sharing count-button behavior and removing unused private helpers; the public folder rename does not alter launcher/script names or package internals.

The local UI workflow links the independently authored OpenDesign reference at `agent/skills/ui-design/reference/open-design.md`, with a conditional pointer in managed AGENTS.md. It defines explicit external-artifact availability, project selection, handoff, run inspection and proposal boundaries without adding a public skill, role or routing engine. Immutable official OpenDesign interface/source links and inspected-version distinctions are evidence only; no upstream executable or prose payload is redistributed.

The [upstream-update-review procedure](agent/skills/upstream-update-review/SKILL.md) is independently authored original guidance. It consumes the existing inventory/provenance and authoritative upstream evidence without copying upstream payload or creating a source registry. Its recommendations do not authorize adoption; existing security, authoring and integration owners retain their boundaries. No separate SOURCES file or notice is needed for this original procedure.
The `commit-message` skill is original, locally authored guidance based on the task requirements and supplied current repository-style observations. Its `SOURCES.md` records conceptual research and rejected mutation behavior; no upstream prose, templates, or code were copied or adapted.

The original `github-triage`, `work-with-pr`, and `unpublished-changes` skills each have their own `SOURCES.md`; each records independent authorship and no imported skill/code. Native destructive-shell policy was grounded in the official OMP v18.6.1 matcher and approval resolver: [bash.ts at pinned commit](https://github.com/can1357/oh-my-pi/blob/2a2c6dcbbb558c0f8145f67f28b3370984f2bf60/packages/coding-agent/src/tools/bash.ts) and [approval-mode.md](https://github.com/can1357/oh-my-pi/blob/2a2c6dcbbb558c0f8145f67f28b3370984f2bf60/docs/approval-mode.md). The source tree's MIT license was inspected at `/tmp/omp-safety-source/LICENSE` (copyright 2025 Mario Zechner, 2025–2026 Can Bölük, 2026 Stencil Labs, Inc.); no source code or regex was copied. OMP v18.6.1 applies a matching bash-pattern deny before critical-command detection, but critical detection precedes prompt-rule return. Because critical absolute `rm -rf /tmp` therefore gets only the bare override that yolo ignores, recursive force-rm forms use explicit `deny`, not `prompt`. This intentionally prevents those matching agent bash calls even in yolo; legitimate cleanup requires a separately user-controlled path, never `eval` as an evasion. Git destructive-pattern rules remain prompts. The requested AGY inspiration was limited to its public README and root API listing; workflow automation/auto-repair concepts were rejected as incompatible, and no text/code was read or copied.

## Retired entrypoints: migration map

See the canonical [existing-home skill retirement map](../docs/migration.md#public-name-migration) for current renamed/merged/retired identifiers, prior historical identifiers and non-pruning cleanup boundaries.

## Updates, deployment and evidence limits

An upstream updater targeting `.agent/skills/` or `.agents/skills/` can recreate retired roots. Choose the native destination and update a complete package plus its explicit `config/files.tsv` inventory, not piecemeal entrypoints/references or mixed-version launcher/binary files. The installer remains non-pruning and preserves pre-existing destination data: old installed directories are not automatically deleted. No live-home migration was performed. Inspect retained data before any separately authorized cleanup; do not treat consolidation as permission for blanket destructive deletion.

Tests, reports, recovery receipts, credentials, histories, generated state and assessment fixtures are excluded from deployment. OMP/model credentials and optional external integrations remain machine-local prerequisites; installation does not enable services. Earlier cutovers changed passive guidance and approval/discovery policy as recorded in history. This catalog change modifies only skill assets, skill-routing pointers, inventory/checker and documentation; models, agents, extensions, WATCHDOG, plugins and unrelated runtime configuration are unchanged.

Historical root-consolidation evidence: POSIX integration passed 240 entries and a private-home install/doctor/reinstall plus OMP 18.5.0 passive discovery observed 53 names. Earlier 372/373-entry and 304-mapping results also remain history. They do not establish acceptance of the balanced catalog. Current verification and limits are recorded in [verification records](../docs/verification.md). No live-home deployment, engine/service execution or Windows verification is inferred from these records.
