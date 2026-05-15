---
type: source
tags: [sorting, advanced]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 9 Sorting/Lecture 9.1.pdf]
---

# Source: Lecture 9.1 (Advanced Sorting)

## Summary
Advanced sorting techniques and supplementary notes for the sorting lecture series.

## Implementation Details
(To be extracted from `raw/Data structure/ปี67/Lecture 9 Sorting/Lecture 9.1.pdf`)
- Specific optimizations for standard sorts.
- Analysis of insertion sort caveats.

## Complexity/Trade-offs
- Covers edge cases in $O(n^2)$ and $O(n \log n)$ algorithms.

## Learning Materials
- [[sorting-algorithms|Sorting Algorithms]]
- [[Practice-Implementation-Guide|Practice Guide]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 9 Sorting/Lecture 9.1.pdf|Lecture 9.1.pdf]] (2 pages, 253 extracted characters) -> `conductor/extracted/ปี67_Lecture_9_Sorting_Lecture_9.1.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 9 Sorting/Short note Insertion sort.pdf|Short note Insertion sort.pdf]] (3 pages, 2022 extracted characters) -> `conductor/extracted/ปี67_Lecture_9_Sorting_Short_note_Insertion_sort.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 9 Sorting/หมายเหตุ ในหัวข้อ insertion sort.pdf|หมายเหตุ ในหัวข้อ insertion sort.pdf]] (2 pages, 1006 extracted characters) -> `conductor/extracted/ปี67_Lecture_9_Sorting_หมายเหตุ_ในหัวข้อ_insertion_sort.pdf.txt`

### Deep Notes
- Lecture 9.1 is a small continuation/clarification page for sorting, especially insertion-sort details.
- The important distinction is between swapping and shifting. In insertion sort, the saved key is inserted after larger values shift one position to the right.
- This page should be read beside [[Lecture-9-Sorting|Lecture 9 Sorting]] and [[sorting-algorithms|Sorting Algorithms]] because it sharpens the step-by-step trace rather than introducing a new ADT.

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_9_Sorting_Lecture_9.1.pdf.txt`
```text
--- PAGE 1 ---
10
Bubble Sort

--- PAGE 2 ---
11
def bubble_sort(arr):
n = len(arr) 
for i in range(n):
last_index = n - 1 - i
for j in range(last_index):
if arr[j] > arr[j + 1]:
temp = arr[j]
arr[j] = arr[j + 1]
arr[j + 1] = temp 
//Bubble sort routine
```

#### Extract: `conductor/extracted/ปี67_Lecture_9_Sorting_Short_note_Insertion_sort.pdf.txt`
```text
--- PAGE 1 ---
Short note: Insertion sort 
 
def insertion_sort(a): 
 for p in range(1, len(a)): 
 tmp = a[p] 
 j = p 
 while j > 0 and tmp < a[j - 1]: 
 a[j] = a[j - 1] 
 j -= 1 
 a[j] = tmp 
 
my_list = [34, 8, 64, 51, 32, 21] 
insertion_sort(my_list) 
 
 
 
 
 
For ของ p ; p = 1 ; 1 < 6 จริง 
tmp = 
j 
 while ของ j ; j = ; > 0 && tmp < a[j - 1] = ; 
34 8 64 51 32 21 
while ของ j ; j = ,; 0 > 0 เท็จ && tmp < a[ j - 1 ]; 
34 
8 
64 
51 
32 
21 
[0]
[1] 
[2] [3] 
[4] [5] 
a

--- PAGE 2 ---
After p = 1 
 
 8 34 64 51 32 21 
position move = ? 
 
 
For ของ p ; p = ; < 6 จริง 
tmp = 
j 
while ของ j ; j = ; > 0 && tmp < a[ j - 1] =; 
After p = 2 
 
 
8 34 64 51 32 21 
 
For ของ p ; p = ; < 6 จริง 
tmp = 
j 
while j = , ; 2 > 0 && tmp < a[ j - 1] = 
a[ j ] = ? 
 
After p = 
3 
 8 34 51 64 32 21 
 
 
For ของ p ; p = ? ; ?<6 
tmp= ? 
After p= 
 
 
8 34 51 64 32 21 
 
 
 
 
[0] [1] 
[2] [3] 
[4] [5] 
[0] [1] 
[2] [3] 
[4] [5] 
[0] [1] 
[2] [3] 
[4] [5] 
[0] [1] 
[2] [3] 
[4] [5]

