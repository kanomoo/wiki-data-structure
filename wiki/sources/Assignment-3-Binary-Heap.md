---
type: source
tags: [practice, heap, priority-queue]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Assignment 3 Binary Heap/Assignment 3 Inclass.pdf]
---

# Source: Assignment 3 Binary Heap

## Summary
A deep-dive assignment into the mechanics of **Min-Heaps**, specifically the "Percolate Up" process during insertion to maintain the **Heap Order Property**.

## Implementation Details

### The Task
Insert the following sequence into an empty min-binary heap:
`10, 12, 1, 14, 6, 5, 8, 15, 3, 9, 7, 4, 11, 13, 2`

### Step-by-Step Logic (Percolate Up)
1. **Insert 10, 12**: Structure OK, Order OK.
2. **Insert 1**: 
    - Placed as left child of 10.
    - **Percolate**: 1 is smaller than 10. Swap.
    - New Heap: `1 (root), 12, 10`.
3. **Insert 6, 5**:
    - 5 is smaller than its parent (12). Swap.
    - New Heap: `1, 5, 10, 14, 6`.

### Array Representation
Heaps are typically stored in arrays for efficiency:
- `heap[0]` is often left empty to simplify index math.
- Parent of `i` is at `i // 2`.
- Left child of `i` is at `2i`.
- Right child of `i` is at `2i + 1`.

## Complexity/Trade-offs
- **Insertion**: $O(\log n)$ as we only traverse up the height of the tree.
- **Find Min**: $O(1)$ (always at index 1).
- **Structure**: Always a **Complete Binary Tree**, ensuring the height is always $\log n$.

## Related Pages
- [[heap-priority-queue|Heap & Priority Queue Concept]]
- [[Lecture-8-Priority-Queue|Main Heap Lecture]]
- [[Practice-Implementation-Guide|Practice Implementation Guide]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Assignment 3 Binary Heap/Assignment 3 Inclass.pdf|Assignment 3 Inclass.pdf]] (4 pages, 1489 extracted characters) -> `conductor/extracted/ปี67_Assignment_3_Binary_Heap_Assignment_3_Inclass.pdf.txt`
- [[raw/Data structure/ปีเก่า/สำเนาของ assign3.pdf|สำเนาของ assign3.pdf]] (1 pages, 638 extracted characters) -> `conductor/extracted/ปีเก่า_สำเนาของ_assign3.pdf.txt`
- [[raw/Data structure/ปี67/Assignment 3 Binary Heap/Screenshot 2026-02-15 173116.png|Screenshot 2026-02-15 173116.png]] visual source
- [[raw/Data structure/ปีเก่า/สำเนาของ Assign3.jpg|สำเนาของ Assign3.jpg]] visual source

### Deep Notes
- Assignment 3 targets binary heap operations, especially insert and deleteMin traces.
- For each insert, append the value at the next open slot and percolate up. For each deleteMin, replace root with the last item, remove the last slot, then percolate down.
- Array representation is part of the answer, not just the drawn tree. Always keep tree shape complete after each operation.
- The older assign3 source is included here as cross-year practice for the same heap skill family.

### Visual Source Checklist
- ![[raw/Data structure/ปี67/Assignment 3 Binary Heap/Screenshot 2026-02-15 173116.png|180]]
- ![[raw/Data structure/ปีเก่า/สำเนาของ Assign3.jpg|180]]

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Assignment_3_Binary_Heap_Assignment_3_Inclass.pdf.txt`
```text
--- PAGE 1 ---
Assignment 3 Inclass : From book “Data Structures and Algorithms Analysis in C++” 
by Mark Allen Weiss, p.283

--- PAGE 2 ---
Solution: 
First step: From an empty binary heap, insert 10 then 12 :Check structure prop. and order prop. 
 
 
 
 
2nd step: Insert 1: Check structure prop. and order prop. Swap 10 1 
 
 
 
3rd step: Insert 14: Check structure prop. and order prop. No change. 
 
 
 
 
 
4th step: Insert 6 then 5: Check structure prop. and order prop. Swap 12 6,10 5. 
 
 
 
 
 
5th step: Insert 8 then 15: Check structure prop. and order prop. No change. 
 
 
 
 
 
1 
10 
12 
10 
12 
10 
1 
12 
10 
1 
12 
14 
10 
1 
12 
14 
6 
5 
5 
1 
6 
14 
12 
10 
5 
1 
6 
14 
12 
10 
8 
15

--- PAGE 3 ---
6th step: Insert 3: Check structure prop. and order prop. 
 
 
 
 
 
 
7th step: Insert 9: Check structure prop. and order prop. 
 
 
 
 
 
 
8th step: Insert 7 then 4 then 11: Check structure prop. and order prop. 
 
 
 
 
 
 
9th step: Insert 13 then 2: Check structure prop. and order prop. 
 
 
 
 
5 
1 
6 
14 
12 
10 
8 
15 
 
5 
1 
 
 
12 
10 
8 
15 
 
5 
1 
 
 
12 
10 
8 
15 
 
 
5 
1 
 
 
 
10 
8 
15 
 
 
5 
1 
 
 
 
10 
8 
15

--- PAGE 4 ---
Finally: array of binary heap after insert all elements already. 
 
 
 
 
Then 6.3 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
[0] 
3 
2 
4 
5 
6 
 
 
 
 
 
 
7 
8 
10 
9 
11 
12 
1 
 
 
 
 
 
13 
14 
16 
15 
17 
 
 
 
 
 
 
 
[0] 
3 
2 
4 
5 
6 
 
 
 
 
 
 
7 
8 
10 
9 
11 
12 
1 
 
 
 
 
 
13 
14 
16 
15 
17
```

#### Extract: `conductor/extracted/ปีเก่า_สำเนาของ_assign3.pdf.txt`
```text
--- PAGE 1 ---
หองสง Assignment 3: Priority Queue : DATA STRUCTURE AND ALGORITHM 
ภาคเรียนที่ 1/2566 ตอนเรียนที่ 1 
จากรหัสประจําตัวของนักศึกษา 5 ตัวสุดทาย 
สมมติ ตัวแปรออบเจค a ตามโครงสรางคลาส BinaryHeap มีขนาด 8 ชอง 
จงใส รหัสประจําตัวของนักศึกษา ทีละตัวเขาไปในตัวแปร ออบเจค a 
ยกตัวอยางเชน 
รหัสประจําตัวของนักศึกษา 62060216 32050 
ใหนํา 32050 ทีละตัวเขาไปในตัวแปร ออบเจค a 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
3
 
[0]
1
3
2
4 
5
6
7
8
 
 
3 
2 
 
 
[0]
1
3
2
4
5
6
7
8
 
2 
3
0
 
[0]
1
3
2
4
5
6
7
8
 
5 
2
3 
0 
 
 
[0]
1
3
2
4
5 
6
7
8
 
3
5
2
0
0
 
 
[0]
1 
3
2 
4
5
6
7 
8 
 
 
[0]
1
3
2
4
5 
6
7
8
 
 
 
[0] 
1
3
2
4
5
6
7
8
```
