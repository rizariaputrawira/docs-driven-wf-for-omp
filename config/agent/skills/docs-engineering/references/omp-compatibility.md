# OMP compatibility and upgrade gate

This is the sole compatibility owner. It governs evidence, not runtime authority,
installation or an upgrade service. No minimum-version range is claimed.
**Last verified OMP: 18.6.3**, official release/source
[093275112f7adff207608673c0e33c7f3d16e27f](https://github.com/can1357/oh-my-pi/tree/093275112f7adff207608673c0e33c7f3d16e27f).
Installed version, source support and authenticated behavior are different proofs.
Current outcomes live in the source checkout's `docs/verification.md`, which is
not deployed as part of this skill package.

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
