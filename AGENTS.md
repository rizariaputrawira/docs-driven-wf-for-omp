# Repository Guidelines

## Project Overview

This repository is a portable snapshot of OMP user-level configuration and the installers/doctors that deploy and verify it. It is not the OMP application: no first-party application source tree or build system is present. Treat files under `config/` as managed runtime payload, not as OMP implementation code.

## Architecture & Data Flow

`config/files.tsv` is the explicit source-to-home-relative inventory. `install.sh` and `install.ps1` validate the complete inventory and destination paths, then copy changed files into selected user homes while preserving unrelated files. `scripts/doctor.sh` and `scripts/doctor.ps1` compare those destinations; fix mode delegates to the installer and checks again. The payload is then consumed by an installed OMP runtime: settings, policy, custom agents, extensions, MCP declarations, commands, skills, and plugin metadata each retain their respective runtime roles.

The policy in `config/agent/PERSONALITY.md` distinguishes tool-heavy work from advisory/planning roles. Custom definitions live in `config/agent/agents/`; `luna-tool-boundary.js` enforces worker routing and tool boundaries. MCP credentials and local executable paths are environment-provided. Installation does not start MCP servers or other services.

## Key Directories

- `config/agent/`: OMP settings, policies, agents, extensions, user-invoked commands, MCP declarations, and OMP-root skills.
- `config/skills-agents/`, `config/skills-agent/`: separate snapshots installed to `~/.agents/skills/` and `~/.agent/skills/`; keep copies distinct.
- `config/plugins/`: package/lock metadata; `pi-9router-ext` is locked but disabled.
- `scripts/`: doctor entry points and the POSIX integration runner.

## Development Commands

Run from the repository root:

```sh
python3 scripts/test_install.py
sh install.sh --dry-run --home /path/to/existing-home
sh scripts/doctor.sh --check --home /path/to/existing-home
sh scripts/doctor.sh --fix --home /path/to/existing-home
```

PowerShell uses its own entry points and switches, for example `.\install.ps1 -DryRun` and `.\scripts\doctor.ps1 -Check -Home 'C:\Users\example'`. Use an existing disposable home when exercising install/fix. No build, lint, or formatter command is defined in the repository.

## Code Conventions & Common Patterns

- Keep the file inventory explicit: when adding or relocating a deployed regular file, update `config/files.tsv` with its repository-relative source and destination. Do not replace it with wildcard copying.
- Installer and doctor changes must validate all inputs and destinations before the first write. Preserve byte-identical files and unrelated destination content; changed files receive collision-safe backups. Do not claim transactional rollback.
- POSIX scripts use portable `sh` with `set -eu`, explicit flag parsing, and nonzero error exits. PowerShell scripts parse their public flags explicitly and use byte-wise equality compatible with Windows PowerShell 5.1.
- The Python integration runner uses the standard library, `pathlib`, disposable fixtures, subprocess calls to the real POSIX scripts, and assertions for observable file state. Keep tests deterministic and isolated.
- Treat credentials and per-machine paths as external inputs: use documented environment variables rather than committing secrets or absolute user paths. Preserve disabled/dormant integration states unless the task explicitly changes them.

## Important Files

- `config/files.tsv`: deployment contract shared by installer and doctor.
- `config/agent/config.yml`: role assignments, task overrides, approval mode, and skill discovery roots.
- `config/agent/mcp.json`: portable GitHub and OpenDesign MCP entries; requires `GITHUB_TOKEN` and `OMP_OPEN_DESIGN_CLI`.
- `config/agent/extensions/luna-tool-boundary.js`: worker routing and workspace-tool policy hook.
- `config/plugins/omp-plugins.lock.json`: disabled plugin state.
- `README.md`: supported install/doctor commands and external prerequisites.

## Runtime/Tooling Preferences

The deployment/test path uses POSIX `sh` and Python 3 standard library; remote ZIP installs additionally need `curl` and `unzip`. The Windows scripts target PowerShell 5.1+ and remote ZIP support uses `Invoke-WebRequest`/`Expand-Archive`. PowerShell execution is not covered by the Python runner, so Windows behavior requires platform verification. OMP, model credentials, Node/OpenDesign executables, and optional RTK/herdr services are external prerequisites. `config/plugins/bun.lock` records plugin metadata; it does not make dependency installation or a build step part of this repository's workflow.

## Testing & QA

`python3 scripts/test_install.py` exercises the production POSIX scripts with a complete temporary payload and home. It covers dry-run, install/check/fix, byte equality, backups, malformed or missing sources, unsafe destinations, comparison errors, and local HTTP ZIP acceptance/rejection. It reports when no PowerShell runtime is available; it does not test the `.ps1` scripts or OMP authenticated generation. Keep verification within disposable homes and do not start external services as part of installer tests.
