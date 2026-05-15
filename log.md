# Wiki Log

Chronological record of wiki operations.

## [2026-05-15] initialize | Wiki System Setup
- Created directory structure (`raw/`, `wiki/`).
- Initialized core files (`GEMINI.md`, `index.md`, `log.md`).
- Established Wiki Agent persona and schema.

## [2026-05-15] ingest | The LLM Wiki Idea
- Created source page [[the-llm-wiki-idea]].
- Defined core concepts: [[persistent-knowledge]], [[wiki-architecture]].
- Updated index and registered activity.

## [2026-05-15] install | Obsidian Agent Skills
- Downloaded and installed 5 skills from `kepano/obsidian-skills`.
- Skills added: `obsidian-markdown`, `json-canvas`, `obsidian-cli`, `obsidian-bases`, `defuddle`.
- Updated `GEMINI.md` to reflect new capabilities.

## [2026-05-16] audit | Wiki Quality Fix
- Conducted systematic audit of all Concept pages.
- Expanded "thin" pages: [[linked-list]], [[stack]], [[sorting-algorithms]], [[graph-algorithms]], [[shortest-path-algorithms]], [[tree-and-binary-tree]], [[binary-search-tree]], [[heap-priority-queue]], [[hashing]].
- Verified content depth, Python logic examples, and complexity notes.
- Updated [[Data-Structure-Summarization-Tracker]] to reflect verified quality.
- Investigated missing visual files; reported status to user.


## [2026-05-16] lint | Hardened Schema & Deep Enrichment
- **Schema Hardening**: Updated `GEMINI.md` with strict **Minimum Viable Page (MVP)** standard (>1000 chars, mandatory "Implementation Details" section).
- **Link Standardization**: Bulk updated internal wikilinks to use `[[kebab-case|Alias]]` format to prevent "white nodes".
- **Deep Ingest**: Re-analyzed raw PDFs to enrich core topics with Python code, Big O analysis, and logic flows:
    - [[Lecture-4-Stack]] & [[stack]]: Added Postfix evaluation and conversion logic.
    - [[Lecture-3-Linked-List]] & [[linked-list]]: Added Node/LinkedList class logic.
    - [[Lecture-5-Tree]] & [[tree-and-binary-tree]]: Added traversal and expression tree logic.
    - [[Lecture-5.1-BST]] & [[binary-search-tree]]: Added recursive insert/delete logic.
    - [[bst-deletion-advanced]]: Created dedicated deep dive for Case 3 deletion.
    - [[Lecture-10-Graph]] & [[graph-algorithms]]: Added representation and Topological Sort details.
    - [[Lecture-11-Shortest-path]] & [[shortest-path-algorithms]]: Added BFS-based shortest path algorithm.
- **Node Resolution**: Created missing source pages for all Assignments (1-4) and Test Programs (1-2) to eliminate broken graph nodes.
- **Master Index**: Fully updated `index.md` and synthesis pages to ensure 100% discoverability.

## [2026-05-16] ingest | Full Raw Data Structure Folder
- Scanned `raw/Data structure` recursively: 86 files total (57 PDF, 29 images).
- Extracted text layers from 51 PDFs into `conductor/extracted`; identified 6 image-only/no-text PDFs for visual review in Obsidian.
- Created [[raw-data-structure-source-inventory]] with every PDF/image linked and embedded for traceability.
- Created [[data-structure-complete-exam-notes]] as a detailed Thai reading guide covering ADT, Python OOP, linked list, stack/queue/postfix, tree/BST, hashing, heap, sorting, graph, topological sort, shortest path, assignments, and exam checklist.
- Created [[past-exam-pattern-bank]] to consolidate recurring patterns from old exams and Noteอู้ดง: double hashing, heap trace, insertion sort, shellsort, topological sort, shortest path tables, and short-answer formulas.
- Updated `index.md` with the new synthesis and source-index pages.
