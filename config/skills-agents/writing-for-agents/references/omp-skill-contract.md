# Passive OMP skill contract

Load when packaging an OMP skill or authoring skill-selection guidance. This is an adaptation of upstream invocation/pointer ideas to the approved native OMP interface contract; upstream provider metadata and tool names are not portable permissions. Published contracts are interface reference, not proof about an installed or future OMP version.

## Package and trigger

Use a canonical skill directory with `SKILL.md`; supported discovery reads the one-level entrypoint metadata. Newly authored frontmatter in this suite contains only `name` and `description`. Name is the retained canonical identity. Description says when to load, not the steps, output schema or enforcement claims. Provenance/license belongs in `SOURCES.md` and actual notice files, not invented flags.

Place conditional references/templates within that owner and link exact relative paths. Cross-skill shared guidance uses a conditional `skill://name/relative-path` pointer to the enabled owner rather than copying its procedure. Namespace/collision handling depends on the actual OMP registry; do not create a second same-named managed variant or hard-code a package installation path.

## Real invocation and loading

Use the currently available native discovery/URI/task interfaces, confirmed for the installed version. Explicit plain-file loading is also a distinct authorized route: read the actual canonical `SKILL.md`, state its base directory, and resolve local references against it. A named skill or slash token alone is not evidence its body was read. Skill content does not retroactively activate runtime keywords, change model thinking, grant tools or serialize approval.

If an enabled suite is explicitly requested but convenience URI support is unavailable, a known canonical file may be loaded only under that explicit authorization; mark native discovery unverified. Deliberate disablement/filtering wins and does not trigger file-load fallback or automatic setup. Missing suite documentation does not block ordinary native OMP work; only explicitly requested unavailable suite-specific proof is blocked. Renewed explicit file-load authorization is different from automatic reactivation.

## Consumer/permission binding

State the actual consuming role and task result contract. Dispatch uses the available public task schema and permitted tools, not upstream Skill/Task aliases, model tiers or plugin engines. Read-only instructions limit behavior but are not OS containment; a name/tools list/model ID alone does not establish loaded definition provenance or sandboxing. No metadata field in this passive package enforces those properties.

Plan Mode/read-only actions return their result through an allowed channel without checkout writes or execution. Authoring a skill cannot change runtime config, approval state, services, hooks or credentials. For independently dispatched source inspection, the controller must establish the real role/definition basis and limits required by the consuming workflow.

## Independent compatibility layers

Separate package/inventory/link/notice checks, installed discovery/URI/custom-agent parsing, and actual tool-enabled behavior. Exact installed version and exercised layer accompany any compatibility claim. An upstream moving doc or prior version pass is not current acceptance. For an authorized upgrade assessment load `skill://engineering-docs/references/omp-compatibility.md`; do not update/install/downgrade OMP from this skill.

The accepted contract deliberately omits upstream `disable-model-invocation`, mandatory router skills and Claude-specific mechanics. Concise conditional AGENTS routing can point to canonical owners without a new engine. An unavailable interface leaves the corresponding suite claim unverified, never widens permissions or selects a same-named substitute as proof.
