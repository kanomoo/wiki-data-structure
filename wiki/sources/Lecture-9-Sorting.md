---
type: source
tags: [sorting, comparison-sort, implementation]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 9 Sorting/Lecture 9 Sorting.pdf]
---

# Source: Lecture 9 - Sorting Algorithms

## Summary
Introduction to comparison-based sorting algorithms, covering their logic, Python implementations, and performance characteristics.

## Implementation Details

### 1. Insertion Sort
Best for small or nearly sorted arrays.
```python
def insertion_sort(a):
    for p in range(1, len(a)):
        tmp = a[p]
        j = p
        while j > 0 and tmp < a[j - 1]:
            a[j] = a[j - 1]
            j -= 1
        a[j] = tmp
```

### 2. Selection Sort
Efficient in terms of memory writes (swaps).
```python
def selection_sort(arr):
    n = len(arr)
    for i in range(n):
        min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        if min_idx != i:
            arr[i], arr[min_idx] = arr[min_idx], arr[i]
```

### 3. Bubble Sort
Repeatedly steps through the list, compares adjacent elements and swaps them if they are in the wrong order.
```python
def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
```

## Complexity Analysis

| Algorithm | Best Case | Average | Worst Case | Space |
|-----------|-----------|---------|------------|-------|
| Insertion | $O(n)$    | $O(n^2)$ | $O(n^2)$    | $O(1)$ |
| Selection | $O(n^2)$  | $O(n^2)$ | $O(n^2)$    | $O(1)$ |
| Bubble    | $O(n)$    | $O(n^2)$ | $O(n^2)$    | $O(1)$ |

## Related Pages
- [[sorting-algorithms|Sorting Concept Deep-Dive]]
- [[Test-Program-2-Sorting|Practice Assessment]]
- [[Lecture-9.1|Advanced Sorts (Next Lecture)]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 9 Sorting/Lecture 9 Sorting.pdf|Lecture 9 Sorting.pdf]] (9 pages, 1959 extracted characters) -> `conductor/extracted/ปี67_Lecture_9_Sorting_Lecture_9_Sorting.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 9 Sorting/For Example Bubble sort.pdf|For Example Bubble sort.pdf]] (2 pages, 1957 extracted characters) -> `conductor/extracted/ปี67_Lecture_9_Sorting_For_Example_Bubble_sort.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 9 Sorting/For Example Selection sort.pdf|For Example Selection sort.pdf]] (3 pages, 2956 extracted characters) -> `conductor/extracted/ปี67_Lecture_9_Sorting_For_Example_Selection_sort.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 9 Sorting/Short note Insertion sort.pdf|Short note Insertion sort.pdf]] (3 pages, 2022 extracted characters) -> `conductor/extracted/ปี67_Lecture_9_Sorting_Short_note_Insertion_sort.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 9 Sorting/หมายเหตุ ในหัวข้อ insertion sort.pdf|หมายเหตุ ในหัวข้อ insertion sort.pdf]] (2 pages, 1006 extracted characters) -> `conductor/extracted/ปี67_Lecture_9_Sorting_หมายเหตุ_ในหัวข้อ_insertion_sort.pdf.txt`

### Deep Notes
- Sorting sources cover the mechanics and trace patterns of Bubble Sort, Selection Sort, and Insertion Sort.
- Bubble sort repeatedly compares adjacent elements and swaps out-of-order pairs, pushing the largest unsorted value toward the end each pass.
- Selection sort selects the minimum from the unsorted suffix and swaps it into the next output position; it has fewer swaps than bubble sort but still scans quadratically.
- Insertion sort grows a sorted prefix and inserts each new item into its proper place by shifting larger values right. It is efficient on nearly sorted data.
- Exam traces usually ask for array state after each pass, so record pass number, comparison range, swap/shift, and sorted region.

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_9_Sorting_Lecture_9_Sorting.pdf.txt`
```text
--- PAGE 1 ---
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 9
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
SORTING
Preliminaries
Insertion sort
Selection sort
Bubble sort

--- PAGE 3 ---
3
Preliminaries
The algorithms will all be exchangeable.
Each will be passed an array containing 
the elements.
We will also assume the existence of 
the "<" and ">" operators.
Sorting under these conditions is known 
as comparison-based sorting.

--- PAGE 4 ---
4
Insertion Sort
Original 34 8 64 51 32 21 P. Moved 
--------------------------------------------------------
After p = 1
8
34
64
51
32
21
1
After p = 2
8
34
64
51
32
21
0
After p = 3
8
34
51
64
32
21
1
After p = 4
8
32
34
51
64
21
3
After p = 5
8 21 32 34 51 64 4

--- PAGE 5 ---
5
def insertion_sort(a):
for p in range(1, len(a)):
tmp = a[p]
j = p
while j > 0 and tmp < a[j - 1]:
a[j] = a[j - 1]
j -= 1
a[j] = tmp
//Insertion sort routine

--- PAGE 6 ---
6
3 cases in algorithms
There are 3 cases 
when study in algorithms.
Best Case
Worst Case
Average Case

