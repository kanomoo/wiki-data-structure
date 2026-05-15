---
type: concept
tags: [architecture]
created: 2026-05-15
updated: 2026-05-15
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
