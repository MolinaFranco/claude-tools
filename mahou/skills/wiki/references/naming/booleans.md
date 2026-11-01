# Naming booleans

verified: 2026-11-01

Answers how to name a variable, prop or state that holds a boolean.

## Knowledge

- A boolean starts with `is`: `isEditing`, `isOpen`, `isPending`. The name reads as a yes or no question about the thing it describes.
- The rule applies to local state as well as props: `const [isEditing, setIsEditing] = useState(false)`.
- A name a library already gives a boolean stays as the library gives it, such as `isPending` and `isError` on a TanStack Query result, or `disabled` and `checked` on a DOM attribute.

## Sources

- Program design session, 2026-11-01: a form's local state named after the flag it held, renamed to `isEditing`.
