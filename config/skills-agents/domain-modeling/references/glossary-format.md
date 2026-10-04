# Glossary format

Load when recording settled terminology. Existing canonical structure wins; the following is a lean fallback, not a reason to relocate or multiply glossaries.

## Contents

Use a context title and one or two sentences describing the business/domain boundary. Under `Language`, give each settled term a tight definition of what it **is**, usually one or two sentences. List discouraged synonyms only when needed to distinguish actual competing project language. Group related terms when natural clusters exist; otherwise a flat list suffices.

Example settled wording:

```markdown
# Ordering

Ordering records customer commitments and their fulfilment state.

## Language

**Order**: A customer's commitment to purchase a specified set of items.
_Avoid_: Transaction, purchase request

**Invoice**: A request for payment for an amount owed by a customer.
_Avoid_: Payment, receipt
```

Before adding a term, check whether it names a project-specific concept and whether an existing definition already owns it. General programming vocabulary, implementation choices, requirements, open questions and scratch notes belong elsewhere. Distinct concepts must not be made synonyms merely because the code uses the same primitive type.

## Multiple contexts

If an existing glossary map defines separate contexts, preserve it and update the correct context owner. A map explains each context, links its glossary, and describes meaningful relationships: which context owns a concept, references another context's identity, or produces information consumed by it. It is not a second copy of every definition or a forced event architecture.

Infer context from the current topic and actual map. If ownership remains materially ambiguous, state the competing owners and seek the decision before writing. Do not create a multi-context map for a single-context project. With no existing owner, a root `GLOSSARY.md` is created lazily only for an authorized settled term.

## Write criterion

A glossary update is ready when the definition distinguishes the concrete counterexamples discussed, uses the selected canonical term consistently, keeps approved intent when code is deficient, and has one maintained owner. Report any remaining implementation mismatch separately rather than embedding code details into the glossary.
