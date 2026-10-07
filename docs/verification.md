# Verification and current limits

## Canonical documentation location adoption (2026-10-07)

Source baseline: current `main` at
`d37dd6dd5b2a45485b117cc97c5355309b7453d3`. This change is passive
skill/catalog guidance, not a runtime extension or project-migrating installer.
The catalog defines 128 exact local artifact destinations and one external-only
artifact among 129 existing IDs; document selection remains selective.

| Exercised check | Result and boundary |
|---|---|
| `bun scripts/test_document_locations.mjs` | PASS: complete unique artifact destinations, approved taxonomy/safe project-relative paths, root/native-format exceptions, infrastructure defaults, rejected unsafe/duplicate paths and retired competing fallback/registry lint. |
| `bun scripts/test_skill_catalog.mjs` | PASS: 35 canonical skills, 14 hidden aliases, 265 mapped skill assets, 287 inventory mappings, 38 notices, URI/relative targets. Its previously documented privacy destination assertion now reflects the existing supported inventory; no privacy payload changed. |
| `bun scripts/test_agent_config.mjs` | PASS: existing seven worker definitions/configuration contract and 24 negative cases; no model, approval or routing changes. |
| `python3 scripts/test_install.py` | PASS: production POSIX installer/doctor integration for 287 entries; PowerShell unavailable, not verified. |
| Source-loaded OMP 18.8.0 setup/status, `openai-codex/gpt-6-luna`, disposable half-finished Parcel CLI | PASS in this fixture: read implementation/mixed notes, reconciled product/SRS/architecture/deployment to canonical owners, retained abandoned-dashboard history, created navigator/manifest, recorded adoption, and returned `docs/testing/test-strategy.md` with a verification-gap reason. No absent substantive document forest. |
| Source-loaded read-only pre-adoption countercase | PASS in this fixture: inspected root `requirements.md`, reported provisional context/authority limits, no migration, manifest, navigator or directory creation. |
| Independent fixture inspection and `bun /tmp/docflow-check-smoke.mjs` | PASS: all supplied legacy facts/history retained, selected paths match catalog, navigation targets exist or are explicitly planned missing owners, implementation unchanged, only populated directories, pre-adoption file bytes/layout unchanged. |

Local assessment sources were explicitly loaded from the candidate checkout,
including its references/templates, not installed same-named skills. Prompts
and resulting fixtures are `/tmp/docflow-smoke-adopt-prompt.md`,
`/tmp/docflow-smoke-unadopted-prompt.md`, `/tmp/docflow-smoke-adopt/` and
`/tmp/docflow-smoke-unadopted/`. These are disposable verification artifacts,
not distributed project templates. CLI transcripts were captured in the
controller's output artifacts. The baseline guidance was preserved but not
behavior-run: no comparative red/green claim. Source-loaded behavior is not
native discovery/registration, universal model obedience, Plan Mode enforcement,
or full delivery/UI-runtime proof.

Existing GitHub/OpenDesign MCP startup attempts failed in both CLI assessment
runs; no MCP tools were used. The local filesystem scenarios completed despite
those unrelated unavailable integrations. The source audit found and removed
independent glossary/ADR, family-derived delivery and dated brainstorming spec
defaults. Global adopted-project resolution covers unchanged coding/UI/security
consumers while preserving their ordinary non-adoption and read-only boundaries.

Local deployment ran `sh install.sh --dry-run`, `sh install.sh` and
`sh scripts/doctor.sh --check` successfully. All 287 managed mappings matched;
changed payload received backups and model/approval/integration settings were
unchanged. Doctor also reported legacy roots, retired skills and unrelated
unmanaged data, preserved by design. A targeted installed Markdown path scan
confirmed obsolete `domain-modeling`, `project-delivery`, `brainstorming` and
leftover `engineering-docs` references still contain old defaults outside the
managed payload. This is a local non-pruning compatibility exception, not a
second supported registry or a clean-home migration claim. Use the current
managed skills; no retirement or arbitrary project migration was performed.

## Optional telemetry containment audit (2026-10-07)

