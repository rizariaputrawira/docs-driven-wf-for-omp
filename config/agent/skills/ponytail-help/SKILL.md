---
name: ponytail-help
description: "Quick reference for ponytail's modes, skills, and commands. One-shot display."
homepage: https://github.com/DietrichGebert/ponytail
license: MIT
---

# Ponytail Help

Display this reference card when invoked. One-shot, do NOT change mode,
write flag files, or persist anything.

## Levels

| Level | Trigger | What change |
|-------|---------|-------------|
| **Lite** | `/skill:ponytail lite` | Build what's asked, name the lazier alternative in one line. |
| **Full** | `/skill:ponytail` | The ladder enforced: YAGNI → stdlib → native → one line → minimum. Default. |
| **Ultra** | `/skill:ponytail ultra` | YAGNI extremist. Deletion before addition. Challenges requirements before building. |

## Skills

| Skill | Trigger | What it does |
|-------|---------|--------------|
| **ponytail** | `/skill:ponytail` | Lazy mode itself. Simplest solution that works. |
| **ponytail-review** | `/skill:ponytail-review` | Over-engineering review. |
| **ponytail-audit** | `/skill:ponytail-audit` | Whole-repo over-engineering audit. |
| **ponytail-debt** | `/skill:ponytail-debt` | Harvest `ponytail:` shortcut comments into a tracked ledger. |
| **ponytail-gain** | `/skill:ponytail-gain` | Measured-impact scoreboard. |
| **ponytail-help** | `/skill:ponytail-help` | This card. |

## Deactivate

Say "stop ponytail" or "normal mode". Resume with `/skill:ponytail`.
