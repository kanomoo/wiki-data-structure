---
type: concept
tags: [knowledge-management]
created: 2026-05-15
updated: 2026-05-16
sources: [the-llm-wiki-idea]
---

# Concept: Persistent Knowledge

Persistent knowledge is information that is compiled, synthesized, and stored in a structured way that allows it to compound over time.

## Characteristics
- **Non-Transient**: Unlike chat history, it is saved to a permanent file system.
- **Interlinked**: New data is connected to existing nodes (`[[links]]`).
- **Evolving**: Entities and concept pages are updated as new evidence arrives.

## Implementation in LLM Wiki
The wiki acts as a "second brain" where the LLM is the primary gardener, ensuring that insights from one document are propagated to relevant topic pages.

## Detailed Concept Expansion

Persistent knowledge is the wiki's memory layer: conclusions are written into durable markdown pages so future work starts from accumulated understanding instead of re-reading everything from scratch.

### Mental Model
Raw files are evidence, source pages are document-level interpretation, concept pages are reusable ideas, and synthesis pages are higher-level study guides or comparisons.

### Invariants and Rules
- Do not mutate raw sources.
- New evidence should enrich existing pages when those pages already represent the topic.
- Every durable claim should be traceable to a source page or raw file.
- Links make knowledge compound; isolated pages decay.

### Implementation Patterns
For this vault, persistence means updating wiki/sources, wiki/concepts, wiki/synthesis, index.md, and log.md. A good operation leaves the wiki more navigable than before: fewer thin pages, more source-backed claims, and clearer paths from question to evidence.

### Complexity and Trade-offs
The trade-off is maintenance cost. Detailed pages take longer to build, but they reduce future context cost and prevent repeated extraction work. Overly large pages can become hard to scan, so use sections and links.

### Practice and Exam Checklist
- Prefer enriching an existing concept over creating duplicate nodes.
- Add source connections whenever new evidence changes a concept.
- Update log.md after major ingestion.
- Run link/thin-content checks periodically.

### Source Connections
- [[the-llm-wiki-idea|The LLM Wiki Idea]]
- [[wiki-architecture|Wiki Architecture]]
- [[raw-data-structure-source-inventory|Raw Data Structure Source Inventory]]
