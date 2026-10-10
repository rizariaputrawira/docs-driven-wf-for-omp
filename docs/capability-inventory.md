# Current capability inventory

Inspected source baseline: current `main` commit `7ac5bda055f1ce27e604dde95a898b7307ac6dca` and actual one-level SKILL.md frontmatter, not historical catalog counts.
Baseline: 35 upstream input capabilities.
Result: 37 canonical capabilities, 34 model-visible and 3 explicit-only, including
two local additions: `workflow-omp-health` and `ui-browser`, plus 14 hidden compatibility pointers.

This file owns detailed semantic inventory. [Decisions](capabilities.md) own
dispositions; [migration](migration.md) owns old identifiers; package SOURCES.md
and [provenance](../config/SKILL-SOURCES.md) own exact source/license boundaries.
All procedures retain native request, approval and tool availability limits.

## Identity and routing

Each row records one baseline capability, not a compatibility alias. Baseline
folders are `config/agent/skills/<baseline name>/`; result folders are
`config/agent/skills/<canonical owner>/`. The two image-generation rows converge
on one owner. See [migration](migration.md) for explicit alias classifications.

| Baseline public name | Canonical owner | Decision / family | Model exposure | Legacy/original names |
| --- | --- | --- | --- | --- |
| apple-design | ui-gesture-design | RENAME / ui-. | Model-visible canonical. | apple-design. |
| ask-sonner | ui-sonner | RENAME / ui-. | Model-visible canonical. | ask-sonner. |
| brainstorming | workflow-brainstorming | RENAME / workflow-. | Model-visible canonical. | brainstorming. |
| brand-concepts | brand-concepts | KEEP / Natural capability exception. | Model-visible canonical. | brandkit. |
| code-review | code-review | KEEP / code-. | Model-visible canonical. | None retained as a historical identifier. |
| code-simplicity | code-simplicity | KEEP / code-. | Model-visible canonical. | ponytail, ponytail-review, ponytail-audit, ponytail-debt, ponytail-help, ponytail-gain. |
| commit-message | git-commit-message | RENAME / git-. | Model-visible canonical. | commit-message. |
| diagnosing-bugs | code-debugging | RENAME / code-. | Model-visible canonical. | diagnosing-bugs. |
| domain-modeling | docs-domain-modeling | RENAME / docs-. | Model-visible canonical. | domain-modeling. |
| engineering-docs | docs-engineering | RENAME / docs-. | Model-visible canonical. | engineering-docs. |
| expo-motion | ui-expo-motion | RENAME / ui-. | Model-visible canonical. | animate-expo, expo-motion. |
| github-triage | git-triage | RENAME / git-. | Model-visible canonical. | github-triage. |
| handoff-to-another-harness | workflow-handoff | RENAME / workflow-. | Model-visible canonical. | handoff-to-another-harness. |
| image-to-code | ui-image-to-code | RENAME / ui-. | Model-visible canonical. | image-to-code-skill, image-to-code. |
| imagegen-frontend-mobile | ui-image-generation | MERGE / ui-. | Model-visible canonical. | imagegen-frontend-mobile. |
| imagegen-frontend-web | ui-image-generation | MERGE / ui-. | Model-visible canonical. | imagegen-frontend-web. |
| mobile-web | ui-mobile-web | RENAME / ui-. | Model-visible canonical. | mobile-native, mobile-web. |
| pick-ui-library | ui-library-selection | RENAME / ui-. | Explicit-only hidden canonical. | pick-ui-library. |
| plan-review | docs-plan-review | RENAME / docs-. | Model-visible canonical. | plan-review. |
| project-delivery | workflow-delivery | RENAME / workflow-. | Model-visible canonical. | project-delivery. |
| resume-from-handoff | workflow-handoff-read | RENAME / workflow-. | Model-visible canonical. | resume-from-handoff. |
| retrospective | workflow-retrospective | RENAME / workflow-. | Model-visible canonical. | retro, retrospective. |
| security-audit | security-audit | KEEP / security-. | Model-visible canonical. | None retained as a historical identifier. |
| security-intake | security-intake | KEEP / security-. | Model-visible canonical. | None retained as a historical identifier. |
| security-review | security-review | KEEP / security-. | Model-visible canonical. | None retained as a historical identifier. |
| stitch-design-input | stitch-design-input | KEEP / Natural capability exception. | Model-visible canonical. | stitch-design-taste. |
| swift-development | swift-development | KEEP / Natural capability exception. | Model-visible canonical. | write-swift. |
| tdd | code-tdd | RENAME / code-. | Model-visible canonical. | tdd. |
| local addition | ui-browser | ADD / ui-. | Model-visible canonical. | No historical alias. |
| ui-design | ui-design | KEEP / ui-. | Model-visible canonical. | impeccable, design-taste-frontend, emil-design-eng. |
| ui-prototyping | ui-prototyping | KEEP / ui-. | Explicit-only hidden canonical. | prototype. |
| ui-stress-test | ui-stress-test | KEEP / ui-. | Model-visible canonical. | break-ui. |
| unpublished-changes | git-change-status | RENAME / git-. | Model-visible canonical. | unpublished-changes. |
| upstream-update-review | workflow-upstream-review | RENAME / workflow-. | Model-visible canonical. | upstream-update-review. |
| local addition | workflow-omp-health | ADD / workflow-. | Explicit-only hidden canonical. | No historical alias. |
| web-motion | ui-web-motion | RENAME / ui-. | Model-visible canonical. | animate, improve-animations, review-animations, find-animation-opportunities, animation-vocabulary, web-motion. |
| work-with-pr | git-pr-work | RENAME / git-. | Model-visible canonical. | work-with-pr. |
| writing-for-agents | agent-guidance | RENAME / agent-. | Model-visible canonical. | writing-for-agents. |

