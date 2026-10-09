# Verification and current limits

## Complexity cuts — source verification (2026-10-09)

The three scoped simplifications share the PowerShell inventory validator,
replace manual profile appends with `File.AppendAllText` using the existing
encoding, and bind the browser's six forwarding-only session helpers directly.
Validation, backups, unrelated-content preservation, the missing-helper guard,
project ownership checks and handled-session guards are retained. No dependency
or model/routing change is introduced; the original dirty checkout is untouched.

- PASS: native Windows PowerShell **5.1.26100.9444** executed the production
  installer and doctor in disposable native Windows directories over all
  **288 inventory entries**. Dry-run, install/check, identical reinstall,
  managed-file drift/fix, exact backup and unrelated bytes, and duplicate/unsafe
  inventory rejection before writes passed.
- PASS: `scripts/test_telemetry_install.ps1`, including byte-exact UTF-8,
  UTF-16 LE/BE and UTF-32 LE/BE append/reinstall cases. Existing bytes and
  BOM-selected encodings are preserved without a second BOM.
- PASS: `bun scripts/test_agent_config.mjs`,
  `node scripts/test_model_routing.mjs`, `bun scripts/test_skill_catalog.mjs`,
  `bun scripts/test_document_locations.mjs`, `node scripts/test_antislop.mjs`
  and `python3 scripts/test_install.py`. The Python runner's PowerShell
  availability message does not include `powershell.exe`; Windows evidence
  above comes from the separate native invocation, not the Python runner.
- PASS: JavaScript syntax and a disposable Node VM smoke of the maintained
  session helper and changed browser initialization/bindings: scroll persistence
  and reload/clear, handled-session persistence and selective/all clear, session
  removal, foreign-project rejection, and missing-helper initialization guard.
  **Not verified:** the full rendered live overlay or browser/backend flow.

The native Windows invocation used process-only `-ExecutionPolicy Bypass`;
no saved execution policy changed. Direct execution from the WSL UNC checkout
first encountered the existing provider-path format limitation, so verification
copied the explicit inventory and required scripts to a disposable native
Windows directory. No UNC-support fix is claimed. Windows fixtures were removed.
The full native transcript is session-local `artifact://274`; the six source
checks and Node VM smoke returned successful terminal results in this session.

## Historical Candidate C full-template deployment — receipt (2026-10-09)

