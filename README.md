# omp-docflow

Portable OMP configuration with a Luna runtime, bounded Sol decisions, exceptional
Sol-high advice, security workflows, on-demand capability guidance, and optional documentation-driven delivery.

> **Safety:** This configuration deliberately sets `tools.approvalMode: yolo`, an unrestricted approval mode. Review this setting and its consequences before installing.

Ordinary requested work proceeds within scope without repeated conversational confirmation; [PERSONALITY](config/agent/PERSONALITY.md#task-authority) owns that rule. Native yolo still prompts for selected force-push/reset/clean bash forms and denies matching recursive force-rm forms. Eval backends are disabled by default, avoiding routine eval prompts without opening its independent process-execution surface; deliberately re-enabled eval still prompts. This also removes eval-only browser helpers, persistent Python/JS cells and eval orchestration by default: use available native tools or existing project automation, or deliberately opt into eval for a session. These are textual approval rules, not containment. The doctor never prunes unrelated data. See [capability decisions](docs/capabilities.md#approval-friction-decision) for the tradeoff and limits.

This repository is a portable, inventory-managed snapshot of user-level configuration and guidance for an existing OMP installation. It is not OMP, an installer for OMP, a plugin marketplace installer, or a project template. It contains no OMP application or credentials and starts no external services.

## Quick start

Install OMP separately, authenticate the configured provider, and confirm your account can use the configured model IDs. This repository does not declare a minimum OMP version; installation-route prerequisites depend on your choice. See [requirements and prerequisites](#requirements-and-prerequisites).

From the repository root, preview first:

```sh
sh install.sh --dry-run
sh install.sh
```

Windows PowerShell (beta; the telemetry/profile changes still require
PowerShell runtime verification—see [requirements](#requirements-and-prerequisites)):

```powershell
.\install.ps1 -DryRun
.\install.ps1
```

The source defaults to this checkout; destination defaults to your existing home (`$HOME` or `%USERPROFILE%`). Installation validates the complete inventory before writes, copies only listed files, leaves identical files untouched, backs up changed files with collision-safe names, and does not prune old or unrelated destination data. Dry-run does not copy files or create destination directories/backups.

After installing, start `omp` in your project and request the needed outcome. The [task-to-skill catalog](SKILL-USAGE.md) links current procedures; no setup pipeline or automatic external service is required. Selected legacy names have tiny hidden compatibility entrypoints; existing homes may also retain stale full procedures: see the [non-pruning migration map](docs/migration.md).

### Install and update

To update, refresh your checkout from `main`, then repeat the preview and install
commands above. The same managed-file and backup rules apply.

To use another existing home and a local source directory or ZIP URL:

```sh
sh install.sh --home '/path/with spaces' --source https://github.com/rizariaputrawira/omp-docflow/archive/refs/heads/main.zip
```

```powershell
.\install.ps1 -Home 'C:\Users\example' -Source 'https://github.com/rizariaputrawira/omp-docflow/archive/refs/heads/main.zip'
```

Remote ZIP archives must contain exactly one top-level directory, including hidden entries. See [Configuration doctor](#configuration-doctor) to check deployed files.

## What this configures

`config/files.tsv` is the explicit source-to-home-relative-destination allowlist used by both installers and doctors. It lists the files deployed under your OMP home and is not itself installed.

| Path | Role |
|---|---|
| `config/agent/PERSONALITY.md` | Global working, escalation, delegation and evidence-acceptance policy |
| `config/agent/AGENTS.md` | Conditional semantic routing and canonical permission distinctions |
| `config/agent/SYSTEM_TEMPLATE.md` | Native system-prompt template override; preserves dynamic OMP sections while correcting execution-only delegation gates |
| `config/agent/agents/` | Seven bounded role definitions, requested built-in tools and output contracts |
| `config/agent/extensions/` | Deterministic runtime restrictions and integrations; no worker-model router |
| `config/agent/skills/` | Passive on-demand procedures selected by public `name:` |
| `config/agent/commands/` | User-invoked command guidance; installation starts no services |
| `config/agent/mcp.json` | MCP declarations that refer to machine-provided credentials and executables |
| Native OMP plugin state | Empty plugin scaffolding is no longer managed; OMP owns future plugin metadata |
| `scripts/`, `install.*` | Deployment checks, static configuration contracts and executable hook contracts |

`config/agent/` maps to `~/.omp/agent/`; existing user plugin state is preserved, not managed. Managed skills use one source folder and deploy in native flat `<folder>/SKILL.md` layout. Existing homes retain obsolete native skills until separately authorized retirement; fresh installs do not imply a completed migration.
`SYSTEM_TEMPLATE.md` is a supported native OMP override discovered at `~/.omp/agent/SYSTEM_TEMPLATE.md`; it replaces the generated system-prompt template block, while generated context/footer and tool schemas remain native. A literal `SYSTEM.md`, if present, takes precedence over the template and can mask it. The override is pinned to OMP 18.8.4 source; review its source diff and rendering behavior when upgrading OMP. Changes apply to newly initialized prompts/sessions, not an already-running session; restart OMP after installation.

## Architecture and safe use

Keep the runtime concepts distinct:

- **Skills** are passive guidance selected by public `name:` and read on demand. They do not grant a model, tool or permission.
- **Agents** are bounded role definitions with instructions, requested built-in tool selection and output contracts. Their presence does not prove runtime discovery/dispatch or universally exclude ambient tools.
- **Extensions** are event hooks/integrations. The retained model-dependent tool hook is not a reviewer sandbox, OS containment or worker-model router.
- **Commands** are user-invoked guidance; OpenDesign lifecycle recipes are POSIX shell, not PowerShell commands.
- **MCP declarations** describe connections and prerequisites. They do not install or start servers.
- **OMP** controls session discovery, tool permissions, approval and native Plan Mode.

See [canonical permission distinctions](config/agent/AGENTS.md#permission-and-model-ownership) and [global working policy](config/agent/PERSONALITY.md). Task isolation is disabled; instructions, frontmatter and hooks do not establish OS containment. Native Plan Mode, extension interception, approval, model selection and tool admission are distinct.

### Model and worker ownership

Fresh unforced main and native Plan Mode use `openai-codex/gpt-6-luna:medium` with medium default thinking. Luna owns ordinary execution, planning, decomposition, integration and verification; work size may justify bounded Luna work, never stronger reasoning by itself. Sol-medium (`openai-codex/gpt-6.1-sol:medium`) is reserved for one identified unresolved consequential decision, then returns execution to Luna. Large task ≠ Sol task; use mechanical proof before another model review. These are configured requests, not unconditional authenticated identity guarantees: explicit CLI selection, native precedence/resolution and credential fallback remain relevant.

Use scout for bounded discovery, routine/task for clear implementation, and existing review agents for source review. Slow is a bounded Sol-medium decision service, not a persistent owner or generic executor. Advisor is optional evidence-only Sol-high advice, not automatic investigation or pairing. Maximum concurrency is three, recursion depth one, and one writer owns a shared checkout unless isolation is established. `task.showResolvedModelBadge: true` displays the resolved model ID for subagent execution; it is not proof of cost, token usage, quality, isolation or authorization. Delegation may increase total tokens; no savings are implied without measurements.

### Two workflows, not a universal pipeline

**Ordinary native work:** Luna-medium main handles work directly or selectively uses bounded Luna workers, then performs proportionate verification. No Sol escalation for size alone. No docs-engineering setup, delivery baseline, manifest, extra approval or new document is needed unless the actual task boundary requires it.

**Documentation-dependent delivery:** when enabled and available, matching docs-engineering supplies material authoritative context. Project-delivery owns new applications and explicit substantial/end-to-end documentation-dependent delivery, including whole-boundary readiness, native approval and affected-owner reconciliation. Context lookup alone is not full delivery; consequential multi-slice plan review can apply independently.

For practical guidance, prompt examples, capabilities and boundaries, see the [skill usage guide](SKILL-USAGE.md). For new or substantial delivery, consult the [canonical delivery baseline procedure](config/agent/skills/workflow-delivery/references/documentation-baseline.md); [docs-engineering context](config/agent/skills/docs-engineering/references/context-routing.md) and [standards reference](config/agent/skills/docs-engineering/references/standards.md) define their respective procedures. These are alternatives selected for the actual task, not a required sequence.

### Canonical documentation after adoption

Before explicit `docs-engineering setup` adoption, inspection preserves project files
and their locations. Installing omp-docflow does not adopt or migrate any project.
After authorized adoption, `docs/README.md` is the compact human map and
`docs/docs-engineering.yaml` is the machine ownership index. `PRODUCT.md` and
`DESIGN.md` remain project-root exceptions.

The [catalog](config/agent/skills/docs-engineering/references/catalog.yaml) owns
exact artifact paths; the [location contract](config/agent/skills/docs-engineering/references/locations.md)
explains resolution, native formats and migration. Setup inspects scattered and
mixed-content documents before authorized moves, splits or merges, reconciles
links without discarding information, and returns the highest-value next path
with its reason. Only necessary documentation is selected; missing documents
are not mass-created and directories appear only when they contain files.
`status` shows the documentation home, current gaps and recommended next action;
`next` and `sequence` remain available for a prioritized queue and dependency view.

Use the managed `docs-domain-modeling`, `workflow-delivery` and
`workflow-brainstorming` names. Non-pruning upgrades may retain obsolete full
`domain-modeling`, `project-delivery` or `brainstorming` procedures and old
`engineering-docs` references with conflicting defaults. They are not the
canonical contract; inspect doctor advisories and the [migration map](docs/migration.md)
before separately authorized retirement. Installation never deletes them.

Example OMP requests:

- “Use code-debugging to trace this reported export failure; inspect the actual caller and relevant evidence, then explain the cause or remaining uncertainty.”
- “Use code-review on my current changes; include untracked files and requirements, and report correctness and specification findings without editing.”
- “Use ui-design to review this settings page for keyboard access and narrow screens; preserve its current behavior and brand.”

## Requirements and prerequisites

- Install OMP separately using its [official installation choices](https://github.com/can1357/oh-my-pi#install). Authenticate with `omp login openai-codex` or `/login openai-codex` inside OMP. A generic OpenAI API key does not automatically authenticate the separate provider. See [OMP provider documentation](https://github.com/can1357/oh-my-pi/blob/main/docs/providers.md).
- Configured model identifiers are `gpt-6.1-sol` and `gpt-6-luna`; account/provider availability is not established here. Select supported models in your own settings if needed.
- POSIX installation requires `sh`, `awk`, `dirname`, `mkdir`, `rm`, `cp`, `cmp`, `mktemp` and `date`. Remote ZIP additionally requires `curl` and `unzip`.
- Windows installer is beta and requires PowerShell 5.1+; remote ZIP uses `Invoke-WebRequest` and `Expand-Archive`. Normalized-key inventory lookup is repaired in source; PowerShell runtime verification is unavailable for the new telemetry/profile changes. Windows PowerShell 5.1 and native-Windows behavior remain unverified; historical evidence is in [verification records](docs/verification.md).
- Third-party software and credentials are not bundled. Installation starts no services. Every installed file is inventoried.

### Optional integrations and capabilities

GitHub MCP and OpenDesign declarations are present by default and may attempt to connect. Missing inputs may cause unavailability or connection/authentication errors; optional does not guarantee silent startup.

| Integration | Prerequisites and scope |
|---|---|
| GitHub MCP | Network to `https://api.githubcopilot.com/mcp/` and a valid `GITHUB_TOKEN` inherited by OMP. This is bearer token/PAT, not host-managed OAuth; grant only needed permissions. No local server or Docker required. See [official setup](https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp-in-your-ide/set-up-the-github-mcp-server) and [declaration](config/agent/mcp.json). |
| OpenDesign | Explicit external-artifact workflows only. Requires Node, built OpenDesign installation/dependencies, absolute WSL/Linux JS entrypoint in `OMP_OPEN_DESIGN_CLI` (source layout `<checkout>/apps/daemon/bin/od.mjs`), and reachable daemon at `http://127.0.0.1:7456`. Explicit POSIX lifecycle recipes also need `curl` and separate absolute executable `OMP_OPEN_DESIGN_LAUNCHER`. Installation starts neither daemon nor generation. See [setup](https://github.com/nexu-io/open-design) and [contract](config/agent/skills/ui-design/reference/open-design.md). |
| RTK | Optional shell-output optimization; requires `rtk-ai/rtk` executable on PATH (not Rust Type Kit). Recommend 0.24.0+ for `rtk rewrite`; hook minimum is 0.23.0. Missing/old executable disables hook; `RTK_DISABLED=1` bypasses it. See [installation](https://github.com/rtk-ai/rtk/blob/master/INSTALL.md). |
| herdr | Optional pane/session reporting; hook is active only in a Herdr-managed pane providing `HERDR_ENV=1`, `HERDR_SOCKET_PATH` and `HERDR_PANE_ID`. No minimum version is established. |
| Impeccable engine | Bundled `ui-design` launcher targets engine 0.1.11. First download may need permitted network, writable cache, `curl`/`wget` and `shasum`/`sha256sum`; compatible preinstalled binary avoids download. Optional critique-ignore discovery uses an already available Python 3 or an error-distinguishing native metadata/read interface; if neither is available, report discovery unavailable without installing a runtime. See [ui-design setup](config/agent/skills/ui-design/SKILL.md#setup). |
| Browser, Stitch, image tools | Live Impeccable workflows need browser capability and a running surface. Google Stitch access/tool availability and permitted image-generation tools are needed only when requested. No generator, credential or provider is configured here. |

Libraries mentioned in skill coding recipes are target-project dependencies, not baseline workstation requirements. Bundled upstream snapshots need no separate install; see [provenance and licensing](config/SKILL-SOURCES.md).

### Optional outbound observability

The managed OMP configuration explicitly disables `telemetry.otlpExportEnabled`
and `dev.autoqa`, with `dev.autoqaConsent: denied`. Keep those values explicit:
OMP 18.8.0 defaults OTLP export and AutoQA to enabled, although export also
requires an endpoint and automatic issue submission requires consent.
Local session, usage-accounting and troubleshooting logs remain enabled.

Installers deploy `.omp/telemetry.env` and `.omp/telemetry.ps1` and add an
idempotent managed source stanza to POSIX `.profile` and `.bashrc`, plus
existing `.bash_profile`, `.bash_login`, and `.zshenv`. Changed profiles are
backed up before modification; their existing bytes are preserved. A zsh
configuration directory is not created or managed. PowerShell uses the default
WindowsPowerShell and PowerShell profile layouts under the selected home; no
machine-wide environment or registry setting is written. Unsupported or
redirected shell profiles remain outside this managed boundary. Malformed
managed stanzas are rejected before payload writes rather than rewriting
unknown user code.

The environment disables Bun/OMP/RTK/Next telemetry, OMP AutoQA, OTLP exporter
endpoints/headers, and discovered OpenDesign PostHog, Langfuse, telemetry-relay,
object-relay, and Vela inputs. OMP's extension reapplies these values at load
so OMP-launched children inherit them. The `open-design` MCP declaration
explicitly passes the same applicable privacy values at its stdio process boundary.
The `start-open-design` command sources installed `.omp/telemetry.env` before
launching the daemon. Already-running daemons and arbitrary separately
launched processes are not retroactively changed. A Bun native binary started
before OMP initialization still needs a shell/PowerShell profile launch to
inherit `DO_NOT_TRACK`.
`DO_NOT_TRACK=1` disables Bun crash uploads and telemetry
([Bun reference](https://bun.com/docs/runtime/environment-variables.md));
`OTEL_SDK_DISABLED=true` disables OMP exporter initialization. OTLP endpoint,
header, and AutoQA push URL/token variables are also cleared to prevent
inherited settings from supplying optional export destinations or credentials.

Do not enable `PI_AUTO_QA` or `PI_AUTO_QA_PUSH` through launch overlays.
Intentional later environment overrides, `--no-extensions`, and remote server
policies are outside this default-off installation guarantee.

Independent integration preferences are not overwritten: RTK supports
`RTK_TELEMETRY_DISABLED=1`, and `rtk telemetry disable` also persists denied
consent. Keep OpenDesign's `telemetry.metrics`, `telemetry.content`, and
`telemetry.artifactManifest` preferences user-owned; disable outbound sink
inputs instead of modifying local application state. For the inspected OpenDesign source commit
`5b19dfa4351b3eed33826ee72746a7c653c23a54`, clearing `POSTHOG_KEY` prevents
the browser exception sink from obtaining a key despite its consent bypass.
Empty `LANGFUSE_PUBLIC_KEY`, `LANGFUSE_SECRET_KEY`,
`OPEN_DESIGN_TELEMETRY_RELAY_URL`, and `OPEN_DESIGN_OBJECT_RELAY_URL` remove
the inspected daemon's telemetry/object relay destinations; Vela is separately
disabled by `OPEN_DESIGN_VELA_TELEMETRY=0`. The local `od` daemon itself was
not started or queried, and current runtime MCP/launcher prerequisites were
absent during this audit.

The source checkout and daemon launch environment are not proof about every
packaged OpenDesign build: bundled sidecar options may override environment
keys, so packaged builds remain a residual risk pending a safe version-specific
check. Provider/authentication, model-catalog/update and explicitly requested
network traffic remain available.

Run `python3 scripts/test_install.py` for the production POSIX integration
checks. `pwsh -NoProfile -File scripts/test_telemetry_install.ps1` covers the
PowerShell telemetry install path, including UTF-16 profile preservation; it
requires a PowerShell runtime and is not native-Windows proof when run on Linux.

## Configuration doctor

Check is the default read-only mode and compares every managed inventory entry, then reports bounded immediate legacy/unmanaged observations separately. Advisory observations never make a healthy inventory fail or cause cleanup. External dependencies remain unverified: the doctor does not start or check services.

```sh
sh scripts/doctor.sh
sh scripts/doctor.sh --check --home /path/to/existing-home
sh scripts/doctor.sh --fix --home /path/to/existing-home
```

```powershell
.\scripts\doctor.ps1
.\scripts\doctor.ps1 -Check -Home 'C:\Users\example'
.\scripts\doctor.ps1 -Fix -Home 'C:\Users\example'
```

Exit codes: `0` every mapped file matches; `1` one or more files are missing/drifted; `2` invalid arguments, inventory/home/read/compare errors or repair failures. `--fix` delegates once to the platform installer, then checks every file. Each platform shares one inventory validation owner between installer and doctor: `scripts/validate-inventory.sh` for POSIX and `scripts/validate-inventory.ps1` for PowerShell.

## Existing-home migration

Installation is non-pruning. Old native folders remain discoverable in existing homes until a separately authorized retirement moves them outside **all skill discovery roots**. Inspect and preserve customized contents first; do not blanket-delete directories. Managed discovery settings leave `customDirectories` empty and disable Agents user/project skill-source discovery, but other runtime providers may exist; this is not application-wide isolation.

The [migration map](docs/migration.md) distinguishes shipped hidden compatibility pointers from stale unmanaged folders. The current catalog has 35 canonical capabilities (33 visible, 2 explicit-only), 14 hidden aliases, 263 skill assets and 285 managed mappings. [Decisions and inventory](docs/capabilities.md) account for all 36 current-main input capabilities. No live-home migration was performed. Retired provider roots can be recreated by external updaters; use the native skill destination.

## Verification and known limits

Approval-specific compatibility is checked against installed OMP **18.8.0**; the previous broader discovery/architecture verification was **18.6.3** (official source `093275112f7adff207608673c0e33c7f3d16e27f`). Neither is a minimum-version or future-compatibility guarantee. [The canonical upgrade gate](config/agent/skills/docs-engineering/references/omp-compatibility.md) and [verification records](docs/verification.md) separate static, handler, native-runtime and authenticated checks.

`bun scripts/test_document_locations.mjs` checks complete catalog path ownership,
safe paths/approved areas, stable root and native-format exceptions, and retired
fallback/duplicate-registry drift. `bun scripts/test_skill_catalog.mjs` checks
managed skill inventory and reference targets. These are structural checks;
actual setup/status behavior is a separate consuming-agent verification.

The repository includes static configuration, installer/doctor, routing-hook,
and disposable-home verification. Scope, receipts, historical evidence, and
known limitations are preserved in [verification records](docs/verification.md).
Historical results are not fresh authenticated-dispatch or Windows-installation
proof.

## Sources, licenses, and further reading

Acknowledgements: this configuration adapts or references work from [Matt Pocock's skills](https://github.com/mattpocock/skills), [Superpowers](https://github.com/obra/superpowers), [GSD](https://github.com/open-gsd/gsd-core), [NVIDIA SkillSpector](https://github.com/NVIDIA/SkillSpector), [Anthropic Security Review](https://github.com/anthropics/claude-code-security-review), [Cloudflare Security Audit](https://github.com/cloudflare/security-audit-skill), Impeccable and Ponytail. Exact sources, revisions, adaptations, attribution and notice mappings are documented in [skill payload provenance](config/SKILL-SOURCES.md) and each adapted skill's `SOURCES.md`.

Full MIT and Apache-2.0 notices remain with the applicable bundled skill payloads; Apache-2.0 records include attribution and modification notices. See each relevant `LICENSE*` file and source ledger for the actual association. Attribution is not endorsement or a blanket statement of redistribution rights. The [Superpowers README](https://github.com/obra/superpowers#readme) describes its upstream project; this repository contains selected locally adapted material, is not its plugin, and upstream install instructions do not install this configuration.

Anti Slop is a compact UI/product-copy filter, not another design workflow. Its conditional delivery check excludes conceptual questions; Impeccable and the selective design complements retain ownership. The full MIT notice is [LICENSE.antislop](config/agent/extensions/LICENSE.antislop); selective-merge and source details are in [capabilities](docs/capabilities.md#anti-slop-selective-merge) and [provenance](config/SKILL-SOURCES.md#anti-slop-compact-extension).

No project-wide `LICENSE` was present in the inspected root listing. Historical snapshot roots had no separate LICENSE/COPYING files; unchanged snapshots and some retained third-party assets have unresolved licensing caveats. Titus material was not copied or translated because no covering grant was established. Local presence, attribution, a source URL, or a notice belonging to a different adaptation does not establish redistribution rights. Resolve exact upstream terms or exclude/rewrite material before relying on permission to redistribute it. This repository-content review is not legal advice or compliance certification.

For practical skill selection see [SKILL-USAGE.md](SKILL-USAGE.md). For runtime details consult OMP's [18.6.3 agent discovery](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/docs/task-agent-discovery.md) and [Plan Mode child restrictions](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/task/structured-subagent.ts).
