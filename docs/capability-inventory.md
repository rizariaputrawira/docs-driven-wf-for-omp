# Original skill inventory and source review

This is the decision record for the 41 public names at the approved pre-change baseline. `Exposed` describes frontmatter metadata only: `yes` means model invocation was not disabled, `hidden` means `disable-model-invocation: true`; it does not mean inaccessible, permissioned, or enforced. OMP v18.6.3 hides disabled entries from model prompt listings but still permits user commands and `skill://` reads. `Local` means independently authored per the repository provenance record; `unclear` means the legacy snapshot's exact source/license remains unresolved. See [decision matrix](capabilities.md), [source provenance](../config/SKILL-SOURCES.md), and [migration map](migration.md).

| Original public name (folder) | Trigger, authority and procedure | Output / refs and overlap | Provenance, exposure, disposition |
|---|---|---|---|
| animate (`animate`) | Web motion build, opportunities, or terminology; writes only under task authority; distinct read-only branches. | Implementation / suggestions / glossary; build, opportunities, principles, vocabulary. Merged with audit/review modes. | Current procedures/references locally authored; legacy RECIPES provenance unresolved; exposed. MERGE as web-motion. |
| animate-expo (`animate-expo`) | React Native/Expo animations, gestures and haptics; implementation under authority. | Native JS/TS procedure and recipes; separate runtime from web motion. | Source caveat retained; exposed. RENAME expo-motion. |
| apple-design (`apple-design`) | Explicit specialist web gesture/spring/material/typography/reduced-motion guidance; implementation only when authorized. | Focused recommendations; overlaps UI and motion. | Source/license unclear; exposed. DEFER. |
| ask-sonner (`ask-sonner`) | Sonner setup, styling, toast defects; authorized diagnosis/wiring. | Library-specific guidance plus API reference; not a general notification owner. | Source/license unclear; exposed. DEFER. |
| brainstorming (`brainstorming`) | Unresolved consequential creative/behavioral choice or explicit stress test; stops before implementation approval. | Options, evidence, tradeoffs and proposal; stress-test reference. | Adapted pinned sources/full notices; exposed. KEEP. |
| brandkit (`brandkit`) | Brief-led image brand-board/logo-world concepts; generation tool-dependent. | Concept imagery only, no production identity/trademark proof. | Source caveat retained; exposed. RENAME brand-concepts. |
| break-ui (`break-ui`) | Requested UI stress test; inspection proposals or authorized dev-only fixture/harness, stops before production correction. | Schema-backed scenarios, observed defects; catalog reference. | Historical snapshot with local authority corrections; source/license unresolved; exposed. RENAME ui-stress-test. |
| code-review (`code-review`) | Requested PR/branch/WIP/correction review; read-only. | Separate correctness/standards and spec verdicts; optional review refs. | Adapted pinned sources/full notices; exposed. KEEP. |
| commit-message (`commit-message`) | Draft/improve message from actual changes; read-only. | Suggested message informed by staged changes/history; no commit. | Local; exposed. KEEP. |
| design-taste-frontend (`design-taste-frontend`) | Landing pages, portfolios, marketing redesign; selective guidance subordinate to Impeccable. | Composition, redesign, scroll and style references; not dashboards. | Locally authored current references; exposed. MERGE as ui-design reference. |
| diagnosing-bugs (`diagnosing-bugs`) | Difficult, flaky, performance or root-cause diagnosis; user's report is evidence; fix only authorized. | Causal hypotheses, root correction and original-path proof; tracing/wait refs. | Adapted pinned sources/full notices; exposed. KEEP. |
| domain-modeling (`domain-modeling`) | Active terminology/relationships, ambiguous domain or consequential ADR. | Counterexamples, terms/lifecycle and proposed records; glossary/ADR refs. | Adapted pinned source/full notice; exposed. KEEP. |
| emil-design-eng (`emil-design-eng`) | Focused component detail, typography and interaction polish; no permission grant. | Before/After/Why guidance; component-craft reference. | Locally authored current body/reference; exposed. MERGE as ui-design reference. |
| engineering-docs (`engineering-docs`) | Authoritative documentation context, governance, evidence-led audit and reconciliation; action-specific write authority. | Context, status, sequence, audits or owner updates; templates/references. | Adapted pinned source/full notices; exposed. KEEP. |
| github-triage (`github-triage`) | Authorized issue/PR queue or supplied item classification; read-only. | Evidence, type, priority, duplicates, gaps, next route. | Local; exposed. KEEP. |
| handoff-to-another-harness (`handoff-to-another-harness`) | Explicit pause/export/transfer; non-overwriting portable snapshot. | Snapshot or proposal-only content; portable format reference. | Adapted pinned source/full notice; exposed. KEEP. |
| image-to-code (`image-to-code-skill`) | Supplied/permitted website reference analysis, authorized implementation; generation only when requested/available. | Analysis or code with fidelity evidence; no fabricated fidelity. | Source caveat retained; exposed. KEEP public name; folder align. |
| imagegen-frontend-mobile (`imagegen-frontend-mobile`) | Requested mobile app screen/flow reference images; permitted available generation only. | Images, not code; platform/flow consistency. | Source/license unclear; exposed. DEFER. |
| imagegen-frontend-web (`imagegen-frontend-web`) | Requested website-section reference images; available permitted tool. | Separate images, not frontend code. | Source/license unclear; exposed. DEFER. |
| impeccable (`impeccable`) | UI workflow across new/refined/audited surfaces; user brief, product truth, authorization govern. | Full upstream 4.5.0 package with locally marked entrypoint adaptation. | Pinned Apache-2.0 and full license; exposed. RENAME ui-design; package retained. |
| improve-animations (`improve-animations`) | Bounded whole-surface existing-motion audit/plan/execute; audit read-only, plan channel authorized, execution separately authorized. | Prioritized evidence table, scoped plan, or authorized execution; audit/template. | Local; exposed. MERGE modes into web-motion; not default. |
| mobile-native (`mobile-native`) | Mobile browser/PWA viewport, touch, notch and status-bar behavior; authorized web fix. | Web-specific implementation and real-hardware limits; not native app. | Source caveat retained; exposed. RENAME mobile-web. |
| full-output-enforcement (`output-skill`) | Exhaustive output/truncation handling. | Duplicates global completion contract; rigid pause behavior adds no distinct repo capability. | Historical snapshot, source/license unresolved; exposed. RETIRE without moving material or inferring a grant. |
| pick-ui-library (`pick-ui-library`) | Explicit-only task-specific frontend library recommendation. | Curated recommendation, no install/replacement authorization. | Source/license unclear; hidden metadata. DEFER. |
| plan-review (`plan-review`) | Consequential multi-slice plan coverage/integration review. | Criterion-to-proof findings, read-only/non-approving; checklist ref. | Adapted pinned source/full notice; exposed. KEEP. |
| project-delivery (`project-delivery`) | Documentation-first new app/substantial end-to-end delivery or authorized resume. | Whole-boundary delivery, readiness and reconciliation; lifecycle refs. | Adapted pinned sources/full notices; exposed. KEEP. |
| prototype (`prototype`) | Explicit request to compare isolated alternatives; plan remains proposal, build requires authorization. | Isolated variants/picker; not automatic production integration. | Historical snapshot with local authority corrections; source/license unresolved; hidden metadata. RENAME ui-prototyping; keep hidden metadata. |
| ponytail (`ponytail`) | Conversational simplicity levels or one-shot review/audit/debt/help; actions remain distinct. | Minimal correct changes or reports; review/debt refs. | MIT notice retained, body revision caveat; exposed. RENAME code-simplicity. |
| resume-from-handoff (`resume-from-handoff`) | Read/load selected handoff only; never continue or inspect cited sources. | Faithful snapshot summary; GSD source/license record. | Adapted pinned source/full notice; exposed. KEEP. |
| retro (`retro`) | Requested retrospective on completed work; recommendation-only. | Evidence-grounded ranked lessons; learning extraction ref. | Adapted pinned source/full notice; exposed. RENAME retrospective. |
| review-animations (`review-animations`) | Explicit-only review of actual bounded animation diff; no edits/whole-surface audit. | Anchored findings/verdict, not native approval; standards. | Local; hidden metadata. MERGE mode into web-motion; preserve explicit-request instruction, no metadata gate claim. |
| security-audit (`security-audit`) | Explicit bounded deep implementation-level security audit; source-only. | Coverage and independent findings; attack-class references. | Adapted pinned source/full notice; exposed. KEEP distinct. |
| security-intake (`security-intake`) | Source-only external skill/plugin/MCP/dependency intake; no fetch/install/execute. | Purpose-authority disposition and gaps; checklist. | Adapted pinned source/full notice; exposed. KEEP distinct. |
| security-review (`security-review`) | Focused supplied diff/base-head security review; source-only. | Changed-source coverage, independent dispositions and limits. | Adapted pinned source/full notice; exposed. KEEP distinct. |
| stitch-design-taste (`stitch-skill`) | Explicit Stitch-specific design-input/example authoring from actual brief/context. | Design information, not canonical truth or generic UI workflow. | Source caveat retained; exposed. RENAME stitch-design-input. |
| tdd (`tdd`) | Explicitly requested/approved test-first red-green-refactor. | Vertical behavior cycles and honest RED/GREEN; test refs. | Adapted pinned sources/full notices; exposed. KEEP distinct from diagnosis/review. |
| unpublished-changes (`unpublished-changes`) | Report local/pushed/merged/released state; read-only and baseline-qualified. | Present/absent/unknown Git lifecycle evidence. | Local; exposed. KEEP. |
| upstream-update-review (`upstream-update-review`) | Check named/all used upstreams for useful changes; passive read-only. | Source-linked recommendations, not adoption. | Local; exposed. KEEP. |
| write-swift (`write-swift`) | Swift write/review/migration, concurrency, performance and bugs; implementation under authority. | Technical procedure with Swift 6.3 baseline; toolchain limits. | Source uncertainty retained; exposed. RENAME swift-development. |
| work-with-pr (`work-with-pr`) | Authorized bounded change implementation/PR preparation; no implicit publication. | Implementation and unpublished PR material; delegates specialist scope. | Local; exposed. KEEP. |
| writing-for-agents (`writing-for-agents`) | Author/revise agent guidance or separately authorized behavioral assessment. | Instruction authorship; assessment requires actual source-loaded independent evidence. | Adapted pinned sources/full notices; exposed. KEEP. |

