# Plan: Wiki Quality Audit and Enrichment

The user identified that the wiki graph contains many nodes with very thin content (summary only, no depth). This plan aims to audit the existing structure, enrich thin pages with data from raw sources, and establish a quality gate to prevent future "empty" nodes.

## Objectives
- **Standardization**: Align wikilinks with consistent kebab-case file naming.
- **Enrichment**: Expand at least 5 "thin" concept/source pages with implementation details from raw PDFs.
- **Coverage**: Create missing source pages for Assignments and Test Programs.
- **Quality Gate**: Update `GEMINI.md` with a mandatory structure for new wiki pages.

## Key Files & Context
- `wiki/sources/`: Summary pages (currently too brief).
- `wiki/concepts/`: Core topic pages (currently too brief).
- `raw/Data structure/ปี67/`: Raw PDF sources for enrichment.
- `GEMINI.md`: Workflow and schema definitions.

## Proposed Changes

### 1. Standardization & Cleanup
- Rename links like `[[Persistent Knowledge]]` to `[[persistent-knowledge]]` or standardize on aliased links `[[persistent-knowledge|Persistent Knowledge]]`.
- Fix broken links to missing assignments/tests by creating placeholder source pages with basic metadata.

### 2. Content Enrichment (Deep Ingest)
- **Priority 1**: `Lecture 4 Stack` -> Extract Postfix logic and implementation patterns.
- **Priority 2**: `Lecture 3 Linked List` -> Extract node structure and operation complexity.
- **Priority 3**: `Lecture 5 Tree` & `Lecture 5.1 BST` -> Extract tree traversal and search logic.
- **Priority 4**: `Lecture 10 Graph` -> Extract Adjacency List/Matrix differences and Topological sort logic.
- **Priority 5**: `Lecture 11 Shortest Path` -> Extract Dijkstra's algorithm steps.

### 3. Missing Coverage
- Create source pages for:
    - `Assignment 1 Linked List`
    - `Assignment 2 Binary Tree`
    - `Assignment 3 Binary Heap`
    - `Assignment 4 Shortest Path`
    - `Test Program 1_ Queue`
    - `Test Program 2_ Sorting`

### 4. Process Hardening
- Update `GEMINI.md` with a "Minimum Viable Page" (MVP) standard:
    - Must have at least 3 sections (Summary, Details, Links).
    - Must extract at least 2 "Key Terms" or "Entities".
    - Must include at least 1 implementation detail (code snippet or logic flow) if applicable.

## Verification & Testing
- **Visual Audit**: Open the graph in Obsidian and verify no "white nodes" (uncreated pages) remain for core topics.
- **Content Check**: Verify that `Lecture-4-Stack.md` has grown from ~400 bytes to >1500 bytes with specific logic.
- **Link Check**: Run `grep` to ensure no `[[` links point to non-existent files.

## Alternatives Considered
- **Automated Summarization**: Could use a subagent to batch-summarize all PDFs. *Decision: Rejected for initial enrichment to ensure high-quality "human-like" synthesis first.*
- **Removing Thin Nodes**: Could delete empty nodes. *Decision: Rejected because the graph connectivity is valuable; we just need to fill the nodes.*

---
**Informal Agreement Needed**:
- Does this prioritization of enrichment (Stack, Linked List, Tree, Graph, Shortest Path) match your current focus?
- Should I proceed with standardizing links to kebab-case, or do you prefer Title Case aliasing?