## Capability contracts

These are selection contracts, not duplicated procedures; follow the selected
owner's SKILL.md for execution.

| Baseline public name | Trigger | Authority | Procedure | Output | Platform/runtime | Closest overlaps |
| --- | --- | --- | --- | --- | --- | --- |
| apple-design | Explicit specialist gesture/material UI design. | Authorized UI work only. | Select interaction, typography and reduced-motion guidance. | Scoped interaction design/code. | Web interaction; not Swift-only. | ui-design, ui-web-motion. |
| ask-sonner | Sonner toast setup/styling/troubleshooting. | Authorized library work; no implicit install. | Inspect integration, select API and diagnose behavior. | Toast integration or anchored diagnosis. | React Sonner. | ui-library-selection, ui-design. |
| brainstorming | Unresolved consequential choice or explicit stress test. | Proposal before native approval. | Compare evidence/options and establish approved scope. | Options, tradeoffs and proposal. | Platform-neutral. | docs-domain-modeling, docs-plan-review. |
| brand-concepts | Requested image-led brand-board/logo-world concepts. | Permitted generator only; no production identity claim. | Ground brief/assets and generate requested concept. | Concept images, not vector/trademark proof. | Image-generation tool. | ui-image-generation, ui-design. |
| code-review | PR/branch/WIP/correction correctness or spec review. | Read-only review, never approval. | Trace changes against standards/spec and report evidence. | Anchored correctness/spec verdicts. | Source repository. | security-review, code-simplicity. |
| code-simplicity | Implementation simplicity or complexity/debt audit. | Task permission; audit/review report-only. | Select lite/full/ultra or one-shot review/audit/debt branch. | Simpler implementation or ranked complexity findings. | Language-neutral. | code-review, code-debugging. |
| commit-message | Draft/improve Git commit message. | Advice only; never commits. | Inspect staged-first changes and repo style. | Grounded commit message. | Git. | git-change-status, git-pr-work. |
| diagnosing-bugs | Difficult/flaky/performance/root-cause diagnosis. | Authorized diagnosis/fix, no invented reproduction. | Form falsifiable hypotheses and prove original-path correction. | Root cause, fix and exercised evidence. | Language/runtime-specific. | code-review, code-tdd. |
| domain-modeling | Active terminology/relationships or consequential ADR. | Model/propose within scope, not implicit execution. | Stress-test terms, relationships and lifecycle. | Domain model, counterexamples and proposed records. | Platform-neutral. | workflow-brainstorming, docs-engineering. |
| engineering-docs | Material authoritative docs context/governance/audit. | Read-only defaults; setup/create/maintain need authority. | Select existing information owner and reconcile evidence. | Context/status/audit or authorized owner update. | Passive Markdown/native tools. | workflow-delivery, docs-plan-review. |
| expo-motion | Expo/RN animation/gestures/haptics/stutter. | Authorized native-mobile work. | Select Reanimated/gesture recipe and verify on relevant runtime. | Native motion code and device limits. | Expo/React Native. | ui-web-motion, ui-mobile-web. |
| github-triage | Issue/PR queue or supplied-item classification. | Read-only; no labels/comments/close. | Classify evidence, duplicate candidates and next owner. | Type/priority/gaps/confidence/next route. | GitHub or supplied records. | git-pr-work, code-review. |
| handoff-to-another-harness | Explicit pause/export/transfer. | Non-overwriting snapshot when authorized; proposal if read-only. | Collect portable context and exact unfinished boundary. | Handoff snapshot or proposal. | Harness-neutral. | workflow-handoff-read, workflow-delivery. |
| image-to-code | Implement supplied/authorized visual reference. | Authorized code only; no image-generation assumption. | Analyze geometry/assets and implement grounded reference. | Frontend implementation and fidelity limits. | Frontend/browser. | ui-image-generation, ui-design. |
| imagegen-frontend-mobile | Requested mobile screen/flow images. | Images only with available permitted generator. | Read mobile procedure after shared platform selection. | Mobile screen/flow reference images. | Image generator; native-mobile concepts. | ui-image-generation web branch, ui-image-to-code. |
| imagegen-frontend-web | Requested website-section reference images. | Images only with available permitted generator. | Read web procedure after shared platform selection. | Website-section reference images. | Image generator; website concepts. | ui-image-generation mobile branch, ui-image-to-code. |
| mobile-web | Mobile browser/PWA viewport/touch/safe-area work. | Authorized browser work, not native conversion. | Inspect viewport/input/platform and verify actual browser states. | Targeted mobile-web fix with device limits. | Web/PWA. | ui-web-motion, ui-expo-motion. |
| pick-ui-library | Explicit frontend library recommendation. | Hidden canonical; recommendation does not authorize install. | Check existing packages and choose matching curated option. | Library recommendation and tradeoffs. | Frontend dependencies. | ui-sonner, workflow-brainstorming. |
| plan-review | Consequential multi-slice plan integration/coverage. | Read-only, non-approving. | Map acceptance to deliverable/integration/proof. | Anchored plan findings and gaps. | Platform-neutral. | workflow-delivery, code-review. |
| project-delivery | New app/substantial doc-dependent delivery or authorized resume. | Native approved stage; no automatic baseline for routine edits. | Prepare necessary information, implement slices and reconcile. | Whole-boundary delivery and observed verification. | Project-specific. | docs-engineering, workflow-handoff-read. |
| resume-from-handoff | Read/load selected handoff only. | Read snapshot only; no cited-file inspection/continuation. | Summarize snapshot faithfully without execution. | Portable context summary and unresolved items. | Harness-neutral. | workflow-handoff, workflow-delivery. |
| retrospective | Requested learning from completed slice/session. | Recommendations only; no policy edits. | Extract source-grounded lessons and promotion conditions. | Ranked lessons and revisit conditions. | Platform-neutral. | workflow-delivery, agent-guidance. |
| security-audit | Explicit bounded deep source security audit. | Read-only source inspection; no payload execution. | Map trust boundaries and independently discover/refute. | Coverage, dispositions and evidence limits. | Implementation source. | security-review, security-intake. |
| security-intake | External skill/plugin/MCP/dependency source intake. | Supplied source only; no install/execute/adoption authority. | Compare claimed purpose to actual capability and provenance. | Exact intake verdict plus coverage/gaps. | External bundle source. | security-review, workflow-upstream-review. |
| security-review | Supplied diff or explicit base/head security review. | Read-only bounded change review. | Trace changed security boundary and independently refute. | Dispositioned candidates and change coverage. | Repository diff. | security-audit, code-review. |
| stitch-design-input | Stitch-specific DESIGN.md input/example. | Proposal input, not canonical truth or implicit tool call. | Ground observed brief/project and author bounded example. | Labeled Stitch design input. | Google Stitch. | ui-design, brand-concepts. |
| swift-development | Write/review/migrate Swift; concurrency/ARC/performance. | Authorized Swift work. | Apply Swift-specific ownership/concurrency/toolchain guidance. | Swift code/review and observed evidence. | Swift/Apple toolchain. | code-debugging, code-review. |
| tdd | Explicitly requested/approved test-first development. | Opt-in RED/GREEN/refactor within scope. | Vertical behavior slices with honest failing-before evidence. | Behavior tests, implementation and observed RED/GREEN. | Project test runtime. | code-debugging, code-review. |
| ui-browser | Browser interaction, inspection and rendered UI verification. | Relevant web task with native Bash access; optional, not automatic. | Open isolated, in-memory Chromium; inspect, interact, screenshot, diagnose and close. | Browser observations and bounded verification evidence. | WSL CLI, Playwright-managed Chromium. | ui-design, project Playwright Test suite. |
| ui-design | Frontend design/refinement/critique/accessibility. | Request/native tools; no implicit engine or artifact generation. | Impeccable workflow and selective local supplements. | Design analysis or authorized UI implementation/audit. | Frontend/browser; optional engine. | ui-web-motion, ui-mobile-web, ui-gesture-design. |
| ui-prototyping | Explicit divergent UI alternatives. | Hidden canonical; isolated picker only when authorized. | Select variation axes, build isolated alternatives and let user choose. | Functional variant picker or proposal. | Frontend development harness. | ui-stress-test, ui-design. |
| ui-stress-test | Requested UI edge-case stress test. | Read-only fixture proposal or authorized dev harness; no production fix. | Choose realistic fixtures and observe bounded failures. | Fixture matrix and defect report. | Frontend development harness. | ui-prototyping, ui-design. |
| unpublished-changes | What is local/unpushed/unmerged/unreleased. | Read-only; no fetch or publication. | Inspect selected refs/baselines and separate lifecycle dimensions. | Present/absent/unknown publication-state evidence. | Git; optional GitHub evidence. | git-pr-work, git-triage. |
| upstream-update-review | Check used/named upstreams for useful changes. | Read-only recommendations; no refresh/adoption. | Identify source pins and compare authoritative changes. | Source-linked recommendations and gaps. | Upstream source/release docs. | security-intake, agent-guidance. |
| web-motion | Build/name/suggest web motion; opt-in audit or explicit diff review. | Implementation only when authorized; reviews never approve. | Select build/opportunities/vocabulary/audit/diff-review branch. | Motion code, definitions, audit/plan or findings. | Web/browser, not Expo. | ui-design, ui-gesture-design. |
| work-with-pr | Authorized bounded issue/change implementation and PR preparation. | No implicit branch/commit/push/publish/merge. | Define scope, implement/verify and optionally draft PR metadata. | Implementation and unpublished PR draft. | Git/GitHub project. | git-triage, code-review. |
| writing-for-agents | Author guidance/skills or separately authorized behavior assessment. | Authoring does not grant assessment/runtime authority. | Establish consuming contract, one owner and source-loaded proof. | Guidance edits or scoped assessment. | Agent/harness guidance. | docs-engineering, workflow-upstream-review. |

