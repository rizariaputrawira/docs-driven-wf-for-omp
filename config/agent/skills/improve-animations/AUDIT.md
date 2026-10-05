# Motion audit dimensions

Independently authored replacement playbook. Shared policy and fallback timing examples live in `skill://animate/references/principles.md`; do not duplicate or override them here.

1. **Purpose and frequency**: map actual interactions and motion's user benefit. Frequent actions favor restraint; keyboard activation alone is not exclusion. Look for delayed focus/action and decoration on readable data.
2. **Easing and duration**: inspect project tokens, responsiveness and task-specific reasons. Ordinary UI defaults under 300ms; justified drawers can use 200–500ms. Built-in easing is not inherently defective. Example ranges never automatically justify slower existing behavior.
3. **Physicality and origin**: inspect trigger-connected surfaces, centered modal exceptions, abrupt scale entrances and feedback clarity. Non-motion feedback is valid; a pure fade or absence of press-scale is not inherently a finding.
4. **Interruption**: exercise or inspect rapid activation, reversal, cancellation and entry/exit coherence. Gestures may need velocity-preserving springs, safe thresholds, pointer capture, extra-pointer protection and boundary resistance. Distinguish deliberate hold progress from immediate response.
5. **Performance**: prefer transform/opacity, named properties and localized updates. Height/layout, clipping, blur and inherited-variable changes need cost analysis and actual verification. CSS/WAAPI/transform and library shorthand paths are not unconditional GPU/off-thread guarantees. Accordion/clipping exceptions remain possible.
6. **Accessibility**: reduced-motion may mean no animation. Preserve state/focus and non-motion feedback; gate hover-only behavior for appropriate pointers. Check keyboard/touch semantics, availability and essential content.
7. **Cohesion and tokens**: reuse actual conventions, avoid nearly identical parallel tokens and mismatched personalities. Stagger, blur and bounce need a purpose, not universal adoption.
8. **Missed opportunities**: identify grounded abrupt state changes, spatial relationships or rare completion moments within scope. Apply the same purpose/frequency/function gate; do not turn audit into decorative expansion.

Use actual source anchors. Rank consumer consequences and grounded effort, not invented measurements. Keep uncertain frequency, rendering and feel labeled. Audit remains read-only; runtime inspection must be available and permitted. Recommend narrow/wide, repeated activation, reduced-motion and real-device checks where relevant, without claiming source review proves them.
