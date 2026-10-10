# OMP compatibility and upgrade gate

This is the sole compatibility owner. It governs evidence, not runtime authority,
installation or an upgrade service. No minimum-version range is claimed.
**Last broader skill/discovery verification: 18.6.3**, official release/source
[093275112f7adff207608673c0e33c7f3d16e27f](https://github.com/can1357/oh-my-pi/tree/093275112f7adff207608673c0e33c7f3d16e27f).
Approval-specific checks below use **18.8.0**. Installed version, source support,
passive registration, handler behavior and authenticated execution are different proofs.
Current outcomes live in the source checkout's `docs/verification.md`, which is
not deployed as part of this skill package.


## Candidate C prompt and compatibility state (checked 2026-10-10)

Installed OMP and latest stable are **18.8.7**, release tag revision
[`f261ed9faf16b61880b544f599876bface4ded0d`](https://github.com/can1357/oh-my-pi/tree/f261ed9faf16b61880b544f599876bface4ded0d).
Current upstream `main` resolves to
[`b07a1c146d0d12cfc855a2c65d52f892ef319040`](https://github.com/can1357/oh-my-pi/commit/b07a1c146d0d12cfc855a2c65d52f892ef319040).
The check compared exact upstream content for every tracked Candidate C
surface at both revisions: no hard-critical or watched file changed from the
18.8.7 baseline to `main`. The stable release is still the adoption target;
`main` is early-warning only. OMP exposes ordinary task/subagent dispatch but
the reviewed stable release, current main source, and release notes expose no
native decision-only consultation mechanism that guarantees Luna resumes as
execution owner. Keep the narrow append; do not add an extension or router.

### Native prompt discovery

The inspected [18.8.7 prompt customization documentation](https://github.com/can1357/oh-my-pi/blob/v18.8.7/docs/system-prompt-customization.md),
[CLI prompt resolution](https://github.com/can1357/oh-my-pi/blob/f261ed9faf16b61880b544f599876bface4ded0d/packages/coding-agent/src/main.ts),
[prompt builder](https://github.com/can1357/oh-my-pi/blob/f261ed9faf16b61880b544f599876bface4ded0d/packages/coding-agent/src/system-prompt.ts),
and [config discovery](https://github.com/can1357/oh-my-pi/blob/f261ed9faf16b61880b544f599876bface4ded0d/packages/coding-agent/src/config.ts)
establish:

- An explicit CLI `--system-prompt` / `--system-prompt-template` replaces
  discovered custom prompt input; `--append-system-prompt` replaces discovered
  append input for that invocation.
- Without those CLI flags, append discovery is project-first then user-level.
  Supported bases are `.omp`, `.claude`, `.codex`, and `.gemini` in that
  priority order; foreign user roots require `enabledProviders` opt-in (or
  `CLAUDE_CONFIG_DIR` for Claude). Project `APPEND_SYSTEM.md` therefore
  shadows the managed global Candidate C clarification. Append discovery uses
  the launch cwd bases, not the override file's ancestor walk.
- Discovered `SYSTEM.md` / `SYSTEM_TEMPLATE.md` selection is project-first,
  then user-level; within each scope a literal `SYSTEM.md` beats a template.
  Native `.omp` discovery also supports nearest ancestor roots and `.agent` /
  `.agents`; foreign project roots are resolved from launch cwd. A selected
  system override does not retain the stock default instruction block.

The checker models those file-discovery rules and reports `known-patched` only
when the effective discovered append is exactly the managed global file with
the recorded SHA-256 and no discovered system override exists. A project
append, unrecognized append, `SYSTEM.md`, or `SYSTEM_TEMPLATE.md` cannot pass
as known-patched. A missing append is `native-compatible` only when a matching
runtime receipt exists. The detached checker cannot observe CLI prompt flags,
CLI-only profile selection, SDK full-prompt replacement, or an already running
session; it prints this limit and the operator must use the checked file-based
launch context. Never modify a project prompt file to make health pass.

`PERSONALITY.md` remains the sole owner of escalation conditions. The append
only clarifies that native execution-delegation restrictions do not prohibit
one policy-required bounded consultation. It does not ask for general task
delegation.

### Exact upstream source comparison

`scripts/check-omp-compat.mjs` resolves release tags to immutable revisions,
then fetches the raw bytes of the tracked files at baseline and candidate and
compares SHA-256. It does not rely on GitHub's capped compare-file listing or
download the repository. Missing/unavailable tracked content is `NOT VERIFIED`.
The compatibility record classifies the bounded set into two groups:

**Hard critical**: `main.ts`, `system-prompt.ts`, prompt capability/config
discovery, model role resolver/settings, task settings/dispatch/executor/spawn
policy, Plan Mode settings/handoff, and native system/project prompt templates.
A changed file returns `REVIEW REQUIRED` until its contract is reviewed or
exercised.

**Watched**: extension type/runner, settings registry/config wrapper,
approval/bash, and skill capability/discovery. A changed file asks for focused
surface-specific checks; it does not assert that the routing architecture
changed. Unchanged hard-critical bytes allow an existing runtime receipt tied
to the exact reviewed baseline to carry forward without another model call.
The checker reports watched drift separately and does not silently clear the
focused-check requirement.

`--candidate latest` resolves the official stable release. Optional
`--inspect-main` compares the same tracked files at the moving main tip for
early warning only. Neither path installs, promotes, or updates OMP.

### Deterministic health and runtime evidence

The checker validates installed effective model roles, task bounds, advisor,
retry/fallback and prewalk settings; managed compatibility-record consistency;
prompt discovery/hash; and source comparison when the installed/candidate
version differs from the reviewed source. It is read-only and makes no model
call. The explicit `workflow-omp-health` skill retains doctor and skill-list
checks, and `full` runs the focused deterministic repository suite.

Runtime evidence remains separate: the recorded 18.8.7 receipt covers fresh
Luna-direct, Luna→one slow/Sol bounded decision→Luna, and Plan Mode. Reuse it
only when the prompt mode and hard-critical sources remain unchanged. Changed
prompt construction requires prompt-discovery and applicable Luna routing
probes; task dispatch changes require the bounded slow dispatch probe; Plan
Mode changes require its own probe. Provider/authentication evidence is not
inferred from static config or source hashes. Do not replay unchanged cases
just because omp-docflow documentation or unrelated files changed.

The currently reviewed source and runtime receipt remain recorded separately in
`omp-compatibility.yml`. The checker does not rewrite or bless either record.
No OMP update, candidate install, promotion, or rollback is supplied here.
`workflow-omp-health` is the operator entrypoint after deployment or upgrade;
this reference defines its compatibility evidence and limits.

## Approval-specific 18.8.0 check

Official main and release v18.8.0 resolved to
[`4ef97c8826ee012829a3e756b693a2a16a414f47`](https://github.com/can1357/oh-my-pi/tree/4ef97c8826ee012829a3e756b693a2a16a414f47).
The installed Linux-x64 binary SHA-256 matched the release asset. Re-resolve the
installed version and current official source before applying this result to an upgrade.

- Inspect [approval documentation](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/docs/approval-mode.md),
  [resolver](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/packages/coding-agent/src/tools/approval.ts),
  [bash matcher](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/packages/coding-agent/src/tools/bash.ts)
  and [extension wrapper](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/packages/coding-agent/src/extensibility/extensions/wrapper.ts).
  Per-tool prompt/deny still apply under yolo; recheck final rewritten arguments,
  ordered raw/segment matches and critical-before-prompt behavior.
- Inspect [eval settings](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/packages/coding-agent/src/eval/settings.ts)
  and [built-in selection](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/packages/coding-agent/src/tools/index.ts).
  Both backends disabled must remove eval; one enabled backend exposes it. Retain
  the prompt policy for deliberate opt-in. Check browser/prelude and Code-Mode
  capability implications; do not infer standalone browser/python tools from CLI help.
- Inspect [structured child policy](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/packages/coding-agent/src/task/structured-subagent.ts)
  and [executor](https://github.com/can1357/oh-my-pi/blob/4ef97c8826ee012829a3e756b693a2a16a414f47/packages/coding-agent/src/task/executor.ts):
  ordinary children are headless yolo but inherit per-tool policies; prompt-required
  calls reject without UI. Native Plan Mode retains its read-only child restrictions.
- Run the existing configuration and hook checks. Use inert command strings for
  destructive-pattern handler verification, never execute the destructive examples.
  Source-loaded handlers with fixture settings/UI are not installed TUI-dialog proof.
- For passive native registration, use isolated HOME/PI_CODING_AGENT_DIR/empty cwd,
  no copied credentials/extensions/MCP and a non-generating RPC `get_state` call.
  Explicitly select the intended configured model if auth-free default selection
  cannot resolve it; do not send a model turn merely to inspect `dumpTools`.
  Record exact config/overlays, model, version, tool list and zero message/stream state.

Current exercised results, reproduction commands, authority simulations and
unverified dialog/model-behavior limits remain in the checkout's
`docs/verification.md`; this reference is the upgrade checklist, not an approval router.

## Status vocabulary and safe execution

- **STATIC VERIFIED:** actual payload/config/source inspection or deterministic
  contract check. A recognized key or selector is not authenticated dispatch.
- **RUNTIME VERIFIED:** actual command/handler/session observed at the stated
  version and isolated input. Scope the claim to that operation.
- **NOT VERIFIED:** missing prerequisites/unrun behavior; historical results and
  same-named substitute definitions cannot fill the gap.

Use an existing disposable HOME, native PI_CODING_AGENT_DIR, empty workspace and
machine-independent environment. Do not copy credentials or use live user state.
Do not start MCP/RTK/Herdr services, generators or Impeccable engine to prove passive
compatibility. Follow current `omp --help`; do not invent replacement flags or
claim future compatibility from an unchanged historical result.

## Upgrade checklist

| Surface | Static acceptance | Bounded runtime acceptance | Limits |
|---|---|---|---|
| Deployment/license payload | Inventory paths unique/existing, every skill asset and notice mapped, protected notices preserved | Production installer/doctor dry-run/install/check/reinstall/fix in disposable home | No pruning, rollback or Windows assurance from POSIX pass |
| config.yml | YAML parses; keys registered in exact official settings schema; role/thinking/fallback/approval settings unchanged unless separately authorized | Native discovery/read loads isolated managed config without parse errors; authenticated selection separately | No minimum version from one release |
| Canonical skills | Unique names match flat folders; taxonomy exceptions deliberate; relative and full skill URI targets exist | `omp skill list --json`, selected/all canonical `omp read skill://<name>` | Local discovery is not natural-language routing |
| Hidden compatibility pointers | disable-model-invocation true; exactly one canonical destination; no duplicate body/authority | Native list records hide; URI alias read resolves; enabled `/skill:name` separately | Hidden is not access control or semantic redirection by itself |
| Prompt visibility | Native system-prompt.ts and agent-session.ts filter hide=true before catalog rendering | Observe actual model-visible list when a non-generating session interface permits | CLI discovery may include hidden entries and does not itself show prompt catalog |
| Filters | Exact source confirms includeSkills globs and --skills parse/session override | Isolated includeSkills ui-* and code-* lists; CLI --skills launch path where safely possible | Nonmatching aliases excluded, no file-load bypass |
| Agent definitions/model resolution | YAML/frontmatter/schema parse; seven exact names, selectors, tool/output contracts; effective source precedence checked | Spawn exact managed roles; observe resolved identity, thinking/fallback and definition source | Credentials required for real dispatch; role name alone insufficient |
| Resolved-model badge | Setting recognized; pinned render/feed path reviewed | Observe actual task feed badge for resolved model | Config boolean is not rendering or identity proof |
| Plan Mode | Current settings/state/task read-only boundaries inspected; plan policy unchanged | Native interactive/child permission behavior with harmless fixtures | Source/test actor is not OS isolation |
| Anti Slop | before_agent_start input/result string[] contract and duplicate handling checked | `node scripts/test_antislop.mjs`; real extension/session loading separately | Handler test is not model obedience or visual result |
| Tool model boundary | tool_call event/context contract and exact model policy checked | `node scripts/test_model_routing.mjs`; fresh harmless actor cases separately | Not a reviewer or OS sandbox; unknown identities must remain restricted |
| WATCHDOG/advisor | Config parses; advisor.enabled false; per-agent prewalk/advisor off; WATCHDOG entry separate | Explicit advice startup only when authorized | Enabled Sol WATCHDOG entry does not mean global advisor active |
| MCP | JSON/schema, environment credential/executable prerequisites checked | Connection/tool discovery only when authorized and prerequisites available | Declaration does not install/start/connect services |
| Optional RTK/Herdr | Extension source gates, imports/event contracts and external protocol reviewed | Actual extension loading and harmless enabled integration only when available/authorized | Missing executable/socket is NOT VERIFIED, never fake success |
| Empty plugin state | Native loader absent/empty manifest/lock contract inspected | No-plugin discovery in disposable home without managed scaffold | Native OMP owns future plugin state; existing user files untouched |

Run current repository checks: `bun scripts/test_skill_catalog.mjs`,
`bun scripts/test_agent_config.mjs`, `node scripts/test_model_routing.mjs`,
`node scripts/test_antislop.mjs`, `python3 scripts/test_install.py`.
For native passive discovery: `HOME=<home> PI_CODING_AGENT_DIR=<home>/.omp/agent`
from an empty workspace, `omp skill list --json` and `omp read skill://ui-design`.
Use disposable config `skills.includeSkills: [ui-*]` / `[code-*]` for filtering.
Never send a model turn merely to establish an available static/passive check.

## Official 18.6.3 interfaces relied on

All source links below use the same immutable commit, not moving main:

- [Skill contract](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/docs/skills.md):
  native one-level `<skills-root>/<name>/SKILL.md`. No general aliases field.
- [Scanner](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/discovery/helpers.ts)
  and [skills](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/extensibility/skills.ts):
  hide/disable-model-invocation normalized exposure, native URI/slash reachability,
  exact-name dispatch, conditional commands, include/ignore globs and prompt listing.
- [CLI flags](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/cli/flag-tables.ts)
  and [main](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/main.ts):
  --skills parses names/globs and overrides includeSkills for a launched session.
- [Agent discovery](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/docs/task-agent-discovery.md)
  and [structured child](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/task/structured-subagent.ts):
  native definitions, precedence and Plan Mode tool restrictions.
- [Extension types](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/extensibility/extensions/types.ts)
  and [runner](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/extensibility/extensions/runner.ts):
  before_agent_start systemPrompt:string[] and tool_call event/context signatures.
- [Plugin loader](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/extensibility/plugins/loader.ts):
  absent no-plugin roots and empty native runtime state are supported.

Custom/high-coupling points are exact live model identity/context in the tool
boundary, RTK's legacy Pi import/binary protocol, Herdr IPC/env payload and optional
engine/external MCP dependencies. Retain justified hooks; recheck them after every
actual upgrade rather than promising that static guidance can replace enforcement.

## Disabled/unavailable behavior and security role acceptance

Deliberate --no-skills or filtering wins. Missing suite assets do not stop ordinary
native work or trigger setup/automatic file-load reactivation. If convenience URI
support alone is unavailable and an enabled suite is explicitly requested, a known
canonical file may be loaded only under that explicit authorization, with native
discovery unverified. Renewed explicit file authorization is a separate request.

Before accepting security results establish effective execution-time definition
provenance: intended managed source/schema, loaded path/content basis, permitted
read-only operations and no child-spawn authority. Inspect higher-precedence
project overrides and malformed/recovered/bundled substitutes. A matching name,
model or result shape is not proof. Validate lifecycle/terminal semantics with
[security](security.md); missing source/tool provenance leaves suite confirmation
incomplete, not clean. No widened tools, fabricated dispatch or repaired output
creates assurance.

## Recovery

Historical verified definitions are recovery material, not current-version proof.
Restore only intended managed changes from inspected backups and preserve unrelated
files. Repeat static/passive/behavioral layers with exact version, source and
observed operations. Never auto-install/downgrade OMP, refresh upstream pins, copy
credentials, start services or change model/approval architecture from this gate.
