# Wiki Data Structure

A markdown-based knowledge wiki for data structures and algorithms. The repository collects raw lecture notes, assignments, and exam materials, then turns them into structured wiki pages with cross-links and synthesis notes.

## What this repo contains

- `raw/` — original source material and assets
- `wiki/` — curated wiki pages, concepts, syntheses, and source summaries
- `index.md` — the main content catalog
- `log.md` — chronological activity log
- `GEMINI.md` — wiki schema, standards, and workflow guide
- `conductor/` — extraction and orchestration artifacts

## Purpose

This wiki is designed to compound over time:

- summarize each source once
- connect related ideas with wikilinks
- keep traceability back to the original raw documents
- support exam review, concept lookup, and long-term knowledge building

## How to use

1. Start with `index.md` to browse the catalog.
2. Open pages under `wiki/concepts/` for topic summaries.
3. Open pages under `wiki/sources/` for source-specific notes.
4. Refer to `GEMINI.md` for the content standards and workflow.

## Content model

The wiki follows a layered structure:

- Raw inputs in `raw/`
- Curated pages in `wiki/`
- Governance and standards in `GEMINI.md`
- Discovery through `index.md`

## Notes

This repository is currently a documentation wiki rather than an application. Releases, deployments, and packages are not used unless a publishing workflow is added later.