--- PAGE 3 ---
After p = ? 
 
 8 34 51 64 32 21 position move = ? 
 
 
 
 
Tmp= ? 
 
 j = p: กําหนดตัวแปร j ใหมีคาเทากับ p เพื่อใชเปนตัวชี้ในการเปรียบเทียบและเลื่อนตําแหนง 
while j > 0 and tmp < a[j - 1]: นี่คือหัวใจของการแทรก 
 j > 0: เงื่อนไขนี้ทําใหแนใจวาเราไมไดพยายามเขาถึง index ที่นอยกวา 0 (ซึ่งไมมีในลิสต) 
 tmp < a[j - 1]: เปรียบเทียบคาของสมาชิกที่เรากําลังจะแทรก (tmp) กับสมาชิกที่อยูกอนหนา (a[j - 1]) 
 ถาทั้งสองเงื่อนไขเปนจริง: หมายความวา tmp มีคานอยกวาสมาชิกที่อยูกอนหนา ดังนั้น สมาชิกที่อยูกอน
หนา (a[j - 1]) ตองถูก เลื่อนไปทางขวา หนึ่งตําแหนง เพื่อเปดทางให tmp 
 a[j] = a[j - 1]: เลื่อนสมาชิก a[j - 1] ไปยังตําแหนง a[j] อยาลืม หมายถึง นําคาทางขวา มาใสทางซาย 
 j -= 1: ลดคา j ลง 1 เพื่อขยับไปเปรียบเทียบกับสมาชิกตัวถัดไปทางซาย 
 เมื่อเงื่อนไขใน while เปนเท็จ (คือ j เปน 0 แลว หรือ tmp ไมนอยกวา a[j - 1] แลว) แสดงวาเราเจอ
ตําแหนงที่เหมาะสมแลว จึงนําคา tmp ไปใสไวที่ตําแหนง j ดวยคําสั่งวา a[j] = tmp 
 
 
 
 
 
 
 
 
 
P 
[0] [1] 
[2] [3] 
[4] [5] 
j 
Tmp = ?
```

#### Extract: `conductor/extracted/ปี67_Lecture_9_Sorting_หมายเหตุ_ในหัวข้อ_insertion_sort.pdf.txt`
```text
--- PAGE 1 ---
หมายเหตุ : ในหัวข้อ insertion sort 
ค ำสั่ง for p in range(1, 5): และ for p in range(5): ใน Python มีควำมแตกต่ำงกันที่ จุดเริ่มต้น และ 
จ านวนรอบ ของกำรวนซ ้ำ ดังนี้ 
for p in range(1, 5): 
 ช่วง (Range): ค ำสั่งนี้จะสร้ำงล ำดับของตัวเลขที่ เริ่มต้นที่ 1 และ สิ้นสุดที่ 4 (ไม่รวม 5) 
 ตัวแปร p: จะมีค่ำเป็น 1, 2, 3, 4 ในแต่ละรอบของกำรวนซ ้ำ 
 จ านวนรอบ: วนซ ้ำทั้งหมด 4 ครั้ง 
ตัวอย่าง: 
for p in range(1, 5): 
 print(p) 
ผลลัพธ์: 
1 
2 
3 
4 
for p in range(5): 
 ช่วง (Range): ค ำสั่งนี้จะสร้ำงล ำดับของตัวเลขที่ เริ่มต้นที่ 0 (โดยปริยำย) และ สิ้นสุดที่ 4 (ไม่รวม 5) 
 ตัวแปร p: จะมีค่ำเป็น 0, 1, 2, 3, 4 ในแต่ละรอบของกำรวนซ ้ำ 
 จ านวนรอบ: วนซ ้ำทั้งหมด 5 ครั้ง 
ตัวอย่าง: 
for p in range(5): 
 print(p) 
ผลลัพธ์: 
0 
1 
2 
3 
4

--- PAGE 2 ---
สรุปความแตกต่าง: 
 range(start, stop): ก ำหนดทั้งจุดเริ่มต้นและจุดสิ้นสุด (ไม่รวมจุดสิ้นสุด) 
 range(stop): ก ำหนดเฉพำะจุดสิ้นสุด โดยจะเริ่มนับจำก 0 (โดยปริยำย) 
กำรเลือกใช้ขึ้นอยู่กับว่ำคุณต้องกำรให้ลูปวนซ ้ำตั้งแต่ตัวเลขใดถึงตัวเลขใด
```
