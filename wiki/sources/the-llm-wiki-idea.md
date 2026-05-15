---
type: source
tags: [meta, architecture]
created: 2026-05-15
updated: 2026-05-16
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

## Detailed Raw Source Integration

ส่วนนี้เติมให้หน้า source นี้ครบตามหลัก LLM Wiki เดียวกับหน้า Data Structure อื่น ๆ: มี traceability, implementation logic, trade-offs, และการเชื่อมโยงกลับไปยังโครง wiki ที่ต้องดูแลต่อเนื่อง.

### Source Coverage Added
- [[raw/the-llm-wiki-idea.md|the-llm-wiki-idea.md]] source note for the wiki architecture itself
- [[GEMINI|GEMINI.md]] schema/workflow reference used to validate this source page

### Deep Notes
- LLM Wiki ไม่ใช่การเก็บ raw dump แต่เป็นการแปลง source ให้เป็น persistent markdown ที่ค้น, อ่าน, และเชื่อมโยงได้ในอนาคต
- `wiki/sources` ควรเป็น summary page ของ source แต่ละชุด โดยต้องมีข้อมูลพอให้ LLM หรือคนอ่านต่อได้โดยไม่ต้องเปิด raw ทุกครั้ง
- ข้อมูลจาก raw ควรถูก “propagate” เข้า source/concept/synthesis ที่เกี่ยวข้อง ไม่รวมเป็นไฟล์กองกลางถ้าหน้าเดิมมีอยู่แล้ว
- หน้า source ที่ดีต้องมี traceability กลับไป raw, implementation details จากต้นฉบับ, trade-offs/complexity ถ้าเป็น technical source, และ wikilinks ไปหน้าที่เกี่ยวข้อง
- สำหรับ Data Structure wiki หมายความว่า lecture, assignment, test และ old note ควรถูกเติมเข้า source pages เดิม เช่น stack ไป `Lecture-4-Stack`, graph ไป `Lecture-10-Graph`, shortest path ไป `Lecture-11-Shortest-Path`

### Maintenance Rules
- ถ้ามี raw ใหม่ ให้เติมหรือสร้าง source page ที่ตรงกับเอกสารนั้น แล้วค่อย propagate ไป concept/synthesis
- ถ้ามี source page เดิมอยู่แล้ว ให้ enrich หน้านั้นก่อน ไม่สร้าง archive ซ้ำ
- ทุก source page ควรผ่าน MVP: frontmatter, summary, implementation details, complexity/trade-offs, traceability, connectivity
- ควรอัปเดต `index.md` และ `log.md` เมื่อ ingest รอบใหญ่เสร็จ เพื่อให้ wiki จำประวัติการเปลี่ยนแปลงได้
