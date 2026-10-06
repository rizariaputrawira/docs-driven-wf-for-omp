# Verification and current limits

Basis: inspected main `e850b6a07a55bc893d97c786928c45906952bbe7` plus the
architecture revision documented here. Installed and official latest OMP observed on
2026-10-06: **18.6.3**, immutable release source
`093275112f7adff207608673c0e33c7f3d16e27f`. Linux/WSL, Bun 1.4.2 and Node
24.20.0. One tested release is not a minimum-version or future-upgrade promise.

## Reproducible repository checks

```sh
bun scripts/test_skill_catalog.mjs
bun scripts/test_agent_config.mjs
node scripts/test_model_routing.mjs
node scripts/test_antislop.mjs
python3 scripts/test_install.py
```

| Exercised check | Outcome / evidence boundary |
|---|---|
| `omp --version`, `omp --help`, `npm view @oh-my-pi/pi-coding-agent version repository --json` | Installed and published package both 18.6.3; official latest/tag source independently checked. No update performed. |
| `python3 scripts/test_install.py` | PASS: production POSIX installer/doctor integration for 282 mappings, including dry-run, equality/backups, unsafe/missing inventory and local HTTP ZIP cases. Neither pwsh nor Windows PowerShell available. |
| `bun scripts/test_skill_catalog.mjs` | PASS: 35 canonical capabilities (33 visible, 2 explicit-only), 14 hidden aliases, 263 exactly mapped assets, 282 mappings, 38 notices; all full URI/relative targets resolve, flat names/exposure/tiny pointer destinations valid, retained notice hashes unchanged. |
| `bun scripts/test_agent_config.mjs` | PASS: Sol-medium main/plan, seven role selectors/definitions, maxConcurrency 3, maxRecursionDepth 1 and 16 negative cases. Static configuration, not authenticated dispatch. |
| `node scripts/test_model_routing.mjs` | PASS: seven named tool-boundary handler cases; not OS containment or actual agent-session loading. |
| `node scripts/test_antislop.mjs` | PASS: 16 positive and 18 negative cases; native result shape, prompt preservation, chained/repeated injection and fresh preparation. Not model obedience. |
| Disposable production dry-run/install/check/reinstall/fix | PASS: 282 managed mappings; stale web-motion procedure and unrelated notes retained, customized old impeccable SKILL backed up while managed hidden pointer installed; doctor reported stale owner advisory, not managed alias as legacy. |
| Protected architecture/package comparison | 14 runtime/config/agent files byte-identical; security-reviewer changes only its canonical security-lifecycle URI, with frontmatter/tools/schema/authority unchanged. Both complete image procedure bodies retained in lazy references. Impeccable scripts/original technical assets unchanged; only entrypoint and local supplemental routing pointers changed. |
| Installed `omp skill list --json` in isolated native state | RUNTIME VERIFIED: 49 discovered identities, 33 visible, 16 hidden, zero warnings. Hidden set is exactly 14 aliases plus ui-prototyping/ui-library-selection. All 35 canonical and all 14 alias native URI reads passed. |
| Disposable `skills.includeSkills: [ui-*]` / `[code-*]` local lists | RUNTIME VERIFIED: 11 UI and four code canonical results, no out-of-prefix entries. Nonmatching unprefixed aliases excluded. |
| Immutable source license comparison | Full retained notice text matched all nine inspected immutable LICENSE sources, ignoring only transport terminal whitespace. Existing 25 notice hashes preserved separately; new Emil/Taste notices from exact cloned source bytes. Not blanket legal clearance. |
| Emil/Taste file comparison | 19 baseline pairs: six byte-identical, eleven modified/adapted with substantial matching expression, two Stitch files source-uncertain. Comparison pins are not historical import commits. |
| Inventory presentation simplification | 36 baseline records and all 15 fields retained through contract tables, proven folder formulas and shared source/coupling keys; 661 → 162 lines. No procedure, notice or runtime mechanism removed. |
| Pre-publication smoke | PASS: fresh disposable dry-run/install/doctor check preserved unrelated content; OMP 18.6.3 discovered 49 identities (33 visible, 16 hidden, no warnings), and native ui-design/impeccable reads passed. Transcript: `/tmp/docflow-publish-smoke-ntu061zi/transcript.json`. All five repository checks above rerun and passed. |

