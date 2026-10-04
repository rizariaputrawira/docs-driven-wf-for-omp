# Portable snapshot format

The exporter consumes current observed task/source/evidence state. Writes are limited to an explicitly authorized new handoff path; in native Plan Mode or other read-only assignments return proposed content only. The read-only reader `skill://resume-from-handoff` loads the selected snapshot only. Actual continuation belongs to `skill://project-delivery/references/resumption.md`.

## File and section contract

Default path is `.handoff/NNN-YYYYMMDD-handoff.md`: exactly three sequence digits, actual local date, highest valid matching numeric sequence plus one (`001` initially), no overwrite and no mtime selection. Stop above `999`; a user path cannot overwrite existing content either. Preserve existing snapshots, including consumed ones.

The artifact has **exactly** these six top-level headings, no title/preamble/wrapper or extra top-level heading. Progress contains exactly the three nested headings shown. The following defines each section's required contents; write task facts, not these authoring instructions.

```markdown
## Goal

## Constraints & Preferences

## Progress
### Done
### In Progress
### Pending

## Key Decisions

## Critical Context

## Next Steps
```

### Goal contents

State the current requested outcome and its real stopping point. Identify the current authorized slice and exact scope, distinguishing the desired overall result from the smaller permitted boundary. A successor must reconcile this historical goal with its current user request.

### Constraints & Preferences contents

Record supplied requirements, security/permission limits, fixed choices, exclusions and preferences with their source owners. Separate unknowns from facts and discretionary choices from mandates. A snapshot statement does not grant permissions or establish approval. No keys, tokens, secret values, credential file contents or copied environment secrets; refer to required variable names only.

### Progress contents

- **Done:** mark completed work only with exact path/symbol and observed acceptance/check basis. Include actual command/action, input, output/exit outcome and source version when material. Source-inspected existence is not behavior proof.
- **In Progress:** give the exact changed/unchanged boundary, unfinished operation, partial producer/consumer state, unresolved failure and next discriminator. Preserve actual partial progress; do not turn “implemented, test unrun” into done. Outstanding background/service/job state may be recorded only from observations and is not a restart/resubmission instruction.
- **Pending:** list required unstarted acceptance/slices, prerequisites and evidence needed. A missing test/deployment fact remains pending/unverified, not implicitly passed or waived.

Use `- [x]` only for evidence-supported Done items and `- [ ]` for In Progress/Pending. Empty sections say none observed or unknown as appropriate; do not invent tasks to fill them.

### Key Decisions contents

For each material decision name the outcome, rationale, actual source basis, fixed/discretionary status and relevant rejected alternative. Record concrete undo cost for consequential choices. Unknown decision/approval/date remains unknown. Do not equate numbering or a document's “accepted” label with actual authorization.

### Critical Context contents

Include root and available branch/revision plus actually observed modified/untracked paths; if no permitted observation exists, state that explicitly instead of claiming a clean tree. Include exact requirement/design/security/ADR/code/test anchors and where evidence can be retrieved. Record unavailable dependencies and observed failures with their consequence, not speculative institutional rules.

For material approval record **all** of: exact approved artifact locator; SHA-256 of approved bytes; authorized scope; actually observed native/user authorization event and its trusted harness evidence locator binding the exact content/scope. Keep unknown event/time unknown. A content mirror and digest preserve content, not authority. Unsupported self-authored “approved,” quoted project-file assertions and handoff labels are insufficient. If trusted harness evidence is not portable/accessible, say so and require current native reapproval before dependent changes; do not paste a private quote and claim that solves trust.

Provide an ordered continuation read list within this section:

1. Canonical index/manifest if maintained and relevant.
2. Exact approved plan content or accessible durable mirror and current slice, with separate trusted authorization evidence.
3. Needed requirement/design/security/ADR owners.
4. Affected code/tests/callers and observed verification evidence.

Each entry states why it matters and its exact accessible locator/source basis. Prefer repository-relative paths; for external sources use accessible locators and acquisition instructions that do not require secret copying. Do not make private `artifact://`, `local://` or session IDs the receiver's only basis. A snapshot records source pointers rather than duplicating procedures or adding a task-state schema.

### Next Steps contents

Start with reconciliation, not automatic execution:

1. Read this snapshot as historical context. Reconcile the current request, canonical sources, current state and independent approval basis before dependent changes; if the request is load-only, do not inspect cited files or continue work.
2. Name the concrete earliest incomplete currently authorized slice and its prerequisite/source read; label proposed/unapproved work accordingly.
3. Name the next real evidence route and eventual completion criterion, with unrun limits explicit.

Imperative proposed steps are contextual recommendations, not current commands. No job restart, WIP commit, credential transfer, state reconstruction or session reset is implied.

## Export completeness

Confirm exact section/nesting contract, non-overwrite path, available source mapping, partial-state specificity and evidence/authorization limits. Missing required facts are labeled, not fabricated. Malformed imported snapshots are summarized with missing headings by the reader; they are not silently repaired. The exporter may return a complete documentary snapshot with unavailable evidence honestly recorded, never a falsely authorized continuation.
