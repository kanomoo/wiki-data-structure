---
type: synthesis
tags: [exam, past-paper, patterns, data-structure]
created: 2026-05-16
updated: 2026-05-16
sources:
  - raw/Data structure/ปีเก่า
  - raw/Data structure/โน๊ตอู้ดง/Noteอู้ดง.pdf
---

# Past Exam Pattern Bank

หน้านี้สกัด “รูปแบบข้อสอบ” จากไฟล์ปีเก่าและโน้ตอู้ดง เพื่อใช้ซ้อมทำโจทย์ซ้ำ ๆ คู่กับ [[data-structure-complete-exam-notes|Data Structure Complete Exam Notes]] และ [[Exam-Preparation-Guide|Exam Preparation Guide]].

## Pattern 1: Hashing / Double Hashing

สิ่งที่โจทย์มักให้:

- `TableSize`
- รายการ key ที่ต้อง insert
- วิธีแก้ collision เช่น double hashing
- เกณฑ์ rehash เช่นมากกว่า 70% หรือ 75%
- ตารางที่ต้องเติม `Element` และ `Info`

ขั้นตอนทำ:

1. คำนวณ `h0 = key % TableSize`.
2. ถ้าช่องว่าง ให้ใส่ key และเขียน `ACTIVE`.
3. ถ้าชน ให้หา `R` ซึ่งเป็น prime ที่น้อยกว่า `TableSize`.
4. คำนวณ `hash2 = R - (key % R)`.
5. ลอง `h_i = (h0 + i * hash2) % TableSize` โดยเริ่ม `i = 1`.
6. นับ collision ทุกครั้งที่ตำแหน่งที่ลองมีข้อมูลอยู่แล้ว.
7. หลัง insert ครบ ให้คำนวณ load factor เพื่อตอบ rehash.

> [!warning] กับดัก
> ในสูตร double hashing อย่าใช้ `h0 % R` แทน `key % R` ถ้าโจทย์เขียน `R - (X MOD R)`. ใช้ตัวแปรตามโจทย์เสมอ.

## Pattern 2: Heap Insert และ DeleteMin

สิ่งที่โจทย์มักถาม:

- array หลัง insert ครบ
- ผลหลัง `deleteMin` ครั้งที่ 1 และ 2
- ค่า `hole`, `child`, และเลขที่เปรียบเทียบในแต่ละรอบ
- loop ทำงานกี่รอบ

วิธีตอบ insert:

1. ใส่ค่าที่ท้าย array.
2. ตั้ง `hole = currentSize`.
3. เทียบค่าที่ insert กับ parent `array[hole // 2]`.
4. ถ้าน้อยกว่า parent ให้เลื่อน parent ลง.
5. ขยับ `hole //= 2`.
6. จบเมื่อถึง root หรือค่า insert ไม่เล็กกว่า parent.

วิธีตอบ deleteMin:

1. ค่าที่ออกคือ root.
2. เอาค่าท้ายสุดเป็น `tmp`.
3. เลือกลูกที่เล็กกว่าเป็น `child`.
4. ถ้า `child < tmp` ให้เลื่อน child ขึ้น.
5. วาง `tmp` ที่ hole สุดท้าย.

## Pattern 3: Insertion Sort Trace

โจทย์มักใช้คำว่า `After p = ?`, `tmp`, `Position Move`.

วิธีทำ:

1. เริ่ม `p = 1`.
2. `tmp = a[p]`.
3. เลื่อนค่าทางซ้ายที่มากกว่า `tmp` ไปทางขวา.
4. นับจำนวนเลื่อนเป็น position move.
5. วาง `tmp` ในตำแหน่งสุดท้าย.
6. เขียน array หลังจบรอบ `p`.

ถ้า array เรียงจากน้อยไปมากอยู่แล้ว move = 0 ทุกครั้ง และเป็น best case. ถ้าเรียงมากไปน้อย move จะมากสุดและเป็น worst case.

## Pattern 4: Shellsort

โจทย์จะให้ increment/gap sequence แล้วให้เขียนผลหลัง pass ใด pass หนึ่ง.

วิธีทำ:

1. แยกสมาชิกตามระยะ gap.
2. ทำ insertion sort ภายในกลุ่มที่เกิดจาก gap.
3. ลด gap ตาม sequence.
4. เมื่อ gap = 1 เท่ากับทำ insertion sort รอบสุดท้าย.

> [!tip]
> อย่า sort ทั้ง array ทันทีใน gap แรก ให้จัดเฉพาะสมาชิกที่ห่างกันตาม gap ก่อน.

## Pattern 5: Topological Sort

สิ่งที่ต้องเขียน:

- adjacency list
- indegree array
- queue
- dequeue order

ขั้นตอน:

1. นับ indegree ของทุก vertex.
2. enqueue vertex ที่ indegree = 0.
3. dequeue ออกเป็นคำตอบ.
4. ลด indegree ของ neighbor.
5. ถ้า neighbor เหลือ indegree = 0 ให้ enqueue.

ถ้า queue หมดแต่ยังมี vertex เหลือ แปลว่ากราฟมี cycle และ topological sort ไม่สมบูรณ์.

## Pattern 6: Unweighted Shortest Path

โจทย์มักให้กราฟและ source แล้วให้เติมตาราง:

| Vertex | Known | Dv | Pv |
|---|---|---:|---:|
| v | F/T | ระยะ | previous |

ขั้นตอน:

1. source มี `Dv = 0`, vertex อื่น `Dv = 999`.
2. enqueue source.
3. dequeue ทีละ vertex แล้ว mark known.
4. neighbor ที่ยัง distance เป็น 999 ให้ตั้ง `Dv = Dv[v] + 1`, `Pv = v`.
5. เส้นทางไป target ให้ย้อน `Pv` จาก target กลับ source.

## Pattern 7: คำถามอธิบายสั้น

คำถามที่พบในปีเก่า:

- คุณสมบัติ hash function ในอุดมคติ: คำนวณง่าย, key ต่างกันควรกระจายคนละตำแหน่ง, กระจายทั่ว table.
- Wraparound: เมื่อ probe เลยท้าย array ให้กลับมาต้น array ด้วย modulo.
- Complete graph edge: `n(n - 1) / 2`.
- Adjacency matrix space: `|V|^2`.
- Adjacency list space: `|V| + |E|`.
- Pivot ใน quicksort ไม่ถูก partition ต่อ เพราะหลัง partition pivot อยู่ตำแหน่งถูกต้องแล้ว.
- Complete binary tree height `h`: จำนวน node อย่างน้อย `2^h`, มากที่สุด `2^(h+1)-1` ถ้านับ height ตามระดับที่ชีทใช้.

## Practice Loop

รอบซ้อมที่แนะนำ:

1. ทำ hashing 2 ชุด โดยนับ collision และ rehash threshold.
2. ทำ heap insert 1 ชุด, deleteMin 2 ครั้ง, insert เพิ่ม 1 ครั้ง.
3. ทำ insertion sort พร้อม `tmp` และ move ทุก `p`.
4. ทำ shellsort ตาม gap ที่โจทย์กำหนด.
5. ทำ topological sort จากกราฟหนึ่งรูป.
6. ทำ shortest path table จากกราฟหนึ่งรูป.

เมื่อทำครบให้เทียบกับ [[raw-data-structure-source-inventory|Raw Data Structure Source Inventory]] เพื่อเปิดภาพโจทย์/ไฟล์ปีเก่ากลับมาตรวจ.

