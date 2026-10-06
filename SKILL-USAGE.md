# Choose and use a skill in OMP

Start with the outcome, not a procession of skills. Ordinary work uses direct Luna or bounded native workers, proportionate verification and done. It needs no documentation setup, baseline, manifest or extra approval unless the real boundary requires them.

Use [managed semantic routing](config/agent/AGENTS.md#engineering-workflow), [global working/delegation policy](config/agent/PERSONALITY.md), [native model ownership](README.md#native-worker-model-ownership) and [permission distinctions](config/agent/AGENTS.md#permission-and-model-ownership) rather than duplicating their rules. Material authoritative-context dependencies use engineering-docs; new apps and explicit substantial/end-to-end documentation-dependent delivery use project-delivery. Context lookup is not full delivery. Other skills are selected by actual trigger, not prerequisites or discovery tiers.

| Your goal | Start here |
|---|---|
| New app or substantial delivery | [Delivery and decisions](#delivery-and-decisions): project-delivery |
| Find, prepare, audit or reconcile documents | [Engineering documents](#engineering-documents): engineering-docs |
| Fix, review or work test-first | [Implementation and review](#implementation-and-review) |
| Improve an existing interface | [UI workflow](#ui-workflow): impeccable first |
| Name, plan, review or build motion | [Motion](#motion) |
| Choose a visual direction or generate concepts | [Style specialists](#style-specialists), [Images and design documents](#images-and-design-documents) |
| Upstream changes | [Upstream changes](#upstream-changes): upstream-update-review |
| Inspect a bundle or security boundary | [Source-only security](#source-only-security) |
| Pause, load a snapshot or continue | [Handoff and continuation](#handoff-and-continuation) |
| Suggest a commit message | [Coding and output tools](#coding-and-output-tools): commit-message |

## One practical prompt template

Paste an ordinary **message inside OMP**, not a terminal command:

> Use [public skill name] for [specific task]. Inspect [project/files/diff/supplied material]. Preserve [behavior, platform, brand and constraints]. I want [read-only findings / proposed content / authorized edits to named owners]. Expected result: [report, implementation, images or complete files]. Evidence available: [diagnostic, requirements, observed results or none]. Do not [out-of-scope edits, installs, services or configuration changes].

Examples are illustrative, not observed repository facts. Include a concrete task; unchanged specialists such as Swift may answer bare invocation with a readiness greeting.

## Availability, names and permissions

A **skill** is passive guidance, not an executable, installer, model or tool. An **agent** is a bounded role with instructions, requested built-in tool selection and an output contract, not a universal sandbox. Discovery, model policy, native Plan Mode, extension interception and approval are separate: see [canonical permission distinctions](config/agent/AGENTS.md#permission-and-model-ownership). This repository supplies configuration and source snapshots, not OMP, credentials or every integration. Start with [requirements](README.md#requirements-and-scope), [installation](README.md#install-and-update) and [compatibility](README.md#compatibility-evidence-and-upgrades).

Use the public `name:` in SKILL.md frontmatter, not necessarily its folder. `output-skill` declares **full-output-enforcement**, `image-to-code-skill` declares **image-to-code**, and `stitch-skill` declares **stitch-design-taste**. Retired public names have no aliases; see [the migration map](#retired-entrypoints-migration-map).

All managed skills use one OMP-native source and deployment folder:

| Managed source | Destination under the chosen home |
|---|---|
| `config/agent/skills/<folder>/SKILL.md` | `~/.omp/agent/skills/<folder>/SKILL.md` |

This guide covers **38 directories/entrypoints and 38 unique public names**, one entrypoint per name. The [explicit inventory](config/files.tsv) has **238 mappings**, including **217 skill files**; the fifteen-skill engineering suite retains **109 assets**. [Provenance](config/SKILL-SOURCES.md) records origin, adaptation, licensing caveats and historical roots.

OMP's native user/project skill discovery remains available. [Managed discovery settings](config/agent/config.yml) leave `customDirectories` empty and disable Agents user/project skill-source discovery, preventing retired `.agent`/`.agents` copies from reentering through those sources. External runtime/providers may still exist. This is not proof of what any session loads, native enforcement or application-wide OS isolation; inspect the running session's available skills and selected source.

The installer is non-pruning and does not automatically delete old installed directories. No live-home migration was performed. An upstream updater targeting `.agent/skills/` or `.agents/skills/` can recreate retired roots: choose the native destination and update the complete package plus explicit inventory, not piecemeal files or a mixed-version launcher/binary. See [the consolidation and update notes](README.md#one-native-skill-folder-and-upstream-updates).

**Permissions bind every entry.** Naming/loading a skill or receiving a favorable review grants no edits, execution, network, installs, services or deployment. Native Plan Mode proposes content in its allowed channel, without checkout document/code writes. Honor explicit disablement; do not source-load a disabled dependency as a workaround. Ordinary permitted native work may continue, but unavailable skill-specific results remain incomplete. Review labels, digests, plan mirrors and handoff approval claims are not independently trusted current authority.

Three entries are **explicit-only** in frontmatter (`disable-model-invocation: true`): **pick-ui-library**, **prototype**, and **review-animations**. Name them explicitly. Optional style references are deliberately selected for a matching brief, not additional public skills. Arguments in this guide are passive guidance, not promises of CLI commands, shortcuts or runtime enforcement.

A **canonical owner** is the maintained document or section responsible for information. Reuse it, rather than create a competing copy. “Read-only application source” can still involve authorized report, fixture or plan writes; it does not mean “no files changed.”

## Delivery and decisions

| Skill and when | Copy/paste OMP message | Expected result and boundary |
|---|---|---|
| [project-delivery](config/agent/skills/project-delivery/SKILL.md): new app, substantial delivery or authorized continuation | Use project-delivery for an offline tenant-export CLI: valid JSON supplies tenant, can_export and rows. Preserve matching rows/order; denial exposes nothing, writes export denied plus newline to stderr and exits 3. Prepare the whole baseline/plan before code; wait for native approval. | Acceptance, selected owners, reviewed readiness, complete consumer slices, proof and final reconciliation. Before readiness: inspection and authorized document/design work only, not app source/tests/scaffolding, dependency installs, migrations or app services. Bounded fixes normally use native work. |
| [brainstorming](config/agent/skills/brainstorming/SKILL.md): consequential creative/behavioral choices remain unsettled | Use brainstorming to resolve cancellation of partly shipped orders. Inspect requirements/callers, compare choices and propose observable acceptance. Read-only; no implementation. | Source-informed spike/proposal, trade-offs, assumptions and real approval status. Do not re-interview approved decisions. Exploration approval does not authorize shipping artifacts or unseen implementation; document writes also need permission. |
| [domain-modeling](config/agent/skills/domain-modeling/SKILL.md): ambiguous terms, relationships or decisions | Use domain-modeling to distinguish login identity from billing tenant, both called account. Inspect glossary/callers; test one person belonging to two tenants. Propose wording only. | Counterexamples, definitions, ownership/lifecycle rules and justified ADR proposals. An ADR records a consequential architecture decision. No code or architecture authorization; trivial naming needs no ADR, and a numbered proposal is not accepted. |
| [plan-review](config/agent/skills/plan-review/SKILL.md): consequential multi-slice coverage review | Use plan-review on the export plan/acceptance owner. Check library/CLI integration, denial, row preservation/order, whole-boundary readiness and planned proof. No edits, checks or approval. | Criterion → deliverable → integration → proof coverage, covered/partial/uncovered/unknown states and blockers/warnings/info. Read-only, non-authorizing; trivial edits bypass it. Happy-path tasks cannot compensate for missing required architecture/error/test intent. Integrate findings before native approval. |

### Documentation-first, not a document forest

New-app/substantial delivery needs sufficient **logical information for the whole authorized boundary before code**, not just the first tracer. Reuse owners; a lean CLI can keep substantive README sections instead of separate PRD/SRS/ADR/runbook files.

Prepare dependency-aware coverage: classification/profile and actual obligations; purpose/scope; behavior, acceptance, quality/security; architecture/contracts/threats; detailed and applicable UI design; verification intent; applicable release/operations/recovery/reader plans; then readiness and the implementation plan. Security starts early. Plans do not imply passed tests, deployed targets, successful restores or store acceptance. Standards alignment is not certification or an ISO-mandated waterfall.

The [baseline procedure](config/agent/skills/project-delivery/references/documentation-baseline.md) owns the policy. Native approval must cover the exact material baseline/plan; persist necessary reviewed docs under authorization before implementation. Material intended changes to requirements, architecture/interfaces, security/platform rules or scope require affected owner/readiness and plan updates plus required native reapproval **before dependent code**. Corrections preserving reviewed intent can use current scope.

Finish only after **every required acceptance criterion is supported and every affected document owner reconciles** with source and relevant observed evidence. A guide update alone is insufficient. “Code complete, docs pending” and “docs reconciled, runtime unverified” are not full completion. A bounded native correction updates affected docs only, without the full-app gate.

## Engineering documents

[**engineering-docs**](config/agent/skills/engineering-docs/SKILL.md) finds, selects, creates, audits and maintains necessary information. An unspecified action defaults to **read-only context**, not setup:

> Use engineering-docs for the tenant-export row-order correction. Inspect acceptance, implementation and tests; return constraints and gaps. Do not set up documentation or change files.

The eight native actions below are skill arguments, not invented commands. Example facts: an offline Linux CLI filters public synthetic JSON by tenant, preserves rows/order, denies disallowed export, has no persistence/service, and README owns purpose/acceptance/usage.

| Action and when | Copy/paste OMP message | Outcome and permission |
|---|---|---|
| **setup**: select information/owners | Use engineering-docs setup for this offline Linux CLI with public synthetic input and no persistence/service. Reuse README owners; update necessary index/manifest and sections only. | Classification/profile, selection/omissions, owners, sources and gaps. **Authorized document writes**; no mass bundle. Reuse sufficient indexes; preserve/report invalid manifests instead of bypassing them. |
| **status**: inspect readiness | Use engineering-docs status for the CLI. Compare index/README, show declared versus observed states, required gaps and next action. Do not write. | Scoped phase/document/required/status/next-action table. **Read-only**; due pre-code gaps separate from later unobserved evidence. Active labels do not prove coverage. |
| **next**: prioritize document work | Use engineering-docs next for the CLI. Rank grounded gaps, prerequisites, blockers and independent drafts. Do not change files. | Bounded recommendations, not a task queue. **Read-only**; material hazards outrank cosmetics. Feasible code cannot bypass required readiness gaps. |
| **sequence**: understand dependencies | Use engineering-docs sequence for the CLI. Show dependency order, independent drafts, due pre-code gaps and later evidence. Do not write. | Tailored prerequisite/lifecycle view. **Read-only**; sufficient information matters, not separate files or universal numbered gates. Security starts early; results remain unobserved. |
| **create**: fill missing information | Use engineering-docs create requirements for the CLI. Extend README with filtering, full-row preservation, order and denial; update necessary trace/index links only. Leave unknown denial details explicit. | Substantive right-owner coverage or existing sufficiency. **Authorized document writes**. Requirements resolves to srs, not mandatory SRS files. Unknown aliases get actionable errors. Artifact TDD means technical design, not test-first. |
| **context**: one task's constraints | Use engineering-docs context for the row-order fix. Inspect acceptance/code/tests; return authoritative anchors and gaps. No manifest setup or edits. | Seven headings: Objective, Scope, Constraints, Evidence / Context, Expected Result, Verification, Done When. **Read-only**; absent manifest allows provisional context, not setup. Filename priority cannot settle conflicts. |
| **audit**: compare docs/source/evidence | Use engineering-docs audit for export behavior/design/verification owners. Report drift, gaps and uncertainty against source/evidence. No repairs or execution. | Prioritized documentation findings and state/trace/coverage limits. **Read-only**, not security-audit. Changed digests request review, not automatic semantic-drift findings. |
| **maintain**: reconcile after change | Use engineering-docs maintain for the order fix. Inspect code and supplied original-path/regression results. Update all affected owners/links only; retain unrelated content and unverified states. | Accurate affected-owner content/evidence states. **Authorized document writes**. Missing execution stays proposed/unverified. Changed intent uses create/owner extension and required reapproval, not false as-built claims. |

Details: [sequence](config/agent/skills/engineering-docs/references/sequence.md), [ownership/manifest](config/agent/skills/engineering-docs/references/manifest.md), [context](config/agent/skills/engineering-docs/references/context-routing.md), [audit](config/agent/skills/engineering-docs/references/audit.md).

## Implementation and review

| Skill and when | Copy/paste OMP message | Expected result and boundary |
|---|---|---|
| [tdd](config/agent/skills/tdd/SKILL.md): explicitly selected test-first/red-green-refactor | Use tdd for the approved order fix. Preserve complete rows/order; you may edit relevant tests/code and run scoped checks. Report meaningful RED then observed GREEN, one behavior at a time. | Independent expected values, vertical behavior cycles, minimal fix and optional preserving refactor. Writes **and execution** need authorization; import/setup failure is not RED. Regression requests do not select tdd. Do not discard useful work to manufacture test-first history. |
| [code-review](config/agent/skills/code-review/SKILL.md): correctness, repo standards, spec fidelity | Use code-review on export WIP, including staged/unstaged/untracked changes. README owns acceptance. Trace CLI/library callers, denial/order. Return separate correctness/Standards and Spec verdicts; no edits, tests, publishing or approval. | Exact comparison scope, pass/issues/unknown verdicts, grounded findings and coverage limits. Read-only by default; absent material spec leaves Spec unknown. Correction review dispositions every prior finding and checks new breakage. Security/complexity have separate scopes. |
| [diagnosing-bugs](config/agent/skills/diagnosing-bugs/SKILL.md): difficult, flaky, causal or performance investigation | Use diagnosing-bugs: CLI denial leaks rows although the helper test passes. Treat my report as ground truth, not a confirmation replay. Trace/correct the cause; add regressions and run authorized original-path remediation checks. | Discriminating hypotheses/evidence, cause or uncertainty, root correction and consumer/regression proof. Source-only diagnosis is possible; probes/edits require authority. Plausibility is not verified fix. Investigation alone needs no tests/docs; permanent fixes need original-path evidence, not just green helpers. |
| [writing-for-agents](config/agent/skills/writing-for-agents/SKILL.md): skills and agent-facing instructions | Use writing-for-agents to revise AGENTS.md export routing. Reuse acceptance only when behavior is affected. You may update guidance/pointers; no installation or assessment actors. | Actionable instructions, triggers, owners, boundaries and completion criteria. Authoring does not authorize deployment or behavioral assessment. Separately authorized assessment needs actual source-loaded baseline/candidate consumers and independent judgment; source review is not behavioral proof. |
| [retro](config/agent/skills/retro/SKILL.md): learn from completed work | Use retro for the completed correction. Read plan/code/review/actual results; separate decisions, lessons, candidate patterns and surprises. Recommend improvements without changing files, settings or memory. | Evidence-linked ranked recommendations, counterevidence/unknowns, existing owners and adoption/revisit conditions. Recommendation-only by default. One success is not a recurring pattern; hindsight grants no policy or requirement authority. Authorize selected changes separately. |

## Upstream changes

Use [upstream-update-review](config/agent/skills/upstream-update-review/SKILL.md) to discover used third-party sources from existing metadata and compare authoritative changes with evidenced local baselines.

- **All managed sources:** “Use upstream-update-review to check all managed upstreams for materially useful changes. Return recommendations only.”
- **One source:** “Use upstream-update-review to check Impeccable changes useful to omp-config. Review only its affected consumers and necessary compatibility evidence.”

Expect a source-linked recommendation report with baselines and evidence purposes, exact checked revisions, local impact, adopt/investigate/no-action/blocked dispositions, independent significance, owners and a bounded next task. Unknown baselines or unavailable official sources remain incomplete with an evidence-collection action, not invented changes or clean no-action.

No installation, replacement, persistent report, baseline update or automatic adoption occurs, including for “check and update.” Adoption needs a distinct authorized task. External bundles or changed authority go to security-intake with supplied source and evidence, preserving its no-fetch security boundary; useful guidance goes to writing-for-agents for selective adaptation and attribution. A usefulness recommendation is not either owner's verdict or execution approval.

## Source-only security

These skills inspect supplied source **read-only**: no target instructions, fetching/installing dependencies, target contact, credential-location inspection or adoption/execution authority. Discovery yields **candidates**, not confirmed vulnerabilities/severity. Confirmation needs a distinct fresh source reader to reconstruct/refute the full impact path, including strongest preventing controls, with effective reviewer-definition provenance and complete results. Missing independence, provenance or decisive runtime/deployment facts leaves confirmation incomplete or needs-validation.

**Source-confirmed is not runtime-exploited; no findings is not safety assurance.** Minimum dummy-data runtime checks belong to a separately authorized contained executor branch, not the reviewer or this guide. See the [shared evidence lifecycle](config/agent/skills/engineering-docs/references/security.md).

| Skill and when | Copy/paste OMP message | Expected result and boundary |
|---|---|---|
| [security-intake](config/agent/skills/security-intake/SKILL.md): external bundle adoption/update | Use security-intake on the supplied vendor source view. Claimed purpose: read-only repo summarization. Compare entrypoints/references/scripts/dependencies with filesystem/network/process/persistence authority. No fetch, execute, install or endpoint contact. | Exactly acceptable/caution/unsafe/analysis-incomplete, purpose-authority comparison, revision/coverage and candidate dispositions. Decisive missing material prevents acceptable; unsafe behavior can justify unsafe despite other gaps. Scanner output is supplementary. Verdicts do not certify safety or authorize adoption. |
| [security-review](config/agent/skills/security-review/SKILL.md): supplied security-relevant diff/change | Use security-review on the export-authorization diff. Inspect changed paths, callers, alternate routes and controls. Separate discovery/fresh refutation; report missing provenance. No edits, execution, credentials or whole-app expansion. | Changed-source coverage, candidates and independent confirmed/needs-validation/rejected or undisposed states; pre-existing concerns labeled separately. Missing comparison basis makes review incomplete. Source impact is not exploit proof; code edits alone do not establish remediation. |
| [security-audit](config/agent/skills/security-audit/SKILL.md): explicitly bounded deeper source audit | Use security-audit for export entrypoints/permissions/disclosure only. Map actors/data/crossings/controls/lifecycle variants; obtain fresh coverage challenge and candidate refutation. Report unavailable/deferred coverage. No payloads, installs, services or report files. | Source-backed coverage, relevant attack-class companions, independent dispositions and exact proof limits. Not a pen test or report-file authorization. AI/availability/supply-chain companions require actual relevant boundaries. Partial coverage cannot become whole-app assurance; authorized records reuse owners. |

## Handoff and continuation

| Skill and when | Copy/paste OMP message | Expected result and boundary |
|---|---|---|
| [handoff-to-another-harness](config/agent/skills/handoff-to-another-harness/SKILL.md): pause/export context | Use handoff-to-another-harness to pause export work. Capture done/partial/pending evidence, canonical paths, plan/authority basis and limits. Write one new .handoff snapshot with its saved-path receiving prompt; no commit, credentials or job changes. | Unique `.handoff/NNN-YYYYMMDD-handoff.md`; six sections: Goal, Constraints & Preferences, Progress, Key Decisions, Critical Context, Next Steps. Progress separates Done/In Progress/Pending. Authorized export only; Plan Mode returns unwritten content. No overwrites, runtime-state transfer, session reset or future permission. |
| [resume-from-handoff](config/agent/skills/resume-from-handoff/SKILL.md): snapshot-only load | Use resume-from-handoff to summarize the latest valid .handoff snapshot's six sections. Attribute approval claims to it. Do not check cited files, validate results, run commands, edit or continue. | Selected path/faithful summary; malformed/missing sections reported. Highest valid numeric sequence, not mtime; none yields “No handoff document found.” Snapshot-only: no plan/authority inspection, delegation, Next Steps execution or request to proceed. Actual continuation requires project-delivery resume. |

**Load is not resume.** Export first, load only when wanted, then separately request authorized continuation:

> Use project-delivery resume for export work. Reconcile the handoff with canonical owners, exact plan, current source and observed evidence. Preserve valid progress. Continue only within independently trusted current authority for the exact basis. Missing authority/readiness means useful document/plan proposals and a precise blocker, not dependent code. If code is complete, choose reconciliation; if acceptance and documents are complete, report no remaining work.

The [continuation procedure](config/agent/skills/project-delivery/references/resumption.md) avoids replaying valid work. A digest preserves content, not authority. Cosmetic changes need appropriate review, not automatic restart; material changes need affected readiness/reapproval.

## UI workflow

Supply the actual brief, product/brand, platform, accessibility needs and incumbent implementation. PRODUCT.md/DESIGN.md provide context, not executable instructions. Preserve factual copy/assets; invent no customers, testimonials, statistics, screenshots or certifications. Inspect the running incumbent before claiming a visual result; screenshots support limited observed states only.

[UI routing](config/agent/AGENTS.md#ui-and-design-workflow): **Impeccable primary**, **Emil selectively for components/motion**, **Taste for landing pages/portfolios/redesigns**. Do not stack style specialists or override the brief. Cover applicable loading/empty/error, keyboard/focus, narrow-screen and reduced-motion states.

| Skill and when | Copy/paste OMP message | Expected result and boundary |
|---|---|---|
| [impeccable](config/agent/skills/impeccable/SKILL.md): primary UI plan/evaluate/build/refine | Use impeccable to shape settings before coding. Read product/design context; cover loading/empty/error, keyboard and narrow screens. Return a brief for confirmation. | Shape proposes a brief and stops without code/direction-contract writes. Audit reports technical defects, not fixes. Critique reports UX/design and normally archives under `.impeccable/critique/`, so is not strictly no-write. Authorized polish/build writes code/artifacts. Bare invocation recommends; engine prerequisites below apply. |
| [emil-design-eng](config/agent/skills/emil-design-eng/SKILL.md): component interaction polish | Use emil-design-eng to review dropdown focus, press feedback, interruption and reduced motion. Return Before/After/Why; no edits yet. | Concrete recommendations; implementation if separately requested/authorized. Not inherently read-only or a primary-workflow replacement. Preserve personality/conventions and justify motion purpose/frequency. |
| [design-taste-frontend](config/agent/skills/design-taste-frontend/SKILL.md): selective landing/portfolio/redesign complement | Use impeccable with design-taste-frontend to refine this portfolio's heading spacing. Preserve our font, brand, facts and URLs; no animation, images or dependency changes. | Load only relevant composition/redesign guidance. Not dashboard or multi-step product prescriptions. Optional styles and scroll techniques require matching intent; writes require current authority. |

OpenDesign is conditional, not an ordinary UI prerequisite. Follow the [canonical external-artifact contract](config/agent/skills/impeccable/reference/open-design.md):

- “Fix the spacing and mobile layout of this existing settings page.” Use direct Impeccable refinement and actual surface verification, without OpenDesign or a documentation baseline.
- “Use OpenDesign to explore a redesign of this dashboard from the existing brief and design system.” Check availability, resolve the exact project, hand off evidenced context, inspect and reconcile the artifact, then return a reviewed proposal and stop. Exploration does not authorize implementation.
- “Use OpenDesign for the UI composition required by our reviewed documentation baseline.” Consume the existing canonical requirements/design context, revision and approval evidence; return reviewed scoped composition/provenance to established baseline/readiness/implementation-plan owners. Do not create a competing document suite.

Missing prerequisites are reported exactly, without implicit setup. Missing or ambiguous projects require selection; no implicit creation or first/latest fallback. Generated pricing, metrics or other unsupported facts are rejected or omitted, not promoted to requirements. Artifact acceptance grants no code authorization. Impeccable's named-element live-browser `generate` remains a separate command.

### Impeccable setup and engine prerequisites

The single [canonical Impeccable package](config/agent/skills/impeccable/SKILL.md) is **4.5.0 with engine 0.1.11**, including its generate command. Older packages 4.3.1/4.2.2 are retired. The old engine 0.1.5 Linux binary is **not** copied into this package; use the matching launcher/pin, not a mixed-version shortcut.

Its procedure runs the context launcher once per session from the actual skill directory, with the project as working directory, then reads the playbook and product/design/surface/native context. Craft-floor guidance loads before UI edits, not planning alone. Missing DESIGN.md does not erase incumbent identity; narrow refinement need not demand a new PRODUCT.md.

The [newest launcher](config/agent/skills/impeccable/scripts/impeccable) uses a standalone binary, not Node/retired npm CLI. A first-run download may need permitted network, a writable cache, curl/wget and SHA-256 tooling; an available compatible binary avoids it. Disclose failure/refusal and follow the source-defined direct-context fallback through permitted tools; do not invent facts or bypass download restrictions. Web live/generate/browser iteration needs real web/browser capability and a running surface; native work uses native references. Assets do not supply hooks/services/access. No engine or service was invoked for this consolidation.

## Style specialists

Styles are now optional [Taste reference directions](config/agent/skills/design-taste-frontend/references/style-directions.md), not separate public entrypoints. Load only the requested or brand-supported section: `minimalist-editorial`, `industrial-print`, `tactical-crt`, or `high-end-editorial`. None mandates a palette, typeface, images, blur, glass, telemetry or motion. Preserve factual content, accessibility and actual product identity.

For an incumbent marketing upgrade, use the [redesign checks](config/agent/skills/design-taste-frontend/references/redesign.md) while Impeccable owns refinement versus replacement. [Scroll storytelling](config/agent/skills/design-taste-frontend/references/scroll-storytelling.md) covers occasional purposeful pin/scrub/stack composition only when motion fits the brief; animate build owns implementation. No new dependencies or simulated randomization.

## Components and platform tools

| Skill and when | Copy/paste OMP message | Expected result and boundary |
|---|---|---|
| [apple-design](config/agent/skills/apple-design/SKILL.md): web direct manipulation/springs/materials | Use apple-design to review web-sheet pointer tracking, release velocity and interruption. Recommend reduced motion; no edits. | Concrete gesture/motion guidance; writes when requested/authorized. Web translation, not SwiftUI or official Apple material package. Translucency needs purpose; source cannot prove gesture feel. |
| [pick-ui-library](config/agent/skills/pick-ui-library/SKILL.md): one explicit library recommendation | Use pick-ui-library for long React-list virtualization. Inspect package.json; recommend one library without installing/replacing anything. | Curated task match/dependency mismatch. **Explicit-only**; recommendation scope. Wiring/install/replacement requires authorization. A fade does not warrant a motion dependency. |
| [prototype](config/agent/skills/prototype/SKILL.md): explicitly compare isolated alternatives | Use prototype plan-only for two member-card layout variants using our tokens/content. Propose axes and accessible picker behavior, no writes or launcher. | **Explicit-only**. Planning is proposal-only; authorized implementation builds isolated functional variants/picker and verifies keyboard, selection, URL state and narrow-screen placement. User selection is not blanket production integration authority. |
| [break-ui](config/agent/skills/break-ui/SKILL.md): schema-backed data/state stress | Use break-ui inspection-only on the member list. Propose realistic fixtures and a development-only harness, no files or production fixes. | Inspection returns proposals. Authorized harness work injects at the real data boundary, observes rendered defects and reports remedies; it stops before production corrections unless requested. |
| [mobile-native](config/agent/skills/mobile-native/SKILL.md): phone web/PWA touch/viewport/notch issues | Use mobile-native to fix PWA input zoom and browser chrome hiding actions. Preserve user zoom; explain CSS/meta changes and remaining physical-phone checks. | Minimal browser/PWA fixes. Writes; not React Native, Expo, Swift or motion design. Never mask symptoms with disabled zoom/global text selection. Verified feel requires hardware, not desktop emulation. |
| [ask-sonner](config/agent/skills/ask-sonner/SKILL.md): React Sonner setup/style/toast defects | Use ask-sonner to fix duplicate save-success toasts. Inspect Toaster mounts/callers; preserve save behavior/theme. | Sonner-specific diagnosis/wiring when authorized. Needs actual React/Sonner/API context, not general notification architecture. One Toaster mount, client calls; guidance does not install it. |

## Images and design documents

Image instructions supply no generator, credentials, subscription or spending permission. Requested generation requires **available, permitted tools**; missing images remain incomplete, never prose reported as images. Supplied-image analysis can proceed without fresh generation. Concepts are not apps or evidence about actual customers/products; image output cannot prove keyboard/error/authorization behavior.

| Skill and when | Copy/paste OMP message | Expected result and boundary |
|---|---|---|
| [brandkit](config/agent/skills/brandkit/SKILL.md): image-led brand-board/logo-world concepts | Use brandkit for one concept board from supplied name/audience/approved assets. Layout follows the brief. | Tool-dependent concept imagery, not app code, editable vectors, trademark clearance or factual product proof. Counts/panels/identity come from actual inputs. |
| [imagegen-frontend-web](config/agent/skills/imagegen-frontend-web/SKILL.md): separate section references | Use imagegen-frontend-web for exactly three section images: introduction, actual-work showcase, contact. Supplied assets/copy, images only. | One separate image per requested section, no fixed site pack or extra sections. Unavailable generation is an exact prerequisite gap, not completion. |
| [imagegen-frontend-mobile](config/agent/skills/imagegen-frontend-mobile/SKILL.md): screen/flow images | Use imagegen-frontend-mobile for three Android notes screens: list, editor, save-error. Supplied copy, raw screens, images only. | Image-only, platform/flow consistency; brief determines count and frames. No invented users/assets or native-behavior proof. |
| [image-to-code](config/agent/skills/image-to-code-skill/SKILL.md): analyze reference, optionally build | Use image-to-code to analyze this supplied screenshot's hierarchy/spacing. No new generation or code yet. | Supplied references do not require generation. Authorized code work compares actual reference/implementation. Explicitly requested unavailable generation stays incomplete; complete reachable analysis/proposal without fake fidelity/build claims. |
| [stitch-design-taste](config/agent/skills/stitch-skill/SKILL.md): Stitch-specific design input | Use stitch-design-taste to propose a Stitch input from our existing brand/screens. No writing or Stitch calls yet. | Proposed semantic design information, not canonical project truth. Bundled DESIGN.md is an example. Existing owner and brief govern values; external calls require available permitted tools and explicit authority. |

## Motion

Select the requested stage, not the library. Reuse compatible tokens, protect immediate actions/focus and handle interruption/reduced motion. Frequent interactions favor little/no movement; keyboard activation alone is not a ban. Fallback timing examples are not mandatory ceilings or justification for slower existing behavior.

| Owner/action | Copy/paste OMP message | Expected result and boundary |
|---|---|---|
| [animate vocabulary](config/agent/skills/animate/references/vocabulary.md) | Use animate vocabulary: what is a popover growing from its trigger called? | Term/definition or labeled approximation only. No code or plan writes. |
| [animate opportunities](config/agent/skills/animate/references/opportunities.md) | Use animate opportunities: what could animate here? Suggestions only. Inspect frequent actions and rare completion states. | Prioritized grounded proposals, rejected candidates and verdict. No implementation, installs, planner or worktree writes. |
| [animate build](config/agent/skills/animate/references/build.md) | Use animate build for this occasional popover's authorized enter/exit change. Preserve tokens, focus, interruption and reduced motion. | Authorized web implementation plus actual changed-path proof and visual/device limits. No automatic library selection. Bare animate offers its three branches without writes. |
| [improve-animations](config/agent/skills/improve-animations/SKILL.md) | Audit existing motion without writes. Return priorities; propose selected plans only in chat/native permitted planning channel. | Audit is read-only. Planning has no assumed plans directory/index/worktree/dispatch. Execute requires exact current authority and executor capability. |
| [review-animations](config/agent/skills/review-animations/SKILL.md) | Explicitly review this motion diff, citing standards/source lines. No edits. | **Explicit-only**, report/verdict only, not native approval. Distinguish justified drawer timing from ordinary delay; do not claim performance/feel from source alone. |
| [animate-expo](config/agent/skills/animate-expo/SKILL.md) | Use animate-expo to fix the authorized swipe dismissal. Inspect SDK/Reanimated/Gesture Handler, preserve velocity and reduced motion. | Native JS/TS motion, thread/tool/device-specific. Existing RECIPES retained; physical release-device feel remains separate from source/simulator checks. |

## Coding and output tools

| Skill and when | Copy/paste OMP message | Expected result and boundary |
|---|---|---|
| [ponytail](config/agent/skills/ponytail/SKILL.md): coding simplicity and one-shot reports | Use ponytail full for the complete approved helper correction. Trace symbol-aware callers; preserve every acceptance condition. | Conversational lite/full/ultra, not persistent config. Simplest correct implementation, actual changed-path proof and meaningful existing checks. Requested reports stay complete. |
| [ponytail review/audit](config/agent/skills/ponytail/references/complexity-review.md) | Use ponytail review on this real diff; then audit the explicitly named subtree. Report only, protect smoke checks. | Distinct diff/repository branches with delete/stdlib/native/yagni/shrink tags. Complexity only, no automatic fixes or level activation. Supported possible reductions only; unknown totals stay unknown. |
| [ponytail debt](config/agent/skills/ponytail/references/debt-ledger.md) | Use ponytail debt to collect actual shortcut comments, skipping dependencies/build/VCS. Chat ledger only. | File/line, ceiling, trigger and no-trigger flags; honest counts. Saving requires an authorized exact destination. No tracker, mode change or scoreboard. |
| **ponytail help** | Use ponytail help to explain lite/full/ultra and review/audit/debt/help. No activation or writes. | Inline reference table only, no runtime shortcut claim. |
| [write-swift](config/agent/skills/write-swift/SKILL.md): Swift implementation/review/migration | Use write-swift to review the concurrency diagnostic against sources/toolchain/targets. Propose compatible root correction; no unchecked Sendable suppression or code/build-setting edits yet. | Isolation/ownership/task/value-type guidance or authorized implementation. Needs Swift project/compiler-language/target context; compilation/profiling needs real tools. Source baseline is not installed availability. Not mobile-web/PWA or Expo motion, nor substitute UI/platform testing. Include a specific task. |
| [commit-message](config/agent/skills/commit-message/SKILL.md): suggest concise text for actual Git changes | Use commit-message to suggest a message for the staged changes. Return text only; do not stage or commit. | Read-only advice grounded in actual diffs and recent history. Staged changes take precedence; no staged change means inspect relevant unstaged/untracked content. No changes means no fabricated message. |
| [full-output-enforcement](config/agent/skills/output-skill/SKILL.md): exhaustive scoped output | Use full-output-enforcement for the agreed patch. Read current files; return every complete final file in chat without skeletons/omissions/placeholders. No writes or extra scope. | Full requested deliverables; interruption uses clean section/file/function break and completed-count/next-section marker. Paused is incomplete. Missing inputs stay blockers, not fake code. Cannot override scope, permissions, Plan Mode/readiness or authorize tools/tests. Full code is not verified code. |

## Short choose-this-not-that workflows

### New app versus bounded bug

**New app:** project-delivery → resolve only unsettled decisions → select/reuse owners with enabled engineering-docs → review whole-boundary readiness/plan → native approval → real consumer implementation/checks → all-owner reconciliation. Plan-review assists consequential multi-slice review, not approval. Select tdd only for requested test-first.

**Bounded bug:** no automatic full-app setup. Example:

> The export CLI reverses matching rows; README already requires input order. Fix the bounded defect, preserve unrelated changes, add regression coverage and run the scoped original CLI-path check. Update affected docs only. Use diagnosing-bugs if needed; do not create a full baseline or assume test-first.

Treat the report as ground truth. Discriminate causes instead of confirmation-only replay; green helper tests cannot replace original-consumer proof.

### Review the scope you mean

Code-review: correctness/spec. Plan-review: planned coverage. Ponytail review/audit: complexity. Security-review: changed boundary; security-audit: explicitly bounded depth. Engineering-docs audit: document drift. Explicit motion review: one animation diff. None automatically fixes or approves; missing evidence is unknown, not clean.

### Refine an incumbent, do not accidentally replace it

Use impeccable audit for technical issues or critique for UX, within current authority. Authorize polish preserving identity/copy/routes/behavior. Add Emil only for components, mobile-native for browser/PWA defects. Break-ui inspection and prototype planning return proposals without writes; authorized harness/variant implementation stays isolated. Taste complements landing/portfolio/redesign, not dense settings UI. A new visual world requires a real redesign decision, not concealed polish.

### Match motion stage and platform

Animate vocabulary names and opportunities proposes static seams; improve-animations audits/plans existing motion; explicit review-animations judges diffs. Animate build constructs web motion, animate-expo handles native JS/TS, write-swift handles Swift. Mobile-native is browser/PWA work. Actual device feel, generated images and runtime results require observation, not source inference.

## Retired entrypoints: migration map

See the canonical [existing-home skill retirement map](README.md#existing-home-skill-retirement) for all 17 historical identifiers, surviving owners and non-pruning cleanup boundaries.

