# Skill payload provenance and license boundaries

Source catalog basis: current main `e850b6a07a55bc893d97c786928c45906952bbe7`.
The result contains 35 canonical capabilities (33 visible, two explicit-only),
14 hidden locally authored compatibility pointers, 263 skill assets and 282
explicit mappings. Counts do not prove native discovery or legal clearance.

Public capability names are separate from source identities. Renaming never erases
upstream authorship. Full notices accompany affected deployed packages, not only
this non-deployed index. Per-package SOURCES.md owns exact immutable upstream paths,
local file scope and modifications. No blanket license-compliance claim is made.

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
| pbakaus/impeccable | skill-v4.5.0, 508d7e8955de3b3caf2d8676e85206723d41a887; complete versioned skill package | MODIFIED/ADAPTED entrypoint and reference/critique.md optional-state discovery (local modification notice); original package identity, scripts and remaining package assets retained; independent supplements under reference/local | Apache-2.0, Copyright 2025 Paul Bakaus | agent/skills/ui-design/LICENSE; entrypoint and critique reference modification notices; original root NOTICE absent at pin |
| miqdadbadjuber/anti-slop | v3.2.20, 91f12ec67e9de6043cfd93b846404986ba73c3f4; skills/antislop, antislop-ui, antislop-copywriting SKILL.md | MODIFIED/ADAPTED compact policy in agent/extensions/antislop.js; integration/trigger code locally authored | MIT, Copyright (c) 2026 Miqdad Badjuber (antislop) | agent/extensions/LICENSE.antislop; extension attribution and durable decision record |
| NVIDIA/SkillSpector | 35270064e42230dbc566e4134c55b5d581355db3; skills/skill-inspector/SKILL.md | MODIFIED/ADAPTED security-intake SKILL and intake-checklist; no scanner/dependencies distributed | Apache-2.0, Copyright 2026 NVIDIA CORPORATION & AFFILIATES | security-intake/LICENSE.skillspector and SOURCES.md; no root NOTICE; third-party scanner notices excluded with source scope rationale |
| anthropics/claude-code-security-review | 0c6a49f1fa56a1d472575da86a94dbc1edb78eda; .claude/commands/security-review.md | MODIFIED/ADAPTED security-review core/change-review; source-only native boundaries | MIT, Copyright (c) 2025 Anthropic | security-review/LICENSE.anthropic and SOURCES.md |
| cloudflare/security-audit-skill | c1c8a8c1471069fb0e188eeaff69b8e8db6564a8; skills/security-audit/{SKILL,RECONNAISSANCE,HUNTING,VALIDATION-AND-REPORTING,ATTACK-CLASSES,AI-AND-LLM,RESOURCE-EXHAUSTION-AND-AVAILABILITY,SUPPLY-CHAIN-AND-RELEASE}.md | MODIFIED/ADAPTED security-audit and seven references, not full upstream engine | MIT, Copyright (c) 2025-2026 Cloudflare, Inc. | security-audit/LICENSE.cloudflare and exact per-file SOURCES.md |
| DietrichGebert/ponytail | dbdfc8de29fb91609ed2df2ae378782a956d8e86 pins LICENSE only, not old body | MODIFIED/ADAPTED code-simplicity; historical body revision unresolved | MIT, Copyright (c) 2026 DietrichGebert | code-simplicity/LICENSE.ponytail; historical ponytail: debt marker retained, not dispatcher |
| mattpocock/skills | d81f3a183412e71a5b1e84ca21bc1a35eea03a60; exact skill paths in affected package SOURCES.md | MODIFIED/ADAPTED code-review/debugging/TDD, domain modeling, brainstorming/delivery, agent guidance | MIT, Copyright (c) 2026 Matt Pocock | LICENSE.matt inside every affected deployed package; original exact source path maps retained |
| obra/superpowers | 8ca22dba9a94f28898bbce59f2537ff4d87c747d; exact skill/reference paths in package SOURCES.md | MODIFIED/ADAPTED code-review/debugging/TDD, brainstorming/delivery, agent guidance | MIT, Copyright (c) 2025 Jesse Vincent | LICENSE.superpowers inside every affected package; SOURCES.md modifications |
| open-gsd/gsd-core | 69f890fc36e6cfc90f2b1fcebb502ef76bbe8aa8; exact templates/skills in package SOURCES.md | MODIFIED/ADAPTED docs-engineering/plan-review, workflow-delivery/handoff/read/retrospective | MIT, Copyright (c) 2026 Open GSD | LICENSE.gsd inside every affected package; exact path/modification maps |

