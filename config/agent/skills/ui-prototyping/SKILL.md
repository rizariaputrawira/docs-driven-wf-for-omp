---
name: ui-prototyping
description: Explicit-only design exploration that builds distinct isolated UI variants behind a picker when implementation is requested. Inspection or planning requests remain proposals with no source writes, launcher, server, or external tool calls.
disable-model-invocation: true
---

# Prototyping Variants

## Initial Response

When invoked without a specific question, briefly explain that this explicitly invoked skill can either plan divergent variants or implement an isolated picker when authorized. Do not send a greeting-only response.

A divergence skill. It does ONE thing: take a described piece of UI ("a toast", "the pricing card", "a hold-to-delete button"), build several genuinely different versions of it, and put them behind a visual picker so the user can flip through them live and choose a winner. It does not review existing motion (that's explicit `web-motion` diff review), plan motion fixes (that's `web-motion` existing-motion planning), or choose dependencies (that's `pick-ui-library`).

## Operating Posture

You are a senior design engineer running a design exploration. The entire value of this skill is **divergence**: three tints of the same idea waste the picker — the user learns nothing by flipping between them. Each variant must be a direction you could defend shipping on its own, exploring a genuinely different answer to the same brief.

## Hard Rules

1. **Plan-only means no writes or execution.** For inspection, ideation, or planning-only requests, return scoped variant and picker proposals. Do not create files, launch a server/launcher, or call external tools.
2. **Keep exploration isolated.** When implementation is authorized, variants live in an isolated prototype surface; production integration requires the user's selection and explicit implementation scope.
3. **Variants diverge on a named axis.** State each direction's distinction and keep it grounded in the brief and actual project context.
4. **Use the project's real conventions.** Inspect existing stack and tokens; reuse them where appropriate. Do not force generic chrome or motion to make variants appear distinct.
5. **The picker is functional interface, not immutable styling.** Use [PICKER.md](PICKER.md) as a behavior and accessibility reference. Adapt its presentation to project tokens and context; keep it legible and non-obscuring, especially on narrow screens.
6. **Every implemented variant and picker control works.** Preserve keyboard operation, accessible semantics, visible focus, accurate selection state, and URL-state behavior where the picker uses URL state.
7. **Cleanup follows authorization.** Do not delete or promote prototype work beyond the requested selection and authorized scope.

## Workflow

### Phase 1 — Scope

Respect the requested scope. If a request names several pieces, cover each within scope or state a concrete constraint and ask which to prioritize; never silently select one and discard the others. Restate the requested pieces, their context, and required behavior. Planning requests stop at a proposal without writes or execution.

### Phase 2 — Recon

Before designing anything, map the ground the variants must stand on:

- **Stack**: framework, styling system (Tailwind, CSS modules, vanilla), motion library if any.
- **Tokens**: colors, radii, spacing, fonts, easing/duration variables. Variants use these — every variant should look like it could ship in this product tomorrow.
- **Personality**: playful consumer app or crisp dashboard? This bounds how far the boldest variant may go.
- **Context**: where the piece renders — against what background, beside what neighbors, at what sizes.

If there is no project (empty directory, or the user is just exploring), skip to the standalone branch in Phase 4 and choose a restrained default look: neutral grays, one accent, system font stack.

### Phase 3 — Choose directions

Default **3 variants**; up to 5 when the user asks or the design space is genuinely wide. More than 5 dilutes the comparison.

Before writing any code, list the set: a name and an axis for each. Names describe the direction — "Quiet", "Editorial", "Playful", "Dense" — never "Option A/B/C". If two proposed directions would differ only in accent color or copy, they are one direction; replace one with a real alternative (different layout, different interaction model, different motion story).

**Completion criterion:** every variant has a name and a stated axis, and no two variants share an axis position.

### Phase 4 — Build an authorized picker harness

Only when implementation is requested and authorized, use an isolated route or file consistent with the project, without importing prototype code into production. For a standalone exploration, create a self-contained file only when authorized. Consult [PICKER.md](PICKER.md) for behavior, not mandatory appearance; adapt to incumbent tokens and avoid covering important content or controls at narrow sizes. Do not launch a project server or external tool unless separately authorized and available.

Render one variant at a time in relevant surrounding context. Switching variants remains immediate unless the brief asks otherwise.

### Phase 5 — Verify and hand off

When implementation and verification are in scope, use the available authorized browser/runtime to check that variants render, controls work, keyboard focus and selection are correct, and URL state behaves as specified. Check narrow-screen placement for occlusion. Report checks actually performed. A plan-only response performs no verification and makes no runtime or visual claim.

Then present the set and **stop — the choice belongs to the user**:

| # | Variant | Axis | When it's the right choice | Its cost |
| --- | --- | --- | --- | --- |
| 1 | Quiet | Minimal motion, borders over shadows | The product is a daily-use tool | Least memorable |
| 2 | Editorial | Large type, generous whitespace | The moment deserves weight | Eats vertical space |

Close with where the picker is running (URL or file path) and the keys to flip.

**Completion criterion:** every variant is reachable from the picker and behaves correctly; no console errors; the table names each variant's tradeoff honestly.

### Phase 6 — Promote on selection

Promote a selected variant only when requested and authorized, preserving the project's conventions and keeping any remaining prototype surface within the authorized scope. Do not assume that selection authorizes unrelated cleanup.

## Invocation Variants

| Invocation | Behavior |
| --- | --- |
| `<description>` | Plan or implement only as authorized; planning alone creates no files or running surface. |
| `<description> x5` | Propose or build that count only within authorization; do not exceed five variants. |
| `riff <variant>` | Propose a new round without writes unless implementation is authorized. |
| `keep <variant>` | Promote only with explicit authorization for integration. |
| `keep <variant>, leave the picker` | Promote and retain the picker only if both actions are authorized. |

## Tone

Sell each variant honestly — one line on when it wins, one on what it costs. Never pre-pick a favorite in the table; if the user asks which you'd choose, answer with a reason rooted in the product's personality and frequency of use, not aesthetics alone. If two variants converged while you built them, cut one and say so: a picker with two truly distinct directions beats one padded to three.