The matrix is source review, not a claim that every branch was executed. `disable-model-invocation` is exposure metadata only; prose procedures and frontmatter do not create OS isolation, authorization or native approval.

## Exact baseline discovery metadata and reference inventory

Source: Git `ae057bd421a0a66354a0334d3e270b53f0a4f296`, original frontmatter and package paths. Descriptions below are historical discovery text, not active routing. The earlier table owns semantic authority/output and overlap review. `disable-model-invocation` is recorded as exposure metadata; explicit-only procedure boundaries are stated in the review table, not inferred from metadata. No original capability branch was executed for this inventory.

### animate (`animate`)

Build web motion, propose animation opportunities without edits, or name an effect from its description. Use build for implementation, opportunities for suggestions or "feel more alive", and vocabulary for "what is it called". Not native Expo motion, whole-surface audits, or explicit diff reviews.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `RECIPES.md`, `references/build.md`, `references/opportunities.md`, `references/principles.md`, `references/vocabulary.md`.

### animate-expo (`animate-expo`)

Build animations in React Native and Expo, making the decisions in the order that determines whether they feel right — should it animate, which thread it runs on, which properties, spring or timing, how the gesture hands off, how it degrades. Writes the implementation with Reanimated, Gesture Handler, Expo Router and expo-haptics. Use when animating anything in an Expo app, adding gestures, sheets, screen transitions, press feedback or haptics, or fixing motion that stutters on device. For web animation use `animate`.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `RECIPES.md`.

