# Choose a capability

Skills are passive procedures, not tools, permissions, model selection or runtime
proof. Start from the requested outcome and read the selected canonical skill.
[Managed routing](config/agent/AGENTS.md) and [policy](config/agent/PERSONALITY.md)
retain native authority boundaries. [Decisions](docs/capabilities.md),
[inventory](docs/capability-inventory.md), [migration](docs/migration.md) and
[verification](docs/verification.md) own architecture and evidence details.

## Families

| Family | Choose for | Canonical skills |
|---|---|---|
| ui- | Interface design, motion, mobile-web behavior and UI reference assets | [ui-design](config/agent/skills/ui-design/SKILL.md), [ui-expo-motion](config/agent/skills/ui-expo-motion/SKILL.md), [ui-gesture-design](config/agent/skills/ui-gesture-design/SKILL.md), [ui-image-generation](config/agent/skills/ui-image-generation/SKILL.md), [ui-image-to-code](config/agent/skills/ui-image-to-code/SKILL.md), [ui-library-selection](config/agent/skills/ui-library-selection/SKILL.md), [ui-mobile-web](config/agent/skills/ui-mobile-web/SKILL.md), [ui-prototyping](config/agent/skills/ui-prototyping/SKILL.md), [ui-sonner](config/agent/skills/ui-sonner/SKILL.md), [ui-stress-test](config/agent/skills/ui-stress-test/SKILL.md), [ui-web-motion](config/agent/skills/ui-web-motion/SKILL.md) |
| code- | Implementation correctness, diagnosis, behavior tests and complexity | [code-debugging](config/agent/skills/code-debugging/SKILL.md), [code-review](config/agent/skills/code-review/SKILL.md), [code-simplicity](config/agent/skills/code-simplicity/SKILL.md), [code-tdd](config/agent/skills/code-tdd/SKILL.md) |
| docs- | Engineering information and evidence-led model/plan review | [docs-domain-modeling](config/agent/skills/docs-domain-modeling/SKILL.md), [docs-engineering](config/agent/skills/docs-engineering/SKILL.md), [docs-plan-review](config/agent/skills/docs-plan-review/SKILL.md) |
| workflow- | Task decision and delivery lifecycle | [workflow-brainstorming](config/agent/skills/workflow-brainstorming/SKILL.md), [workflow-delivery](config/agent/skills/workflow-delivery/SKILL.md), [workflow-handoff](config/agent/skills/workflow-handoff/SKILL.md), [workflow-handoff-read](config/agent/skills/workflow-handoff-read/SKILL.md), [workflow-retrospective](config/agent/skills/workflow-retrospective/SKILL.md), [workflow-upstream-review](config/agent/skills/workflow-upstream-review/SKILL.md) |
| git- | Repository collaboration and change lifecycle | [git-change-status](config/agent/skills/git-change-status/SKILL.md), [git-commit-message](config/agent/skills/git-commit-message/SKILL.md), [git-pr-work](config/agent/skills/git-pr-work/SKILL.md), [git-triage](config/agent/skills/git-triage/SKILL.md) |
| security- | Distinct source trust boundaries | [security-audit](config/agent/skills/security-audit/SKILL.md), [security-intake](config/agent/skills/security-intake/SKILL.md), [security-review](config/agent/skills/security-review/SKILL.md) |
| agent- | Instructions consumed by agents | [agent-guidance](config/agent/skills/agent-guidance/SKILL.md) |

Natural exceptions: [swift-development](config/agent/skills/swift-development/SKILL.md)
for Swift, [stitch-design-input](config/agent/skills/stitch-design-input/SKILL.md)
for Google Stitch input, [brand-concepts](config/agent/skills/brand-concepts/SKILL.md)
for broader brand-board/logo-world concepts.

## Important boundaries

- `ui-design` is the primary UI workflow. Component craft and marketing references
  stay lazy and conditional; motion/platform owners are selected only in scope.
- `ui-web-motion` selects build/opportunities/vocabulary, bounded existing-motion
  lifecycle or explicit diff review. Review-only requests stay read-only; a request
  to review and fix includes implementation. `ui-expo-motion` owns Expo/RN,
  `ui-mobile-web` owns browser/PWA, not native apps.
- `ui-image-generation` generates requested images only, selecting web or mobile
  procedure lazily. `ui-image-to-code` implements a supplied/authorized reference.
  Tool availability and actual image output are required, not assumed.
- `ui-sonner` troubleshoots one library; `ui-library-selection` recommends a library
  only when explicitly requested. It does not authorize installation. The picker
  and `ui-prototyping` are hidden canonical explicit-only procedures.
- `code-review` reviews correctness/spec; `security-review` is scoped changed-source
  security review; `security-audit` is explicit bounded deep audit;
  `security-intake` assesses supplied external sources without execution/adoption.
- `docs-engineering` governs necessary information. `workflow-delivery` owns
  authorized whole-boundary delivery; ordinary bounded edits need no docflow setup.
  `docs-plan-review` reviews coverage/integration without approving execution.
- `workflow-handoff` creates a non-overwriting transfer when authorized;
  `workflow-handoff-read` reads one snapshot only. Continuing work belongs to
  authorized delivery, not load-only handoff reading.
- Git advice/status/triage never implies commit, push, publish, merge or labels.
  An explicit request for those actions counts as task authority under
  [the canonical working policy](config/agent/PERSONALITY.md); native approval
  still applies. `git-commit-message` itself remains read-only.
  `git-pr-work` implements requested scope and may draft unpublished PR text.

## Legacy names and filters

Fourteen tiny hidden compatibility entrypoints preserve selected explicit names,
including `impeccable`, `animate`, `animate-expo`, `ponytail`, `write-swift`,
`mobile-native`, `prototype`, `break-ui`, `brandkit`, `retro`, `engineering-docs`,
`tdd`, `commit-message` and `writing-for-agents`. Each points to one canonical
procedure. Natural-language legacy synonyms in canonical descriptions are a
separate routing aid. [Migration](docs/migration.md) classifies other old names.

At last verified OMP 18.6.3, `disable-model-invocation: true` hides listing exposure,
not enabled URI/slash reachability. Family filters, for example `--skills 'ui-*'`
or `skills.includeSkills: [ui-*]`, match public names. They can exclude an
unprefixed alias and must not be bypassed by direct file loading. Use the canonical
name when operating under a family filter.

Current catalog: 35 canonical capabilities (33 model-visible, 2 explicit-only), 14 hidden compatibility pointers, 263 skill assets and 282 mappings. Counts are not authenticated routing proof.
