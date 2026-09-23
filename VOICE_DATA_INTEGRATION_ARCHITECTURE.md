# Voice Data Integration & Architectural Ingestion Guide
## Project: wiki-data-structure (Obsidian Knowledge Base)

เอกสารฉบับนี้จัดทำขึ้นเพื่อระบุโครงสร้างสถาปัตยกรรมของโครงการ `wiki-data-structure` อย่างละเอียดที่สุด และกำหนดแนวทางการบูรณาการข้อมูลการถอดความเสียง (Voice Transcripts), ภาพกระดาน/สไลด์ (Board Photos), สูตรคำนวณลัด (Shortcuts & Formulas), จุดตรวจข้อสอบจริง (Exam Leaks & Traps), และการบ้าน/แล็บ เข้าสู่ระบบ Wiki อย่างเป็นระบบ

---

## 1. การวิเคราะห์โครงสร้างโครงการ (Project Architectural Inventory)

โครงสร้างโฟลเดอร์ของ `C:\Project\wiki-data-structure\` ถูกออกแบบตามหลักการ **Zettelkasten / Obsidian Knowledge Base**:

```text
C:\Project\wiki-data-structure\
├── raw/
│   └── assets/                     <-- เก็บไฟล์ภาพถ่ายกระดาน/สไลด์ (IMG_20260909_*, IMG_20260923_*)
├── wiki/
│   ├── sources/
│   │   ├── transcripts/            <-- แหล่งรวมไฟล์ถอดความเสียง verbatim .txt ทุกสัปดาห์
│   │   ├── Lecture-10-Graph.md     <-- สรุปเลกเชอร์รายบท
│   │   ├── Test-Program-2-Sorting.md <-- โจทย์การบ้าน/แล็บเขียนโปรแกรม
│   │   └── Exam-Preparation-*.md   <-- แนวข้อสอบและการเตรียมตัว
│   ├── concepts/                   <-- แก่นความคิดและมโนทัศน์ (Atomic Concepts เช่น graph-theory.md)
│   ├── synthesis/                  <-- การสังเคราะห์ข้ามหัวข้อ (Cheat Sheets, Summaries)
│   └── entities/                   <-- บุคคล, เครื่องมือ, เครื่องจักร (เช่น Dr. Pradit, Python, etc.)
├── fix_wiki.py                     <-- Python script ซ่อมแซมลิงก์และอัปเดตดัชนี
├── data-structure-roadmap.canvas    <-- ผังการเรียนรู้ Obsidian Canvas
└── index.md / README.md            <-- ทางเข้าหลักและสารบัญรวม
```

---

## 2. แผนที่การนำข้อมูลเสียงและภาพเข้าสู่โปรเจกต์ (Voice & Image Ingestion Mapping)

| ข้อมูลนำเข้าจาก `C:\Project\Voice\` | ปลายทางใน `wiki-data-structure\` | วัตถุประสงค์และการประมวลผล |
| :--- | :--- | :--- |
| **ไฟล์เสียงดิบ (.aac)** | ย้ายไป `C:\Project\Voice\Success\` | **ห้ามก๊อปปี้ไฟล์เสียงเข้าโปรเจกต์เด็ดขาด** เพื่อป้องกันพื้นที่บวมและแยก Audio Storage ออกชัดเจน |
| **Verbatim Transcript (.txt)** | `wiki/sources/transcripts/20260923_091645.txt` | เอกสารอ้างอิงปฐมภูมิ (Primary Source) ถอดความคำต่อคำ 100% |
| **ภาพถ่ายกระดาน 14 ภาพ** | `raw/assets/IMG_20260923_*` | แหล่งภาพอ้างอิงสำหรับฝังในเอกสาร Wiki Markdown `![[IMG_...]]` |
| **ทฤษฎีบทและสูตรคำนวณลัด** | `wiki/concepts/graph-theory.md` | บันทึกสูตร Complete Graph $E = \frac{V(V-1)}{2}$, Space Complexity $O(\|V\|^2)$ vs. $O(\|V\|+\|E\|)$ |
| **แนวข้อสอบจริงและจุดลวง** | `wiki/synthesis/exam-simulation-chapter-10-graphs.md` | จำลองข้อสอบปรนัย-อัตนัย พร้อมบทลงโทษการตอบผิดฟอร์แมต (0 คะแนน) |
| **การบ้าน Test Program 2** | `wiki/sources/Test-Program-2-Sorting.md` | แนบแนวทางโค้ดเฉลย Insertion, Selection, Bubble Sort และ Trace ตารางรอบ |

---

## 3. สรุปสาระสำคัญและสูตรลัดที่สกัดจากเสียง (Voice Intelligence & Exam Traps)

### 3.1 จุดหลอกที่ทำให้นักศึกษาได้ 0 คะแนนในข้อสอบปลายภาค (Exam Traps)
1. **การเขียน Path:**
   - *คำสั่ง:* จงเขียน Path จาก $A$ ไป $C$
   - *ถูก:* `$A, B, C$` หรือ `(A, B, C)`
   - *ผิด (ได้ 0 คะแนนทันที):* `$A \rightarrow B \rightarrow C$` (ห้ามเขียนหัวลูกศรเด็ดขาด เพราะนิยามเป็น Sequence of Vertices)
2. **การตอบจำนวนเส้นของ Complete Graph:**
   - *สูตร:* $E = \frac{V(V-1)}{2}$
   - *โจทย์ $V = 10$:* ต้องตอบจำนวนเต็ม **`45`** เท่านั้น หากตอบติดสูตร `10*(10-1)/2` จะได้ **0 คะแนน**
3. **คำถามบน Null Graph ($V=\{\}, E=\{\}$):**
   - *ถาม:* Path จาก $A$ ไป $C$ บนกราฟว่างคืออะไร?
   - *ตอบ:* **"ไม่มี Path จาก $A$ ไป $C$ เพราะไม่มีจุด $A$ และ $C$ อยู่ในกราฟ"**
4. **หน่วยของ Length of Path:**
   - ตอบเป็น **"เส้น" (Edges)** ห้ามตอบเป็นเซนติเมตรหรือนิ้ว

### 3.2 การคำนวณเปรียบเทียบ Memory Waste (Adjacency Matrix vs. Adjacency List)
- **กราฟ 7 จุดยอด 12 เส้น:**
  - Adjacency Matrix: $7 \times 7 = 49$ ช่อง
    - ช่องที่มีเลข 1: $12 \times 100 / 49 = \mathbf{24.48\%}$
    - ช่องที่เป็นเลข 0 (สูญเปล่า): $100 - 24.48 = \mathbf{75.51\%}$
  - Adjacency List: $|V| + |E| = 7 + 12 = \mathbf{19}$ ช่อง (ประหยัดกว่า 61.22%)
- **โจทย์ข้อสอบกราฟ 10 จุดยอด 20 เส้น:**
  - Adjacency Matrix ใช้: $|V|^2 = 10^2 = \mathbf{100}$ ช่อง
  - Adjacency List ใช้: $|E| + |V| = 20 + 10 = \mathbf{30}$ ช่อง (ประหยัดกว่า 70%)

---

## 4. ขั้นตอนการบำรุงรักษาและการคอมไพล์ (Maintenance Workflow)

1. ทุกครั้งที่มีไฟล์ Transcript ใหม่ นำเข้าที่ `wiki/sources/transcripts/`
2. ถอดแยกแนวคิด (Concepts) และสูตรลัดใส่ `wiki/concepts/`
3. อัปเดตไฟล์แบบฝึกหัดและการบ้านใน `wiki/sources/`
4. รันคำสั่งตรวจสอบความสมบูรณ์ของลิงก์:
   ```bash
   python fix_wiki.py
   ```
5. ตรวจสอบการแสดงผลใน Obsidian Graph View และ Canvas View
