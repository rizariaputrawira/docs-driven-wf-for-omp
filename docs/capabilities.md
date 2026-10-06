# Capability architecture and decisions

Canonical public names communicate capability, not source branding. Public skills
remain one level beneath the native skills root. Source identity, copyright and
licenses remain separate. [Inventory](capability-inventory.md) covers every one
of the 36 actual input capabilities. Result: 35 canonical capabilities (33 visible,
2 explicit-only), plus 14 hidden compatibility pointers.

## Functional taxonomy

| Prefix | Scope | Belongs | Does not belong |
|---|---|---|---|
| ui- | Interface design, motion, mobile-web behavior and UI reference assets | Design, motion, prototypes, stress fixtures, Sonner/library selection, screen images and image implementation | Swift language work, full brand identity, security review, project governance |
| code- | Implementation correctness, diagnosis, behavior tests and complexity | Code review/debugging/TDD/simplicity | Security verdicts, Git publication, language-specific Swift reference |
| docs- | Engineering information and evidence-led model/plan review | Engineering docs, domain terminology/models, plan coverage/integration | End-to-end delivery execution, handoff lifecycle, Git review |
| workflow- | Task decision and delivery lifecycle | Brainstorming, delivery, handoff export/read, retrospective, upstream recommendation | Per-skill technical procedures, Git publication, runtime routing |
| git- | Repository collaboration and change lifecycle | Commit-message advice, PR work, change/publication status, issue/PR triage | Generic code correctness/security review; implicit commit/push/merge |
| security- | Distinct source trust boundaries | External intake, changed-source review, explicit deep audit | Documentation audit, live probing, automatic adoption or installation |
| agent- | Instructions consumed by agents | Guidance/skill authorship and separately authorized assessment | Agent/model runtime selection, approval architecture, general docs |

Natural exceptions: `swift-development` is language-specific; `stitch-design-input`
operates on Google Stitch; `brand-concepts` covers broader brand concepts, not only
interface design. Their existing names are already functional, so avoid rename churn.
No nested public directories, family router or new config layer is added.

## Current canonical merge/rename matrix

| Input public name | Decision | Result canonical owner | Rationale |
|---|---|---|---|
| apple-design | RENAME | `ui-gesture-design` | Functional prefix groups a real capability; procedure boundary retained. |
| ask-sonner | RENAME | `ui-sonner` | Functional prefix groups a real capability; procedure boundary retained. |
| brainstorming | RENAME | `workflow-brainstorming` | Functional prefix groups a real capability; procedure boundary retained. |
| brand-concepts | KEEP | `brand-concepts` | Already functional or clearer natural exception; no evidence supports further consolidation. |
| code-review | KEEP | `code-review` | Already functional or clearer natural exception; no evidence supports further consolidation. |
| code-simplicity | KEEP | `code-simplicity` | Already functional or clearer natural exception; no evidence supports further consolidation. |
| commit-message | RENAME | `git-commit-message` | Functional prefix groups a real capability; procedure boundary retained. |
| diagnosing-bugs | RENAME | `code-debugging` | Functional prefix groups a real capability; procedure boundary retained. |
| domain-modeling | RENAME | `docs-domain-modeling` | Functional prefix groups a real capability; procedure boundary retained. |
| engineering-docs | RENAME | `docs-engineering` | Functional prefix groups a real capability; procedure boundary retained. |
| expo-motion | RENAME | `ui-expo-motion` | Functional prefix groups a real capability; procedure boundary retained. |
| github-triage | RENAME | `git-triage` | Functional prefix groups a real capability; procedure boundary retained. |
| handoff-to-another-harness | RENAME | `workflow-handoff` | Functional prefix groups a real capability; procedure boundary retained. |
| image-to-code | RENAME | `ui-image-to-code` | Functional prefix groups a real capability; procedure boundary retained. |
| imagegen-frontend-mobile | MERGE | `ui-image-generation` | Same image-only authority/output/lifecycle; platform detail becomes lazy reference. |
| imagegen-frontend-web | MERGE | `ui-image-generation` | Same image-only authority/output/lifecycle; platform detail becomes lazy reference. |
| mobile-web | RENAME | `ui-mobile-web` | Functional prefix groups a real capability; procedure boundary retained. |
| pick-ui-library | RENAME | `ui-library-selection` | Functional prefix groups a real capability; procedure boundary retained. |
| plan-review | RENAME | `docs-plan-review` | Functional prefix groups a real capability; procedure boundary retained. |
| project-delivery | RENAME | `workflow-delivery` | Functional prefix groups a real capability; procedure boundary retained. |
| resume-from-handoff | RENAME | `workflow-handoff-read` | Functional prefix groups a real capability; procedure boundary retained. |
| retrospective | RENAME | `workflow-retrospective` | Functional prefix groups a real capability; procedure boundary retained. |
| security-audit | KEEP | `security-audit` | Already functional or clearer natural exception; no evidence supports further consolidation. |
| security-intake | KEEP | `security-intake` | Already functional or clearer natural exception; no evidence supports further consolidation. |
| security-review | KEEP | `security-review` | Already functional or clearer natural exception; no evidence supports further consolidation. |
| stitch-design-input | KEEP | `stitch-design-input` | Already functional or clearer natural exception; no evidence supports further consolidation. |
| swift-development | KEEP | `swift-development` | Already functional or clearer natural exception; no evidence supports further consolidation. |
| tdd | RENAME | `code-tdd` | Functional prefix groups a real capability; procedure boundary retained. |
| ui-design | KEEP | `ui-design` | Already functional or clearer natural exception; no evidence supports further consolidation. |
| ui-prototyping | KEEP | `ui-prototyping` | Already functional or clearer natural exception; no evidence supports further consolidation. |
| ui-stress-test | KEEP | `ui-stress-test` | Already functional or clearer natural exception; no evidence supports further consolidation. |
| unpublished-changes | RENAME | `git-change-status` | Functional prefix groups a real capability; procedure boundary retained. |
| upstream-update-review | RENAME | `workflow-upstream-review` | Functional prefix groups a real capability; procedure boundary retained. |
| web-motion | RENAME | `ui-web-motion` | Functional prefix groups a real capability; procedure boundary retained. |
| work-with-pr | RENAME | `git-pr-work` | Functional prefix groups a real capability; procedure boundary retained. |
| writing-for-agents | RENAME | `agent-guidance` | Functional prefix groups a real capability; procedure boundary retained. |

