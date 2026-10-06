---
name: stitch-design-input
description: Create or refine a Stitch-specific DESIGN.md example from the actual project brief and observed project context. The document guides authorized Google Stitch generation; it is not canonical project truth or a substitute for existing project owners. Use only when requested. External Stitch access is tool-dependent and requires explicit authorization.
---

# Stitch Design Taste — Semantic Design System Skill

## Scope and authority

This skill helps author a Stitch-specific `DESIGN.md` from the user's brief and relevant, observed project context. Label generated material as a proposed Stitch input/example. It does not become canonical project truth or supersede existing project documentation, design tokens, accessibility requirements, or the actual brief. Preserve existing ownership: update an existing design-system document only when requested and authorized; otherwise create the specifically requested example in the authorized location.

Stitch access is optional and tool-dependent. Do not call Stitch or its MCP integration without explicit authorization and an available permitted tool. If unavailable, finish the reachable source-based document work and state the exact limitation; do not claim a Stitch generation or validation occurred.

## Prerequisites
- Access to Google Stitch via [labs.google/stitch](https://labs.google/stitch)
- Optionally: Stitch MCP Server for programmatic integration with Cursor, Antigravity, or Gemini CLI

## Design information to capture

Include only what the brief and available project evidence support: visual intent, existing color and typography tokens, component states, layout and responsive behavior, interaction and motion intent, and relevant exclusions. Distinguish observed project facts from proposals and unresolved choices. Do not invent a palette, typeface, component convention, layout, or motion requirement to fill a template.

## Analysis

Read the actual brief and inspect relevant existing project guidance and implementation before proposing values. Existing compatible tokens and conventions take precedence. Describe density, composition, and motion only when supported by the product and brief; do not use numeric dials or preset defaults as requirements. Ask one focused question only when a material design decision cannot be resolved from the brief or project evidence.

### Color and typography

Record existing values and their roles when available. If the brief requests a new direction and no incumbent system governs it, propose values with a reason and label them as proposals. Do not impose an accent count, saturation ceiling, palette, banned colors, font family, type scale, or serif/sans rule independent of the actual product brief and accessibility needs.

### Composition, components, and responsive behavior

Describe hierarchy, content, component states, and responsive behavior relevant to the requested screens. Preserve actual content and product structure. Do not require a hero, inline imagery, asymmetry, a particular CTA count, card pattern, CSS layout method, viewport breakpoint, touch-target value, or mobile navigation pattern without a brief- or platform-based reason. Record real constraints and verify the requested target contexts when implementation or a visual result is in scope; do not claim verification that was not performed.


### Motion intent

Specify motion only when it serves the interaction and the brief. Motion is optional, not perpetual: do not require looping effects, staggered reveals, spring physics, or animation on every active component. State the purpose and relevant reduced-motion behavior when motion is requested. Do not prescribe an animation engine or assert that a property is universally hardware accelerated.

### Anti-patterns

List only exclusions grounded in the brief, observed product conventions, factual-content requirements, or accessibility. Do not present arbitrary font, color, layout, copy, asset-host, or component bans as universal rules. Never invent factual content or present placeholder assets/data as real.

## Suggested example structure

A Stitch-specific example may use this structure, adapting or omitting sections to fit the actual project:

```markdown
# Stitch Design Input: [Project or screen]

> Example input for Google Stitch. Not canonical project documentation.

## Brief and scope
[Actual requested outcome, audience/context if supplied, and explicit exclusions.]

## Observed project context
[Existing tokens, components, content, and constraints, with source references where useful. Mark unknowns.]

## Visual direction
[Brief-led proposal, clearly distinguished from observed facts.]

## Components and states
[Only the components and states relevant to the request.]

## Layout and responsive behavior
[Requested target contexts and evidence-based constraints.]

## Interaction and motion
[Requested behavior; omit motion if not needed.]

## Open questions
[Only material unresolved decisions.]
```

## Authoring principles

- Be specific about function and source: separate observed facts from recommendations.
- Reuse actual project tokens and content where compatible with the brief.
- Include precise values only when observed or intentionally proposed for a stated reason.
- Keep the document scoped to the requested Stitch use; do not turn preferences into universal bans.
- Do not claim that Stitch ran, rendered, or validated anything unless the authorized tool was actually used and its result inspected.