This source-led audit and local verification start from the clean omp-docflow checkout at
`20cb011f522425870304aaa9031cfe880ec1e337` and preserve
`config/agent/config.yml` architecture byte-for-byte. The component class
definitions and A/B/C/D/E inventory are in
[capabilities](capabilities.md#telemetry-boundary-inventory).

### Controls and variable decisions

The OMP 18.8.0 native config keeps OTLP export false and AutoQA disabled/denied
(`config/agent/config.yml:97-99,202-203`). OMP 18.8.0 source records the
`OTEL_SDK_DISABLED` exporter gate and config gate; local sessions, usage stats,
token display, and diagnostics remain separate local behavior and were not
disabled.

| Variable family | Decision | Control location / reason |
|---|---|---|
| `DO_NOT_TRACK`, `OTEL_SDK_DISABLED`, `RTK_TELEMETRY_DISABLED`, `NEXT_TELEMETRY_DISABLED` | KEEP | Existing compatible native/RTK/Next opt-outs retained in privacy files and extension. |
| `OTEL_EXPORTER_OTLP_{ENDPOINT,HEADERS}` and per-signal traces/metrics/logs endpoint/header variants | ADD | Empty inherited exporters must not revive endpoints or credentials; set in profiles, OMP extension and OpenDesign MCP environment. |
| `PI_AUTO_QA`, `PI_AUTO_QA_PUSH` | KEEP | Existing opt-outs retained; AutoQA remains denied in native OMP configuration. |
| `PI_AUTO_QA_PUSH_URL`, `PI_AUTO_QA_PUSH_TOKEN` | ADD | Clear inherited optional AutoQA push destination/credentials in managed environments. |
| `POSTHOG_KEY`, `LANGFUSE_PUBLIC_KEY`, `LANGFUSE_SECRET_KEY`, `OPEN_DESIGN_TELEMETRY_RELAY_URL`, `OPEN_DESIGN_OBJECT_RELAY_URL`, `OPEN_DESIGN_VELA_TELEMETRY` | KEEP + ADD object relay | Existing supported PostHog/Langfuse/telemetry-relay/Vela controls retained; add supported object-relay empty value. Source checkout evidence: daemon `analytics.ts:181-197,473-498`; `langfuse-trace.ts:410-545,2634-2700`; `trace-object-manifest.ts:149-163`; `integrations/diagnostic-relay.ts:11-18`. |
| Provider auth, model/update endpoints, `OD_DAEMON_URL`, RTK rewrite and Herdr socket variables | KEEP | Required/functional or local optional interfaces; do not clear. |
| `POSTHOG_HOST` | NO CHANGE | Empty key disables inspected daemon/browser keyed capture; host is inert without a key. |
| `telemetry.metrics`, `telemetry.content`, `telemetry.artifactManifest` app preferences | NO CHANGE | User-owned preferences remain untouched; containment is enforced at outbound sink inputs instead. |
| Obsolete variables | NONE identified | No repo control was removed or renamed. |

The managed control paths are `config/privacy/telemetry.env` and
`telemetry.ps1` → profile stanzas installed/checked by `scripts/telemetry-profiles.sh`
and `.ps1` → OMP child override in
`config/agent/extensions/telemetry-opt-out.js`. The OpenDesign MCP declaration
passes explicit supported values in `config/agent/mcp.json`; the explicit
`start-open-design` command sources installed `.omp/telemetry.env` before its
daemon launch. `install.sh`/`.ps1` deploy all managed files through
`config/files.tsv`; `doctor.sh`/`.ps1` audit or repair those payload/profile
states. No architecture, approval, model, Plan Mode, OMP stats/sessions, RTK
rewrite/tracking, Herdr local IPC, or OpenDesign functionality was removed.

### Evidence and limits

OpenDesign source inspected from `/home/personal/tools/open-design` at commit
`5b19dfa4351b3eed33826ee72746a7c653c23a54` shows: POSTHOG key required for
browser/daemon capture (`analytics.ts:473-498`); Langfuse requires relay or both
keys, and Vela has an independent default-on path unless disabled
(`langfuse-trace.ts:410-545,2634-2700`); object manifests and diagnostics
accept the object relay (`trace-object-manifest.ts:149-163`,
`integrations/diagnostic-relay.ts:11-18`). The inspected source applies
environment controls to the local source-launch path. An alternate packaged
OpenDesign sidecar can inject baked options that override inherited environment
values (`sidecars.ts:659-720`); this packaged path remains an explicit
unverified residual risk and must not be described as fully disabled.

No OpenDesign daemon was started or queried. `OMP_OPEN_DESIGN_CLI` and
`OMP_OPEN_DESIGN_LAUNCHER` were absent in the inspected environment, so live
MCP/daemon behavior remains unverified.

Executed pre-publication checks:

| Check | Result |
|---|---|
| `python3 scripts/test_install.py` | PASS: production POSIX installer/doctor, 285 inventory entries, inherited telemetry sentinel clearing. |
| `bun scripts/test_agent_config.mjs` | PASS: parsed YAML, seven agent contracts and 24 negative cases. |
| `bun scripts/test_model_routing.mjs` | PASS: seven tool-boundary handler cases; not OS containment proof. |
| Baseline byte comparison of config, all agent definitions, RTK and Herdr extensions | PASS: unchanged. |
| Actual opt-out module execution plus child-environment smoke | PASS: telemetry endpoints/credentials cleared; provider credential and Herdr local IPC sentinel preserved. |
| `sh install.sh --dry-run --home <temp>`, install, then `sh scripts/doctor.sh --check --home <temp>` | PASS: managed summary healthy. |
| Native OMP 18.8.0 `config get` in the disposable home | PASS: OTLP false, AutoQA false, token display true. |
| Native local `rtk telemetry status` and `rtk rewrite 'git status'` | PASS: telemetry blocked, rewrite returns `rtk git status` (protocol exit 3). |
| `pwsh -NoProfile -File scripts/test_telemetry_install.ps1` | NOT VERIFIED: no PowerShell runtime available. |

Source references: [OMP 18.8.0 environment controls](https://github.com/can1357/oh-my-pi/blob/v18.8.0/docs/environment-variables.md),
[OMP AutoQA](https://github.com/can1357/oh-my-pi/blob/v18.8.0/packages/coding-agent/src/tools/report-tool-issue.ts),
[RTK 0.51.0 telemetry](https://github.com/rtk-ai/rtk/blob/v0.51.0/src/core/telemetry.rs),
and [OpenDesign inspected revision](https://github.com/nexu-io/open-design/tree/5b19dfa4351b3eed33826ee72746a7c653c23a54).
Temporary verification scripts and disposable home were outside the repository
under `/tmp/omp-docflow-audit.R3QKtAPR/`; none are deployed.

## Compact communication verification

Pre-publication basis: branch `main`, HEAD
`80554641c62919d5fa2844b8f49900dc01bd0c4a`, OMP `18.8.0`, Linux/WSL.
Configured origin remains `https://github.com/rizariaputrawira/omp-config.git`;
GitHub resolves repository ID `1402051919` to
`https://github.com/rizariaputrawira/omp-docflow`. Remote main matched HEAD.
Existing README/verification edits and untracked work are excluded from this
change. Evidence and temporary checkers: `/tmp/compact-communication-evidence/`.

| Command / check | Observed outcome and boundary |
|---|---|
| `sh scripts/doctor.sh --check --home /home/personal` | PASS before edits: all 285 managed mappings and shell profile stanzas healthy; legacy/unmanaged advisories retained. `doctor-before.txt`. |
| `bun scripts/test_skill_catalog.mjs` | FAIL: existing line 22 assumes `.omp/${source.slice(7)}`; `config/privacy/telemetry.env` deliberately maps to `.omp/telemetry.env`. Inventory and checker are unchanged by this task. `skill-catalog.txt`. |
| `bun scripts/test_agent_config.mjs` | PASS: seven worker contracts, native approval settings and 24 negative cases. Static, not authenticated dispatch. `agent-config.txt`. |
| `node scripts/test_model_routing.mjs` | PASS: seven handler cases, not OS containment. `model-routing.txt`. |
| `node scripts/test_antislop.mjs` | PASS: 16 positive and 18 negative handler cases, not model obedience. `antislop.txt`. |
| `python3 scripts/test_install.py` | PASS: real POSIX installer/doctor integration over 285 inventory entries. `install-tests.txt`. |
| `pwsh -NoProfile -File scripts/test_telemetry_install.ps1` | NOT VERIFIED: no PowerShell runtime available; not executed. |
| `python3 /tmp/compact-communication-evidence/check.py` | PASS: all other config payloads byte-identical, all seven frontmatters unchanged, exact worker sentence appends, single canonical policy owner, unchanged dirty README. Security-reviewer remains byte-identical. `protected-check.json`. |
| `node /tmp/compact-communication-evidence/telemetry.mjs /mnt/d/user/personal/project/omp-config/config/agent/extensions/telemetry-opt-out.js` | PASS: fresh process seeded all 11 keys with enabled/sentinel values; extension restored exact opt-outs. `repository-telemetry.txt`. |
| `bun /tmp/compact-communication-evidence/structured.mjs /mnt/d/user/personal/project/omp-config/config/agent` | PASS after correcting temporary checker assumptions about scalar/list selectors and inherited thinking: native YAML privacy, role/thinking/approval settings and seven baseline frontmatters verified. `repository-structured.txt`. |
| `sh install.sh --dry-run --home /tmp/compact-communication-evidence/disposable-home` | PASS: no payload/profile writes; unrelated sentinel retained. `disposable-dry-run.txt`. |
| `sh install.sh --home /tmp/compact-communication-evidence/disposable-home` | PASS: all 285 installed destinations byte-match sources; sentinel retained. `disposable-install.txt`. |
| `sh scripts/doctor.sh --check --home /tmp/compact-communication-evidence/disposable-home` | PASS: managed payload/profile health, no unmanaged observations. `disposable-doctor.txt`. |
| Disposable-home native `omp skill list --json` and `omp read skill://agent-guidance`, `omp read skill://ui-design`, `omp read skill://impeccable` | PASS from empty workspace with isolated HOME/config: 49 identities, zero warnings; current owners and compatibility pointer resolve. No credentials copied or model turn sent. `disposable-skills.txt`, `disposable-read-*.txt`. |

The canonical five-bullet section adds **137 whitespace-delimited words and
8 lines** to PERSONALITY; each changed worker adds one 16-word sentence without
adding lines. No token/cost reduction is measured. Full task delta review found
no routing, authority, approval, network, telemetry, mode or runtime integration
changes. Operational config/inventory search found no Caveman activation/package
patterns. The architecture citation is concept-only provenance; wording is
independently authored, with no bundled Caveman implementation or implied
sponsorship/integration.

These are STATIC VERIFIED and disposable LOCAL INSTALL VERIFIED observations.
Actual-home deployment, installed native checks and authenticated communication
smoke are unrun at this pre-publication checkpoint; no future deployment or
universal behavioral compliance is claimed. Independent daemons and arbitrary
egress remain outside telemetry assurance.

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

## Optional critique state correction

The local `ui-design` entrypoint now identifies critique state as optional and
routes discovery to the single executable recipe in
`reference/critique.md#setup`. That recipe suppresses only `ENOENT` from metadata
lookup, rejects non-regular files, and leaves all subsequent read errors visible.
It creates no inspection directories. An existing Python 3 interpreter is one
supported interface, not a new installation prerequisite; without it or a native
metadata/read interface that distinguishes errors, discovery is reported
unavailable rather than absent.

Focused regression passed on Linux with Bun 1.4.2, Python 3 and preinstalled
Impeccable engine 0.1.11:

```sh
IMPECCABLE_BIN="$HOME/.impeccable/bin/0.1.11/impeccable" \
  bun scripts/test_critique_optional_state.mjs
```

`node` can replace `bun`; `PYTHON3` may name an existing Python 3 executable.
The engine must already be installed (launcher target 0.1.11); the test does not
download one. It executes the Python block extracted from the maintained
playbook against absent parent/file, existing guidance, invalid file/parent
types, unreadable file and denied parent-lookup fixtures. POSIX root runs use an
unprivileged child for permission fixtures. Windows ACL denial is explicitly
unverified by these POSIX fixtures.

The regression also uses the unchanged canonical launcher/storage helper to
write two real snapshots, read their trend, and check the first snapshot survives
the second write. It is not a source-string assertion of filesystem behavior or
an actual OMP consumer/model-obedience run. The original missing-state error is
user-reported; no failing baseline consumer run is claimed.

Current upstream was inspected at
[`bbcb29d9dee6c94915d760bcfc36818ad5be66ad`](https://github.com/pbakaus/impeccable/commit/bbcb29d9dee6c94915d760bcfc36818ad5be66ad).
Its critique guidance still says to read `ignore.md` if it exists; no ignore-read
helper or exact upstream fix was found. Its storage implementation treats missing
history as empty and creates directories when writing. The local engine,
launcher, command semantics and history persistence remain unchanged.
Upstream also collapses some history-listing errors to empty history and ignores
the Rust snapshot `write_all` result; this guidance correction does not claim to
repair those pre-existing engine limitations.

`python3 scripts/test_install.py` passed POSIX installer/doctor integration for
285 inventory entries. PowerShell was unavailable. The broader
`bun scripts/test_skill_catalog.mjs` stopped at its pre-existing telemetry
destination assertion (`.omp/privacy/telemetry.env` expected versus the inventory's
intentional `.omp/telemetry.env`); telemetry and that unrelated assertion were not
changed.

One source-loaded OMP 18.8.0 consumer smoke exercised the candidate entrypoint
and critique Setup in a disposable HTML project, not a full visual critique.
The Python probe returned no ignore guidance; canonical `latest` exited 2 and
`trend` returned `[]`. Post-inspection metadata checks still reported `ENOENT`
for all optional critique paths. Canonical `write` then created a snapshot, and
`latest`/`trend` read it back; the verifier also read the persisted report.
The consumer's direct context invocation failed because the checkout launcher
was not executable; invoking the unchanged launcher through `sh` successfully
loaded context with normal missing-product/design/surface directives. No launcher
mode or behavior was changed. GitHub/OpenDesign MCP connection warnings were
unrelated to the local filesystem branch and neither service was used.