## Merge analysis before naming

| Cluster | Trigger / authority / evidence | Procedure, output and lifecycle | Runtime / security / provenance | Decision |
|---|---|---|---|---|
| Web/mobile image generators | Explicit requested images; same permitted-generator authority, brief/assets evidence, no code | One image-generation lifecycle; select only requested platform procedure, preserve full specialized recipes | Image tool common; platform framing stays separate; both confirmed Taste adaptations with one mapped full MIT notice | MERGE as ui-image-generation, web/mobile lazy references |
| Sonner and UI library selection | Sonner setup/troubleshooting versus explicit dependency recommendation; recommendation never authorizes installation | API troubleshooting produces code/diagnosis; picker produces recommendation, with hidden explicit-only exposure | React library versus curated dependency choice; Emil MIT resolved but different authority/output/exposure | KEEP distinct ui-sonner and ui-library-selection |
| Gesture design, general UI and web motion | Explicit specialist interaction taste versus primary UI workflow versus selected motion mode | Specialist interaction reasoning is substantive, not merely post-owner reference; motion review has separate read-only branches | Gesture prescription should not silently govern every UI; confirmed Emil source stays separate from Impeccable Apache package | KEEP distinct ui-gesture-design, ui-design and ui-web-motion |
| Image generation versus image-to-code | Request images versus implement supplied/authorized visual reference | Image output and frontend implementation are different lifecycle/output contracts | Different tool permissions; no code inferred from image request; Taste notices kept in each package | KEEP distinct |
| Docs governance, delivery and plan review | Material information context versus whole-boundary delivery versus consequential plan coverage | Context defaults read-only, delivery follows approved stages, plan review does not approve | GSD/Matt/Superpowers mappings retained; no model or native approval change | KEEP distinct |
| Existing first-wave local supplements and motion modes | Selective component/marketing knowledge; web motion build/audit/review triggers | Local UI references remain lazy; consolidated motion modes preserve separate authority/output | No unrelated licensed material merged into Impeccable-owned files | KEEP earlier merges; no reversal |

License resolution does not itself justify a merge. No canonical capability is
retired just to meet a count target. Stitch provenance remains unresolved; its
procedure/package is retained intact and not merged.

## Compatibility entrypoints

