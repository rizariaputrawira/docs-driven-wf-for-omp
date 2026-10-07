# Verification and current limits

Historical broader basis: inspected main `e850b6a07a55bc893d97c786928c45906952bbe7`
plus the architecture revision documented here. Installed/latest OMP observed on
2026-10-06 was **18.6.3**, source
`093275112f7adff207608673c0e33c7f3d16e27f`, Linux/WSL, Bun 1.4.2 and Node
24.20.0. The approval-specific 18.8.0 record below does not reverify every historical
claim. Neither record is a minimum-version or future-upgrade promise.

## Approval cleanup 2026-10-07

Source of truth: remote omp-docflow main and local HEAD both
`cebe3627b7d93f175f056475070b017fef9c3976`. Existing local README/verification and
PowerShell work was preserved, not reset. The review stage performed no commit,
push or live-home installation; subsequent user-authorized deployment is recorded below.

Installed `omp --version` returned **18.8.0**. Official main and v18.8.0 resolved to
[`4ef97c8826ee012829a3e756b693a2a16a414f47`](https://github.com/can1357/oh-my-pi/tree/4ef97c8826ee012829a3e756b693a2a16a414f47).
Installed Linux-x64 binary SHA-256
`6d0bd5d624f96b42513859558bc001d523a1eada1d71446ab7ca743ec2aa7de1`
matched the [official release asset](https://api.github.com/repos/can1357/oh-my-pi/releases/assets/617904833).
Source/API and embedded installed-source evidence is in `/tmp/native-approval-evidence/`.

### Approval-source tracing

This matrix combines static native source interpretation with the exercised inert
handler cases below. No supplied transcript establishes historical conversational
confirmation frequency; “possible” identifies guidance ambiguity, not measured behavior.

| Operation | Native before → after | Conversational cause / intended after | Responsible owner |
|---|---|---|---|
| Read file; grep/glob/search | Allow → allow | No redundant permission to inspect | Native yolo; PERSONALITY task authority |
| Edit/write affected file | Allow → allow | Separate-authorization wording could imply a new step; requested scope proceeds | Native yolo; canonical authority + narrowed skills |
| Ordinary test/formatter/linter command | Allow → allow | No permission question merely to verify requested work | Native bash/yolo; canonical authority |
| Git status/diff | Allow → allow | Read-only evidence proceeds | Native bash/yolo; git-change-status |
| Bounded task worker | Allow → allow | Delegation already within task authority | Native task exec tier/yolo; unchanged routing |
| Eval | Every call prompt → absent by default | No default eval attempt; deliberately enabled eval still prompts | Native eval backend gates; retained per-tool policy |
| `git reset --hard`, force push, selected force-clean forms | Prompt → prompt | Explicit request counts; native policy still decides | Native bash patterns |
| `git push --follow-tags` | False-positive prompt → allow | Only perform publication if requested | Narrowed short-force glob |
| Matching recursive force-rm | Deny → deny | No interpreter/tool evasion | Native bash patterns |
| Mixed Git prompt + matching removal | Prompt, or allow when critical override replaced prompt → deny | No extra model approval system | Removal deny rules moved first |

Native [approval documentation](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/docs/approval-mode.md)
and [resolver](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/packages/coding-agent/src/tools/approval.ts)
confirm per-tool prompt/deny survive yolo and final rewritten arguments are checked.
The [bash implementation](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/packages/coding-agent/src/tools/bash.ts)
uses normalized case-sensitive `*` wildcards and ordered raw/segment matches.
The [eval registry](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/packages/coding-agent/src/tools/index.ts)
omits eval when both backends are false; no standalone browser/python replacement
was registered. Raw eval subprocesses are not bash-tool calls and are not governed
by bash.patterns. Option rationale and capability loss live in
[capabilities](capabilities.md#approval-friction-decision).

Native Plan Mode remains enabled, not enabled on startup, and its working-tree/
child read-only guards remain unchanged. A plan review is not another approval
transition. Ordinary children run headless yolo but inherit per-tool policies:
prompt-required calls reject without interactive UI. One real research-worker
eval attempt was rejected with exactly that error before execution.

### Exercised checks and limits

| Command / scenario | Outcome and classification |
|---|---|
| `bun scripts/test_skill_catalog.mjs` | PASS; STATIC VERIFIED 35 canonical capabilities, 14 hidden aliases, 263 skill assets, 282 mappings, 38 notices and all URI/relative targets. No registration/model-obedience inference. |
| `bun scripts/test_agent_config.mjs` | PASS; STATIC VERIFIED model selectors/concurrency/depth plus approval/eval configuration, ordinary command cases, force Git/rm cases and 24 negative mutations. Static wildcard contract is not a shell parser/runtime proof. |
| `node scripts/test_model_routing.mjs` | PASS; seven existing tool-boundary handler cases; architecture unchanged, not OS containment. |
| `node scripts/test_antislop.mjs` | PASS; 16 positive/18 negative handler cases; no approval policy changes. |
| `python3 scripts/test_install.py` | PASS; 282 POSIX managed mappings. Reports neither pwsh nor Windows PowerShell available; no current Windows proof. |
| `bun /tmp/approval-architecture-check.mjs` | PASS; STATIC VERIFIED all non-eval/bash config values equal main; unchanged removal deny strings; seven agents, four extensions, WATCHDOG and MCP byte-identical. `/tmp/approval-architecture-evidence.json`. |
| `node /tmp/native-approval-smoke.cjs /home/personal/.local/bin/omp /mnt/d/user/personal/project/omp-config/config/agent/config.yml /tmp/docflow-pristine/config/agent/config.yml` | PASS after correcting fixture lexical-this binding. RUNTIME VERIFIED only for exact installed embedded-source handlers executed with fixture settings/runner/dependencies: 18 inert before/after command cases, eval prompt/allow/deny, final extension-rewrite recheck and restricted registration gate. NOT full installed TUI/interpreter proof; dangerous strings never executed. |
| `node /tmp/native-approval-passive-rpc.cjs /home/personal/.local/bin/omp /tmp/docflow-pristine/config/agent/config.yml /mnt/d/user/personal/project/omp-config/config/agent/config.yml` | RUNTIME VERIFIED actual installed passive RPC registration: baseline eval present, candidate absent; ordinary native tools retained; no direct browser/python in either. Both exit 0, response success, zero messages, not streaming, empty stderr. `/tmp/native-approval-passive-rpc-GPtW8u/{baseline,candidate}/{result.json,stdout.jsonl,stderr.txt}`. |

The passive RPC probe used disposable HOME/PI_CODING_AGENT_DIR/empty workspace,
sanitized environment, no credentials/extensions/MCP copied and no model turn.
Temporary safety overlays disabled update/setup/splash/eval provisioning; launch
flags disabled extensions/skills/rules/title/LSP only for the probe. Initial
auth-free default-model selection failed (`No default model selected`, evidence
`/tmp/native-approval-passive-rpc-MOGUvB`); explicit selection of the existing
configured `openai-codex/gpt-6.1-sol` with medium thinking allowed passive state
inspection without credentials. No routing configuration was changed.

Handler events prove approval was **required**, not that a dialog was visually
shown. Prompt-required wrapper calls rejected without UI and did not execute;
allow executed one inert fixture callback; deny did not execute. Source-loaded
handlers observed follow-tags prompt→allow, Git+rm prompt/allow→deny and unchanged
standalone Git prompt/removal deny behavior.

Known native limitation remains: `git reset --hard HEAD; shutdown` resolves allow
in yolo because unrelated critical detection replaces the earlier Git prompt with
a bare override. This was an inert handler input only. Pattern rules are not a
complete destructive-command filter; no custom router or broad new restrictions
were added. Selected `git clean -fdn` dry-run still prompts conservatively.

### Written-policy simulations

These nine cases are STATIC VERIFIED interpretation, **not authenticated model
behavior**. Ordinary listed steps have no native prompt under managed yolo;
matching destructive policies, deliberate eval opt-in and provider safety checks
remain exceptions. Clarification is only for unresolved material intent, target,
scope, consequence or cost—not a routine implementation step.

| Request | Proceeds / remains read-only | Native approval / conversational boundary |
|---|---|---|
| Fix this failing test | Inspect, bounded investigation, edit relevant code/tests, run relevant tests and verify | No routine confirmation; clarify only newly material scope/behavior |
| Refactor this module and run tests | In-scope refactor and proportionate verification | Same; no approval to run each command |
| Review this diff | Read-only source/diff inspection and findings; no fixes or execution from review alone | No question to begin; report findings |
| Review this diff and fix problems | Read-only reviewer then scoped implementation/verification | No artificial reapproval after review |
| Build UI and verify on mobile | Requested UI edits and relevant narrow/wide verification using available automation | Material unresolved design choice only; eval browser helpers require deliberate backend opt-in and native prompt; real hardware/automation availability must be reported honestly |
| Draft commit message | Read-only git-commit-message procedure; no Git mutation | No confirmation; return draft |
| Commit staged changes | Draft message through read-only skill, then requested staged commit as separate execution responsibility | No routine extra approval; clarify ambiguous/newly risky staged scope only |
| Commit and push staged changes | Message, requested commit and ordinary push | Explicit request supplies intent; native force-push policy still prompts; unresolved target/ref requires clarification |
| Check branch unpublished changes | Read-only status/diff/log/available refs; no fetch/commit/push | No routine question; missing/stale upstream evidence reported as unknown |

Occurrence classification is retained in session artifacts
`local://approval-friction-audit.md` (managed guidance) and
`local://approval-owner-classification.md` (other owners), with categories for
normative gates, read-only/security exceptions, licenses, history and domain/schema
semantics. No mechanical authorization-word deletion. Specialized security/review,
disabled-suite, git-message, Astra, native Plan and changed-consequence boundaries remain.
Four extensions were source inspected: model boundary blocks unsupported models
rather than prompting; RTK rewrites commands before native recheck; Herdr observes
approval events; Anti Slop injects bounded UI guidance, not approval policy.

**NOT VERIFIED:** full TUI approval-dialog rendering/interactive choices,
authenticated model obedience or before/after conversational prompt frequency,
browser automation/fallback dependencies, JS/Python process execution, interactive
Plan Mode/child dispatch and actual RTK/Herdr/MCP integration. No services started.

### Authorized live deployment

After the review, the user explicitly requested live installation and Git publication.
`sh install.sh --dry-run --home /home/personal`,
`sh install.sh --home /home/personal`, and
`sh scripts/doctor.sh --check --home /home/personal` all exited successfully.
Doctor reported **managed summary: healthy** across 282 mappings. Changed managed
files received installer backups; unrelated content and legacy skill folders were
not pruned. Legacy/unmanaged advisories remain, so old discoverable procedures may
still compete with current guidance. No MCP/RTK/Herdr service was started.
Fresh OMP launches should be used to load the updated configuration and instructions.

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
