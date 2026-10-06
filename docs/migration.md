# Skill migration and compatibility

This file owns identifier migration, not procedure bodies. Installation remains
non-pruning. A current repository-shipped hidden pointer is managed compatibility;
a previous full procedure left in an old home is stale unmanaged data, not an
alias. Do not automatically delete old skill folders or users' custom content.

## Current canonical rename map

| Baseline public name | Result canonical owner | Disposition |
|---|---|---|
| `apple-design` | `ui-gesture-design` | RENAME, procedure preserved |
| `ask-sonner` | `ui-sonner` | RENAME, procedure preserved |
| `brainstorming` | `workflow-brainstorming` | RENAME, procedure preserved |
| `commit-message` | `git-commit-message` | RENAME, procedure preserved |
| `diagnosing-bugs` | `code-debugging` | RENAME, procedure preserved |
| `domain-modeling` | `docs-domain-modeling` | RENAME, procedure preserved |
| `engineering-docs` | `docs-engineering` | RENAME, procedure preserved |
| `expo-motion` | `ui-expo-motion` | RENAME, procedure preserved |
| `github-triage` | `git-triage` | RENAME, procedure preserved |
| `handoff-to-another-harness` | `workflow-handoff` | RENAME, procedure preserved |
| `image-to-code` | `ui-image-to-code` | RENAME, procedure preserved |
| `imagegen-frontend-mobile` | `ui-image-generation` | MERGE, lazy platform reference |
| `imagegen-frontend-web` | `ui-image-generation` | MERGE, lazy platform reference |
| `mobile-web` | `ui-mobile-web` | RENAME, procedure preserved |
| `pick-ui-library` | `ui-library-selection` | RENAME, procedure preserved |
| `plan-review` | `docs-plan-review` | RENAME, procedure preserved |
| `project-delivery` | `workflow-delivery` | RENAME, procedure preserved |
| `resume-from-handoff` | `workflow-handoff-read` | RENAME, procedure preserved |
| `retrospective` | `workflow-retrospective` | RENAME, procedure preserved |
| `tdd` | `code-tdd` | RENAME, procedure preserved |
| `unpublished-changes` | `git-change-status` | RENAME, procedure preserved |
| `upstream-update-review` | `workflow-upstream-review` | RENAME, procedure preserved |
| `web-motion` | `ui-web-motion` | RENAME, procedure preserved |
| `work-with-pr` | `git-pr-work` | RENAME, procedure preserved |
| `writing-for-agents` | `agent-guidance` | RENAME, procedure preserved |

## Legacy classification

