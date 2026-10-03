# omp-config

Portable snapshot of OMP user-level configuration and behavior, including model-role and agent-model assignments, agent definitions, rules, extensions, commands, MCP declarations, skill sources, watchdog configuration, and the disabled plugin lock state. The maintained settings intentionally preserve `tools.approvalMode: yolo`; review this unrestricted approval choice before installing.

## Requirements and scope

- POSIX: `sh`, `awk`, `dirname`, `mkdir`, `rm`, `cp`, `cmp`, `mktemp`, and `date`. Remote ZIP installation additionally requires `curl` and `unzip`.
- Windows: PowerShell 5.1+; remote ZIP installation uses `Invoke-WebRequest` and `Expand-Archive`.
- Installation validates an existing home directory and every mapped source and destination before writing. It does not prune unrelated files or directories. Changed regular files receive collision-safe sibling backups; byte-identical files are not rewritten.
- The portable files do not include OMP itself, model credentials, node, the OpenDesign daemon, RTK, or herdr services. `config/agent/mcp.json` expects `GITHUB_TOKEN` and `OMP_OPEN_DESIGN_CLI`; configure these per machine. The latter names an installed daemon CLI, not a bundled build. The optional RTK and herdr integrations are retained without enabling their services.
- `config/SKILL-SOURCES.md` documents the three captured skill roots and licensing caveat. Skills are snapshots, not a guarantee of downstream redistribution rights.

## Managed files

`config/files.tsv` is the explicit source-to-destination inventory used by both installers and doctors. It maps the regular files under `config/agent/` to `~/.omp/agent/`, `config/plugins/` to `~/.omp/plugins/`, `config/skills-agents/` to `~/.agents/skills/`, and `config/skills-agent/` to `~/.agent/skills/`. The inventory itself is source metadata and is not installed. It includes the three skill roots as separate destinations and preserves their configured discovery order and distinct copies.

Credentials, histories, databases, caches, `node_modules`, and generated state are excluded. The installer creates only directories needed for listed files; no unrelated destination data is copied, removed, or overwritten.

## Install and update

From a local clone on Linux/macOS:

```sh
sh install.sh --dry-run --home /path/to/existing-home
sh install.sh
sh install.sh --home '/path/with spaces'
```

Windows PowerShell:

```powershell
.\install.ps1 -DryRun
.\install.ps1
.\install.ps1 -Home 'C:\Users\example'
```

The home override selects the destination root; it must already exist. POSIX defaults to `$HOME`; PowerShell defaults to `%USERPROFILE%`. The scripts also accept `--source`/`-Source` with a local source directory or ZIP URL:

```sh
sh install.sh --source https://github.com/rizariaputrawira/omp-config/archive/refs/heads/main.zip
```

```powershell
.\install.ps1 -Source 'https://github.com/rizariaputrawira/omp-config/archive/refs/heads/main.zip'
```

Remote archives must contain exactly one top-level directory, including hidden entries. Dry-run reports intended changes but does not create destination directories, backups, or services.

The OpenDesign start/stop command guidance is user-invoked and POSIX-shell-specific. Set `OMP_OPEN_DESIGN_LAUNCHER` to an executable installed launcher before running those commands; Windows installation does not provide a native PowerShell equivalent. MCP additionally uses `OMP_OPEN_DESIGN_CLI` for the installed daemon CLI and `OD_DAEMON_URL=http://127.0.0.1:7456`; installation does not start the daemon or MCP server.

## Configuration doctor

Check is read-only and compares every inventory entry:

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

The doctor exits 0 only when every mapped file matches, 1 for missing or drifted files, and 2 for invalid arguments or unusable inventory/home/read/repair errors. Fix delegates to the platform installer once, then checks every file. Use `python3 scripts/test_install.py` to run the deterministic POSIX installer/doctor integration scenarios; the runner reports explicitly when no PowerShell runtime is available.
