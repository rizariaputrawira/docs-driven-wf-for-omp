---
name: git-pr-work
description: "Use when turning an issue or requested change into bounded implementation and pull-request preparation."
---

# Work with an issue or pull request

Translate the authorized request into a bounded change and useful PR material; this is not an orchestration engine and does not grant GitHub or Git mutation authority.

1. Establish the requested issue/change, repository, current branch and refs, source/head/base evidence, and exact permitted scope. Read authoritative project guidance when documentation dependencies are material. Identify acceptance evidence, exclusions, risks, and unresolved requirements before implementation. If unclear behavior is consequential, route to `workflow-brainstorming`; difficult causes to `code-debugging`; substantial documentation-dependent delivery to `workflow-delivery`; focused security review/intake to `security-review`/the appropriate existing security workflow.
2. Suggest a branch name only. Do not create/switch branches or worktrees implicitly. Obtain any needed user authorization before implementation or Git/GitHub mutation. Implement only the bounded approved change; keep native main-agent decomposition and permissions in force. Route small clear work to native implementation; use `code-tdd` only when requested/approved test-first work applies. Do not add commits, push, force-push, publish, close, delete, merge, or release.
3. Verify proportionately within authorization and report checks actually run versus unrun. For requested review of a proposed change use `code-review`; focused security diff review uses `security-review`. Use `git-commit-message` only for an actual git-commit-message request/need before separately authorized Git mutation; that owner handles staged precedence and repository style. Never duplicate or override it.
4. Draft PR title/body without publishing if useful or requested. Include explicit headings/slots: **Refs** (source/request evidence; head is current or suggested/not-created; base known, proposed, or unknown), **Summary and scope**, **Related issue**, **Verification** (observed and unrun), and **Limits**. Mark each unknown ref unknown; never copy another PR's refs onto this change. Do not insert closing keywords unless requested. Make no PR or Issue API changes without explicit authorization.
5. Return the bounded plan/status and concrete next manual steps. Explain which authorized actions remain (for example add/commit/push/create/merge) without performing them. A draft is useful for a human to apply manually.
