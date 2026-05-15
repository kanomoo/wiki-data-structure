---
type: source
tags: [test, sorting, performance]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Test Program 2_ Sorting/]
---

# Source: Test Program 2 - Sorting

## Summary
A practical assessment involving the implementation and performance comparison of basic sorting algorithms: **Bubble Sort**, **Selection Sort**, and **Insertion Sort**.

## Implementation Details

### 1. Selection Sort Logic
Finds the minimum element from the unsorted part and puts it at the beginning.
```python
def selection_sort(arr):
    n = len(arr)
    for i in range(n):
        min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
```

### 2. Insertion Sort Logic
Builds the sorted array one item at a time by "inserting" it into its correct position.
```python
def insertion_sort(arr):
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        while j >= 0 and key < arr[j]:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
```

### 3. Comparison of $O(n^2)$ Sorts
| Algorithm | Best Case | Average | Worst Case | Swaps |
|-----------|-----------|---------|------------|-------|
| Bubble    | $O(n)$    | $O(n^2)$ | $O(n^2)$    | Many  |
| Selection | $O(n^2)$  | $O(n^2)$ | $O(n^2)$    | Few ($O(n)$) |
| Insertion | $O(n)$    | $O(n^2)$ | $O(n^2)$    | Many  |

## Complexity/Trade-offs
- **Selection Sort** is preferred when memory writes (swaps) are expensive because it only performs $O(n)$ swaps.
- **Insertion Sort** is extremely efficient for small datasets or arrays that are already "mostly sorted".

## Related Pages
- [[sorting-algorithms|Sorting Algorithms Concept]]
- [[Lecture-9-Sorting|Main Sorting Lecture]]
- [[Practice-Implementation-Guide|Practice Implementation Guide]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 9 Sorting/For Example Bubble sort.pdf|For Example Bubble sort.pdf]] (2 pages, 1957 extracted characters) -> `conductor/extracted/ปี67_Lecture_9_Sorting_For_Example_Bubble_sort.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 9 Sorting/For Example Selection sort.pdf|For Example Selection sort.pdf]] (3 pages, 2956 extracted characters) -> `conductor/extracted/ปี67_Lecture_9_Sorting_For_Example_Selection_sort.pdf.txt`
- [[raw/Data structure/ปี67/Test Program 2_ Sorting/Screenshot 2026-02-15 173348.png|Screenshot 2026-02-15 173348.png]] visual source

### Deep Notes
- This test program is sorting-focused. The screenshot is the authoritative prompt; lecture examples provide the step-by-step trace model.
- For bubble sort, document each pass and show adjacent swaps. For selection sort, document selected minimum and final swap per pass.
- If asked to code, keep loop bounds precise: bubble sort inner loop shrinks after each pass; selection sort inner loop scans from `i+1` to end.
- Complexity explanation should mention O(n^2) time for both and O(1) auxiliary space for in-place versions.

### Visual Source Checklist
- ![[raw/Data structure/ปี67/Test Program 2_ Sorting/Screenshot 2026-02-15 173348.png|180]]

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

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
