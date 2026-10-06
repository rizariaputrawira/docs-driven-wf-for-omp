# Animation review standards

Independently authored replacement for legacy standards. Read `skill://ui-web-motion/references/principles.md` for shared motion constraints and fallback ranges. Source inspection cannot prove browser performance or gesture feel.

## Review dimensions

1. Purpose/frequency: identify actual user purpose and likely frequency. Frequent actions favor little/no motion; keyboard initiation alone is not a ban. Flag delayed actions/focus and decorative movement of readable data.
2. Timing/tokens: compatible existing tokens win. Ordinary UI usually stays under 300ms; a documented 200–500ms drawer can be justified by spatial/gesture needs. Do not flag built-in curves merely for being built-in, or slow every interaction because a recipe permits it. Inspect perceived response and task-specific reasons.
3. Origin/physicality: trigger-connected popovers should preserve their spatial source. Centered modals are exempt. Scale-from-zero may look abrupt; do not substitute universal press-scale mandates for meaningful feedback.
4. Interruption: repeated activation, reversal and cancellation should continue coherently from current state. Transitions or springs often suit this better than restarted entrance keyframes. Gesture motion may need velocity, pointer capture, extra-pointer protection and boundary resistance.
5. Performance: prefer transform/opacity and named transition properties. Check real costs for height/width/layout, clipping, filters and inherited variables. Accordion height and clipping are permitted with reason and actual verification. CSS/WAAPI/transform and library shorthands do not guarantee either GPU execution or failure. Inspect installed version and measured rendering when available.
6. Accessibility: reduced-motion alternatives can be gentle or completely motion-free. Keep state, action and focus immediate. Gate hover-only motion for appropriate pointers; preserve keyboard/touch feedback and semantics. Never rely on entrance motion to expose essential content.
7. Cohesion: reuse tokens and actual component behavior. Stagger, bounce and blur are optional techniques with task-specific reasons, not missing-feature findings by default.

## Evidence and severity

A slow ordinary entrance lacking reduced-motion handling is a grounded concern. A justified drawer duration is not automatically the same defect. Cite actual source lines and explain the consumer effect; separate observed defects, source risks and feel/performance checks still needed.

Recommend slow playback/frame inspection for uncertain coordination, actual representative load for rendering, and real devices for gesture feel. Do not invent proof. Review verdicts assess the requested diff only and are not native approval or permission to implement.
