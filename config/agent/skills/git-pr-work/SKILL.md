---
name: git-pr-work
description: "Use when turning an issue or requested change into bounded implementation and pull-request preparation."
---

# Work with an issue or pull request

Translate the authorized request into a bounded change and useful PR material; this is not an orchestration engine and does not grant GitHub or Git mutation authority.

1. Establish the requested issue/change, repository, current branch and refs, source/head/base evidence, and exact permitted scope. Read authoritative project guidance when documentation dependencies are material. Identify acceptance evidence, exclusions, risks, and unresolved requirements before implementation. If unclear behavior is consequential, route to `workflow-brainstorming`; difficult causes to `code-debugging`; substantial documentation-dependent delivery to `workflow-delivery`; focused security review/intake to `security-review`/the appropriate existing security workflow.
2. Suggest a branch name only. Do not create/switch branches or worktrees implicitly. A direct request for implementation or Git/GitHub action supplies task authority within its scope; native policy still governs, and unresolved material ambiguity or a newly introduced consequence requires resolution before that dependent action. Implement only the bounded requested change. Route small clear work to native implementation; use `code-tdd` only for requested test-first work. Do not add commits, push, force-push, publish, close, delete, merge, or release unless requested.
3. Verify proportionately within scope and report checks actually run versus unrun. For requested review of a proposed change use `code-review`; focused security diff review uses `security-review`. Use `git-commit-message` for a commit-message request/need before Git mutation; that owner handles staged precedence and repository style. Never duplicate or override it.
4. Draft PR title/body without publishing if useful or requested. Include explicit headings/slots: **Refs** (source/request evidence; head is current or suggested/not-created; base known, proposed, or unknown), **Summary and scope**, **Related issue**, **Verification** (observed and unrun), and **Limits**. Mark each unknown ref unknown; never copy another PR's refs onto this change. Do not insert closing keywords unless requested. A direct request for PR or issue API changes authorizes only those requested changes, subject to native policy and unresolved material consequences.
5. Return the bounded plan/status and concrete next steps. Explain which authorized actions remain without performing unrequested actions. A draft is useful for a human to apply manually.
