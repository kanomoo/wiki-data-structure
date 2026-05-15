---
type: source
tags: [meta, architecture]
created: 2026-05-15
updated: 2026-05-15
sources: [raw/the-llm-wiki-idea.md]
---

# Source: The LLM Wiki Idea

## Summary
The LLM Wiki pattern shifts from transient RAG queries to a persistent, compounding knowledge base. It leverages LLMs to automate the maintenance of a structured markdown wiki.

## Key Takeaways
- **Compounding Value**: The wiki gets richer with every source; cross-references are built once.
- **LLM Maintenance**: Humans curate and inquire; LLMs summarize and cross-link.
- **Structural Integrity**: Relies on a schema (`GEMINI.md`), an index (`index.md`), and a log (`log.md`).

## Related Concepts
- [[persistent-knowledge|Persistent Knowledge]]
- [[wiki-architecture|Wiki Architecture]]
