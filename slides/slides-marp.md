# Slide Spec

This file defines the reusable Marp slide style and content rules for lecture decks in this repository.

## Goal

Create slides that are:

- visually polished
- compact enough to fit the page
- easy for another AI to read and regenerate
- separate from wiki source pages

## Folder Rule

- Wiki source pages stay in `wiki/sources/`
- Slide decks stay in `slides/<deck-name>/`
- The main slide source should usually be named `lecture-name.md`
- Exported files should live next to the source as `.html` and `.pdf`

## Visual Style

Use this visual direction unless a lecture needs a different look:

- dark gradient background
- bright accent colors
- card-based sections instead of dense paragraphs
- rounded panels and subtle borders
- clear hierarchy for title, subtitle, and section cards

## Content Rules

- Keep one idea per slide
- Avoid long paragraphs
- Prefer cards, tables, and short bullets
- Split content across slides if it starts to overflow
- Keep slide typography compact enough to fit a 16:9 page without crowding
- Avoid layouts that force more than 4 dense items into one row
- Leave safe space for page numbers and avoid content near the bottom-right corner
- Use examples only when they clarify the concept
- Keep typography large enough for presentation mode

## Recommended Marp Frontmatter

```yaml
---
marp: true
theme: gaia
size: 16:9
paginate: true
---
```

## Suggested Slide Structure

1. Title slide
2. Roadmap slide
3. Concept definition slides
4. Comparison or example slide
5. Summary slide
6. Q&A slide
7. References slide

## Writing Pattern

For each topic:

- define the concept in one sentence
- explain why it matters
- show a small example
- connect it to related wiki pages
- keep the page visually balanced

## Reuse Notes

When generating future decks, reuse:

- the same folder layout
- the same color logic
- the same compact spacing
- the same rule that prevents overflow

## Current Preferred Style

- dark navy base
- purple and cyan accents
- thin glass-like cards
- short labels and badges
- minimal text density
- generous margins around the slide frame, but reduced internal padding for content

## Example Deck Path

- `slides/lecture-1-introduction/lecture-1-introduction.md`