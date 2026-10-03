---
name: ponytail-gain
description: "Show ponytail measured impact as a scoreboard: less code, less cost, more speed, from the benchmark medians. One-shot display."
homepage: https://github.com/DietrichGebert/ponytail
license: MIT
---

# Ponytail Gain

Display this scoreboard when invoked. One-shot: do NOT change mode, write flag
files, or persist anything.

```
  ponytail gain                     benchmark median · 5 tasks · 3 models

  Lines of code   no-skill  ████████████████████  100%
                  ponytail  ██▌·················    6–20%   ▼ 80–94%
  Cost            no-skill  ████████████████████  100%
                  ponytail  █████▌··············   23–53%  ▼ 47–77%
  Speed           ponytail  ▸ 3–6× faster

  This repo:  /skill:ponytail-debt  (shortcuts you deferred)
              /skill:ponytail-audit (what's still cuttable)
```

## Honesty boundary

These are benchmark medians, not this repo. Never print a per-repo savings
number. The only real per-repo figures come from `ponytail-debt`.

## Boundaries

One-shot display. Edits nothing, changes no mode.
"stop ponytail" or "normal mode": revert.