--- PAGE 7 ---
7
Selection sort
Selection Sort is a simple comparison-
based sorting algorithm that works by 
dividing the input list into two parts: 
the sorted part and the unsorted part.
The algorithm repeatedly finds the 
minimum element from the unsorted 
part and swaps it with the first element 
of the unsorted part. This process is 
repeated until the entire list becomes 
sorted.

--- PAGE 8 ---
8
Selection Sort
Original 64
25
12
22
11 min_idxswap
--------------------------------------------------------
For i=0,j=4 11
25
12
22
64 4
1
For i=1,j=4 11
12
25
22
64 2
1
For i=2,j=4 11 12
22
25
64 3
1
For i=3,j=4 11
12
22
25
64 3
0
For i=4,j=4 11
12
22
25
64 4
0

--- PAGE 9 ---
9
def selection_sort(arr):
n = len(arr)
for i in range(n):
min_idx = i
count = 0
for j in range(i + 1, n):
if arr[j] < arr[min_idx]:
min_idx = j
if min_idx != i:
temp = arr[i]
arr[i] = arr[min_idx]
arr[min_idx] = temp 
//Selection sort routine
```

#### Extract: `conductor/extracted/ปี67_Lecture_9_Sorting_For_Example_Bubble_sort.pdf.txt`
```text
--- PAGE 1 ---
Bubble sort 
ตัวอยางการทํางาน 
สมมติวาเราเรามีลิสต [5, 1, 4, 2, 8] 
รอบที่ 1: 
เปรียบเทียบ 5 กับ 1: เนื่องจาก 5 > 1 ใหสลับตําแหนงกัน จะได [1, 5, 4, 2, 8] 
เปรียบเทียบ 5 กับ 4: เนื่องจาก 5 > 4 ใหสลับตําแหนงกัน จะได [1, 4, 5, 2, 8] 
เปรียบเทียบ 5 กับ 2: เนื่องจาก 5 > 2 ใหสลับตําแหนงกัน จะได [1, 4, 2, 5, 8] 
เปรียบเทียบ 5 กับ 8: เนื่องจาก 5 < 8 ไมตองสลับตําแหนง จะได [1, 4, 2, 5, 8] เหมือนเดิม 
สิ้นสุดรอบที่ 1 ตัวเลขที่มากที่สุดคือ 8 จะถูก "bubble" ไปอยูที่ตําแหนงสุดทายของรายการแลว 
 
รอบที่ 2: 
เปรียบเทียบ 1 กับ 4: 1 < 4 ไมสลับ 
เปรียบเทียบ 4 กับ 2: 4 > 2 สลับ จะได [1, 2, 4, 5, 8] 
เปรียบเทียบ 4 กับ 5: 4 < 5 ไมสลับ 
เปรียบเทียบ 5 กับ 8: 5 < 8 ไมสลับ (ไมจําเปนตองเปรียบเทียบกับ 8 แลว เพราะ 8 อยูในตําแหนงที่ถูกตองแลว) 
สิ้นสุดรอบที่ 2 ตัวเลข 5 จะถูก "bubble" ไปอยูในตําแหนงที่ถูกตอง 
 
รอบที่ 3: 
เปรียบเทียบ 1 กับ 2: 1 < 2 ไมสลับ 
เปรียบเทียบ 2 กับ 4: 2 < 4 ไมสลับ 
เปรียบเทียบ 4 กับ 5: 4 < 5 ไมสลับ 
สิ้นสุดรอบที่ 3 จะไมมีการสลับเกิดขึ้นเลย ซึ่งเปนสัญญาณบงบอกวารายการถูกเรียงลําดับเสร็จสมบูรณแลว 
แตโปรแกรมยังทํางานตอไป ดวย for i in range(n):

--- PAGE 2 ---
สมมติวาเรามีลิสต [64, 34, 25, 12, 22, 11, 90] 
 รอบที่ 1: 
 (64, 34) -> สลับ -> [34, 64, 25, 12, 22, 11, 90] 
 (64, 25) -> สลับ -> [34, 25, 64, 12, 22, 11, 90] 
 (64, 12) -> สลับ -> [34, 25, 12, 64, 22, 11, 90] 
 (64, 22) -> สลับ -> [34, 25, 12, 22, 64, 11, 90] 
 (64, 11) -> สลับ -> [34, 25, 12, 22, 11, 64, 90] 
 (64, 90) -> ไมสลับ -> [34, 25, 12, 22, 11, 64, 90] 
 หลังรอบที่ 1: 90 (ตัวที่ใหญที่สุด) จะอยูที่ตําแหนงสุดทาย 
 
 รอบที่ 2: (พิจารณาถึงตําแหนงกอน 90) 
 (34, 25) -> สลับ -> [25, 34, 12, 22, 11, 64, 90] 
 (34, 12) -> สลับ -> [25, 12, 34, 22, 11, 64, 90] 
 (34, 22) -> สลับ -> [25, 12, 22, 34, 11, 64, 90] 
 (34, 11) -> สลับ -> [25, 12, 22, 11, 34, 64, 90] 
 (34, 64) -> ไมสลับ -> [25, 12, 22, 11, 34, 64, 90] 
 หลังรอบที่ 2: 64 จะอยูที่ตําแหนงรองสุดทาย 