### apple-design (`apple-design`)

Apple's approach to interface design and fluid, physical motion, translated for the web. Use when building or reviewing gesture-driven UI, spring animations, drag/swipe/sheet interactions, momentum and interruptible transitions, translucent materials and depth, typography (optical sizing, tracking, leading), reduced-motion, or the design foundations (feedback, spatial consistency, restraint) behind Apple-style interfaces.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: none.

### ask-sonner (`ask-sonner`)

Guide to Sonner, the React toast library — install and wire up the Toaster, pick the right toast() call, promise and loading toasts, updating, dismissing and persisting toasts, styling, theming and icons, positioning and multiple toasters. Use when working with Sonner or troubleshooting it — toasts that don't appear, appear twice, lose their styles, ignore Tailwind classes, sit behind a modal, or don't follow dark mode.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `API.md`.

### brainstorming (`brainstorming`)

"Use before unresolved creative or behavioral design work, or for an explicit decision stress-test."

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.matt`, `LICENSE.superpowers`, `SOURCES.md`, `references/stress-test.md`.

### brandkit (`brandkit`)

Create image-led brand-board and logo-world concepts from the supplied brief and assets. The brief controls deliverables, panel count, layout, palette and brand direction. Generation requires an available permitted image tool. Output is a visual concept, not production code, vector artwork, trademark clearance or proof of actual product features.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: none.

### break-ui (`break-ui`)

Stress-test a requested UI surface with plausible or schema-backed edge-case data. For inspection-only requests, report scoped fixture and development-harness proposals without writing a toggle or fixture. Build an authorized development-only harness only when requested or otherwise authorized, inspect rendered behavior, report observed defects and proposed fixes, and stop before production corrections unless requested.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `CATALOG.md`.

### code-review (`code-review`)

"Use for requested PR, branch, WIP, working-tree or correction review of correctness, standards and spec fidelity."

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.matt`, `LICENSE.superpowers`, `SOURCES.md`, `references/fix-review.md`, `references/review-brief.md`.

