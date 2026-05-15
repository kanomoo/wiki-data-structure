---
type: concept
tags: [architecture]
created: 2026-05-15
updated: 2026-05-16
sources: [the-llm-wiki-idea]
---

# Concept: Wiki Architecture

The structural design of an LLM-managed knowledge base.

## The Three Layers
1. **Raw Sources**: Immutable truth (PDFs, notes, web clips).
2. **The Wiki**: LLM-generated synthesis (Entities, Concepts, Sources).
3. **The Schema**: Rules and workflows (`GEMINI.md`).

## Core Components
- **index.md**: Content-oriented catalog for LLM navigation.
- **log.md**: Chronological record of growth.

## Detailed Concept Expansion

Wiki architecture defines how raw evidence becomes durable knowledge. The project uses layered folders so each page has a role and the LLM can decide where new information belongs.

### Mental Model
The architecture is a pipeline: raw source -> source note -> concept page -> synthesis guide -> index/log. Each layer answers a different question: what did the document say, what idea does it support, and how should the user study or apply it?

### Invariants and Rules
- raw/ is immutable evidence.
- wiki/sources/ summarizes specific documents or source groups.
- wiki/concepts/ stores reusable ideas.
- wiki/synthesis/ combines many pages into study plans or analyses.
- index.md is navigation; log.md is operational memory; GEMINI.md is the schema.

### Implementation Patterns
When ingesting, first identify whether a target page already exists. If it does, enrich it. If not, create the smallest correct page in the correct layer. Use Obsidian wikilinks with aliases, keep frontmatter valid, and connect source/concept/synthesis pages both ways when useful.

### Complexity and Trade-offs
A strict architecture prevents duplicate pages and broken graph nodes, but it requires discipline. The main failure mode is dumping information into one large archive instead of propagating it to the existing page that owns the topic.

### Practice and Exam Checklist
- Ask: is this source-level, concept-level, or synthesis-level knowledge?
- Keep raw traceability visible.
- Avoid creating a page just because data is large.
- After bulk edits, verify every page has frontmatter, depth, and links.

### Source Connections
- [[the-llm-wiki-idea|The LLM Wiki Idea]]
- [[persistent-knowledge|Persistent Knowledge]]
- [[GEMINI|LLM Wiki Schema]]
