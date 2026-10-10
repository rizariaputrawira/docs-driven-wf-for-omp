# Skill payload provenance and license boundaries

Source catalog basis: inspected current checkout; the historical source baseline
remains a separate provenance fact. The current result contains 37 canonical
capabilities (34 visible, three explicit-only), 14 hidden locally authored
compatibility pointers, 269 skill assets and 294 explicit mappings. Counts do
not prove native discovery or legal clearance.

Public capability names are separate from source identities. Renaming never erases
upstream authorship. Full notices accompany affected deployed packages, not only
this non-deployed index. Per-package SOURCES.md owns exact immutable upstream paths,
local file scope and modifications. No blanket license-compliance claim is made.

## Compact picker provenance keys

Selected OMP skill descriptions put these short source labels before the functional
trigger; each label resolves to the full records and license notices below or in
the named package record:

| Picker label | Full source identity | Skills / complete lineage |
|---|---|---|
| `[Ponytail]` | DietrichGebert/ponytail | `code-simplicity`; the pinned revision identifies license evidence only, and the historical body revision remains unresolved. The precise boundary and MIT notice are in retained licensed boundaries below; source uncertainty is not hidden by the label. |
| `[Matt+Superpowers]` | Matt Pocock's `mattpocock/skills` and Jesse Vincent's `obra/superpowers` | `agent-guidance`, `code-debugging`, `code-review`, `code-tdd`, `workflow-brainstorming`, `workflow-delivery`; exact paths, pinned revisions, mapped merges and MIT notices are in each skill's `SOURCES.md`. |
| `[Matt Pocock]` | Matt Pocock's `mattpocock/skills` | `docs-domain-modeling`; exact pinned paths and MIT notice are in its `SOURCES.md`. |
| `[Open GSD]` | Open GSD's `open-gsd/gsd-core` | `docs-engineering`, `docs-plan-review`, `workflow-delivery`, `workflow-handoff`, `workflow-handoff-read`, `workflow-retrospective`; exact path maps, pinned revision and MIT notices are in package `SOURCES.md` files. |
| `[Emil Kowalski]` | Emil Kowalski's `emilkowalski/skills` | `swift-development`, `ui-expo-motion`, `ui-gesture-design`, `ui-library-selection`, `ui-mobile-web`, `ui-prototyping`, `ui-sonner`, `ui-stress-test`; `ui-web-motion` uses only Emil-derived `RECIPES.md`, while its core and other local references are independently authored. Exact compared source paths, revision, notices and historical-import limits are in package `SOURCES.md` files. |
| `[Taste]` | Leonxlnx's `Leonxlnx/taste-skill` | `brand-concepts`, `ui-image-generation`, `ui-image-to-code`; exact compared source paths, revision, notices and historical-import limits are in package `SOURCES.md` files. |
| `[Impeccable]` | Paul Bakaus's `pbakaus/impeccable` | `ui-design`; entrypoint, retained references/scripts, nested attribution and license boundaries are detailed below and in `config/agent/skills/ui-design/NOTICE.md`. |
| `[NVIDIA]` | NVIDIA's `NVIDIA/SkillSpector` | `security-intake`; exact pinned source mapping and Apache-2.0 notice are in its `SOURCES.md`. |
| `[Anthropic]` | Anthropic's `anthropics/claude-code-security-review` | `security-review`; exact pinned command mapping and MIT notice are in its `SOURCES.md`. |
| `[Cloudflare]` | Cloudflare's `cloudflare/security-audit-skill` | `security-audit`; exact pinned file mapping and MIT notice are in its `SOURCES.md`. |

Labels are navigation aids, not source or license claims beyond their documented
scope. Full source URLs, revisions, merge lineage, modifications and notices remain
in the package ledgers; picker text intentionally omits that detail.

## Emil and Taste source confirmation

Compared immutable revisions were independently checked against current upstream
main on 2026-10-06. Clone-byte SHA-256/diff comparisons covered all 19 listed files:
six baseline byte-identical, eleven modified/adapted with substantial matching
expression, two Stitch files unresolved. These revisions identify the exact
**comparison source**, not an established historical import commit. Historical
local snapshot dates do not prove when/from which upstream commit copying occurred.

