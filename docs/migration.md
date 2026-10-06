# Skill migration and retirement

This file owns old public identifiers, old native folder identifiers and existing-home cleanup boundaries. Renames are not aliases. Installation is non-pruning: existing homes may retain old folders and customized data. Inspect before any separately authorized cleanup; never blanket-delete discovery roots. No live-home migration is claimed.

## Public-name migration

| Old public name | Old source folder | Current public owner |
|---|---|---|
| `impeccable` | `impeccable` | `ui-design` |
| `animate` | `animate` | `web-motion` |
| `improve-animations` | `improve-animations` | `web-motion` audit/plan mode |
| `review-animations` | `review-animations` | `web-motion` explicit review mode |
| `emil-design-eng` | `emil-design-eng` | `ui-design` local component-craft reference |
| `design-taste-frontend` | `design-taste-frontend` | `ui-design` local marketing-site references |
| `animate-expo` | `animate-expo` | `expo-motion` |
| `prototype` | `prototype` | `ui-prototyping` |
| `break-ui` | `break-ui` | `ui-stress-test` |
| `mobile-native` | `mobile-native` | `mobile-web` |
| `brandkit` | `brandkit` | `brand-concepts` |
| `stitch-design-taste` | `stitch-skill` | `stitch-design-input` |
| `ponytail` | `ponytail` | `code-simplicity` |
| `retro` | `retro` | `retrospective` |
| `write-swift` | `write-swift` | `swift-development` |
| `image-to-code` | `image-to-code-skill` | `image-to-code` |
| `full-output-enforcement` | `output-skill` | Retired; no replacement |

## Prior historical identifiers

The following migration identifiers predate this catalog change; they remain records only and are not current entrypoints: `emil-animate`, `emil-find-animation-opportunities`, `emil-review-animations`, `find-animation-opportunities`, `animation-vocabulary`, `taste-skill`, `taste-skill-v1`, `gpt-tasteskill`, `redesign-skill`, `brutalist-skill`, `minimalist-skill`, `soft-skill`, `ponytail-review`, `ponytail-audit`, `ponytail-debt`, `ponytail-help`, `ponytail-gain`. Their records are also retained in [retired-skills.txt](../scripts/retired-skills.txt); no version-1 Taste procedure or gain-scoreboard replacement is claimed.

| Retired folder under `.omp/agent/skills/` | Former public name | Surviving action/reference or removal |
|---|---|---|
| `emil-animate` | `emil-animate` | web-motion `build`: `skill://web-motion/references/build.md` |
| `emil-find-animation-opportunities` | `emil-find-animation-opportunities` | web-motion `opportunities`: `skill://web-motion/references/opportunities.md` |
| `emil-review-animations` | `emil-review-animations` | explicit web-motion diff review: `skill://web-motion/references/diff-review.md` |
| `find-animation-opportunities` | `find-animation-opportunities` | web-motion `opportunities`: `skill://web-motion/references/opportunities.md` |
| `animation-vocabulary` | `animation-vocabulary` | web-motion `vocabulary`: `skill://web-motion/references/vocabulary.md` |
| `taste-skill` | `taste-skill` | selective marketing: `skill://ui-design/reference/local/marketing-sites.md` |
| `taste-skill-v1` | `design-taste-frontend-v1` | Exact v1 procedure removed; current selective `skill://ui-design/reference/local/marketing-sites.md`, not v1 compatibility |
| `gpt-tasteskill` | `gpt-taste` | Taste optional scroll: `skill://ui-design/reference/local/marketing-sites/scroll-storytelling.md` |
| `redesign-skill` | `redesign-existing-projects` | Impeccable workflow plus `skill://ui-design/reference/local/marketing-sites/redesign.md` |
| `brutalist-skill` | `industrial-brutalist-ui` | Taste opt-in industrial-print/tactical-crt: `skill://ui-design/reference/local/marketing-sites/style-directions.md` |
| `minimalist-skill` | `minimalist-ui` | Taste opt-in minimalist-editorial: `skill://ui-design/reference/local/marketing-sites/style-directions.md#minimalist-editorial` |
| `soft-skill` | `high-end-visual-design` | Taste opt-in high-end-editorial: `skill://ui-design/reference/local/marketing-sites/style-directions.md#high-end-editorial` |
| `ponytail-review` | `ponytail-review` | code-simplicity `review`: `skill://code-simplicity/references/complexity-review.md` |
| `ponytail-audit` | `ponytail-audit` | code-simplicity `audit`: `skill://code-simplicity/references/complexity-review.md` |
| `ponytail-debt` | `ponytail-debt` | code-simplicity `debt`: `skill://code-simplicity/references/debt-ledger.md` |
| `ponytail-help` | `ponytail-help` | code-simplicity `help`: inline `skill://code-simplicity` table |
| `ponytail-gain` | `ponytail-gain` | Removed uncited static scoreboard; no replacement or measured-saving claim |

## Existing-home behavior and compatibility

Managed skills deploy to the native OMP root. The installer copies explicit `config/files.tsv` rows and does not prune obsolete files. An updater targeting `.agent/skills/` or `.agents/skills/` may recreate retired roots. Select the native destination and update complete packages and inventory rather than copying partial payloads. Existing custom content remains outside automatic cleanup.

Historical root consolidation retired legacy duplicate singular/plural roots and retained the pinned Impeccable 4.5.0 package with engine 0.1.11; older 4.3.1/4.2.2 packages and mixed-version engine 0.1.5 were not retained as current assets. The launcher may require permitted network access on first use; no launcher or engine execution is implied by this document. Unversioned differing native copies were selected without a recency claim: differences were bare-invocation greetings or a course link, and native variants were retained. Exact source pin, Apache-2.0 notice and complete-package preservation evidence belong to [provenance](../config/SKILL-SOURCES.md) and the pre-move artifact evidence held by Main.

The old Windows installer limitation remains documented in [verification](verification.md): PowerShell 5.1 rejected a valid inventory because a required-entry lookup used forward-slash keys after destination paths were converted to backslashes. Do not infer a successful Windows install. Compatibility evidence is version-scoped and historical, not current catalog verification.
