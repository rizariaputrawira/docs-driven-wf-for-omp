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
2. Run `bun <agent-dir>/scripts/check-omp-compat.mjs`; preserve its exact status. The read-only checker requires its installed path to match `omp config path`, validates managed and effective Candidate C settings, the OMP version and critical-source comparison, and checks prompt override state.
3. Identify the checkout with `git -C "$PWD" rev-parse --show-toplevel`; treat it as omp-docflow only if that root contains `config/files.tsv`, `install.sh`, and `scripts/doctor.sh` (the directory basename is not identity). Run `sh scripts/doctor.sh --check --home "$HOME"` from that root (use the selected home on Windows). If no such checkout is available, report the doctor check as NOT VERIFIED; do not substitute a guessed inventory.
4. Check effective role values with `omp config get modelRoles` (one JSON record). Confirm `default`, `plan`, `smol`, `routine`, `task`, `slow` and `advisor` match Candidate C. Then check `omp config get task.eager`, `task.maxConcurrency`, `task.maxRecursionDepth`, and `advisor.enabled`; require `default`, `3`, `1`, and `false`. Confirm `APPEND_SYSTEM.md` exists in the effective agent directory and no discovered `SYSTEM.md`/`SYSTEM_TEMPLATE.md` is shadowing the native template.
5. Use `omp skill list --json` to confirm this explicit-only skill and selected managed skills are discoverable. No authenticated model turn is required in quick mode.

### upgrade

1. Run the checker against the installed binary. For a candidate release, use `bun <agent-dir>/scripts/check-omp-compat.mjs --candidate <version>`; it compares official OMP source from the recorded baseline and names changed critical surfaces. Network/API failure is NOT VERIFIED, not a clean comparison.
2. Do not run native `omp update` as a canary: it updates the active installation in place. This repository currently provides no separate candidate installer or verified promotion/rollback command. If the candidate cannot be prepared independently by the operator's existing package manager, stop before mutation and report NOT VERIFIED.
3. If an independently installed candidate is available, run the health procedure against that candidate's own OMP binary, isolated agent directory, and disposable workspace. Do not copy credentials or alter the known-good environment merely to test it.
4. Exercise harmless Candidate C runtime cases only when the required provider/account access is already available and the operator has requested the upgrade check: clear Luna-only work must not spawn `slow`; one clearly consequential unresolved fixture must produce exactly one native `slow` consultation with the configured Sol-medium child and then return implementation/integration/acceptance to Luna; a simple direct task must remain Luna-only; substantial settled work must not invoke Sol from size alone; Plan Mode must remain Luna and preserve native read-only boundaries. Observe actual parent/child model identities and dispatch events, not prompt wording alone. Report provider/authenticated behavior separately.
5. Run `full` checks for changed critical source surfaces or unresolved upgrade evidence. Never promote based only on an unchanged version string or source diff. A candidate check is not post-promotion health.

### full

Run quick checks plus relevant repository tests (`bun scripts/test_agent_config.mjs`, `node scripts/test_model_routing.mjs`, `node scripts/test_antislop.mjs`, `bun scripts/test_skill_catalog.mjs`, `bun scripts/test_omp_compat.mjs`) and repeat applicable native passive/runtime checks. Re-run only coverage relevant to the unresolved or changed surface. Capture compact output paths/receipts, not large transcripts.

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
