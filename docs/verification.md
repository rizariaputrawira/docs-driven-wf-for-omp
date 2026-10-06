# Verification scope and evidence

This file owns current check commands, actual outcomes and meaningful unresolved limits. Routine dated session journals and duplicate receipts are intentionally omitted; their exact historical records remain in repository history. Historical results do not accept the current catalog change.

## Current catalog cutover

Verified on 2026-10-06 against source main `ae057bd421a0a66354a0334d3e270b53f0a4f296` plus this uncommitted cutover. Local runtime: Linux/WSL, Bun 1.4.2, Node 24.20.0, OMP 18.6.3. No live-home deployment, authenticated generation, engine download, image generation or external service was performed.

| Check | Actual result |
|---|---|
| `bun scripts/test_skill_catalog.mjs` | Passed: 36 unique valid public identities, 222 exactly mapped skill assets, 244 mappings, 25 unchanged notice files, complete 41-original inventory/decision coverage, active full skill URI and lazy-reference targets. |
| `python3 scripts/test_install.py` | Passed production POSIX installer/doctor integration for 244 inventory entries, including dry-run, equality/backups, invalid inventory/destination handling and local HTTP ZIP cases. No PowerShell runtime available. |
| `bun scripts/test_agent_config.mjs` | Passed model/worker contract and 16 negative cases. This is static configuration, not authenticated dispatch identity. |
| `node scripts/test_model_routing.mjs` | Seven named tool-boundary handler cases passed; not OS containment. |
| `node scripts/test_antislop.mjs` | 16 positive and 18 negative handler cases passed; not authenticated model behavior. |
| Disposable-home production install/check/reinstall/fix | Passed. Byte-identical reinstall preserved the current entrypoint timestamp. Doctor warned about a retired Impeccable folder without failing healthy managed state; customized old content survived install and fix. |
| Passive native `omp read skill://<current-name>` | All 36 current public entrypoints and four merged UI/motion procedure references resolved from the disposable home. This exercises native URI discovery/read, not semantic routing or generation. |
| Pre-move preservation comparison | All 25 notice files retained unchanged and mapped. All 64 original Impeccable paths retained under ui-design; 63 files byte-identical, with only the adapted SKILL.md metadata/local routing changed. All 13 captured model config, agent definition and extension files byte-identical. |

Reproduce from repository root with the five checker commands above. For production deployment smoke, create an existing disposable home, then run `sh install.sh --dry-run --home <home>`, `sh install.sh --home <home>`, `sh scripts/doctor.sh --check --home <home>`, and a second install/check. Validation is invoked by installer/doctor with the source and home arguments; standalone use is `sh scripts/validate-inventory.sh <repository-root> <existing-home>`.

For native reads, set `HOME=<disposable-home>` and `PI_CODING_AGENT_DIR=<disposable-home>/.omp/agent`, start from an empty disposable working directory and run `omp read skill://ui-design`, `omp read skill://web-motion`, and the other current identities. Read the merged procedure references separately. Do not copy credentials or start the Impeccable engine to reproduce passive resolution.

Detailed local smoke and byte-comparison evidence was captured outside deployment. Routine command output is not a permanent verification journal; the outcomes and reproducible commands above are the maintained acceptance record.

## Evidence boundaries and known limitations