- [emilkowalski/skills](https://github.com/emilkowalski/skills/tree/e8a175de22ae1e49370fc144c1f3bb9aeedf988d),
  `e8a175de22ae1e49370fc144c1f3bb9aeedf988d`: MIT, Copyright (c) 2026 Emil Kowalski.
- [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill/tree/ce26fc25c0e5e8cab638f883de62d9a86ee5e45b),
  `ce26fc25c0e5e8cab638f883de62d9a86ee5e45b`: MIT, Copyright (c) 2026 Leonxlnx.

| Source at the pin above / exact upstream path | Baseline local file | Distributed local file | Relationship and modification | Notice |
|---|---|---|---|---|
| [emilkowalski/skills: skills/apple-design/SKILL.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/apple-design/SKILL.md) | `config/agent/skills/apple-design/SKILL.md` | [agent/skills/ui-gesture-design/SKILL.md](agent/skills/ui-gesture-design/SKILL.md) | BYTE-IDENTICAL baseline; now metadata/attribution adapted; modifications in package SOURCES.md | [agent/skills/ui-gesture-design/LICENSE.emil](agent/skills/ui-gesture-design/LICENSE.emil) |
| [emilkowalski/skills: skills/ask-sonner/SKILL.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/ask-sonner/SKILL.md) | `config/agent/skills/ask-sonner/SKILL.md` | [agent/skills/ui-sonner/SKILL.md](agent/skills/ui-sonner/SKILL.md) | BYTE-IDENTICAL baseline; now metadata/attribution adapted; modifications in package SOURCES.md | [agent/skills/ui-sonner/LICENSE.emil](agent/skills/ui-sonner/LICENSE.emil) |
| [emilkowalski/skills: skills/ask-sonner/API.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/ask-sonner/API.md) | `config/agent/skills/ask-sonner/API.md` | [agent/skills/ui-sonner/API.md](agent/skills/ui-sonner/API.md) | BYTE-IDENTICAL asset retained; modifications in package SOURCES.md | [agent/skills/ui-sonner/LICENSE.emil](agent/skills/ui-sonner/LICENSE.emil) |
| [emilkowalski/skills: skills/pick-ui-library/SKILL.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/pick-ui-library/SKILL.md) | `config/agent/skills/pick-ui-library/SKILL.md` | [agent/skills/ui-library-selection/SKILL.md](agent/skills/ui-library-selection/SKILL.md) | BYTE-IDENTICAL baseline; now metadata/attribution adapted; modifications in package SOURCES.md | [agent/skills/ui-library-selection/LICENSE.emil](agent/skills/ui-library-selection/LICENSE.emil) |
| [emilkowalski/skills: skills/animate-expo/SKILL.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/animate-expo/SKILL.md) | `config/agent/skills/expo-motion/SKILL.md` | [agent/skills/ui-expo-motion/SKILL.md](agent/skills/ui-expo-motion/SKILL.md) | MODIFIED/ADAPTED; local native-authority/brief corrections retained; modifications in package SOURCES.md | [agent/skills/ui-expo-motion/LICENSE.emil](agent/skills/ui-expo-motion/LICENSE.emil) |
| [emilkowalski/skills: skills/animate-expo/RECIPES.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/animate-expo/RECIPES.md) | `config/agent/skills/expo-motion/RECIPES.md` | [agent/skills/ui-expo-motion/RECIPES.md](agent/skills/ui-expo-motion/RECIPES.md) | BYTE-IDENTICAL asset retained; modifications in package SOURCES.md | [agent/skills/ui-expo-motion/LICENSE.emil](agent/skills/ui-expo-motion/LICENSE.emil) |
| [emilkowalski/skills: skills/write-swift/SKILL.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/write-swift/SKILL.md) | `config/agent/skills/swift-development/SKILL.md` | [agent/skills/swift-development/SKILL.md](agent/skills/swift-development/SKILL.md) | MODIFIED/ADAPTED; local native-authority/brief corrections retained; modifications in package SOURCES.md | [agent/skills/swift-development/LICENSE.emil](agent/skills/swift-development/LICENSE.emil) |
| [emilkowalski/skills: skills/mobile-native/SKILL.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/mobile-native/SKILL.md) | `config/agent/skills/mobile-web/SKILL.md` | [agent/skills/ui-mobile-web/SKILL.md](agent/skills/ui-mobile-web/SKILL.md) | MODIFIED/ADAPTED; local native-authority/brief corrections retained; modifications in package SOURCES.md | [agent/skills/ui-mobile-web/LICENSE.emil](agent/skills/ui-mobile-web/LICENSE.emil) |
| [emilkowalski/skills: skills/prototype/SKILL.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/prototype/SKILL.md) | `config/agent/skills/ui-prototyping/SKILL.md` | [agent/skills/ui-prototyping/SKILL.md](agent/skills/ui-prototyping/SKILL.md) | MODIFIED/ADAPTED; local native-authority/brief corrections retained; modifications in package SOURCES.md | [agent/skills/ui-prototyping/LICENSE.emil](agent/skills/ui-prototyping/LICENSE.emil) |
| [emilkowalski/skills: skills/prototype/PICKER.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/prototype/PICKER.md) | `config/agent/skills/ui-prototyping/PICKER.md` | [agent/skills/ui-prototyping/PICKER.md](agent/skills/ui-prototyping/PICKER.md) | MODIFIED/ADAPTED; local native-authority/brief corrections retained; modifications in package SOURCES.md | [agent/skills/ui-prototyping/LICENSE.emil](agent/skills/ui-prototyping/LICENSE.emil) |
| [emilkowalski/skills: skills/break-ui/SKILL.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/break-ui/SKILL.md) | `config/agent/skills/ui-stress-test/SKILL.md` | [agent/skills/ui-stress-test/SKILL.md](agent/skills/ui-stress-test/SKILL.md) | MODIFIED/ADAPTED; local native-authority/brief corrections retained; modifications in package SOURCES.md | [agent/skills/ui-stress-test/LICENSE.emil](agent/skills/ui-stress-test/LICENSE.emil) |
| [emilkowalski/skills: skills/break-ui/CATALOG.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/break-ui/CATALOG.md) | `config/agent/skills/ui-stress-test/CATALOG.md` | [agent/skills/ui-stress-test/CATALOG.md](agent/skills/ui-stress-test/CATALOG.md) | BYTE-IDENTICAL asset retained; modifications in package SOURCES.md | [agent/skills/ui-stress-test/LICENSE.emil](agent/skills/ui-stress-test/LICENSE.emil) |
| [emilkowalski/skills: skills/animate/RECIPES.md](https://github.com/emilkowalski/skills/blob/e8a175de22ae1e49370fc144c1f3bb9aeedf988d/skills/animate/RECIPES.md) | `config/agent/skills/web-motion/RECIPES.md` | [agent/skills/ui-web-motion/RECIPES.md](agent/skills/ui-web-motion/RECIPES.md) | MODIFIED/ADAPTED; local native-authority/brief corrections retained; modifications in package SOURCES.md | [agent/skills/ui-web-motion/LICENSE.emil](agent/skills/ui-web-motion/LICENSE.emil) |
| [Leonxlnx/taste-skill: skills/imagegen-frontend-web/SKILL.md](https://github.com/Leonxlnx/taste-skill/blob/ce26fc25c0e5e8cab638f883de62d9a86ee5e45b/skills/imagegen-frontend-web/SKILL.md) | `config/agent/skills/imagegen-frontend-web/SKILL.md` | [agent/skills/ui-image-generation/references/web.md](agent/skills/ui-image-generation/references/web.md) | MODIFIED/ADAPTED; local native-authority/brief corrections retained; modifications in package SOURCES.md | [agent/skills/ui-image-generation/LICENSE.taste](agent/skills/ui-image-generation/LICENSE.taste) |
| [Leonxlnx/taste-skill: skills/imagegen-frontend-mobile/SKILL.md](https://github.com/Leonxlnx/taste-skill/blob/ce26fc25c0e5e8cab638f883de62d9a86ee5e45b/skills/imagegen-frontend-mobile/SKILL.md) | `config/agent/skills/imagegen-frontend-mobile/SKILL.md` | [agent/skills/ui-image-generation/references/mobile.md](agent/skills/ui-image-generation/references/mobile.md) | MODIFIED/ADAPTED; local native-authority/brief corrections retained; modifications in package SOURCES.md | [agent/skills/ui-image-generation/LICENSE.taste](agent/skills/ui-image-generation/LICENSE.taste) |
| [Leonxlnx/taste-skill: skills/image-to-code-skill/SKILL.md](https://github.com/Leonxlnx/taste-skill/blob/ce26fc25c0e5e8cab638f883de62d9a86ee5e45b/skills/image-to-code-skill/SKILL.md) | `config/agent/skills/image-to-code/SKILL.md` | [agent/skills/ui-image-to-code/SKILL.md](agent/skills/ui-image-to-code/SKILL.md) | MODIFIED/ADAPTED; local native-authority/brief corrections retained; modifications in package SOURCES.md | [agent/skills/ui-image-to-code/LICENSE.taste](agent/skills/ui-image-to-code/LICENSE.taste) |
| [Leonxlnx/taste-skill: skills/brandkit/SKILL.md](https://github.com/Leonxlnx/taste-skill/blob/ce26fc25c0e5e8cab638f883de62d9a86ee5e45b/skills/brandkit/SKILL.md) | `config/agent/skills/brand-concepts/SKILL.md` | [agent/skills/brand-concepts/SKILL.md](agent/skills/brand-concepts/SKILL.md) | MODIFIED/ADAPTED; local native-authority/brief corrections retained; modifications in package SOURCES.md | [agent/skills/brand-concepts/LICENSE.taste](agent/skills/brand-concepts/LICENSE.taste) |
| [Leonxlnx/taste-skill: skills/stitch-skill/SKILL.md](https://github.com/Leonxlnx/taste-skill/blob/ce26fc25c0e5e8cab638f883de62d9a86ee5e45b/skills/stitch-skill/SKILL.md) | `config/agent/skills/stitch-design-input/SKILL.md` | [agent/skills/stitch-design-input/SKILL.md](agent/skills/stitch-design-input/SKILL.md) | SOURCE UNCERTAIN; no merge/rename; modifications in package SOURCES.md | [agent/skills/stitch-design-input/LICENSE.taste](agent/skills/stitch-design-input/LICENSE.taste) |
| [Leonxlnx/taste-skill: skills/stitch-skill/DESIGN.md](https://github.com/Leonxlnx/taste-skill/blob/ce26fc25c0e5e8cab638f883de62d9a86ee5e45b/skills/stitch-skill/DESIGN.md) | `config/agent/skills/stitch-design-input/DESIGN.md` | [agent/skills/stitch-design-input/DESIGN.md](agent/skills/stitch-design-input/DESIGN.md) | SOURCE UNCERTAIN; no merge/rename; modifications in package SOURCES.md | [agent/skills/stitch-design-input/LICENSE.taste](agent/skills/stitch-design-input/LICENSE.taste) |

Notice scope: each Emil/Taste-derived distributed package carries its complete
unchanged MIT notice. The merged image-generation package maps both web/mobile
source procedures under the Taste notice. ui-web-motion/LICENSE.emil covers its
retained RECIPES.md only; its core and other local references remain independently
authored. Impeccable owns no Emil/Taste payload merely because UI routing selects it.

**Stitch remains SOURCE UNCERTAIN.** Its current locally rewritten SKILL.md and
DESIGN.md have insufficient matching expression at the inspected Taste pin to
establish source identity or independence. The candidate Taste notice is included
conservatively. This does not resolve source lineage or establish a covering grant.
The package remains intact, unmerged and unrenamed.

## Retained licensed boundaries

All 25 pre-change notices are retained byte-for-byte, including notices moved with
canonical folders. Full notice text was freshly compared with immutable upstream
LICENSE sources, ignoring only reader transport terminal whitespace, for the nine
repositories below. That text comparison is not a byte-equality claim about reader
transport. Existing notice hashes and new clone-byte notices are checked separately.

| Source repository | Immutable revision / exact source scope | Relationship / local scope | License and copyright | Distributed notice / modification record |
|---|---|---|---|---|
| pbakaus/impeccable | skill-v4.5.0, 508d7e8955de3b3caf2d8676e85206723d41a887; versioned skill package | MODIFIED/ADAPTED entrypoint, reference/critique.md optional-state discovery, and scripts/live-browser.js (direct session-helper bindings; local modification notices); provider-exported references retained; independent supplements under reference/local | Apache-2.0, Copyright 2025 Paul Bakaus; separate nested notices below | agent/skills/ui-design/LICENSE and unchanged root NOTICE.md; entrypoint, critique reference and browser-script modification notices |
| ehmo/platform-design-skills | Parent Impeccable NOTICE identifies source/author; baff03e456864470db3ba8acebc41a003cbfa541 is inspected LICENSE evidence only, not the adapted body revision | Distilled iOS/Android references in Impeccable's pinned provider export | MIT text, Copyright (c) 2026 (no named holder); original-body/license-at-adaptation and underlying-source rights UNVERIFIED | ui-design/NOTICE.md and LICENSE.platform-design-skills; nested evidence limits below |
| miqdadbadjuber/anti-slop | v3.2.20, 91f12ec67e9de6043cfd93b846404986ba73c3f4; skills/antislop, antislop-ui, antislop-copywriting SKILL.md | MODIFIED/ADAPTED compact policy in agent/extensions/antislop.js; integration/trigger code locally authored | MIT, Copyright (c) 2026 Miqdad Badjuber (antislop) | agent/extensions/LICENSE.antislop; extension attribution and durable decision record |
| NVIDIA/SkillSpector | 35270064e42230dbc566e4134c55b5d581355db3; skills/skill-inspector/SKILL.md | MODIFIED/ADAPTED security-intake SKILL and intake-checklist; no scanner/dependencies distributed | Apache-2.0, Copyright 2026 NVIDIA CORPORATION & AFFILIATES | security-intake/LICENSE.skillspector and SOURCES.md; THIRD_PARTY_NOTICES.md covers unbundled scanner/runtime dependencies, excluded with source scope rationale |
| anthropics/claude-code-security-review | 0c6a49f1fa56a1d472575da86a94dbc1edb78eda; .claude/commands/security-review.md | MODIFIED/ADAPTED security-review core/change-review; source-only native boundaries | MIT, Copyright (c) 2025 Anthropic | security-review/LICENSE.anthropic and SOURCES.md |
| cloudflare/security-audit-skill | c1c8a8c1471069fb0e188eeaff69b8e8db6564a8; skills/security-audit/{SKILL,RECONNAISSANCE,HUNTING,VALIDATION-AND-REPORTING,ATTACK-CLASSES,AI-AND-LLM,RESOURCE-EXHAUSTION-AND-AVAILABILITY,SUPPLY-CHAIN-AND-RELEASE}.md | MODIFIED/ADAPTED security-audit and seven references, not full upstream engine | MIT, Copyright (c) 2025-2026 Cloudflare, Inc. | security-audit/LICENSE.cloudflare and exact per-file SOURCES.md |
| DietrichGebert/ponytail | dbdfc8de29fb91609ed2df2ae378782a956d8e86 pins LICENSE only, not old body | MODIFIED/ADAPTED code-simplicity; historical body revision unresolved | MIT, Copyright (c) 2026 DietrichGebert | code-simplicity/LICENSE.ponytail; historical ponytail: debt marker retained, not dispatcher |
| mattpocock/skills | d81f3a183412e71a5b1e84ca21bc1a35eea03a60; exact skill paths in affected package SOURCES.md | MODIFIED/ADAPTED code-review/debugging/TDD, domain modeling, brainstorming/delivery, agent guidance | MIT, Copyright (c) 2026 Matt Pocock | LICENSE.matt inside every affected deployed package; original exact source path maps retained |
| obra/superpowers | 8ca22dba9a94f28898bbce59f2537ff4d87c747d; exact skill/reference paths in package SOURCES.md | MODIFIED/ADAPTED code-review/debugging/TDD, brainstorming/delivery, agent guidance | MIT, Copyright (c) 2025 Jesse Vincent | LICENSE.superpowers inside every affected package; SOURCES.md modifications |
| open-gsd/gsd-core | 69f890fc36e6cfc90f2b1fcebb502ef76bbe8aa8; exact templates/skills in package SOURCES.md | MODIFIED/ADAPTED docs-engineering/plan-review, workflow-delivery/handoff/read/retrospective | MIT, Copyright (c) 2026 Open GSD | LICENSE.gsd inside every affected package; exact path/modification maps |

### Impeccable nested platform attribution

The pinned [root NOTICE.md](https://github.com/pbakaus/impeccable/blob/508d7e8955de3b3caf2d8676e85206723d41a887/NOTICE.md)
names `ehmo/platform-design-skills`, MIT and author ehmo for the distilled
iOS/Android references. The earlier claim that this notice was absent was
incorrect. Its unchanged 503-byte text now accompanies the deployed package as
`agent/skills/ui-design/NOTICE.md`; SHA-256
`c60a093c2845fd9fb82f9c6f742ece31f379f8190b535309d32d66c45ccffdcb`.

The local iOS/Android texts match the pinned upstream `.pi/skills/impeccable/reference/`
exports byte-for-byte; the upstream `skill/reference/` sources additionally
contain rule-marker comments removed by the provider export. This difference
is not evidence of unrecorded local platform-guidance edits.

The complete [original-source MIT LICENSE](https://github.com/ehmo/platform-design-skills/blob/baff03e456864470db3ba8acebc41a003cbfa541/LICENSE)
is preserved as `agent/skills/ui-design/LICENSE.platform-design-skills`, SHA-256
`1126322e2cc8d165adc4c792eeb195717de2bcc7b39be1ce77959d78e87ef685`.
Its copyright text is exactly `Copyright (c) 2026`, without a named holder;
author ehmo is identified in the parent NOTICE, not inserted into the license.
Revision `baff03e456864470db3ba8acebc41a003cbfa541` pins inspected license
evidence only, not the original body used by Impeccable. That body/license
baseline and broader rights in underlying platform-source material remain
UNVERIFIED. Notice preservation is not comprehensive redistribution clearance.

## Independently authored material and exclusions

Git commit-message, PR work, triage, change-status and upstream review are locally
authored procedures. The fourteen compatibility pointers and new shared
image-generation selector are locally authored integration text; platform bodies
remain attributed adaptations. Passive routing/config/installer/checkers are local
mechanisms, not imported upstream engines. Original UI component/marketing local
supplements and current motion core/review/audit references remain separately
identified local material. They are not represented as Impeccable-owned assets.

## Playwright CLI

Microsoft's official npm package `@playwright/cli@0.1.22` was installed globally
for this WSL user from the npm registry. Metadata identifies repository
`microsoft/playwright-cli`, Apache-2.0, and `playwright` /
`playwright-core@1.64.0-alpha-1790635538000`; Playwright's managed Chromium
155.0.8059.12 (revision 1247), headless shell and FFmpeg were downloaded by the
official CLI to `~/.cache/ms-playwright`. Node.js v24.20.0 satisfies the official
CLI documentation's Node.js 20+ requirement. Inspected local package manifest,
CLI entrypoint, skill-check helper, README, bundled skill and session reference.
The upstream skill's storage-state, cookie, attach and page-provided tool
procedures are not adopted; `ui-browser` is independently authored for OMP and
keeps those operations out of ordinary browser work. The CLI entrypoint makes a
daily request to `https://registry.npmjs.org/@playwright/cli/latest` unless
`NO_UPDATE_NOTIFIER` or `CI` is set; OMP guidance uses `NO_UPDATE_NOTIFIER=1`.
Remaining intake limits: transitive Playwright runtime implementation and
dependency source were not exhaustively audited, and their package signatures,
build provenance and runtime behavior are not certified. This records local
package/source evidence, not a safety certification or runtime proof.

Source documentation: [installation](https://playwright.dev/agent-cli/installation),
[configuration](https://playwright.dev/agent-cli/configuration),
[command reference](https://playwright.dev/agent-cli/capabilities), and
[skills](https://playwright.dev/agent-cli/skills). Upstream skill is available in
the installed package at `node_modules/playwright-core/lib/tools/skills/playwright-cli/SKILL.md`;
it is not copied into this repository or installed into OMP's managed root.

Titus 3b752711dabebdc5f3762555d23fd75fc1c9eb92 has no established reuse grant;
only independently expressed ownership/frontier ideas are retained, no copied
prose/templates. Pi shortlist packages are bounded research/rejection evidence,
not adopted bodies. Engineering-docs SOURCES records those decisions and versions.
ISO-informed catalog/templates are original engineering information, not copied
normative clauses, certification or a conformity claim.

## Cursor Thermo-Nuclear Code Quality Review (independent reference)

Reviewed [Cursor Team Kit's skill](https://github.com/cursor/plugins/blob/d73344bee8cf22e53b9d5f4cf5749d38ba38c174/cursor-team-kit/skills/thermo-nuclear-code-quality-review/SKILL.md)
at `d73344bee8cf22e53b9d5f4cf5749d38ba38c174`. The repository's
[MIT license](https://github.com/cursor/plugins/blob/d73344bee8cf22e53b9d5f4cf5749d38ba38c174/cursor-team-kit/LICENSE)
identifies Copyright (c) 2026 Cursor. The local complexity-review reference
independently expresses selected review concepts; no Cursor source text or
substantial expression is copied, and no Cursor code/skill or license file is
bundled. Accepted concepts are evidence-based scrutiny of branching/state
growth, ownership/boundary cohesion, contract clarity, redundancy, and
behavior-preserving structural simplification. Rigid line thresholds,
presumptive blockers, mandatory decomposition, and unconditional abstraction,
parallelism, or atomicity prescriptions were not adopted.
This does not state an endorsement or a license/compliance determination.

Standalone browser binaries and the optional downloaded Impeccable engine are
not bundled. The pinned Impeccable skill package does include scripts and the
`modern-screenshot.umd.js` browser helper, used by `scripts/live-browser.js`.
The Playwright CLI is an optional user-installed WSL tool, not an OMP dependency;
this source intake does not inspect every transitive runtime component or grant
OS containment. Earlier source intake did not download or execute the engine.

## Unresolved component boundaries

These records identify coverage gaps, not compliant redistribution grants.
Resolve exact source, revision, applicable license, copyright, notice and local
modification requirements before clearing or updating the affected material.

| Managed component | Established local evidence | Remaining uncertainty / disposition |
| --- | --- | --- |
| `agent/skills/ui-design/scripts/modern-screenshot.umd.js` | Exact bytes match `skill/scripts/modern-screenshot.umd.js` at Impeccable 508d7e8955de3b3caf2d8676e85206723d41a887; SHA-256 bb36665889124a0b6e15f16045265737449c3bdcf2712cdb08af3cfa01563e2b; used by live-browser.js. | Original helper upstream/version, independently covering license and required notices not established. UNVERIFIED; parent Apache-2.0 notice alone is not clearance. |
| `agent/extensions/rtk.ts` | Managed env-gated RTK wrapper; header identifies a Pi extension and PR #2753. External executable is not bundled. | Wrapper's copied/adapted/independent relationship, exact source/revision and covering license/notice not established. UNVERIFIED; executable licensing does not resolve wrapper rights. |
| `agent/extensions/herdr-omp-agent-state.ts` | Managed env-gated integration with generated herdr header/version. External herdr service is not bundled. | Exact generated-body provenance, covering grant, copyright and required notice/modification record not established. UNVERIFIED; do not infer rights from the header. |

Local modification (2026-10-10): the Herdr integration's private reverse-search
helper was replaced with inline `Array.findLast` for last-assistant selection.
The generated header and IPC behavior were retained; a Herdr reinstall/update
can overwrite this local change. This records the known modification only,
not the unresolved original source, license or required modification terms.

## Deployment and update ownership

Every retained/new notice and SOURCES file is explicitly mapped in files.tsv and
travels with its skill package. Compatibility aliases duplicate no third-party
procedure, so no copied upstream body/notice is claimed for them. Read the owner
before updating a complete package plus explicit inventory; do not mix pins or
replace notices based solely on current upstream main.

Native flat skill roots and existing disabled Agents-provider skill discovery are
unchanged. Installers preserve old/customized files and collision-safe backups;
stale installed folders are not aliases and are never automatically pruned. Empty
plugin scaffold mappings are retired, but existing users' plugin files are not deleted.
That earlier inventory update involved no live OMP installation, authenticated model call, or external service; current runtime evidence is in `docs/verification.md`.


Historical root snapshots and first-wave cleanup remain history, not current
acceptance. Historical unpinned import revisions remain unknown for confirmed
Emil/Taste adaptations, Ponytail body lineage remains unresolved, and Stitch is
still source-uncertain. See [migration](../docs/migration.md) and
[current verification and limits](../docs/verification.md).