## Source, notices and OMP coupling

Source and coupling keys below apply to the result owner. Package-local notices
remain separate assets; these summaries neither replace licenses nor clear
unresolved provenance.

| Baseline public name | Source/provenance | License/notice | OMP coupling |
| --- | --- | --- | --- |
| apple-design | S1 | MIT notice LICENSE.emil. | C1 |
| ask-sonner | S1 | MIT notice LICENSE.emil. | C1 |
| brainstorming | S2 | LICENSE.superpowers; LICENSE.matt. | C1 |
| brand-concepts | S3 | MIT notice LICENSE.taste. | C1 |
| code-review | S2 | LICENSE.superpowers; LICENSE.matt. | C1 |
| code-simplicity | S4 | MIT LICENSE.ponytail. | C1 |
| commit-message | S5 | No imported third-party notice or inferred new grant. | C1 |
| diagnosing-bugs | S2 | LICENSE.superpowers; LICENSE.matt. | C1 |
| domain-modeling | S2 | LICENSE.matt. | C1 |
| engineering-docs | S2 | LICENSE.gsd. | C1 |
| expo-motion | S1 | MIT notice LICENSE.emil. | C1 |
| github-triage | S5 | No imported third-party notice or inferred new grant. | C1 |
| handoff-to-another-harness | S2 | LICENSE.gsd. | C1 |
| image-to-code | S3 | MIT notice LICENSE.taste. | C1 |
| imagegen-frontend-mobile | S3 | MIT notice LICENSE.taste. | C1 |
| imagegen-frontend-web | S3 | MIT notice LICENSE.taste. | C1 |
| mobile-web | S1 | MIT notice LICENSE.emil. | C1 |
| pick-ui-library | S1 | MIT notice LICENSE.emil. | C1 |
| plan-review | S2 | LICENSE.gsd. | C1 |
| project-delivery | S2 | LICENSE.superpowers; LICENSE.matt; LICENSE.gsd. | C1 |
| resume-from-handoff | S2 | LICENSE.gsd. | C1 |
| retrospective | S2 | LICENSE.gsd. | C1 |
| security-audit | S2 | LICENSE.cloudflare. | C1 |
| security-intake | S2 | LICENSE.skillspector. | C1 |
| security-review | S2 | LICENSE.anthropic. | C1 |
| stitch-design-input | S6 | MIT notice LICENSE.taste. | C1 |
| swift-development | S1 | MIT notice LICENSE.emil. | C1 |
| tdd | S2 | LICENSE.superpowers; LICENSE.matt. | C1 |
| ui-design | S7 | Apache-2.0 LICENSE. | C2 |
| ui-browser | S8 | Original local guidance; package source details and intake limits in provenance. | C1 |
| ui-prototyping | S1 | MIT notice LICENSE.emil. | C1 |
| ui-stress-test | S1 | MIT notice LICENSE.emil. | C1 |
| unpublished-changes | S5 | No imported third-party notice or inferred new grant. | C1 |
| upstream-update-review | S5 | No imported third-party notice or inferred new grant. | C1 |
| web-motion | S1 | MIT notice LICENSE.emil. | C1 |
| work-with-pr | S5 | No imported third-party notice or inferred new grant. | C1 |
| writing-for-agents | S2 | LICENSE.superpowers; LICENSE.matt. | C1 |

