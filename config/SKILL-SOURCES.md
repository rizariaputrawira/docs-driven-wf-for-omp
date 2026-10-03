# Skill snapshot provenance

This repository snapshots the current regular-file contents of three local skill roots without merging distinct copies:

- `config/agent/skills/` came from the OMP user skill root (`~/.omp/agent/skills/`).
- `config/skills-agents/` came from the Agents home skill root (`~/.agents/skills/`).
- `config/skills-agent/` came from the Agent home skill root (`~/.agent/skills/`).

The snapshot contains 64 skill directories and 253 files. No symlinked skill entries or symlinked files were present in those roots. Skill copies in different roots are intentionally retained because they may be distinct; OMP discovery and precedence remain root-order dependent.

No `LICENSE*` or `COPYING*` files were present in these source roots. Inline attribution, license links, and authored resource files were retained where present. The source trees are local installed snapshots; this note does not assert that every skill has a redistributable license. Review upstream licensing before redistributing beyond this repository.

The snapshot omits plugin installation trees, databases, logs, caches, credentials, backups, and generated state. `config/files.tsv` explicitly lists every file installed from the portable payload. External tools, OMP itself, model credentials, GitHub token, OpenDesign CLI/launcher, RTK, and herdr remain machine-local prerequisites; optional or disabled integrations are not activated by installation.
