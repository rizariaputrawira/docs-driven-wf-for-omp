# omp-config

Portable distribution of the OMP user-level agent guidance maintained in this repository. It deliberately does not distribute OMP settings, credentials, provider/model selections, trusted workspaces, histories, databases, caches, or generated state.

## Requirements and scope

- OMP 18.4.11 was the installed version used to confirm the user-level rules path `~/.omp/agent/AGENTS.md`; the installer does not depend on a particular OMP config.yml schema.
- POSIX install: `sh`, `cp`, `cmp`, `mktemp`, and `date`; remote mode additionally requires `curl` and `unzip`.
- Windows install: PowerShell 5.1+; remote mode uses `Invoke-WebRequest` and `Expand-Archive`.

## Installed file mapping

| Repository file | Destination |
| --- | --- |
| `config/agent/AGENTS.md` | `$HOME/.omp/agent/AGENTS.md` (`%USERPROFILE%\.omp\agent\AGENTS.md` on Windows) |

This file is intentionally an explicit replacement of that single managed destination. Existing OMP files and directories elsewhere remain untouched. A pre-existing destination is copied to a sibling timestamped `.bak.YYYYMMDDTHHMMSSZ` file before replacement. Identical content is left unchanged, so repeated installs are idempotent. Restore by copying the desired backup over the destination.

## Install and update

From a local clone on Linux/macOS:

```sh
sh install.sh --dry-run
sh install.sh
```

Update by pulling the repository changes, then rerun `sh install.sh`. Windows PowerShell:

```powershell
.\install.ps1 -DryRun
.\install.ps1
```

The scripts also accept an explicit source directory or downloadable ZIP URL. Example one-line install from the default `main` branch:

```sh
sh -c 't=$(mktemp -d) && curl -fsSL https://github.com/rizariaputrawira/omp-config/archive/refs/heads/main.zip -o "$t/repo.zip" && unzip -q "$t/repo.zip" -d "$t" && sh "$t/omp-config-main/install.sh"; r=$?; rm -rf "$t"; exit $r'
```

```powershell
$t = Join-Path $env:TEMP ([guid]::NewGuid().ToString()); New-Item -ItemType Directory $t | Out-Null; try { .\install.ps1 -Source 'https://github.com/rizariaputrawira/omp-config/archive/refs/heads/main.zip' } finally { Remove-Item $t -Recurse -Force }
```

For native remote-archive handling (including installer-side extraction), invoke the script with the archive URL as `--source`/`-Source`:

```sh
sh install.sh --source https://github.com/rizariaputrawira/omp-config/archive/refs/heads/main.zip
```

```powershell
.\install.ps1 -Source 'https://github.com/rizariaputrawira/omp-config/archive/refs/heads/main.zip'
```

Append `--dry-run` or `-DryRun` to preview the destination. Dry-run never creates directories or changes files. The remote source option expects a ZIP containing exactly one top-level directory. Download, extraction, and template checks complete before the destination is touched.

No environment variables, secrets, template substitutions, or user-specific values are required. Troubleshooting: ensure `$HOME` (POSIX) or `$env:USERPROFILE` (Windows) points to the intended account; install the listed remote utilities if using ZIP URLs; inspect the printed backup path before restoring.