- OMP v18.6.3 official skill metadata distinguishes prompt listing exposure from reachability: `disable-model-invocation` is normalized to hidden exposure, but user command and `skill://` access remain. It does not enforce authority, access control, tool isolation or explicit-only behavior. The merged web-motion review mode therefore relies on its explicit-request procedure boundary, not a retained metadata gate.
- Passive discovery/URI resolution proves only that the tested runtime can read a skill. It is not authenticated generation, model routing, dispatch provenance, approval enforcement, visual quality, or OS containment. No authenticated model credential, generation service, or external image tool was exercised here.
- Windows PowerShell 5.1 historically rejected a valid inventory with `Inventory must include AGENTS.md and config.yml.` The required-entry lookup used forward-slash keys after destination paths were converted to backslashes. This remains an unresolved installer limitation; no successful Windows installation is claimed. Preserve this issue until a supported-platform fix is separately verified.
- Impeccable is a versioned 4.5.0 package with engine 0.1.11, Apache-2.0 full license and immutable source pin. The pre-move comparison retained every original path: only its adapted SKILL.md metadata/local routing changed; original scripts, references and notice were byte-identical. Independently authored complements are segregated under `reference/local/`, not represented as upstream package material.
- Historical prior-catalog POSIX, installer, link, and native-discovery receipts are not current acceptance. Their routine session details are in Git history. Distinct compatibility/legal caveats remain in `config/SKILL-SOURCES.md` and migration records.

## Unique historical observations retained

These observations predate this architecture cutover. Full routine receipts are in Git at `ae057bd421a0a66354a0334d3e270b53f0a4f296:docs/verification.md`; none accepts the current tree.

| Historical layer | Meaningful observation and continuing limit |
|---|---|
| Native authority, OMP 18.6.1 | Actual pinned tokenizer/matcher/approval/resolver passed 32 inert command cases, including the critical/prompt shadowing requiring explicit rm deny in yolo. No destructive strings executed; textual patterns are not executable identity, arbitrary spelling coverage or OS containment. |
| Worker provenance, OMP 18.6.1 | Disposable native sessions observed ordinary Luna-medium roles, slow Sol-medium and advisor Sol-high with exact managed bodies; explicit selector precedence changed slow to Luna. Interactive Plan Mode child had read-only tools and reported blockers without approval. These historical observations do not prove current fresh Sol-main dispatch. |
| Sol-main / authenticated consumer attempts | Disposable RPC exited before ready with no available models; interactive launch showed no-model. Later isolated authenticated print attempts timed out without usable output. Fresh-main identity, generation, usage/cost comparisons and five paired architecture cases remain unverified; no credentials/profile copied to bypass it. |
| Passive discovery, OMP 18.5.0 / 18.6.1 | Earlier disposable native discovery/URI reads resolved their then-current catalogs and excluded synthetic retired-root skills. `--no-skills` disables skills, not AGENTS/tools/models; no file-load bypass of deliberate disablement. Old counts are not current acceptance. |
| Source-loaded procedure evidence | Bounded documentation-first, review, security, handoff and disabled/unavailable-context exercises supported their scoped cooperative behavior. Controls also succeeded, so no comparative improvement is inferred. Effective native registration/approval/OS isolation and every possible branch remain unproved. Security candidates needing unavailable impact/deployment facts remained needs-validation, not confirmed severity. |
| Image factual accuracy | Independent assessment rejected inaccurate reference geometry both initially and after a guidance clarification. Measurement or explicit abstention remains required; text policy alone is not fidelity proof. No image generation occurred. Harness/Taste source proposals were not rendered/device proof. |
| OpenDesign | Historical read-only bridge/health observations reported daemon 0.23.1 on loopback and MCP identity 0.2.0, distinct from running-byte identity. Unreachable-daemon call returned fetch failed; no lifecycle/generation/billing action. Consumer attempt timed out; declaration is not current connection/routing proof. |
| Impeccable browser helper | Disposable Chromium exercised actual count-row helpers at 1280px/390px, pointer/keyboard wrap, locked/enabled states, hover and focus with inert transport. This is not complete engine/live-session/generation proof. |
| Windows PowerShell 5.1 | Both script parsers/help and six byte-equality cases per script were smoke-checked; the full install failed as above. No successful Windows installation. |

## Anti-slop delivery note

This assignment changes agent guidance and catalog documentation, not a rendered UI. Visual inspection and a visual-result claim are not applicable. Authored UI-routing language retains project/brief evidence, real behavior and permission boundaries; no generic UI was built.