### commit-message (`commit-message`)

"Use when asked to suggest, draft, or improve a Git commit message from actual repository changes; this advises only and never commits."

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `SOURCES.md`.

### design-taste-frontend (`design-taste-frontend`)

Optional design complement for landing pages, portfolios, and marketing-site redesigns. Reads the actual brief and incumbent; subordinate to Impeccable and the project's existing system.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `references/landing-and-portfolio.md`, `references/redesign.md`, `references/scroll-storytelling.md`, `references/style-directions.md`.

### diagnosing-bugs (`diagnosing-bugs`)

"Use for difficult bugs, flaky failures, performance regressions, or diagnosis before a root-cause fix."

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.matt`, `LICENSE.superpowers`, `SOURCES.md`, `references/condition-based-waiting.md`, `references/root-cause-tracing.md`.

### domain-modeling (`domain-modeling`)

"Use for active terminology or relationship modeling, ambiguous domain concepts, or consequential ADR work."

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.matt`, `SOURCES.md`, `references/adr-format.md`, `references/glossary-format.md`.

### emil-design-eng (`emil-design-eng`)

Use as a selective complement to Impeccable for component craft, typography, and small interface details. Use motion guidance only when motion is part of the requested work.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `references/component-craft.md`.

### engineering-docs (`engineering-docs`)

Use for engineering-documentation governance, resolving authoritative task context, or evidence-led engineering-document audits.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.gsd`, `SOURCES.md`, `references/architecture.md`, `references/audit.md`, `references/catalog.yaml`, `references/context-routing.md`, `references/game.md`, `references/manifest.md`, `references/mobile.md`, `references/omp-compatibility.md`, `references/operations.md`, `references/profiles.md`, `references/requirements.md`, `references/security.md`, `references/sequence.md`, `references/software.md`, `references/standards.md`, `references/testing.md`, `references/traceability.md`, `references/web.md`, `templates/architecture.md`, `templates/artifact.md`, `templates/manifest.yaml`, `templates/requirements.md`, `templates/threat-model.md`, `templates/traceability.yaml`, `templates/verification.md`.

### github-triage (`github-triage`)

"Use to triage an authorized GitHub issue/PR queue or classify a supplied issue or pull request."

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `SOURCES.md`.

### handoff-to-another-harness (`handoff-to-another-harness`)

Use for explicit pause/export or transfer to another harness; create a portable non-overwriting snapshot, or return proposed content only under read-only permissions.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.gsd`, `SOURCES.md`, `references/portable-format.md`.

### image-to-code (`image-to-code-skill`)

Analyze a supplied or permitted generated website reference and implement the requested frontend when authorized. Supplied-image analysis does not require new generation. Generate images only when requested or otherwise permitted and an available tool exists. Do not claim fidelity or build evidence without the corresponding reference and implementation.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: none.

### imagegen-frontend-mobile (`imagegen-frontend-mobile`)

Generate mobile-app screen or flow images only, when requested and an available permitted image-generation tool can provide them. The brief determines screen count, platform, states, content and framing. Preserve platform and flow consistency; do not write code or force device frames or extra screens.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: none.

### imagegen-frontend-web (`imagegen-frontend-web`)

Generate website-section reference images when requested, using the brief to determine sections, image count, composition and brand direction. When multiple sections are requested, provide one separate image per requested section if the permitted tool supports it. Image generation is tool-dependent; this skill produces reference images, not frontend code.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: none.

### impeccable (`impeccable`)