**Verdict: PASS — implemented, normally pushed and installed.** Payload commit
[`b16070df90fa112a1479a5e9a68c6d360416f77b`](https://github.com/rizariaputrawira/omp-docflow/commit/b16070df90fa112a1479a5e9a68c6d360416f77b)
was committed on `main` in the isolated clone and pushed to the canonical
`https://github.com/rizariaputrawira/omp-docflow.git` without force/history rewrite.
The original dirty checkout was not mutated. The clean clone initially lacked
author identity; its repository-local identity was set from the original
checkout's existing repository-local values, without changing global settings
or the original checkout. This deployment receipt is recorded separately from
the already-pushed payload.

After the successful push, the supported installer dry-run, installation and
doctor check all completed successfully against `/home/personal`:

```sh
sh install.sh --dry-run --home /home/personal
sh install.sh --home /home/personal
sh scripts/doctor.sh --check --home /home/personal
```

Doctor reported **managed summary: healthy** for the 288-entry inventory,
including the new native template and restored PERSONALITY mapping. Changed
existing managed files received collision-safe backups; the new template had
no previous file to back up. Telemetry profile checks passed. Legacy skill roots,
retired/unmanaged entries, history/account state and backups remained advisory
observations and were preserved, not deleted. Command/backup evidence is
`/tmp/omp-docflow-candidate-c-jS0TPE/evidence/deployment-receipt.txt` and the
primary full installer/doctor output `artifact://244`.

The installed executable now reports **OMP 18.8.6**, SHA-256
`877acdc48384b80fe4c083b1e610433d28922dd9fccde9ea430aaace8765b19b`;
the earlier observed executable was 18.8.4. No assistant binary update or
rollback was executed, and the exact cause/time of that change was not
established. Unstamped earlier actor runs are not retrospectively assigned a
version. The [upstream 18.8.6 native system template](https://github.com/can1357/oh-my-pi/blob/v18.8.6/packages/coding-agent/src/prompts/system/system-prompt.md) is byte-identical to the
pinned 18.8.4 source (SHA-256 `16193a4d43a1646b27dfb1c97810f3a92bb316c4c8773ff8a9d18c9481215dd3`),
so this upgrade needs no instruction-template change. Current API/TUI checks
below exercise the actual 18.8.6 runtime; future upgrades still require review.

| Installed check | Observed result and basis |
|---|---|
| Native configuration | PASS: `omp config path` resolves `/home/personal/.omp/agent`; native modelRoles JSON shows Luna-medium default/plan, existing Luna worker/vision bindings, Sol-medium slow and Sol-high advisor; all seven worker overrides remain correct. |
| Installed source ownership | PASS: source/installed SHA-256 values match for 13 critical files: config, PERSONALITY, AGENTS, native template, seven agents and both changed skill owners. |
| Fresh passive RPC | PASS: actual `openai-codex/gpt-6-luna`, medium, zero messages and non-streaming; automatic native template and Candidate PERSONALITY loaded. No profile, agent-directory, model or effort selectors. |
| Authenticated role smoke | PASS: three explicitly requested parallel verification probes completed and settled. Routine had actual `gpt-6-luna` provider turns and returned the read contract value `amber-otter-7319` with `contract.txt:1`; slow had an actual `gpt-6.1-sol` turn and returned the bounded snapshot/revocation decision; advisor had an actual `gpt-6.1-sol` turn and returned an evidence-only opinion on the supplied prior Sol receipt. Luna resumed. These explicit probes are installation verification, not a production three-level ladder or natural-routing evidence. |
| Native TUI Plan Mode | PASS: fresh `/home/personal/.local/bin/omp --no-session --no-title --cwd <controlled-fixture>` showed `◑ GPT-6 Luna`. Submitting only `/plan` displayed `Plan mode enabled` and `GPT-6 Luna │ 🗺 Plan`; `/exit` returned 0. No substantive request, generation, proposal or approval. This is actual mode activation, not the `--plan <id>` model-selection flag. |

Installed RPC evidence:
`/tmp/omp-docflow-candidate-c-jS0TPE/evidence/installed-runtime/summary.json`,
`passive.jsonl`, `passive-provenance.jsonl`, `role-smoke.jsonl`,
`modelRoles.json`, `agentModelOverrides.json` and the two critical-byte manifests.
The role smoke returned 0, completed/settled with no incomplete queries/chunks,
in **22.899 seconds**. TUI evidence:
`/tmp/omp-docflow-candidate-c-jS0TPE/evidence/installed-plan/README.txt`
and `pty-transcript.txt`.

The verification cwd alone disabled copied github/open-design MCP declarations,
set RTK_DISABLED and removed Herdr/selector overrides; installed integrations
were not changed and no optional server connection/tools were observed.
Provider records establish the actual child model identities but do not expose
per-child thinking effort: routine/slow medium and advisor high are verified
installed configuration, **not independently provider-logged effort**.
PowerShell execution remains NOT VERIFIED. No measured cost savings or universal
model-compliance guarantee is claimed. A fresh session loads the new template;
the already-running explicit Sol session was not hot-switched.

## Historical Candidate C native-rule correction — source and template-mode verification (2026-10-09)

**Source and exercised runtime behavior: PASS.** This receipt establishes the
candidate configuration and isolated runtime behavior, not publication or
real-home deployment. The earlier blocked assessment below is retained as
history rather than rewritten into a pass.

The user authorized correcting the native delegation rule after the policy-only
candidate skipped its required Sol consultation. OMP 18.8.4 supports a discovered
`~/.omp/agent/SYSTEM_TEMPLATE.md`: this replaces the native instruction template
block, while generated project context/footer, safety blocks and provider tool
schemas remain native. The managed template copies the unrendered upstream
template at commit `40e9368ef0458fd9073329cdff4174895f91bc6b`, preserves its live
Handlebars fields/helpers and non-delegation content, and scopes generic
one-slice/direct-question/fanout/spawn-idle restrictions to execution delegation.
A policy-required bounded decision consultation can use one managed task item
and wait when genuinely prerequisite. Semantic escalation predicates remain
owned by PERSONALITY; no router, keyword classifier or model-switch hook was added.
The obsolete PERSONALITY exception and late AGENTS workaround were removed.

Upstream template SHA-256:
`16193a4d43a1646b27dfb1c97810f3a92bb316c4c8773ff8a9d18c9481215dd3`.
Final managed template SHA-256:
`187de2f69a23a9811c01337f58b158cc8c5dd31bf5537eb49671b6c52e0e13e1`.
The source comparison found only the intended delegation edits and a
non-rendered MIT/source notice after integration corrected three accidental
non-routing spelling/order/indentation differences. The native binary was not
modified; its version string does not establish a source/binary build match.
Literal SYSTEM.md still takes precedence; template changes require a fresh
prompt/session, and every OMP upgrade requires reviewing the upstream diff.

The five focused commands listed in the earlier assessment all passed after the
inventory correction: `bun scripts/test_agent_config.mjs`,
`node scripts/test_model_routing.mjs`, `bun scripts/test_skill_catalog.mjs`,
`node scripts/test_antislop.mjs`, and `python3 scripts/test_install.py`.
The catalog and POSIX integration now cover **288 inventory mappings/entries**.
PowerShell remains unavailable and NOT VERIFIED. Actual output is retained in
`/tmp/omp-docflow-candidate-c-jS0TPE/final-suite-native-rule.txt`.
Subsequent template-only corrections were verified by the supported disposable
installer/doctor and native no-generation rendering, not another model replay.

Private evidence root:
`/tmp/omp-docflow-candidate-c-jS0TPE/evidence/native-rule-fix/`.

| Check | Observed result |
|---|---|
| Complete source loading | PASS: corrected manifests include config, PERSONALITY, AGENTS, native template, all seven agent definitions and both affected skills. An initial new-template actor omitted PERSONALITY because an inventory edit replaced its row; this invalid-source run is retained separately, not a model reasoning failure. Both owner mappings were restored before the accepted run. |
| Final template preservation and discovery | PASS: `template-source-diff-review.txt`; `source-sha256-final-template.txt` and `home-sha256-final-template.txt`; `doctor-final-template.log` reports managed healthy. `receipts/case6-final-template-nogen.jsonl` automatically loads Luna-medium, zero messages/non-streaming, the Candidate PERSONALITY owner and corrected native gates, without model/template overrides. |
| Unchanged natural case 6 | PASS: `receipts/case6-corrected-natural.jsonl`. Luna read the same fixture, sent one native `agent: "slow"` task with actual alternatives and no model override, received the bounded decision and resumed to a completed/settled answer. The child provider record reports `openai-codex/gpt-6.1-sol`; its only tool action was yield. No edits, checks, further spawning or implementation approval; fixture diff empty. |
| Clear direct control | PASS: `receipts/control-case1-direct.jsonl`. The unchanged case-1 docs-status request stayed Luna-medium with zero children, six read-only calls and no writes; fixture diff empty. |
| Independent behavior evaluation | PASS: the fresh read-only evaluator inspected complete identity-redacted streams, accepted both cases and reported no findings. Its review excludes model identity/effort and broader source coverage; raw provider/source evidence supplies those separate bases. |

The accepted generation used template SHA-256
`1fedc70a2f2fa605fe3e8afc511dd75888db59065217f53c001997d7a92d6eda`.
Final bytes restore only non-routing spelling/order/indentation; the semantic
policy, delegation clauses, config and role definitions are unchanged.
Behavior evidence is reused on that unchanged basis; final bytes have separate
source/home manifests, installer/doctor and no-generation proof.
`acceptance-receipt.json` records both bases. Cases 2–5 were not rerun after this
native-template correction; their previously accepted scoped evidence below
remains separate from the new case-6/control observations.

| Accepted run | Luna native total tokens | Sol native total tokens | Elapsed seconds |
|---|---:|---:|---:|
| Natural case 6 | 53,140 | 4,898 | 20.759 |
| Direct case-1 control | 111,977 | 0 | 14.679 |

Case 6's combined native total is 58,038 tokens, with parent/child separately
itemized and streaming copies deduplicated by completed provider response.
Accounting is in `../accounting/native-rule-fix.json` relative to the evidence
root. Native-reported costs are usage metadata, not verified invoice amounts;
retry counters and child reasoning-token counts are unavailable. The child
event records the actual Sol model but no separate runtime thinking-level field:
medium is established by the matching loaded slow definition and unoverridden
native dispatch, not independently logged provider effort. These single runs
establish exercised behavior, not statistical reliability or measured savings.

## Earlier Candidate C assessment — blocked before publication (2026-10-09)

**Verdict: RELEASE BLOCKED.** Candidate C was implemented in the isolated clean
clone `/tmp/omp-docflow-candidate-c-jS0TPE/repo`, based on canonical `main`
`c985d55771a0848569fd47570ac66024c1bf1d72`; the saved baseline archive is
`/tmp/omp-docflow-candidate-c-jS0TPE/baseline.tar`
(SHA-256 `9c3d9ebf85f3b08f574f8dac714a59e0a3aa99bb14a6e75ee6e913bb76d05531`).
The original dirty checkout was preserved. No commit, push or real-home
Candidate C installation was performed. No new documentation tree or benchmark
framework was created.

### Intended architecture and static evidence

Candidate C configures Luna-medium as default and Plan Mode owner; Luna owns
ordinary planning, work, integration and verification. Sol-medium (`slow`) is a
bounded decision service only for an identified unresolved consequential
decision; Sol-high advisor remains exceptional, evidence-only and disabled by
default. Configured selectors are not proof of authenticated identity.

At that assessment, PERSONALITY's routing text required slow consultation when supplied or
inspected evidence meets a semantic consequential predicate and the actual
decision remains unresolved. Luna may establish facts/options but cannot
replace the required Sol decision. A specific exception permits the single
native `agent: "slow"` consultation with actual alternatives in `solutionSpace`
despite generic anti-overdelegation rules; no model override or invented
additional workers. Luna resumes work after the decision. Clear cases, size
alone, routine docs, and security labels alone do not route to Sol; zero workers
is valid for clear work. Native approval, read-only, concurrency/depth and
explicit user model boundaries remain separate.

Final focused repository outcomes (all five commands rerun after the final source
corrections; receipt: `/tmp/omp-docflow-candidate-c-jS0TPE/final-suite.txt`):

| Check | Observed result and limit |
|---|---|
| `bun scripts/test_agent_config.mjs` | PASS at the recorded run: Luna-medium default/plan; seven role aliases and selectors/thinking; spawns empty; slow read-only tools; retry/fallback; global and per-agent advisor/prewalk/service tiers; concurrency/depth and native approval contracts. Follow-up assertions reject Sol default/plan, individual retry/fallback/advisor/prewalk/tier drift, slow writable-tool admission and spawning. This is a static contract, not dispatch proof. |
| `node scripts/test_model_routing.mjs` | PASS: seven named handler cases; this extension registers only `tool_call`; test evidence is only the `luna-tool-boundary.js` handler, not all extensions, native worker resolution or OS containment. |
| `bun scripts/test_skill_catalog.mjs` | PASS: 35 canonical skills, 14 hidden aliases, 265 mapped assets, 287 inventory mappings, 38 notices; URI/relative targets resolve. |
| `node scripts/test_antislop.mjs` | PASS: 16 positive and 18 negative handler cases; not an authenticated UI/runtime review. |
| `python3 scripts/test_install.py` | PASS: production POSIX installer/doctor integration for 287 entries. PowerShell unavailable and NOT VERIFIED. |

All five final commands exited successfully. No application build, typecheck or
linter is defined here. These static/installer passes do not offset the observed
native case-6 routing release defect.

All five managed extensions were source-inspected for registrations/API and
model-routing behavior: `antislop.js` conditionally injects UI/copy guidance at
`before_agent_start`; `luna-tool-boundary.js` gates tools at `tool_call` by live
model/provider; `rtk.ts` handles RTK availability and bash rewrite; Herdr reports
local pane/session state over IPC; `telemetry-opt-out.js` applies process privacy
environment values without handlers. No extension replaces a worker model at
spawn or automatically switches the main. These are source findings, not
runtime-dispatch evidence; the handler test covers only the model-boundary
extension.

The changed slow contract requests Sol-medium and read-only tools by
configuration; effective native authenticated child identity remains distinct.
Likewise configured Luna default/plan and worker selectors do not alone prove
authenticated resolution.

### Disposable runtime and benchmark outcomes

The exercised native executable reported OMP 18.8.4; its observed binary
SHA-256 was
`b2dba223fbdae27acbd99be2f3e76ba10baae1768f9c57cee30c440f308dea4e`.
The version string does not establish a source/binary hash match.
The source-loaded benchmark used fresh baseline/candidate homes and isolated
fixtures. Existing provider authentication was referenced through a private
filesystem link to the existing native account store; credentials were neither
copied nor queried, and the store could receive normal native accounting
writes. Usage attribution came from session/provider records, not shared
account-counter differences. OMP protocol-v2 chunk framing was reconstructed
by the existing RPC client; native client metadata preserves incomplete query
and chunk diagnostics, and incomplete records are not counted as successes.
Raw prompt/tool transcripts and session details are private temporary evidence
under `/tmp/omp-docflow-candidate-c-jS0TPE/evidence/`; they are not distributed
with this repository. A native cache ENOSPC interrupted a run; recovery
removed only the 20 exact cached files, preserving their hashes and environment
receipt. Interrupted records remain incomplete, not passes.

| Case | Observed baseline/candidate result |
|---|---|
| 1. Docs-engineering status | Both arms accepted by the independent read-only evaluator. Candidate Luna completed without Sol and without mandatory workers. |
| 2. Docs-engineering context | Both arms accepted: source/authority distinctions, required context fields and order constraint were handled. Candidate did not require Sol. |
| 3. Bounded pagination implementation | Both arms accepted the scoped code correction and supplied mechanical inputs. Candidate remained Luna-owned. |
| 4. Docs setup/adoption | The initial candidate inspected catalog/locations but left the current CSV/escaping/order requirement in root README rather than reconciling it into the canonical SRS owner; this was an actual acceptance miss. The original prompt's artificial two-file cap carried through the initial guidance-correction attempts and confounded those runs. The clarified pair removed that cap identically from both arms and supplied no SRS hint/quota: candidate passed, reconciling current CSV requirements, history and unknowns without app mutation; baseline failed because its checker wrote `/tmp/parcel-docs-check.mjs` outside the fixture. Do not collapse generations into a claim that the baseline broadly failed or that the candidate's initial miss passed. |
| 5. Substantial workflow-delivery CLI | In the original pair both arms wrote temporary outputs outside the authorized fixture. The clarified prompt explicitly constrained implementation/test/store/malformed/temp files to the fixture: candidate passed; baseline failed on an unrequested production store-root/path restriction. These are distinct outcomes; original failures remain recorded. |
| 6. Cross-system snapshot/revocation decision | Baseline Sol main directly made a valid bounded decision; no child was expected in that baseline architecture, so this is not evidence of a managed slow consultation. Candidate Luna initially decided directly and failed the required routing. A later actual slow Sol-medium attempt read evidence and began a yield but ended incomplete with ENOSPC; it is not a pass. After policy correction and late pointer, the final authenticated candidate still answered directly as Luna-medium after one read, spawned zero children, and exited successfully in 5.593 seconds. The required slow-child criterion still failed; this is a candidate routing release defect, not an environment limitation or reason to escalate whole task classes. |

For original cases 1–3, both baseline and candidate were accepted by the
independent Scout evaluator against the prewritten acceptance sheet. Sanitized
evaluation receipts are retained under
`/tmp/omp-docflow-candidate-c-jS0TPE/evidence/anonymous/final/`; native
transcripts remain in the private `evidence/receipts/` tree. The evaluator
judgment does not replace observable fixture diff/checker results.

The first two original case pairs ran baseline-first; scenario rework and
corrected fixtures remain separate generations. In original case 6, the candidate
actor completed and settled its prompt, but the client capture timed out after
630.172 seconds because `TextIOWrapper` plus selectors buffered the stats
response. This is an actor-generation-complete, stats/capture-incomplete record,
not a provider/model timeout or model-latency measurement. A later client used
binary `os.read` with v2 framing; unavailable stats were not inferred from shared
account counters. Case 6 policy-intent probing covered six semantic scenarios
in one read-only turn and was judged consistent with intent (clear cases Luna,
identified unresolved decisions slow). This is policy-intent evidence, not
authenticated dispatch or proof of consuming-session routing.

For per-run native input/output/reasoning/cache-read/total tokens, wall-clock
client elapsed, child-count evidence and retry availability, see the complete
accounting table and provenance notes at
`/tmp/omp-docflow-candidate-c-jS0TPE/evidence/accounting/README.md` and
`/tmp/omp-docflow-candidate-c-jS0TPE/evidence/accounting/metrics.json`.
Missing metrics remain unavailable; retries are not exposed. These are single
observations, not statistical quality/latency comparisons. Client elapsed is
not model-turn latency. Shared account-counter deltas were not attributed to
these sessions; no cost-savings claim is made.

The following session-level table transcribes the recorded native metrics; the
linked accounting artifact retains session IDs and per-record provenance. Token
counts are native session statistics when present, otherwise explicitly
incomplete unique-main-record sums. `—` is unavailable, and retry counts were
not exposed. Elapsed is native-client wall time, not model-turn latency.

| Run | Arm/model | Input | Output | Reasoning | Cache read | Total | Client elapsed s | Children | Retries |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Original 1 | Baseline / Sol | 24,248 | 691 | 28 | 71,808 | 96,747 | 44.582 | 0 | — |
| Original 1 | Candidate / Luna | 31,981 | 629 | 172 | 121,856 | 154,466 | 25.757 | 0 | — |
| Original 2 | Baseline / Sol | 47,425 | 1,422 | 67 | 138,240 | 187,087 | 71.922 | 0 | — |
| Original 2 | Candidate / Luna | 32,714 | 959 | 151 | 157,696 | 191,369 | 33.767 | 0 | — |
| Original 3 | Baseline / Sol | 26,324 | 647 | 14 | 48,512 | 75,483 | 36.489 | 0 | — |
| Original 3 | Candidate / Luna | 27,132 | 548 | 57 | 58,880 | 86,560 | 24.950 | 0 | — |
| Original 4 | Baseline / Sol | 53,957 | 5,927 | 713 | 568,704 | 628,588 | 240.406 | 0 | — |
| Original 4 | Candidate / Luna | 46,004 | 2,346 | 448 | 429,056 | 477,406 | 72.350 | 0 | — |
| Original 5 | Baseline / Sol | 39,783 | 5,363 | 232 | 481,024 | 526,170 | 195.453 | 0 | — |
| Original 5 | Candidate / Luna | 26,131 | 3,328 | 61 | 379,904 | 409,363 | 111.567 | 0 | — |
| Original 6 | Baseline / Sol | 16,580 | 527 | 72 | 37,376 | 54,483 | 31.115 | 0 | — |
| Original 6 | Candidate / Luna (stats capture incomplete) | 3,659 | 120 | — | 20,480 | 24,259† | 630.172 | 0 | — |
| First correction 4 | Baseline / Sol | 41,821 | 6,309 | 669 | 481,408 | 529,538 | 233.704 | 0 | — |
| First correction 4 | Candidate / Luna | 39,985 | 2,512 | 635 | 445,440 | 487,937 | 151.577 | 0 | — |
| First correction 5 | Baseline / Sol | 41,729 | 6,462 | 668 | 453,248 | 501,439 | 172.017 | 0 | — |
| First correction 5 | Candidate / Luna | 34,724 | 4,889 | 24 | 325,120 | 364,733 | 70.217 | 0 | — |
| First correction 6 | Baseline / Sol | 15,453 | 553 | 160 | 24,064 | 40,070 | 25.374 | 0 | — |
| First correction 6 | Candidate / Luna | 16,601 | 420 | 0 | 58,880 | 75,901 | 13.215 | 0 | — |
| Final correction 4 | Baseline / Sol | 40,405 | 1,223 | — | 105,472 | 147,100† | — | — | — |
| Final correction 4 | Candidate / Luna | 49,947 | 1,900 | 0 | 581,120 | 632,967 | 55.871 | 0 | — |
| Final correction 6 | Baseline / Sol | 15,349 | 386 | 47 | 24,064 | 39,799 | 22.151 | 0 | — |
| Final correction 6 | Candidate / Luna | 12,849 | 147 | 0 | 11,776 | 24,772 | 5.654 | 0 | — |
| Final pointer-candidate (separate) | Candidate / Luna | 12,961 | 144 | 0 | 11,776 | 24,881 | 5.593 | 0 | — |
| Final clarified 4 | Baseline / Sol | 43,368 | 6,804 | 416 | 567,168 | 617,340 | 231.743 | 0 | — |
| Final clarified 4 | Candidate / Luna | 49,268 | 4,442 | 351 | 566,272 | 619,982 | 67.218 | 0 | — |
| Final-source policy-intent | Candidate / Luna | 12,509 | 570 | 0 | 0 | 13,079 | 12.088 | 0 | — |
| ENOSPC final case6 parent partial | Candidate / Luna | 10,932 | 751 | — | 52,736 | 64,419† | — | 1 | — |
| ENOSPC final case6 child partial | Sol-medium / Sol | 4,255 | 55 | — | 3,840 | 8,150† | — | 1 | — |

† Partial unique-record sums where session stats were unavailable; do not treat
them as complete actor totals. The original case-6 candidate actor completed
and settled, but its client did not capture session statistics because of the
buffering issue above; its 630.172-second elapsed value is capture wall time,
not model latency. Separately, the final case-6 candidate parent and Sol-medium
child have partial provider-response records before ENOSPC. The parent partial
total is 64,419 tokens; the child partial total is 8,150 tokens across two
captured provider responses/turn records. There is no complete session total,
final child yield/decision or Luna continuation for that attempt; child
authentication is not consultation completion. Do not add parent and child
partial totals or aggregate them with recovery runs. Retry count is unavailable.
Other rows' zero children mean native `get_subagents` explicitly returned
`subagents: []`; missing child evidence is `—`, not zero. No across-run
statistical quality/latency claim or cost-savings claim is derived from these
single observations.

### Source corrections and final runtime proof

Benchmark evidence led to narrow source-owner corrections, not task-class
escalation:

- `PERSONALITY.md` now requires a bounded Sol decision when evidence meets a
  semantic consequential predicate and prevents Luna from substituting its own
  final choice. Its specific one-item native-task exception expresses the
  intended compatibility with observed anti-overdelegation rules; runtime
  compliance remains unproven and the final case-6 candidate still failed to
  consult slow. No model override or extra workers are introduced; Luna resumes
  after a successful decision receipt.
- `workflow-delivery/references/planning.md` lists only direct/routine/task as
  implementation-slice executors; slow may appear only as a separate bounded
  decision consultation.
- Generic loaded-procedure/output and temporary-output clauses were tried then
  removed after read-only adjudication found them unsupported by the approved
  routing contract: case 4's artificial “create only manifest/navigator”
  restriction was not in the approved plan, and case 5's all-temporary-output
  restriction was absent from its original prompt. The original failed runs
  remain failed; clarified case 4/5 outcomes above use their corrected,
  explicitly bounded fixtures. These removed clauses are not current policy.

After these source corrections, a fresh no-generation candidate-root RPC probe
resolved `gpt-6-luna` / `openai-codex` at medium thinking, zero messages and no
streaming, with current policy markers present. This verifies source-loaded
candidate default selection only; it does not cure the authenticated case-6
direct-Luna routing failure.

A disposable canonical installer/doctor pass on the candidate payload reported
healthy managed state; its isolated candidate-root no-generation probe is in
`/tmp/omp-docflow-candidate-c-jS0TPE/evidence/receipts/final-deploy-nogen.jsonl`
and installer output in
`/tmp/omp-docflow-candidate-c-jS0TPE/evidence/receipts/final-deploy-install.log`.
The real native root remains `/home/personal/.omp/agent`. A read-only native
config check observed real installed `default` and `plan` still at Sol-medium;
Luna smol/routine/task/vision remain medium; slow Sol-medium; advisor Sol-high; commit/tiny/memory Luna-low; all seven worker overrides unchanged. Candidate C installation was not attempted and no managed backup was created.

Authenticated real-install worker smoke and interactive Plan Mode TUI proof
are **NOT VERIFIED**. No Candidate C publication or installation occurred.
Verdict remains **RELEASE BLOCKED** by the observed final candidate case-6
routing defect. The original dirty checkout and real home were preserved.

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

## OMP compatibility and health implementation (2026-10-09)

### Current source and runtime basis — stable and main rechecked 2026-10-10

The installed executable is `/home/personal/.local/bin/omp`, version `18.8.7`,
SHA-256 `b87f9835a0acdbb81bbbad8273aa2d999b608a208598421a9584cffeb3139a8a`.
The latest official stable release checked is v18.8.7, tag
[`f261ed9faf16b61880b544f599876bface4ded0d`](https://github.com/can1357/oh-my-pi/tree/f261ed9faf16b61880b544f599876bface4ded0d).
The current upstream `main` commit is
[`4cd31bd6d00bb7a161443d9a5f4bce4f564664f2`](https://github.com/can1357/oh-my-pi/commit/4cd31bd6d00bb7a161443d9a5f4bce4f564664f2),
32 commits beyond the release. The release-to-main comparison changes no
tracked system-prompt discovery/builder, extension event, or task-dispatch/
subagent source path. Reviewed main changes do not add bounded consultation,
decision-only task invocation, or an equivalent native feature. No OMP binary
update was performed for this task.

Current v18.8.7 `main.ts` discovers project then user `APPEND_SYSTEM.md`
unless the CLI supplies an append prompt, and the native prompt builder appends
it without replacing the stock template. The latest release adds no native
bounded-consultation/decision-only task feature. The extension API's
`before_agent_start` event receives `prompt`, images, and the resolved
`systemPrompt: string[]` before an ordinary provider request or dequeued
user-containing batch; handlers run sequentially and may replace the full
policy array for that request and continuations. It is not a structured
delegation-clause patch API. The existing `antislop.js` hook is composable
because it preserves prior blocks and appends its own policy; no new hook was
needed or added.

The append-only migration gate has now passed on the actual installed OMP
18.8.7 binary. A disposable HOME was installed from the candidate, then its
`SYSTEM_TEMPLATE.md` was removed before launching OMP. The runtime inherited the
stock generated prompt and loaded `APPEND_SYSTEM.md`; the six-line addendum's
SHA-256 is `7f504df8c2cdcb9bb378b0685063140e09c9daf60b43d2a0cdff2286cb7a8aa3`.
The disposable HOME shared the existing OMP auth database through symlinks, as
authorized, without copying credentials. OMP may record normal usage/accounting
there. Candidate config, sessions, workspace and logs remained disposable; the
real OMP config was not changed during these probes.

| Fresh-session probe | Observed result |
|---|---|
| Clear docs-engineering status (Case A) | PASS: `omp -p` completed the supplied unadopted-project status request, read the existing owners, recommended updating README, and did not write files. Its companion native RPC state resolved `openai-codex/gpt-6-luna`, provider `openai-codex`, medium. |
| Consequential decision (Case B) | PASS: natural prompt caused Luna to submit one native task with `agent: "slow"` and no model override. OMP resolved it to `openai-codex/gpt-6.1-sol:medium`; the worker returned a bounded recommendation and Luna resumed with the final answer. No implementation was performed; the fixture remained unchanged. |
| Large but clear work (Case C) | PASS: reading all seven managed agent definitions and reporting their model selectors/responsibilities remained on `gpt-6-luna`; the transcript contains seven reads and no task/subagent invocation. |
| Plan Mode | PASS: fresh OMP TUI showed `GPT-6-Luna`; `/plan` displayed `Plan mode enabled` and the Plan indicator; `/exit` returned 0. No substantive request or approval was submitted. |

Private evidence: `/tmp/omp-docflow-append-probe.3MhvAY/case1-print.log`,
`case1-direct-rpc.jsonl`, `case6-print.jsonl`, `case-large-clear.jsonl`, and
the exited TUI transcript `proc://candidate-c-plan-probe`. The Case B
`--no-session` record exposes OMP's resolved child identity and completed
decision, not a separate saved child provider-turn transcript. No provider
fallback is enabled by configuration.

The compatibility checker now fingerprints the exact addendum, rejects prompt
overrides or unknown text, and requires same-version behavior receipts. It
reports `PASS / known-patched`; it permits `native-compatible` only with a
separate reviewed receipt and no addendum. A changed tracked prompt/task/dispatch
source returns REVIEW REQUIRED. The supported `before_agent_start` API was
rejected for this narrow change because its return contract replaces a complete
`systemPrompt` array rather than editing one stable clause. No new extension,
model router, retries, or unrelated integration change was added.

The template-based deployment receipt below records the prior installed state
and remains historical; it is not evidence for this append-only verification.

### Compatibility record and check status

`config/agent/omp-compatibility.yml` records the source-reviewed 18.8.7 release,
the exact appendix fingerprint, tracked upstream interfaces, `known-patched`
mode, and the three observed behavior receipts. `scripts/check-omp-compat.mjs`
compares source intervals for candidate versions and validates effective
Candidate C model/task/fallback settings through `omp config get`. It fails
closed for an unknown prompt, custom `SYSTEM.md`/`SYSTEM_TEMPLATE.md`, a
mismatched appendix, changed critical upstream sources, or missing behavior
receipts. The same-version check is offline; `--candidate VERSION` requires
GitHub access. `workflow-omp-health` remains explicit-only and does not invoke
Sol by default.

### Historical implementation and deterministic checks (OMP 18.8.6)

The following checks and disposable install were recorded against the earlier
18.8.6 basis, not rerun for this documentation/source review:

PASS:

- `bun scripts/test_agent_config.mjs` — Candidate C configuration, bounded
  concurrency/depth, slow read-only admission, fallback/advisor/prewalk and
  approval contracts.
- `node scripts/test_model_routing.mjs` — seven named tool-boundary cases.
- `node scripts/test_antislop.mjs` — 16 positive and 18 negative handler cases.
- `bun scripts/test_skill_catalog.mjs` — 36 canonical capabilities (33 visible,
  3 explicit-only), 14 aliases, 266 assets and 292 managed mappings.
- `bun scripts/test_omp_compat.mjs` — unknown-version, critical-drift,
  override, configuration mismatch and receipt boundaries.
- `python3 scripts/test_install.py` — POSIX install/doctor integration passed
  for all 292 inventory entries. No PowerShell runtime was available.

A disposable home was populated with the supported installer and removed after
the checks. Its doctor reported `managed summary: healthy` for the 292-entry
inventory. Native `omp config get modelRoles`
returned the expected Luna-medium default/Plan/workers, Sol-medium slow and
Sol-high advisor; `task.eager`, concurrency, recursion depth and
`advisor.enabled` returned `default`, `3`, `1` and `false`. The health skill was
discovered with `hide: true`.
The existing OMP profile reports `skills.enableSkillCommands: true`; official
[OMP 18.8.6 skills documentation](https://github.com/can1357/oh-my-pi/blob/f068751e2f1dbdbc195977776d47a26db8697495/docs/skills.md)
defines explicit invocation as `/skill:<name> [args]`. The health skill was
installed and explicitly invoked against the real profile; see results below.

The installed checker confirmed that `omp config path` matched its own agent
directory and read the effective Candidate C settings. It returned
`NOT VERIFIED` (exit 2) because the managed `SYSTEM_TEMPLATE.md` override is
active. In a separate isolated run with that override temporarily moved, it
returned `NOT VERIFIED` for the missing Candidate C runtime receipts. Both are
intentional fail-closed outcomes, not healthy verdicts.

### NOT VERIFIED and incomplete acceptance

- The first disposable profile had no default model/authentication; no provider credentials were copied into it. After the operator asked for live verification, read-only runtime probes used the existing authenticated OMP 18.8.6 profile with no model override and `--no-session`.
- PASS under the currently installed managed `SYSTEM_TEMPLATE.md`: a clear direct calculation stayed on Luna and returned `42`; a simple implementation created only a fixture file under `/tmp` via one direct Luna write call and no worker (`artifact://122`); an unresolved snapshot/revocation/legal-hold conflict invoked exactly one native `slow` task resolved as `openai-codex/gpt-6.1-sol`, then Luna resumed and returned a bounded disposition (`artifact://119`).
- PASS: interactive TUI showed GPT-6 Luna; `/plan` displayed `Plan mode enabled` and Plan mode in the status line; `/exit` returned 0. This verifies mode activation, not a Plan-mode task (`proc://omp-plan-mode-smoke`).
- These are authenticated current-profile runtime observations, not an isolated-profile comparison and not evidence that `APPEND_SYSTEM.md` alone preserves the route. The actual runtime behavior probes ran with the managed template still active. The isolated profile still has no model/authentication.
- APPEND-only isolated authentication remains unavailable: official OMP 18.8.6 docs place local credentials in the active `agent.db` and say `PI_CODING_AGENT_DIR` relocates that state. `OPENAI_CODEX_OAUTH_TOKEN`, `OPENAI_API_KEY`, and `OMP_AUTH_BROKER_URL` were unset. No live credential database was copied or shared; no separate authenticated test mechanism was established.
- PASS, limited representative settled-size case: a read-only factual synthesis of nine repository files stayed on Luna with no task/Sol child (`artifact://124`). This is one workload, not proof of general delegation restraint.
- NOT VERIFIED: complete A–F matrix; general over-delegation beyond these samples; APPEND-only behavior; isolated authenticated behavior. Candidate C static roles and local tool-boundary tests are not substitutes for those runtime cases.
- `APPEND_SYSTEM.md` remains unverified as a replacement for the template: the isolated comparison could not run. The repository retains the main `SYSTEM_TEMPLATE.md` snapshot from OMP 18.8.4. It is not proven necessary, and the generated-upstream-plus-small-patch fallback has not been implemented.
- No separate candidate OMP installer, promotion or verified rollback path was
  added. Native `omp update` can replace the active installation in place.
  No OMP binary update was attempted.
- PASS: installed the checkout into `/home/personal` using the supported
  installer, after a dry-run. A final
  `sh scripts/doctor.sh --check --home /home/personal` reported
  `managed summary: healthy`; advisory-only legacy roots and unmanaged entries
  were left untouched.
- PASS: invoked the installed skill using
  `omp --no-session --no-title --cwd /mnt/d/user/personal/project/omp-config --mode=json -p '/skill:workflow-omp-health quick'`.
  It ran under Luna, reported static Candidate C role/task settings and doctor
  PASS, and returned `NOT VERIFIED` because the compatibility checker exited 2
  with `SYSTEM_TEMPLATE.md` active. `APPEND_SYSTEM.md` exists, but the required
  native-template condition is not established. The skill's top-level
  fail-closed verdict was corrected from an initial `DEGRADED` to `NOT
  VERIFIED` before this final run.
- PASS: a targeted `omp skill list --json` query showed
  `workflow-omp-health` installed with `hide: true` (explicit-only). Quick mode
  did not require or exercise an authenticated runtime turn and did not invoke
  Sol.
- NOT VERIFIED: APPEND-only behavior, complete A–F runtime matrix, safe
  candidate OMP protection, and post-promotion verification. No OMP binary
  update or promotion was attempted; no `HEALTHY` verdict is claimed.
