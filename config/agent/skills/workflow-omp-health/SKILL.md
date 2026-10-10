---
name: workflow-omp-health
description: Explicitly verify the installed OMP and omp-docflow Candidate C configuration after an OMP, omp-docflow, model or routing update.
disable-model-invocation: true
---

# OMP installation health

Run only when the operator explicitly invokes this skill. In interactive OMP, use `/skill:workflow-omp-health [quick|upgrade|full]`. This is an installed-state health procedure, not an upstream adoption review, installer, or rollback tool. Keep Luna as the normal owner; do not invoke Sol unless the observed evidence independently meets the shared `PERSONALITY.md` decision-consultation policy.

## Modes

Use `quick` after installing/updating omp-docflow without changing the OMP binary. Use `upgrade` after an OMP version change. Use `full` only when explicitly requested or a prior mode leaves a material unresolved result. If no mode is specified, use `quick`.

Locate the effective agent directory with `omp config path`; do not assume a profile or home path. The installed checker is `scripts/check-omp-compat.mjs` beneath that directory.

### quick

1. Record `omp --version` and `omp config path`.
2. Run `bun <agent-dir>/scripts/check-omp-compat.mjs`; preserve its exact status.
   The checker reports effective roles, worker overrides, task limits,
   advisor/fallback/prewalk state, prompt discovery and append hash, receipt
   validity, and exact tracked-source comparison whenever the installed version
   differs from the reviewed baseline. Current-version checks need no network
   request. The detached checker cannot see invocation-only prompt/profile flags
   or SDK prompt replacement; report that limit and do not claim those were
   checked.
3. Identify the checkout with `git -C "$PWD" rev-parse --show-toplevel`; treat
   it as omp-docflow only if that root contains `config/files.tsv`, `install.sh`,
   and `scripts/doctor.sh`. Run `sh scripts/doctor.sh --check --home "$HOME"`
   from that root (selected home on Windows). If no such checkout is available,
   report doctor as NOT VERIFIED; never substitute a guessed inventory.
4. Use `omp skill list --json` to confirm this explicit-only skill and selected
   managed skills are discoverable. No authenticated model turn is required.

### upgrade

1. Run the checker against the installed binary. Use
   `bun <agent-dir>/scripts/check-omp-compat.mjs --candidate latest` for the
   current official stable release or `--candidate VERSION` for an exact tag.
   It resolves the release revision, compares only tracked raw source files,
   and distinguishes hard-critical from watched changes. `--inspect-main` is
   optional early-warning only; unreleased main is never the adoption target.
   Network/API or missing-file failure is NOT VERIFIED, not a clean result.
2. Do not run native `omp update` as a canary: it updates the active
   installation in place. This repository provides no separate candidate
   installer or verified promotion/rollback command. If the candidate cannot
   be prepared independently, stop before mutation and report NOT VERIFIED.
3. If an independently installed candidate is available, use its own OMP
   binary, isolated agent directory, and disposable workspace. Do not copy
   credentials or alter the known-good environment merely to test it.
4. Exercise runtime cases only when their dependent source/prompt contract
   changed, prior valid evidence is inapplicable, behavior is suspected, and
   required provider access is already available: clear Luna-only work;
   consequential unresolved Luna→one slow/Sol consultation→Luna; settled
   large work remaining Luna-owned; and Plan Mode Luna/read-only behavior.
   Observe actual parent/child model identities and dispatch events, not prompt
   wording alone. Report provider/authenticated behavior separately.
5. Use `full` for explicit requests, relevant changed-contract tests, or
   unresolved upgrade evidence. Never promote based only on an unchanged
   version string, config parse, or source diff. A candidate check is not
   post-promotion health.

### full

Run quick checks plus relevant repository tests
(`bun scripts/test_agent_config.mjs`, `node scripts/test_model_routing.mjs`,
`node scripts/test_antislop.mjs`, `bun scripts/test_skill_catalog.mjs`,
`bun scripts/test_document_locations.mjs`, `bun scripts/test_omp_compat.mjs`).
For changed installer/doctor behavior, also run disposable-home POSIX or
PowerShell tests on an available relevant host; do not substitute static parsing
for platform execution or exercise a real user home.
`test_skill_catalog.mjs` is the full source-tree coverage check: it compares
deployable runtime assets against `config/files.tsv`, checks the registered
skill/alias discovery set, source/license/coupling records, retained notices and
reference paths/headings. This is structural coverage, not license compliance.
The doctors check the selected
home against the declared inventory and observe unmanaged state; they do not
prove that the checkout inventory includes every source file or establish
third-party rights. Run only coverage relevant to an unresolved or changed
surface; reuse unchanged, valid behavioral receipts rather than replaying model
cases after unrelated documentation/config-payload changes.

## Verdicts

Return one top-level state:

- **HEALTHY** — all required checks for the selected mode passed, including any required Candidate C runtime behavior; no critical evidence is missing.
- **DEGRADED** — core configuration is usable but an explicitly noncritical capability is unavailable or unverified.
- **INCOMPATIBLE** — evidence demonstrates a required Candidate C/configuration contract fails.
- **NOT VERIFIED** — required evidence could not be established, including unavailable provider access, missing checkout/doctor, source comparison failure, or no isolated candidate environment.

Verdict precedence is fail-closed:

1. **INCOMPATIBLE** if a required contract is demonstrably broken.
2. **NOT VERIFIED** if any required check returns `NOT VERIFIED` or `REVIEW REQUIRED`, or required evidence is missing.
3. **DEGRADED** only when every critical check for the selected mode is verified and passing, and only an explicitly noncritical capability is unavailable or unverified.
4. **HEALTHY** only when every required check for the selected mode passes.

Map the compatibility checker's `INCOMPATIBLE` result to overall `INCOMPATIBLE`; map `NOT VERIFIED` and `REVIEW REQUIRED` to overall `NOT VERIFIED`. A passing doctor or launchable OMP binary does not override a required checker result.

Report version, compatibility result, main/plan/slow/advisor and fallback configuration, Luna direct and Luna→slow→Luna results when exercised, doctor outcome, critical source drift, unverified checks, and one next action. Do not report HEALTHY merely because OMP starts or configuration values parse. Do not change compatibility records, config, models, or installations as a side effect of checking.