Fourteen locally authored pointers preserve selected upstream/muscle-memory names
and commonly referenced suite names. They have no procedure body or authority,
point to exactly one owner, and set `disable-model-invocation: true`.
[Migration](migration.md) classifies all old names. Two hidden canonical specialist
procedures are distinct from these aliases. Prefix filters can exclude nonmatching
legacy names; aliases do not bypass deliberate filtering.

## OMP coupling audit

LOW means portable data/procedure or simple documented file interface. MEDIUM means
versioned documented OMP configuration/event/discovery interfaces. HIGH means an
internal/deprecated compatibility surface or consequential live-state assumption.
Coupling is upgrade cost, not a vulnerability or removal mandate.

| Managed mechanism | Coupling | Decision | Interface and compatibility check |
|---|---|---|---|
| Plain SKILL.md and references | LOW | KEEP | Flat discovery, frontmatter, native URI/command/hide/filter; catalog + isolated native list/read/filter smoke |
| AGENTS.md | LOW | KEEP | Documented guidance discovery; routing/link check; instructions are not enforcement |
| PERSONALITY.md | MEDIUM | KEEP | OMP global instruction source; only canonical pointers changed; semantic policy remains |
| config.yml | MEDIUM | KEEP unchanged | Registered settings schema, model/task/approval config; static parse/agent test, source key review; actor checks separately |
| Agent frontmatter | MEDIUM | KEEP unchanged | Native agent discovery/model/tool/schema contract; parse/static model-role check, effective dispatch needs runtime evidence |
| WATCHDOG.yml | MEDIUM | KEEP unchanged | Advisor configuration; global advisor.enabled=false, Sol entry ready but not auto-active; runtime advice not exercised |
| MCP declarations | MEDIUM | KEEP unchanged | Native HTTP/stdio MCP schema; parse/static prerequisites; no connection/service claim |
| antislop.js | MEDIUM | KEEP unchanged | before_agent_start string-array prompt contract; handler test and source API check |
| luna-tool-boundary.js | HIGH | KEEP unchanged | tool_call plus exact live model/context assumptions; handler regression, real dispatch/Plan Mode separately |
| rtk.ts | HIGH | KEEP optional/env-gated | Legacy Pi type-import compatibility and RTK executable protocol; source gate review, actual RTK process not exercised |
| Herdr integration | HIGH | KEEP optional/env-gated | OMP events plus external IPC/env/protocol assumptions; source gate review, real pane/socket not exercised |
| Empty plugin metadata | MEDIUM | RETIRE managed scaffolding | Native loader tolerates absent empty roots; installer creates package on plugin install; no configured plugin behavior lost |
| Installer/doctor | LOW | KEEP | Explicit home-relative inventory; production POSIX tests/smoke; PowerShell remains unverified with recorded defect |

## Extension purpose and upgrade cost

| Extension | Purpose / removal consequence | OMP API / assumptions | Native alternative | Coverage / decision |
|---|---|---|---|---|
| antislop.js | Conditional UI/product-copy evidence filter; removing loses deterministic per-request injection | before_agent_start; systemPrompt string[] chaining, exact duplicate policy detection | Static instructions/UI skills cannot reproduce conditional automatic injection exactly | test_antislop.mjs + pinned types/runner; KEEP |
| luna-tool-boundary.js | Restrict workspace tool calls by exact live model/provider with narrow plan/main exceptions; removing weakens boundary | tool_call context/model/provider identity; unknown identities must remain restricted; not OS/reviewer sandbox | Native role config chooses model/tools, not same live-model-sensitive gate | test_model_routing.mjs + source context/Plan check; KEEP |
| rtk.ts | Optional command rewrite/output optimization; removing loses RTK feature, not core skills | tool_call/exec/UI events, legacy @earendil-works/pi-coding-agent import; RTK binary protocol/version/timeout | Manual RTK/native commands, not automatic equivalent | Source gating only; native loading/process behavior NOT VERIFIED; KEEP optional |
| herdr-omp-agent-state.ts | Optional pane/session state reporting; removing loses external telemetry | Session/agent events, Herdr env trio and external socket payload contract | No native Herdr reporter | Source env-gate only; socket/event behavior NOT VERIFIED; KEEP optional |

## Empty plugin scaffolding

