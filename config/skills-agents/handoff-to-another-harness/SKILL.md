---
name: handoff-to-another-harness
description: Create a portable, self-contained Markdown handoff for continuing the current task in another AI harness. Use when the user asks to switch harnesses, transfer session state, continue elsewhere, or prepare a handoff. Writes a verified `.handoff/NNN-YYYYMMDD-handoff.md` artifact without modifying the current session.
metadata:
  version: "1.0.0"
---

# Portable Handoff

Create a file that another clean harness can use to continue the user's task without this conversation. This is an export, not an OMP `/handoff`: NEVER compact, reset, fork, or otherwise mutate the current session.

## Arguments

Treat user-supplied text as optional focus instructions. Honor it in the handoff, but do not put a destination harness name in the file name.

If the user supplies an output path, use it only when it does not overwrite an existing file. Otherwise use the artifact path below.

## Artifact path

1. Resolve the repository root. If no repository exists, use the current working directory.
2. Create `<root>/.handoff/` if necessary.
3. Inspect existing files matching `NNN-YYYYMMDD-handoff.md`, where `NNN` is exactly three decimal digits.
4. Select the next sequence number: `001` when no matching file exists; otherwise the highest matching sequence plus one.
5. Format the current local date as `YYYYMMDD`.
6. Write exactly:

   ```text
   .handoff/NNN-YYYYMMDD-handoff.md
   ```

   Example: `.handoff/001-20260916-handoff.md`.

7. NEVER overwrite an existing handoff. If the next sequence exceeds `999`, stop and ask the user to archive or rename older handoffs.

## Content requirements

Write exact technical state, not a vague summary. The next harness must be able to proceed without OMP session IDs, private transcript access, `artifact://` links, or `local://` links.

- Record exact relative paths, symbol names, commands, exit results, observed failures, and decisions.
- State only completed work that has evidence in the current working tree or recorded command output.
- Distinguish done, in-progress, and pending work.
- Use imperative language for the successor: “Run X”, “Inspect Y”, “Fix Z”; never “I need to”.
- Preserve user constraints and explicit non-goals.
- Use repository-relative paths where possible. For external files, give an accessible absolute path or explain how the receiver gets them.
- Do not include API keys, tokens, credentials, `.env` contents, or secret values. Name required environment variables without their values.
- Do not claim a test passed unless it was run successfully. Mark unrun verification explicitly.
- Do not include the destination harness name unless the user explicitly requests it in the document body.

## Required document schema

The file MUST contain exactly these top-level sections and this Progress nesting:

```md
## Goal
[What the user is trying to accomplish]

## Constraints & Preferences
- [Requirements, preferences, and explicit non-goals]

## Progress
### Done
- [x] [Completed work with paths, symbols, or command evidence]

### In Progress
- [ ] [Current work and exact state]

### Pending
- [ ] [Mentioned but not started]

## Key Decisions
- **[Decision]**: [Rationale and rejected alternative where relevant]

## Critical Context
- Repository root, branch/commit, and modified/untracked paths when applicable.
- Exact paths, symbols, command output, test results, failures, dependencies, and external prerequisites.
- Explain any unavailable artifact and how the receiving harness can obtain it.

## Next Steps
1. Read this handoff before editing. Verify the working tree, cited paths, and recorded command results; report any mismatch first.
2. [First actionable continuation step]
3. [Subsequent verification or completion step]
```

Do not add a title, preamble, wrapper, target-harness label, or extra top-level section.

## Procedure

1. Inspect the current task state, current working tree, and available verification evidence before drafting.
2. Create the directory and select the unique file name.
3. Write the handoff using the required schema.
4. Re-read the saved file and verify:
   - all required headings exist exactly once;
   - `Progress` contains `Done`, `In Progress`, and `Pending`;
   - every referenced path and command is actionable or clearly marked unavailable;
   - no OMP-only URI or secret appears;
   - `Next Steps` starts with the receiver verification instruction and has a concrete next action.
5. Report only the saved path and any material limitation that prevents a complete handoff.

## Receiving-harness instruction

When asked how to receive the artifact, provide this exact bootstrap prompt with the generated path substituted:

```text
Read `<handoff-path>` before doing any work. Treat Goal and Constraints & Preferences as authoritative. Verify the repository state, cited files, and recorded verification results. Do not repeat items marked Done. Report any mismatch before editing, then continue at Next Steps item 2.
```