## Static OMP interface evidence

Pinned official source supports one-level native discovery; name/description and
hide/disable-model-invocation fields; no general aliases field; enabled native
skill URI/slash access; includeSkills globs and CLI --skills session override.
Hidden exposure is not access control. Native local CLI list includes hidden skills; pinned `system-prompt.ts:943-944`
and `session/agent-session.ts:9979-9980` exclude hide=true before catalog rendering.
This source confirmation is not authenticated natural-language routing proof.

Managed configuration and agent architecture are unchanged except skill-routing
names in instruction text. Global advisor remains disabled; an enabled WATCHDOG
Sol entry is not automatic advice. Native settings, tool/model policy, Plan Mode
and extensions are distinct mechanisms. The canonical full upgrade checklist is
`config/agent/skills/docs-engineering/references/omp-compatibility.md`.

## Native disposable-home reproduction

Use an existing disposable home and empty working directory, not live user state:

```sh
sh install.sh --dry-run --home <home>
sh install.sh --home <home>
sh scripts/doctor.sh --check --home <home>
```

Set `HOME=<home>` and `PI_CODING_AGENT_DIR=<home>/.omp/agent` from the empty
workspace; unset OMP_PROFILE so it does not redirect state to a named profile.
Run `omp skill list --json`, `omp read skill://ui-design`,
`omp read skill://impeccable`, and selected canonical/alias/reference reads.
For passive prefix checks use a disposable config with
`skills.includeSkills: [ui-*]` or `[code-*]`, then repeat local list/URI reads.
Do not copy credentials or send a model turn to establish passive discovery.

## Inspectable evidence and status

Actual native JSON was captured at `/tmp/docflow-runtime-gate.iSBTIw/skills.json`;
production smoke transcript at `/tmp/docflow-install-smoke-ud31621v/install-transcript.json`;
protected comparison at `/tmp/docflow-protected-verification.json`; source comparisons
at `/tmp/docflow-provenance-comparison.json` and `/tmp/docflow-provenance-diffs.patch`.
These are session inspection artifacts, not deployed runtime dependencies. The
commands above are the maintained reproduction contract.

Runtime verified means local discovery/URI/config-filter operations and exercised
production scripts/handlers only. Slash expansion, natural-language routing,
authenticated worker dispatch and whole-session extension loading are not inferred.

## NOT VERIFIED and continuing limits

- Authenticated fresh-main/subagent dispatch, provider availability, effective
  role provenance, resolved-model badge rendering, interactive Plan Mode behavior
  and model obedience were not exercised by this architecture change. Static
  selectors/tests and old successful runs do not fill these gaps.
- Interactive `/skill:<name>` expansion/argument behavior and session CLI --skills
  filtering remain source-only. The safe non-generating attempt
  `omp skill list --json --skills=ui-*` returned `Unknown option '--skills'`: this
  is a launch-only flag, not a list flag. Runtime launch verification requires a safely observed non-generating session or separately
  authorized actor run. Source support is not an installed interactive result.
- Complete extension loading in an actual agent session, RTK executable behavior,
  Herdr socket/pane reporting, MCP connection/tool discovery, Impeccable optional
  engine and image-generation tools are not implied by declarations/source review.
  No external service or generator was started.
- Windows PowerShell 5.1 historically rejected inventory required-entry lookup after
  slash conversion. The defect remains separately recorded, not silently fixed.
  No successful current Windows installation is claimed.
- Source import revisions remain unknown for confirmed Emil/Taste adaptations.
  Ponytail body revision remains unknown. Stitch source lineage/covering grant
  remains unresolved despite conservative candidate notice placement.
- Installers are non-pruning. No live-home migration, user-folder cleanup or
  transactional rollback was performed or claimed.

## Anti Slop scope

PASS for this guidance/documentation deliverable: no invented UI, statistics,
product proof or visual verification claims. No rendered UI was changed, so a
visual-surface verdict is not applicable. Source routing simulations are labeled
as such and are not authenticated consumer runs.