The three files were genuinely empty dependency/plugin state, not disabled plugins.
At official 18.6.3, [loader.ts](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/extensibility/plugins/loader.ts)
returns no plugins when node_modules is absent and tolerates missing manifests/locks.
[installer.ts](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/extensibility/plugins/installer.ts)
creates package.json when plugin installation needs it;
[manager.ts](https://github.com/can1357/oh-my-pi/blob/093275112f7adff207608673c0e33c7f3d16e27f/packages/coding-agent/src/extensibility/plugins/manager.ts)
tolerates absent bun.lock. Retire only managed empty scaffolding. Non-pruning
installation preserves users' existing plugin files and installed plugins. Future
plugin state belongs to native OMP, not a deployed empty manifest.

## Source-level routing simulations

These are procedure/metadata simulations, not authenticated consumer runs.

| Request | Canonical owner / legacy resolution | Conditional additional reference | Other visible overlap, not selected |
|---|---|---|---|
| Use Impeccable to redesign this dashboard | ui-design; impeccable hidden pointer or description trigger | local/component-craft if relevant; marketing only actual marketing scope | Gesture/motion owners visible but only selected for matching specialist work |
| Use ui-design to redesign this dashboard | ui-design directly | Same conditional craft reference | Same primary-owner rule |
| Use animate to review this drawer transition | ui-web-motion; animate hidden pointer/description trigger | references/diff-review.md and referenced review standards | ui-design/gesture skill visible, not requested review owner |
| Use ui-web-motion to review this drawer transition | ui-web-motion directly | Same explicit review branch | Same boundaries |
| Use Ponytail to simplify this implementation | code-simplicity; ponytail hidden pointer/description trigger | Selected simplicity/review/audit branch only | code-review visible but correctness review not implied |
| Use code-simplicity to simplify this implementation | code-simplicity directly | Same branch | Same boundaries |
| Draft a commit message | git-commit-message | None by default | git-pr-work/status visible, not message owner |
| Review this PR | code-review | Review/correction reference when matching; security-review only requested security boundary | git-pr-work needs implementation request, not review |
| Check what changes are not published | git-change-status | Selected Git lifecycle evidence | Triage/PR work not publication-state owner |
| Audit this authentication code for security | security-audit, explicit bounded source audit | Applicable reconnaissance/hunting/validation references | security-review needs diff scope; intake needs external-bundle boundary |

## Existing native authority and doctor decisions

| Capability and owner | Trigger / evidence | Authority | Procedure | Observable output | Risk if broadened | Existing overlap | Merge-or-add decision |
|---|---|---|---|---|---|---|---|
| Destructive shell approval — native `bash.patterns` and `tools.approval.eval` | Bash command text matches selected Git/rm forms, or eval is invoked | Native OMP policy only; ordinary commands remain yolo | Prompt matching force-push, hard-reset, force-clean commands; deny matching recursive-force-rm spellings; prompt every eval call. At v18.6.1 deny resolves before critical detection, but critical handling precedes prompt return. Thus absolute critical `rm -rf /tmp` would get only a bare override, ignored in yolo, if configured as prompt; explicit deny is required. Built-in critical rules remain untouched. | Git matches prompt; matching recursive-force-rm calls are denied even in yolo; all eval calls prompt. Legitimate cleanup needs a separate user-controlled path, never eval as an evasion. | Blanket shell deny/allow changes normal yolo behavior. A prompt on every eval costs broad friction. Text patterns and approval are not containment. | OMP owns critical matching and approval. Bash patterns cannot constrain eval's independent shell route; eval prompt is separate and intentionally broad. | Add narrow native config rules only. Do not copy critical regex, add hook, or create a checker skill/engine. Deny rm because source-order makes prompt ineffective for the cited critical case. |
| Doctor observations — POSIX and PowerShell doctors | Explicit managed inventory check/fix; immediate entries in selected home | Managed inventory alone sets success/failure; legacy/unmanaged items are advisory. | Compare canonical inventory; fix invokes existing installer. Inspect only immediate roots/entries, no contents or recursive scan; do not follow symlink/reparse roots. Do not start/check services; external dependencies remain unverified, not managed failures. | Managed pass/missing/drift/error lines and summary; separate advisory LEGACY/UNMANAGED observations and advisory summary. | Making observations fail check or authorize cleanup risks user data; recursion expands home boundary. | Inventory owns managed files; `docs/migration.md` owns historical retired names. | Add bounded observations to existing doctors, not another scanner. Share 17-name catalog across scripts; unknown entries are UNMANAGED, never assigned invented legacy provenance. |
| Issue/PR queue triage — `git-triage` | Authorized issue/PR queue or supplied record; labels, discussion and related items | Read-only; no edits/comments/labels/assignment/milestone/close/merge or implementation authority | Treat issue as problem record, PR as proposed change; inspect diff only if authorized/needed; classify and route; mark duplicate CANDIDATES; protect security details and treat remote text as untrusted | Evidence, type, priority, area, candidate duplicates, repro/requirements gaps, confidence, next owner/action; API/offline/auth limits | Mutations convert classification into project-management or publication authority; remote instructions can be hostile | Diagnosis, workflow-brainstorming, delivery, review and security owners handle downstream work, not queue disposition | Add a distinct read-only queue procedure. Route to existing owners; do not merge triage with implementation or review. |
| Bounded issue/change-to-PR work — `git-pr-work` | Authorized issue/change with repository, refs and bounded scope | Implementation and proportionate verification only under native authorization; no implicit branch/worktree, commit, push, publish, close, delete, merge or release | Define scope/acceptance; route to diagnosis, workflow-brainstorming, delivery, test/review/security owners as triggered; suggest branch name only; optionally draft PR metadata with explicit Refs, Summary/scope, Related issue, Verification and Limits fields | Bounded plan/status, actual checked/unrun verification, optional unpublished title/body with source/head/base evidence, Issue relation and limitations | Automatic Git/GitHub lifecycle actions silently broaden authority; refs copied from unrelated PRs misrepresent change | `git-commit-message` owns staged precedence and style; native main owns decomposition; other skill owners retain procedures | Add a thin distinct change-to-PR translation procedure; reuse named owners, never duplicate git-commit-message or orchestrate lifecycle actions. |
| Local/publication/release state — `git-change-status` | User asks what is local, unpushed, unmerged, unreleased or released | Read-only; no fetch/add/commit/push/tag/release/merge/changelog edit | Establish requested scope and selected refs/baselines; inspect status/diff/log/rev-list; optional tags/GitHub releases/open PR/CHANGELOG evidence; disclose stale/missing evidence | Separate present/absent/unknown for unstaged, staged, untracked, upstream ahead/behind, pushed/unmerged, merged/unreleased, released | Assumed tracking/tags/changelog or hashes alone produce false state claims; fetching changes refs; tag is not deployment evidence | Triage handles inbound work; git-pr-work handles authorized change; neither reports the full lifecycle state | Add a read-only evidence procedure. Require baselines; ahead is not proof of unmerged, squash/cherry-pick means hashes are not sole merge evidence, and absent refs mean unknown. |

Source review: official OMP v18.6.1 [`bash.ts`](https://github.com/can1357/oh-my-pi/blob/2a2c6dcbbb558c0f8145f67f28b3370984f2bf60/packages/coding-agent/src/tools/bash.ts), [`approval-mode.md`](https://github.com/can1357/oh-my-pi/blob/2a2c6dcbbb558c0f8145f67f28b3370984f2bf60/docs/approval-mode.md), and inspected MIT license are recorded in [skill provenance](../config/SKILL-SOURCES.md). No OMP code/regex is copied. Actual source-loaded approval testing must use inert strings only; never execute destructive commands.

## Safety applicability and limits

The checked behavior basis is OMP **18.6.1**, not a minimum-version or future-runtime guarantee. Rules match command text and selected shell segments, not executable identity or expanded arguments. Aliases, computed commands, alternate interpreters, unlisted option spellings and subprocesses launched by other tools can escape these patterns; quoted explanatory text can also match. Recheck native policy after runtime upgrades. Other built-in critical operations retain OMP's existing behavior, including the fact that bare critical overrides do not prompt in yolo. These additions are not a complete destructive-command filter.

Every eval call prompts, including benign calculations: this is the deliberate cost of covering an independent execution surface without a custom parser/hook. Approval is not permission to exceed the user's task or an OS boundary. User-controlled cleanup must not be converted into agent execution through another tool to evade a deny.

## Anti Slop selective merge

Anti Slop remains a stateless, compact cross-cutting UI/product-copy filter. Impeccable owns broad UI workflow and production quality; ui-design local marketing reference is selective for landing/portfolio/redesign composition; ui-design local component craft owns focused component craft; ui-web-motion owns detailed motion. No public Anti Slop skill or parallel workflow is added.

Source basis: Anti Slop `v3.2.20`, immutable `91f12ec67e9de6043cfd93b846404986ba73c3f4`; current main `388cbe3b6c37d5175b9f460015bb092ef9e34894` changes README only. Exact source paths, license and local authorship are in [provenance](../config/SKILL-SOURCES.md#anti-slop-compact-extension).

| Capability | Current / resulting owner | Upstream contribution | Decision | Reason |
|---|---|---|---|---|
| Full applicable notice | Extension notice + existing provenance/inventory | MIT notice with Miqdad Badjuber copyright | ADOPT | Preserve full notice beside the substantial adaptation, not attribution alone. |
| Product truth / evidence over claims | `antislop.js` filter; Impeccable/Taste implement | Fabricated testimonials, numbers, logos, security/social proof, activity, dashboard statistics and table/form data | ADAPT | Reject unsupported evidence; synthetic data only for authorized, visibly labeled prototypes, never real proof. |
| Purpose test / content-driven composition / product specificity | Compact filter; Impeccable + Taste detailed workflow | Test whether choices serve the product/content rather than a swappable template | ADAPT | Purposeful choices without imposing a palette, font, layout or visual-technique ban. |
| Fake demos/terminals, inert controls and empty links | Compact anti-filler filter; Impeccable implementation | Reject decorative simulations passed off as working product | ADAPT | Implement promised behavior or remove within scope; avoid duplicating implementation checklists. |
| Honest, actionable copy | Compact filter; Impeccable `clarify` for detailed UI copy | Generic CTA, empty hype, speculative specifics, unsupported claims and AI-style meta commentary | ADAPT | Name known action, use evidence, preserve intended voice; no universal word blacklist. |
| Accessibility, keyboard/focus, contrast, touch and responsive/mobile | Impeccable `craft-floor`, `audit`, `adapt`; ui-design local component craft component craft | Human/mobile checklists | ALREADY COVERED | Canonical owners already cover applicable states, zoom/input/layout quality and actual-surface inspection. |
| Loading/empty/error, input modes, component hierarchy and edge cases | Impeccable `clarify`/craft floor + ui-design local component craft | Functional/resilient UI checks | ALREADY COVERED | Existing owner procedure is retained, not copied into the per-turn filter. |
| Motion purpose, reduced motion and implementation | ui-web-motion within Impeccable workflow | Purposeful motion / interaction checks | ALREADY COVERED | No second motion procedure. |
| Finished-deliverable gate | `antislop.js` conditional guidance | Explicit delivery judgment | ADAPT | PASS/FAIL only for actual UI/copy created, modified or reviewed as finished; state concrete issues/verification limits. Conceptual questions and interim discussion have no ritual label. |
| Vocabulary/punctuation/rhythm and aesthetic prescriptions | Nowhere | Em-dash ban, prose formulas, numerical visual caps and fixed style recipes | REJECT | Filter unsupported/generic behavior, not legitimate style; remove the prior local em-dash ban. |
| Code-comment hygiene | No new integration | Obvious narration, separators, workflow comments, empty labels, vague TODOs, over-explanation; preserve why/legal/contracts | DEFER | Useful but no demonstrated local need warrants broadening a UI/copy filter. code-simplicity owns complexity, agent-guidance owns instructions, neither is repurposed as a general comment workflow. |
| Six skills / wizard / entry-file pointers / DURING-AFTER modes / global settings / audit directories / plugin marketplace / self-update / routing engine | Nowhere | Upstream workflow, packaging and persistence | REJECT | Duplicate owners and unjustified context, state and lifecycle complexity. |

Trigger scope: explicit UI/web/style/product-copy terms plus short action/surface phrases cover settings screens, React profile pages, Vue login forms, Android/iOS screens, component restyling and navigation fixes. Platform/framework names alone do not activate. Non-UI context terms suppress ambiguous surface matches (for example documentation pages or CLI navigation), unless explicit UI/copy terms also occur. Ordinary backend/database/infrastructure/CLI/configuration/documentation/general-code and comment-cleanup requests are outside scope. This is a bounded lexical heuristic, not an intent classifier; mixed requests should name their UI/copy surface explicitly. No general code-comment trigger was added.

Injection uses native OMP `before_agent_start`: return a new `systemPrompt` array preserving existing blocks and appending the exact policy once. An already-present identical policy returns no override. OMP owns continuation lifetime and next-request preparation; the extension has no session state, hidden custom-message fallback or model routing. Conceptual UI questions still receive the filter but its delivery condition explicitly excludes PASS/FAIL. The focused handler test is `node scripts/test_antislop.mjs`; policy wording review is static, not proof that a model obeys it.