### Source keys

- **S1:** emilkowalski/skills@e8a175de22ae1e49370fc144c1f3bb9aeedf988d; compared adaptation/identity; historical import unknown; see package SOURCES.md.
- **S2:** Modified adaptations with immutable per-file mappings in package SOURCES.md; source identities preserved.
- **S3:** Leonxlnx/taste-skill@ce26fc25c0e5e8cab638f883de62d9a86ee5e45b; compared adaptation/identity; historical import unknown; see package SOURCES.md.
- **S4:** DietrichGebert/ponytail; dbdfc8de29fb91609ed2df2ae378782a956d8e86 pins license only, body revision unknown.
- **S5:** INDEPENDENTLY AUTHORED local procedure; package SOURCES when present.
- **S6:** Leonxlnx/taste-skill@ce26fc25c0e5e8cab638f883de62d9a86ee5e45b; SOURCE UNCERTAIN, candidate notice only; see package SOURCES.md.
- **S7:** pbakaus/impeccable@508d7e8955de3b3caf2d8676e85206723d41a887; adapted SKILL and separate independent local references.
- **S8:** Microsoft `@playwright/cli@0.1.22`, npm license Apache-2.0, repository `microsoft/playwright-cli`; installed for the local WSL user. No upstream skill text is redistributed; see [source and security intake](../config/SKILL-SOURCES.md#playwright-cli).

### Coupling keys

- **C1:** LOW: flat SKILL.md/reference, metadata, native URI/command/filter contract.
- **C2:** MEDIUM: optional Impeccable engine/launcher; passive procedure LOW.
- **C3:** LOW: optional globally installed CLI/browser binaries; `ui-browser` is passive OMP skill metadata and guidance.
