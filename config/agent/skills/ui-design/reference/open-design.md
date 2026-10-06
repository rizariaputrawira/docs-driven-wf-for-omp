# Explicit OpenDesign artifacts

Locally authored OMP guidance. Impeccable owns the UI workflow; OpenDesign is an explicitly requested external artifact capability, not another role or automatic design lane.

## Ordered workflow

1. **Intent.** Enter only for an explicit OpenDesign request or an explicit task requirement for external generated/refined design artifacts. UI work alone never triggers this path. Impeccable remains primary, with Taste/Emil used selectively. Impeccable's named-element live-browser `generate` command is separate and needs no OpenDesign.

2. **Availability.** Inspect the actual loaded `open-design` MCP schema, the declaration's `http://127.0.0.1:7456/api/health`, and a permitted read-only MCP operation. Healthy HTTP alone is not MCP readiness. Report the exact evidenced missing prerequisite: Node, JavaScript CLI entrypoint, daemon, MCP admission, workspace access, or generation credentials/runtime. The executable launcher is needed only for lifecycle actions. Do not install, start, reconnect or provision without authority; the MCP declaration authorizes none of those actions.

3. **Project.** Use the exact user-specified handle, otherwise the established current task/repository handle, otherwise inspect `list_projects({})` and `get_project({project:<candidate>})`. Select only exactly one evidence-backed match. An explicit missing handle blocks work; it is not permission to choose another. Missing or multiple matches require user selection. Never use first/latest selection or an expiring active-project fallback. Pass the exact resolved project ID on every subsequent project-scoped call. `create_project` is separate and permitted only when current user authority covers creation. Do not create a registry or persistent mappings.

4. **Handoff.** Include only relevant known fields: objective, target surface, product context, audience, incumbent design system/tokens/components, required content, functional constraints, platform/viewports, accessibility, exclusions, degree of change, source anchors and requested output. Separate observed facts, user requirements, proposed direction and unknowns; invent no fields or facts. Ordinary context is the brief, incumbent and tokens. Applicable documentation-dependent context comes from established canonical engineering-docs/project-delivery owners, revision and approval evidence, not new mandatory documents or manifests. For refinement, include the actual existing entry/artifact and preservation constraints. Naming app checkout anchors does not make them readable by external OpenDesign: supply bounded relevant evidence in the prompt or supported accessible inputs. Never transmit secrets.

5. **Generate/refine.** With confirmed scope and native authorization, use the actual `start_run` MCP tool with explicit `project`, an evidence-backed `prompt`, and one UUID `requestId` per generation action. Reuse that UUID identically only if the response is lost; add no custom retry layer. Name the existing artifact and preservation constraints for refinement. Leave model/agent/plugin/skills/service-tier overrides unset unless established user configuration requires them; do not alter OMP routing. Record the returned `runId`; poll native `get_run({runId})` through queued/running to succeeded/failed/canceled. Surface failures without automatically commissioning replacement runs. If the installed schema differs, inspect before mutation and report the compatibility gap rather than guessing.

6. **Inspect artifact.** Retain actual project/run IDs, entry/artifact reference, preview URL and observed provenance. Session-bound URLs are not permanent project mappings. Inspect a permitted preview or delivered files using native `get_project`, `list_files`, `get_artifact({project,entry,include,maxBytes})`, and paged `get_file`, following the loaded schema. Bundles can truncate: inspect relevant omitted context before claiming completeness. Text-only `get_file` cannot prove binary visuals. A successful run containing only an agent clarification is not a completed design. Lifecycle actions never open a browser; permitted artifact inspection may use one. Missing rendering means source-only review.

7. **Reconcile.** Impeccable/current owner compares the artifact with the brief, incumbent behavior, product truth, existing system, accessibility and platform, then accepts, refines or rejects with evidence. Unsupported features, navigation, metrics, customer data, claims, pricing, backend behavior and states are omitted or reported, never implemented solely because generation supplied them. Artifact acceptance is neither implementation authorization nor canonical requirements.

8. **Return.** Exploration-only work returns a reviewed proposal and stops. Already-authorized implementation resumes normal Impeccable context/craft workflow and actual narrow/wide/interaction verification. Scope changes require native reapproval. Documentation-dependent work returns reviewed scoped composition and provenance to the established baseline/readiness/implementation-plan owners. That suite remains optional for ordinary work.

## Prerequisites and source scope

The bundled declaration uses Node with an absolute WSL/Linux JavaScript CLI entrypoint (`OMP_OPEN_DESIGN_CLI`) and fixed loopback `OD_DAEMON_URL=http://127.0.0.1:7456`. Explicit POSIX lifecycle commands instead need an absolute trusted executable wrapper (`OMP_OPEN_DESIGN_LAUNCHER`). Installation supplies or starts no services, projects or runs.

Interface/lifecycle evidence was inspected against official OpenDesign 0.23.1 source at immutable commit `5b19dfa4351b3eed33826ee72746a7c653c23a54`:

- [MCP tools](https://github.com/nexu-io/open-design/blob/5b19dfa4351b3eed33826ee72746a7c653c23a54/apps/daemon/src/mcp.ts)
- [CLI and lifecycle](https://github.com/nexu-io/open-design/blob/5b19dfa4351b3eed33826ee72746a7c653c23a54/apps/daemon/src/cli.ts)
- [WSL setup](https://github.com/nexu-io/open-design/blob/5b19dfa4351b3eed33826ee72746a7c653c23a54/docs/wsl-setup.md)

The integration discovery pinned this repository's HEAD/main/origin/main/live remote main to `f239d2f6b863dcf3e4214f51f5fa52b569f28de2`. Latest official release `open-design-v0.24.1` at `89e64d813bb1c7a11519b3f668f011f7017637d7` was inspected only, not installed or used to infer installed 0.23.1 behavior. A health/version response does not prove running-byte identity with the checkout. No upstream executable or prose payload is redistributed by this reference.