| Previous/original identifier | Classification | Destination / reason |
|---|---|---|
| `animate` | LEGACY ALIAS | `ui-web-motion`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `animate-expo` | LEGACY ALIAS | `ui-expo-motion`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `animation-vocabulary` | MIGRATION ONLY | `ui-web-motion`. Documentation migration only; no evidence supports another permanent pointer. |
| `apple-design` | DESCRIPTION TRIGGER | `ui-gesture-design`. Concise canonical description synonym; no explicit /skill compatibility. |
| `ask-sonner` | DESCRIPTION TRIGGER | `ui-sonner`. Concise canonical description synonym; no explicit /skill compatibility. |
| `brainstorming` | MIGRATION ONLY | `workflow-brainstorming`. Documentation migration only; no evidence supports another permanent pointer. |
| `brandkit` | LEGACY ALIAS | `brand-concepts`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `break-ui` | LEGACY ALIAS | `ui-stress-test`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `brutalist-skill` | REMOVE | `No independent replacement`. Obsolete, misleading or superseded procedure; do not reinstate. |
| `commit-message` | LEGACY ALIAS | `git-commit-message`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `design-taste-frontend` | MIGRATION ONLY | `ui-design`. Documentation migration only; no evidence supports another permanent pointer. |
| `diagnosing-bugs` | MIGRATION ONLY | `code-debugging`. Documentation migration only; no evidence supports another permanent pointer. |
| `domain-modeling` | MIGRATION ONLY | `docs-domain-modeling`. Documentation migration only; no evidence supports another permanent pointer. |
| `emil-animate` | MIGRATION ONLY | `No independent replacement`. Documentation migration only; no evidence supports another permanent pointer. |
| `emil-design-eng` | MIGRATION ONLY | `ui-design`. Documentation migration only; no evidence supports another permanent pointer. |
| `emil-find-animation-opportunities` | MIGRATION ONLY | `No independent replacement`. Documentation migration only; no evidence supports another permanent pointer. |
| `emil-review-animations` | MIGRATION ONLY | `No independent replacement`. Documentation migration only; no evidence supports another permanent pointer. |
| `engineering-docs` | LEGACY ALIAS | `docs-engineering`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `expo-motion` | MIGRATION ONLY | `ui-expo-motion`. Documentation migration only; no evidence supports another permanent pointer. |
| `find-animation-opportunities` | MIGRATION ONLY | `ui-web-motion`. Documentation migration only; no evidence supports another permanent pointer. |
| `full-output-enforcement` | REMOVE | `No independent replacement`. Obsolete, misleading or superseded procedure; do not reinstate. |
| `github-triage` | MIGRATION ONLY | `git-triage`. Documentation migration only; no evidence supports another permanent pointer. |
| `gpt-tasteskill` | REMOVE | `No independent replacement`. Obsolete, misleading or superseded procedure; do not reinstate. |
| `handoff-to-another-harness` | MIGRATION ONLY | `workflow-handoff`. Documentation migration only; no evidence supports another permanent pointer. |
| `image-to-code` | MIGRATION ONLY | `ui-image-to-code`. Documentation migration only; no evidence supports another permanent pointer. |
| `image-to-code-skill` | MIGRATION ONLY | `ui-image-to-code`. Documentation migration only; no evidence supports another permanent pointer. |
| `imagegen-frontend-mobile` | MIGRATION ONLY | `ui-image-generation`. Documentation migration only; no evidence supports another permanent pointer. |
| `imagegen-frontend-web` | MIGRATION ONLY | `ui-image-generation`. Documentation migration only; no evidence supports another permanent pointer. |
| `impeccable` | LEGACY ALIAS | `ui-design`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `improve-animations` | MIGRATION ONLY | `ui-web-motion`. Documentation migration only; no evidence supports another permanent pointer. |
| `minimalist-skill` | REMOVE | `No independent replacement`. Obsolete, misleading or superseded procedure; do not reinstate. |
| `mobile-native` | LEGACY ALIAS | `ui-mobile-web`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `mobile-web` | MIGRATION ONLY | `ui-mobile-web`. Documentation migration only; no evidence supports another permanent pointer. |
| `output-skill` | REMOVE | `No independent replacement`. Obsolete, misleading or superseded procedure; do not reinstate. |
| `pick-ui-library` | MIGRATION ONLY | `ui-library-selection`. Documentation migration only; no evidence supports another permanent pointer. |
| `plan-review` | MIGRATION ONLY | `docs-plan-review`. Documentation migration only; no evidence supports another permanent pointer. |
| `ponytail` | LEGACY ALIAS | `code-simplicity`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `ponytail-audit` | MIGRATION ONLY | `code-simplicity`. Documentation migration only; no evidence supports another permanent pointer. |
| `ponytail-debt` | MIGRATION ONLY | `code-simplicity`. Documentation migration only; no evidence supports another permanent pointer. |
| `ponytail-gain` | REMOVE | `code-simplicity`. Obsolete, misleading or superseded procedure; do not reinstate. |
| `ponytail-help` | MIGRATION ONLY | `code-simplicity`. Documentation migration only; no evidence supports another permanent pointer. |
| `ponytail-review` | MIGRATION ONLY | `code-simplicity`. Documentation migration only; no evidence supports another permanent pointer. |
| `project-delivery` | MIGRATION ONLY | `workflow-delivery`. Documentation migration only; no evidence supports another permanent pointer. |
| `prototype` | LEGACY ALIAS | `ui-prototyping`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `redesign-skill` | REMOVE | `No independent replacement`. Obsolete, misleading or superseded procedure; do not reinstate. |
| `resume-from-handoff` | MIGRATION ONLY | `workflow-handoff-read`. Documentation migration only; no evidence supports another permanent pointer. |
| `retro` | LEGACY ALIAS | `workflow-retrospective`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `retrospective` | MIGRATION ONLY | `workflow-retrospective`. Documentation migration only; no evidence supports another permanent pointer. |
| `review-animations` | MIGRATION ONLY | `ui-web-motion`. Documentation migration only; no evidence supports another permanent pointer. |
| `soft-skill` | REMOVE | `No independent replacement`. Obsolete, misleading or superseded procedure; do not reinstate. |
| `stitch-design-taste` | MIGRATION ONLY | `stitch-design-input`. Documentation migration only; no evidence supports another permanent pointer. |
| `stitch-skill` | MIGRATION ONLY | `No independent replacement`. Documentation migration only; no evidence supports another permanent pointer. |
| `taste-skill` | MIGRATION ONLY | `No independent replacement`. Documentation migration only; no evidence supports another permanent pointer. |
| `taste-skill-v1` | REMOVE | `No independent replacement`. Obsolete, misleading or superseded procedure; do not reinstate. |
| `tdd` | LEGACY ALIAS | `code-tdd`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `unpublished-changes` | MIGRATION ONLY | `git-change-status`. Documentation migration only; no evidence supports another permanent pointer. |
| `upstream-update-review` | MIGRATION ONLY | `workflow-upstream-review`. Documentation migration only; no evidence supports another permanent pointer. |
| `web-motion` | MIGRATION ONLY | `ui-web-motion`. Documentation migration only; no evidence supports another permanent pointer. |
| `work-with-pr` | MIGRATION ONLY | `git-pr-work`. Documentation migration only; no evidence supports another permanent pointer. |
| `write-swift` | LEGACY ALIAS | `swift-development`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |
| `writing-for-agents` | LEGACY ALIAS | `agent-guidance`. Hidden tiny pointer; meaningful upstream muscle memory or common explicit suite reference. |

