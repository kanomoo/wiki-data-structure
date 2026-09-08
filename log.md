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

## [2026-05-16] enrich | Source Pages From Raw Data Structure
- Corrected ingestion direction to follow the LLM Wiki schema: enrich existing `wiki/sources` pages instead of creating a separate extracted-text archive.
- Added `Detailed Raw Source Integration` sections to all 22 files in `wiki/sources`.
- Distributed all 51 extracted text files from `conductor/extracted` into the relevant source pages, preserving page markers for source traceability.
- Added visual-source checklists for screenshot/image-only assignments, tests, and old exam materials.
- Removed the temporary archive-style source page and helper script that did not match the wiki architecture.

## [2026-05-16] enrich | Concept Pages From Data Structure Sources
- Added `Detailed Concept Expansion` sections to all 15 files in `wiki/concepts`.
- Expanded concept pages with mental models, invariants, implementation patterns, complexity/trade-offs, practice checklists, and source connections.
- Strengthened previously thin meta pages [[persistent-knowledge]] and [[wiki-architecture]] so they document the LLM Wiki workflow directly.
- Linked concept pages back to enriched source pages such as [[Lecture-4-Stack]], [[Lecture-10-Graph]], [[Lecture-11-Shortest-Path]], assignments, and synthesis notes.

## [2026-05-16] cleanup | Raw Data Structure Index Readability
- Reworked [[raw-data-structure-source-inventory]] into a readable topic map with usage guidance, grouped source index, thumbnails, and links to relevant wiki pages.
- Reworked [[raw-data-structure-full-extracted-notes]] into a searchable extracted-text archive with quick navigation, reading guide, topic sections, and collapsible per-file raw text.
- Preserved full coverage: 86 raw files in the inventory and 51 extracted-text PDFs in the full notes archive.
- Polished Obsidian rendering: removed large tables/thumbnails, replaced raw-file wikilinks with normal markdown file links to avoid red unresolved links, used callout cards/foldouts, and cleaned common Thai OCR spacing artifacts such as `ท า`, `ค า`, and `ส า`.
- Rebuilt the full extracted notes as cleaned reading text instead of raw code blocks: joined broken OCR line wraps, normalized Thai Sara Am/composing marks, removed stray bullet glyphs/ligatures, and suppressed two heavily corrupted Noteอู้ดง OCR sections in favor of source links plus clean study-note references.

## [2026-09-09] audio & visual | Transcribe Audio & Integrate Classroom Photo Archive
- Transcribed 9 audio recordings from 2026-09-02 lecture sessions by Prof. Pradit Pitaksathienkul.
- Analyzed 60 classroom photos in `DSA-pic/` (Aug 26 Midterm Solutions & Sep 2 Hashing/Heap lectures).
- Updated [[Lecture-7-Hashing]] with verbatim lecturer insights: collision counting traps (total 7 vs 14), wrap around mod logic, double hashing parameter $R$ variability ($R < TableSize$), and final exam Rehashing Load Factor calculation.
- Updated [[Lecture-8-Priority-Queue]] with array indexing rules (1-based index, child $2i, 2i+1$, parent $\lfloor i/2 \rfloor$ with truncation).
- Created [[Exam-Preparation-and-Classroom-Review]] consolidating midterm walkthrough and final exam traps.
- Registered new exam prep page in [[index.md]].