กระบวนการนี้จะดําเนินตอไป ดวย for i in range(n):
```

#### Extract: `conductor/extracted/ปี67_Lecture_9_Sorting_For_Example_Selection_sort.pdf.txt`
```text
--- PAGE 1 ---
For Example Selection sort: 
If there is the exist array(list in python) contains the numbers [64, 25, 12, 22, 11] 
Write the step for the selection sort () function. In each round, consists of 
1) what is the minimum, and 
2) what is the remaining un-sorted are executed under. 
 
 
 
for i รอบแรก min_idx= 0, i=0 
จาก for j in range(i + 1, n): 
 if arr[j] < arr[min_idx]: 
 min_idx = j 
ได้ว่า 
 
 
รอบที่ 1: 
1. หาค่าน้อยที่สุด: ในอาร์เรย์ [64, 25, 12, 22, 11] ค่าน้อยที่สุดคือ 11 ซึ่งอยู่ที่ตำแหน่งดัชนี 4 
2. สลับ: สลับค่าน้อยที่สุด (11) กับสมาชิกตัวแรกของส่วนที่ยังไม่ได้จัดเรียง (64) 
o ก่อนสลับ: [64, 25, 12, 22, 11] 
o หลังสลับ: [11, 25, 12, 22, 64] 
3. ผลลัพธ์: สมาชิกตัวแรก (11) ถูกจัดเรียงแล้ว ตอนนี้ส่วนที่ยังไม่ได้จัดเรียงคือ [25, 12, 22, 64] 
 
 
 
for i รอบที่ 2 min_idx= 1, i=1 
แปลว่า ต าแหน่งที่ 0 เรียงแล้ว 
จาก for j in range(i + 1, n): 
 if arr[j] < arr[min_idx]: 
 min_idx = j 
ได้ว่า 
 
 
64 
25 
12 
22 
11 
0 
1 
2 
3 
4 
11 
25 
12 
22 
64 
0 
1 
2 
3 
4 
j 
min_idx 
64 
25 
12 
22 
11 
0 
1 
2 
3 
4 
j 
min_idx 
j 
min_idx 
11 
25 
12 
22 
64 
0 
1 
2 
3 
4 
j 
min_idx

--- PAGE 2 ---
Round 2: 
1. Find the minimum : From the unsorted array [25, 12, 22, 64] the minimum is 12 at 
index 2 
2. Swap: swap the minimum (12) with the first of the unsorted array (25) 
o Before swap: [11, 25, 12, 22, 64] 
o After swap : [11, 12, 25, 22, 64] 
3. Result: Now, 2 elements (11, 12) was sorted. The remaining unsorted array is [25, 22, 64] 
 
 
 
for i รอบที่ 3 min_idx= 2, i=2 
แปลว่า ต าแหน่งที่ 0,1 เรียงแล้ว 
จาก for j in range(i + 1, n): 
 if arr[j] < arr[min_idx]: 
 min_idx = j 
ได้ว่า 
 
 
Round 3: 
1. Find the minimum : From the unsorted array [ ] the minimum is ? at index ? 
2. Swap: swap the minimum (?) with the first of the unsorted array (?) 
o Before swap: [ ] เขียนสมาชิกใน array ให้ครบทั้ง 5 ตัว 
o After swap : [ ] เขียนสมาชิกใน array ให้ครบทั้ง 5 ตัว 
3. Result: Now, ? elements (? ) was sorted. The remaining unsorted array is[ ] 
Round 4: 
1. Find the minimum : From the unsorted array [ ] the minimum is ? at index ? 
2. Swap: swap the minimum (?) with the first of the unsorted array (?) 
o Before swap: [ ] เขียนสมาชิกใน array ให้ครบทั้ง 5 ตัว 
o After swap : [ ] เขียนสมาชิกใน array ให้ครบทั้ง 5 ตัว 
3. Result: Now, ? elements (? ) was sorted. The remaining unsorted array is[ ] 
11 
25 
12 
22 
64 
0 
1 
2 
3 
4 
j 
min_idx 
11 
25 
12 
22 
64 
0 
1 
2 
3 
4 
j 
min_idx

--- PAGE 3 ---
Round 5: 
1. There is only one element [64] mean sorted already. 
2. Result: Now, all elements were sorted [11, 12, 22, 25, 64]. 
อย่าลืม for i in range(5): 
// ค าสั่ง range(5): หมายถึง [0, 1, 2, 3, 4] 
 print(i) 
 # ผลลัพธ์: 
 # 0 
 # 1 
 # 2 
 # 3 
 # 4 
ไม่ใช่ 
 # 1 
 # 2 
 # 3 
 # 4 
 # 5 
 
 
หน้าตาประโยคค าสั่งที่ main 
my_list = [34, 8, 64, 51, 32, 21] 
insertion_sort(my_list) 
print("Result :", my_list) 
 
my_list = [64, 25, 12, 22, 11] 
selection_sort(my_list) 
print("Result : ", my_list)
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