## Hidden pointers versus canonical exposure

Every shipped compatibility SKILL.md sets `disable-model-invocation: true`, has no
independent authority/body, and points to exactly one canonical owner. Fourteen
aliases are hidden. `ui-prototyping` and `ui-library-selection` are the two
explicit-only hidden **canonical procedures**, not aliases.

At last verified OMP 18.6.3, hiding omits a skill from the model-visible prompt
catalog, not local discovery, native URI reads or enabled `/skill:<name>` commands.
This is not access control. Natural-language synonyms in canonical descriptions
are separate from explicit compatibility. Hidden canonical specialists keep their
explicit-request procedure boundary.

## Existing-home migration

1. Preview and install the current explicit inventory into the intended existing
   home. Inspect collision-safe backups before any separately authorized cleanup.
2. Doctor compares managed files. Its legacy/unmanaged observations are advisory;
   it neither recursively scans nor deletes old skill/plugin data.
3. A shipped alias replaces its old managed SKILL.md through normal backup rules,
   but old auxiliary files in the folder can remain. Fresh installs receive only
   the tiny pointer; existing custom files are preserved. Retiring old reference
   files/folders requires separately authorized, inspected cleanup.
4. Migration-only old owners can remain installed and model-visible until the user
   separately removes them. This repository does not claim a completed live-home
   migration. No live home was modified for verification.

The empty plugin package/locks are no longer managed. Existing installed plugin
state remains untouched; native OMP creates/manages plugin metadata when needed.

## Filters and native invocation

Canonical families use flat names, for example `ui-web-motion`, not nested public
`ui/motion` directories. OMP 18.6.3 supports `--skills 'ui-*'`, `--skills 'code-*'`
and `skills.includeSkills` globs. Filters apply to names: `ui-*` does not include
an `animate` alias. Explicit aliases do not bypass disabled/filtered skills. Use
the canonical name under a family filter, or explicitly include the legacy name
and its target where supported. Legacy pointer resolution requires its canonical
owner to remain available and enabled, never a file-load bypass.

URI references and relative links in active managed guidance use canonical owners.
Immutable upstream paths, source names, this migration table and deliberate legacy
trigger descriptions retain original identifiers. [Verification](verification.md)
separates source-supported behavior from actually exercised runtime operations.
