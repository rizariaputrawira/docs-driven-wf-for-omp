# omp-docflow

Document-aware OMP configuration with Sol-led orchestration, bounded workers,
security workflows, and optional documentation-driven delivery.

> **Safety:** This configuration deliberately sets `tools.approvalMode: yolo`, an unrestricted approval mode. Review this setting and its consequences before installing.

The native yolo config keeps ordinary commands yolo, prompts for selected force-push/reset/clean bash forms, and denies matching recursive force-rm forms. It prompts every `eval` call because eval can reach an independent shell surface. These policies are textual approval rules, not containment. The doctor reports managed-file health separately from advisory legacy/unmanaged observations and never prunes them. See [capability decisions](docs/capabilities.md) for rationale and read-only Git triage/PR/status workflows.

This repository is a portable, inventory-managed snapshot of user-level configuration and guidance for an existing OMP installation. It is not OMP, an installer for OMP, a plugin marketplace installer, or a project template. It contains no OMP application or credentials and starts no external services.

## Quick start

Install OMP separately, authenticate the configured provider, and confirm your account can use the configured model IDs. This repository does not declare a minimum OMP version; installation-route prerequisites depend on your choice. See [requirements and prerequisites](#requirements-and-prerequisites).

From the repository root, preview first:

```sh
sh install.sh --dry-run
sh install.sh
```

Windows PowerShell (beta; a known inventory-validation failure currently blocks
full installation—see [requirements](#requirements-and-prerequisites)):

```powershell
.\install.ps1 -DryRun
.\install.ps1
```

The source defaults to this checkout; destination defaults to your existing home (`$HOME` or `%USERPROFILE%`). Installation validates the complete inventory before writes, copies only listed files, leaves identical files untouched, backs up changed files with collision-safe names, and does not prune old or unrelated destination data. Dry-run does not copy files or create destination directories/backups.

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
| `config/agent/config.yml` | Native model/agent policy, approval mode, discovery, concurrency/depth and isolation settings |
| `config/agent/agents/` | Seven bounded role definitions, requested built-in tools and output contracts |
| `config/agent/extensions/` | Deterministic runtime restrictions and integrations; no worker-model router |
| `config/agent/skills/` | Passive on-demand procedures selected by public `name:` |
| `config/agent/commands/` | User-invoked command guidance; installation starts no services |
| `config/agent/mcp.json` | MCP declarations that refer to machine-provided credentials and executables |
| `config/plugins/` | Plugin package/lock metadata; no bundled plugins |
| `scripts/`, `install.*` | Deployment checks, static configuration contracts and executable hook contracts |

`config/agent/` maps to `~/.omp/agent/`; `config/plugins/` maps to `~/.omp/plugins/`. Managed skills use one source folder and deploy in native flat `<folder>/SKILL.md` layout. Existing homes retain obsolete native skills until separately authorized retirement; fresh installs do not imply a completed migration.

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

The configured fresh main and native plan roles use `openai-codex/gpt-6.1-sol:medium` with medium default thinking. Sol owns orchestration, consequential decisions, integration and final acceptance. Substantial bounded execution normally uses Luna-medium (`openai-codex/gpt-6-luna:medium`). These are configured requests, not unconditional authenticated identity guarantees: explicit CLI selection, native precedence/resolution and credential fallback remain relevant.

Use scout for bounded discovery, routine/task for clear implementation, and the existing review agents for source review. Select slow only for evidence-backed difficult reasoning or consequential uncertainty: it uses Sol-medium. Advisor is optional evidence-only Sol-high advice, not automatic investigation or pairing. Maximum concurrency is three, recursion depth one, and one writer owns a shared checkout unless isolation is established. `task.showResolvedModelBadge: true` displays the resolved model ID for subagent execution; it is not proof of cost, token usage, quality, isolation or authorization. Delegation may increase total tokens; no savings are implied without measurements.

### Two workflows, not a universal pipeline

**Ordinary native work:** Sol main handles trivial work directly or uses bounded workers, then performs proportionate verification. No engineering-docs setup, delivery baseline, manifest, extra approval or new document is needed unless the actual task boundary requires it.

**Documentation-dependent delivery:** when enabled and available, matching engineering-docs supplies material authoritative context. Project-delivery owns new applications and explicit substantial/end-to-end documentation-dependent delivery, including whole-boundary readiness, native approval and affected-owner reconciliation. Context lookup alone is not full delivery; consequential multi-slice plan review can apply independently.

For practical guidance, prompt examples, capabilities and boundaries, see the [skill usage guide](SKILL-USAGE.md). For new or substantial delivery, consult the [canonical delivery baseline procedure](config/agent/skills/project-delivery/references/documentation-baseline.md); [engineering-docs context](config/agent/skills/engineering-docs/references/context-routing.md) and [standards reference](config/agent/skills/engineering-docs/references/standards.md) define their respective procedures. These are alternatives selected for the actual task, not a required sequence.

Example OMP requests:

- “Use diagnosing-bugs to trace this reported export failure; inspect the actual caller and relevant evidence, then explain the cause or remaining uncertainty.”
- “Use code-review on my current changes; include untracked files and requirements, and report correctness and specification findings without editing.”
- “Use impeccable to review this settings page for keyboard access and narrow screens; preserve its current behavior and brand.”

## Requirements and prerequisites

- Install OMP separately using its [official installation choices](https://github.com/can1357/oh-my-pi#install). Authenticate with `omp login openai-codex` or `/login openai-codex` inside OMP. A generic OpenAI API key does not automatically authenticate the separate provider. See [OMP provider documentation](https://github.com/can1357/oh-my-pi/blob/main/docs/providers.md).
- Configured model identifiers are `gpt-6.1-sol` and `gpt-6-luna`; account/provider availability is not established here. Select supported models in your own settings if needed.
- POSIX installation requires `sh`, `awk`, `dirname`, `mkdir`, `rm`, `cp`, `cmp`, `mktemp` and `date`. Remote ZIP additionally requires `curl` and `unzip`.
- Windows installer is beta and requires PowerShell 5.1+; remote ZIP uses `Invoke-WebRequest` and `Expand-Archive`. A disposable Windows PowerShell 5.1 run rejected a valid inventory, so successful full installation is not established; details and preserved evidence are in [verification records](docs/verification.md).
- Third-party software and credentials are not bundled. Installation starts no services. Every installed file is inventoried.

### Optional integrations and capabilities

GitHub MCP and OpenDesign declarations are present by default and may attempt to connect. Missing inputs may cause unavailability or connection/authentication errors; optional does not guarantee silent startup.

| Integration | Prerequisites and scope |
|---|---|
| GitHub MCP | Network to `https://api.githubcopilot.com/mcp/` and a valid `GITHUB_TOKEN` inherited by OMP. This is bearer token/PAT, not host-managed OAuth; grant only needed permissions. No local server or Docker required. See [official setup](https://docs.github.com/en/copilot/how-tos/provide-context/use-mcp-in-your-ide/set-up-the-github-mcp-server) and [declaration](config/agent/mcp.json). |
| OpenDesign | Explicit external-artifact workflows only. Requires Node, built OpenDesign installation/dependencies, absolute WSL/Linux JS entrypoint in `OMP_OPEN_DESIGN_CLI` (source layout `<checkout>/apps/daemon/bin/od.mjs`), and reachable daemon at `http://127.0.0.1:7456`. Explicit POSIX lifecycle recipes also need `curl` and separate absolute executable `OMP_OPEN_DESIGN_LAUNCHER`. Installation starts neither daemon nor generation. See [setup](https://github.com/nexu-io/open-design) and [contract](config/agent/skills/impeccable/reference/open-design.md). |
| RTK | Optional shell-output optimization; requires `rtk-ai/rtk` executable on PATH (not Rust Type Kit). Recommend 0.24.0+ for `rtk rewrite`; hook minimum is 0.23.0. Missing/old executable disables hook; `RTK_DISABLED=1` bypasses it. See [installation](https://github.com/rtk-ai/rtk/blob/master/INSTALL.md). |
| herdr | Optional pane/session reporting; hook is active only in a Herdr-managed pane providing `HERDR_ENV=1`, `HERDR_SOCKET_PATH` and `HERDR_PANE_ID`. No minimum version is established. |
| Impeccable engine | Bundled launcher targets engine 0.1.11. First download may need permitted network, writable cache, `curl`/`wget` and `shasum`/`sha256sum`; compatible preinstalled binary avoids download. See [skill usage setup](SKILL-USAGE.md#impeccable-setup-and-engine-prerequisites). |
| Browser, Stitch, image tools | Live Impeccable workflows need browser capability and a running surface. Google Stitch access/tool availability and permitted image-generation tools are needed only when requested. No generator, credential or provider is configured here. |

Libraries mentioned in skill coding recipes are target-project dependencies, not baseline workstation requirements. Bundled upstream snapshots need no separate install; see [provenance and licensing](config/SKILL-SOURCES.md).

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

Exit codes: `0` every mapped file matches; `1` one or more files are missing/drifted; `2` invalid arguments, inventory/home/read/compare errors or repair failures. `--fix` delegates once to the platform installer, then checks every file. POSIX installer and doctor share `scripts/validate-inventory.sh` as the inventory validation owner.

## Existing-home migration

Installation is non-pruning. Old native folders remain discoverable in existing homes until a separately authorized retirement moves them outside **all skill discovery roots**. Inspect and preserve customized contents first; do not blanket-delete directories. Managed discovery settings leave `customDirectories` empty and disable Agents user/project skill-source discovery, but other runtime providers may exist; this is not application-wide isolation.

The [migration map and history](docs/migration.md) records all 17 retired identifiers, surviving owners, root consolidation and historical verification. No live-home migration was performed. Updaters targeting `.agent/skills/` or `.agents/skills/` can recreate retired roots; choose the native destination and update complete packages plus `config/files.tsv`, not piecemeal files.

## Verification and known limits

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

For practical skill selection see [SKILL-USAGE.md](SKILL-USAGE.md). For runtime details consult OMP's [v18.6.1 agent discovery](https://github.com/can1357/oh-my-pi/blob/v18.6.1/docs/task-agent-discovery.md) and [Plan Mode child restrictions](https://github.com/can1357/oh-my-pi/blob/v18.6.1/packages/coding-agent/src/task/structured-subagent.ts).
