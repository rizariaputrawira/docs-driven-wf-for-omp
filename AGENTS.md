# Repository Guidelines

## Project Overview

This repository is a portable snapshot of OMP user-level configuration and the installers/doctors that deploy and verify it. It is not the OMP application: no first-party application source tree or build system is present. Treat files under `config/` as managed runtime payload, not as OMP implementation code.

## Architecture & Data Flow

`config/files.tsv` is the explicit source-to-home-relative inventory. `install.sh` and `install.ps1` validate the complete inventory and destination paths, then copy changed files into selected user homes while preserving unrelated files. `scripts/doctor.sh` and `scripts/doctor.ps1` compare those destinations; fix mode delegates to the installer and checks again. The payload is consumed by an installed OMP runtime; this repository does not install OMP or start MCP servers or other services.

`config/agent/PERSONALITY.md` owns the working and escalation policy. Custom agents, extensions, commands, MCP declarations, and skills are under `config/agent/`; `luna-tool-boundary.js` enforces scoped extension tool-boundary behavior and does not route worker models. MCP credentials and local executable paths are environment-provided.

## Key Directories

- `config/agent/`: OMP runtime settings, policies, agents, extensions, commands, MCP declarations, and skills.
- `scripts/`: inventory validation, POSIX and PowerShell installer/doctor support, and integration tests.
- `docs/`: maintained capability, verification, migration, and operational records.

This repository-root `AGENTS.md` governs work in this checkout. `config/agent/AGENTS.md` is a separate managed OMP runtime policy deployed under `~/.omp/agent/`.
`README.md` is the authoritative user-facing overview of managed paths, runtime prerequisites, supported commands, and intentionally unmanaged plugin state.

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

- `config/files.tsv`: deployment contract shared by installers and doctors.
- `config/agent/config.yml`: runtime role assignments, task overrides, approval mode, and skill discovery configuration.
- `config/agent/mcp.json`: portable MCP declarations and their external prerequisites.
- `config/agent/extensions/luna-tool-boundary.js`: model/provider-dependent extension tool boundary; it is not a worker-model router.
- `README.md`: supported deployment commands, managed paths, prerequisites, and unmanaged runtime state.

## Runtime/Tooling Preferences

The POSIX deployment path uses `sh` and Python 3 standard library; remote ZIP installs additionally need `curl` and `unzip`. The Windows scripts target PowerShell 5.1+ and remote ZIP support uses `Invoke-WebRequest`/`Expand-Archive`. PowerShell execution is not covered by the POSIX Python integration runner; see `README.md` and `docs/verification.md` for platform-specific coverage and limits. OMP, model credentials, Node/OpenDesign executables, and optional RTK/herdr services are external prerequisites. The repository has no build, lint, or formatter step; do not install dependencies or activate disabled integrations for routine installer tests.

## Testing & QA

Run `python3 scripts/test_install.py` for POSIX installer/doctor integration. Focused checks use the repository's Bun and Node scripts under `scripts/` (including skill catalog, agent config, model routing, OMP compatibility, and documentation-location checks); see `README.md` and `docs/verification.md` for the maintained test set. Run `scripts/test_install.ps1` and `scripts/test_telemetry_install.ps1` separately with `pwsh` or Windows PowerShell 5.1+ (`powershell.exe`). PowerShell on Linux is not native-Windows verification; native Windows-host execution has its own scoped receipts. Use disposable homes for installer/fix tests and never test against a real user home. Avoid external service startup in installer checks.