Use when the user wants to design, redesign, shape, critique, audit, polish, clarify, distill, harden, optimize, adapt, animate, colorize, extract, or otherwise improve a frontend interface. Covers websites, landing pages, dashboards, product UI, app shells, components, forms, settings, onboarding, and empty states. Handles UX review, visual hierarchy, information architecture, cognitive load, accessibility, performance, responsive behavior, theming, anti-patterns, typography, fonts, spacing, layout, alignment, color, motion, micro-interactions, UX copy, error states, edge cases, i18n, and reusable design systems or tokens. Also use for bland designs that need to become bolder or more delightful, loud designs that should become quieter, live browser iteration on UI elements, or ambitious visual effects that should feel technically extraordinary. Not for backend-only or non-UI tasks.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE`, `agents/impeccable_asset_producer.toml`, `agents/impeccable_documenter.toml`, `agents/impeccable_finish_reviewer.toml`, `agents/impeccable_manual_edit_applier.toml`, `agents/openai.yaml`, `reference/adapt.md`, `reference/adapt.native.md`, `reference/android.md`, `reference/animate.md`, `reference/audit.md`, `reference/audit.native.md`, `reference/bolder.md`, `reference/clarify.md`, `reference/colorize.md`, `reference/component-review.md`, `reference/craft-floor.md`, `reference/craft.md`, `reference/critique.md`, `reference/degraded/asset-producer.md`, `reference/degraded/documenter.md`, `reference/degraded/finish-reviewer.md`, `reference/degraded/manual-edit-applier.md`, `reference/delight.md`, `reference/distill.md`, `reference/doctor.md`, `reference/document.md`, `reference/extract.md`, `reference/generate.md`, `reference/harden.md`, `reference/hooks.md`, `reference/init.md`, `reference/ios.md`, `reference/layout.md`, `reference/live-setup.md`, `reference/live.md`, `reference/mode-operate.md`, `reference/mode-persuade.md`, `reference/mode-read.md`, `reference/new-work.md`, `reference/onboard.md`, `reference/open-design.md`, `reference/operate.md`, `reference/optimize.md`, `reference/overdrive.md`, `reference/polish.md`, `reference/quieter.md`, `reference/region-map.md`, `reference/routing.md`, `reference/shape.md`, `reference/typeset.md`, `reference/visualize.md`, `scripts/VERSION`, `scripts/command-metadata.json`, `scripts/data/font-index-failures.json`, `scripts/data/font-index.json`, `scripts/impeccable`, `scripts/impeccable.cmd`, `scripts/live-browser-dom.js`, `scripts/live-browser-ignores.js`, `scripts/live-browser-session.js`, `scripts/live-browser.js`, `scripts/modern-screenshot.umd.js`.

### improve-animations (`improve-animations`)

Audit existing motion across an explicitly bounded surface and propose prioritized, self-contained plans. Audit is read-only; planning and execution remain subject to native authority. Not a single-diff review.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `AUDIT.md`, `PLAN-TEMPLATE.md`.

### mobile-native (`mobile-native`)

Make a web app feel native on a phone — the small CSS and meta-tag fixes that separate "a website in a browser" from something that feels installed. Covers sticky hover states, tap highlight flashes, the 100vh bug, inputs that zoom the page, laggy taps, pull-to-refresh hijacking scroll, content under the notch, long-press selecting button text, carousels that scroll the wrong way, mismatched status bars, and the rule that you test on real hardware. Use when a web app is being built for or reviewed on mobile, when something "works in Chrome but feels wrong on my phone", when building a PWA, a bottom sheet, a carousel, a full-screen layout, or any touch interaction. For motion itself use animate; for React Native use animate-expo.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: none.

### full-output-enforcement (`output-skill`)

Overrides default LLM truncation behavior. Enforces complete code generation, bans placeholder patterns, and handles token-limit splits cleanly. Apply to any task requiring exhaustive, unabridged output.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: none.

### pick-ui-library (`pick-ui-library`)

Pick the right library for a given frontend task from a curated, opinionated list — numbers, OTP inputs, charts, command menus, virtualization, drag and drop, toasts, state, styling, and more. Only runs when explicitly invoked; it does not trigger on its own.

Exposure: `disable-model-invocation: true` (absent is represented as false). Original assets besides entrypoint: none.

### plan-review (`plan-review`)

Use for read-only coverage and integration review of a consequential multi-slice plan before native proposal or reapproval; trivial edits bypass it.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.gsd`, `SOURCES.md`, `references/coverage-checklist.md`.

### ponytail (`ponytail`)