## Independently authored material and exclusions

Git commit-message, PR work, triage, change-status and upstream review are locally
authored procedures. The fourteen compatibility pointers and new shared
image-generation selector are locally authored integration text; platform bodies
remain attributed adaptations. Passive routing/config/installer/checkers are local
mechanisms, not imported upstream engines. Original UI component/marketing local
supplements and current motion core/review/audit references remain separately
identified local material. They are not represented as Impeccable-owned assets.

Titus 3b752711dabebdc5f3762555d23fd75fc1c9eb92 has no established reuse grant;
only independently expressed ownership/frontier ideas are retained, no copied
prose/templates. Pi shortlist packages are bounded research/rejection evidence,
not adopted bodies. Engineering-docs SOURCES records those decisions and versions.
ISO-informed catalog/templates are original engineering information, not copied
normative clauses, certification or a conformity claim.

No imported executable/scanner, dependency, service, provider directive, new plugin
or dispatcher is adopted. Existing Impeccable optional engine/launcher remains part
of its pinned package; no engine download or execution was performed for this task.

## Deployment and update ownership

Every retained/new notice and SOURCES file is explicitly mapped in files.tsv and
travels with its skill package. Compatibility aliases duplicate no third-party
procedure, so no copied upstream body/notice is claimed for them. Read the owner
before updating a complete package plus explicit inventory; do not mix pins or
replace notices based solely on current upstream main.

Native flat skill roots and existing disabled Agents-provider skill discovery are
unchanged. Installers preserve old/customized files and collision-safe backups;
stale installed folders are not aliases and are never automatically pruned. Empty
plugin scaffold mappings are retired, but existing users' plugin files are not
deleted. No live home, authenticated model call or external service was used here.

## Native system-template source

`agent/SYSTEM_TEMPLATE.md` is a maintained copy of OMP's
[`system-prompt.md`](https://github.com/can1357/oh-my-pi/blob/40e9368ef0458fd9073329cdff4174895f91bc6b/packages/coding-agent/src/prompts/system/system-prompt.md)
at v18.8.4 commit `40e9368ef0458fd9073329cdff4174895f91bc6b`. The upstream
project is MIT-licensed; the template retains the required copyright and
permission notice in a non-rendered Handlebars comment:
[LICENSE](https://github.com/can1357/oh-my-pi/blob/40e9368ef0458fd9073329cdff4174895f91bc6b/LICENSE).
Only delegation wording is changed: execution-only restrictions are scoped to
execution work, and a policy-required bounded decision consultation is explicitly
required as one managed native task item. No semantic escalation predicates are
copied into this native template. All other template blocks, dynamic fields and
helpers are retained from the pinned source.

OMP discovers this override at `~/.omp/agent/SYSTEM_TEMPLATE.md`; it replaces
the default template block, not generated context/footer or tool schemas. A literal
`SYSTEM.md` has precedence and masks the template. Existing sessions do not hot
reload; restart for the new prompt. Each OMP upgrade requires comparing the new
upstream template, reviewing any changed delegation/runtime semantics, reconciling
the focused local edits, preserving the whole dynamic template and exercising
native rendering plus actual policy-relevant dispatch before release. This is
intentional native coupling, not a binary patch or universal runtime guarantee.

Historical root snapshots and first-wave cleanup remain history, not current
acceptance. Historical unpinned import revisions remain unknown for confirmed
Emil/Taste adaptations, Ponytail body lineage remains unresolved, and Stitch is
still source-uncertain. See [migration](../docs/migration.md) and
[current verification and limits](../docs/verification.md).