Coding simplicity guidance with lite/full/ultra conversational levels, or one-shot complexity review, repository audit, shortcut debt ledger and help. Simplify implementation, never requested acceptance criteria.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.ponytail`, `references/complexity-review.md`, `references/debt-ledger.md`.

### project-delivery (`project-delivery`)

Use for documentation-first new applications, substantial/end-to-end delivery or authorized resume; ordinary bounded changes use native OMP workflow.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.gsd`, `LICENSE.matt`, `LICENSE.superpowers`, `SOURCES.md`, `references/documentation-baseline.md`, `references/implementation-brief.md`, `references/planning.md`, `references/resumption.md`, `references/review-feedback.md`, `references/specification.md`, `references/verification.md`.

### prototype (`prototype`)

Explicit-only design exploration that builds distinct isolated UI variants behind a picker when implementation is requested. Inspection or planning requests remain proposals with no source writes, launcher, server, or external tool calls.

Exposure: `disable-model-invocation: true` (absent is represented as false). Original assets besides entrypoint: `PICKER.md`.

### resume-from-handoff (`resume-from-handoff`)

Use only to read/load and summarize a selected portable handoff; strictly read-only, never inspect its cited files or continue its tasks.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.gsd`, `SOURCES.md`.

### retro (`retro`)

Use for a requested retrospective or evidence-grounded learning extraction from a completed session or delivered slice; recommendations do not authorize policy writes.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.gsd`, `SOURCES.md`, `references/learning-extraction.md`.

### review-animations (`review-animations`)

Explicit-only review of a supplied animation diff for purpose, responsiveness, interruption, performance risks and accessibility. Report findings, not implementation or whole-app audit.

Exposure: `disable-model-invocation: true` (absent is represented as false). Original assets besides entrypoint: `STANDARDS.md`.

### security-audit (`security-audit`)

Use only for an explicitly bounded implementation-level security audit or deep security review.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.cloudflare`, `SOURCES.md`, `references/ai-and-llm.md`, `references/attack-classes.md`, `references/availability.md`, `references/hunting.md`, `references/reconnaissance.md`, `references/supply-chain.md`, `references/validation-and-reporting.md`.

### security-intake (`security-intake`)

Use for source-only intake of external skills, plugins, MCP bundles, or dependency adoption and updates.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.skillspector`, `SOURCES.md`, `references/intake-checklist.md`.

### security-review (`security-review`)

Use for a focused security review of a supplied diff or explicit base/head change boundary.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.anthropic`, `SOURCES.md`, `references/change-review.md`.

### stitch-design-taste (`stitch-skill`)

Create or refine a Stitch-specific DESIGN.md example from the actual project brief and observed project context. The document guides authorized Google Stitch generation; it is not canonical project truth or a substitute for existing project owners. Use only when requested. External Stitch access is tool-dependent and requires explicit authorization.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `DESIGN.md`.

### tdd (`tdd`)

"Use for explicitly requested or approved test-first development, TDD, or red-green-refactor."

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.matt`, `LICENSE.superpowers`, `SOURCES.md`, `references/honest-tests.md`, `references/mocking.md`, `references/tests.md`.

### unpublished-changes (`unpublished-changes`)

"Use to report local Git changes and distinguish uncommitted, unpushed, unmerged, unreleased, and released work."

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `SOURCES.md`.

### upstream-update-review (`upstream-update-review`)

"Use when checking whether upstream or third-party projects used by this repository have useful new changes, for all managed sources or a named upstream."

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: none.

### work-with-pr (`work-with-pr`)

"Use when turning an issue or requested change into bounded implementation and pull-request preparation."

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `SOURCES.md`.

### write-swift (`write-swift`)

How to write modern Swift well — modeling with value types, Swift 6 data-race safety and approachable concurrency (@concurrent, main-actor-by-default, actors, task groups), protocols and generics (some vs any), API design, performance and ARC, Swift Testing, macros, and the modern language features agents don't know about yet. Use when writing, reviewing, or migrating Swift, or when a concurrency error, a hang, a data race, a retain cycle, or a performance problem needs fixing.

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: none.

### writing-for-agents (`writing-for-agents`)

"Use for authoring or revising agent guidance, skills, AGENTS.md, CLAUDE.md, or an authorized skill assessment."

Exposure: `disable-model-invocation: false` (absent is represented as false). Original assets besides entrypoint: `LICENSE.matt`, `LICENSE.superpowers`, `SOURCES.md`, `references/authoring.md`, `references/behavioral-assessment.md`, `references/omp-skill-contract.md`.
