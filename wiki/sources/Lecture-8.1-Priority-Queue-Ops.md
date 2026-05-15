---
type: source
tags: [priority-queue, heap, implementation]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 8.1 Priority Queue (Insert and deleteMin)/]
---

# Source: Lecture 8.1 - Priority Queue Operations

## Summary
Technical implementation of a **Binary Heap** (Min-Heap) using an array, focusing on the `insert` and `deleteMin` operations.

## Implementation Details

### Python Class Structure
```python
class BinaryHeap:
    def __init__(self, capacity=100):
        # Index 0 is unused for easier parent/child math
        self.array = [None] * (capacity + 1)
        self.currentSize = 0

    def is_empty(self):
        return self.currentSize == 0
```

### 1. Insert (Percolate Up)
Add the element at the end and "bubble" it up until the heap property is restored.
```python
def insert(self, x):
    if self.currentSize == len(self.array) - 1:
        return # Full
    
    self.currentSize += 1
    hole = self.currentSize
    # While x is smaller than parent (hole // 2)
    while hole > 1 and x < self.array[hole // 2]:
        self.array[hole] = self.array[hole // 2]
        hole //= 2
    self.array[hole] = x
```

### 2. DeleteMin (Percolate Down)
Remove the root (index 1), move the last element to the root, and "bubble" it down.
```python
def delete_min(self):
    if self.is_empty():
        return None
    
    min_item = self.array[1]
    self.array[1] = self.array[self.currentSize]
    self.currentSize -= 1
    self._percolate_down(1)
    return min_item

def _percolate_down(self, hole):
    temp = self.array[hole]
    while hole * 2 <= self.currentSize:
        child = hole * 2 # Left child
        # Pick the smaller of the two children
        if child != self.currentSize and self.array[child + 1] < self.array[child]:
            child += 1
        
        if self.array[child] < temp:
            self.array[hole] = self.array[child]
        else:
            break
        hole = child
    self.array[hole] = temp
```

## Complexity/Trade-offs
- **Insert**: $O(\log n)$ average and worst case.
- **DeleteMin**: $O(\log n)$ as it always traverses the height.
- **FindMin**: $O(1)$ constant time access.

## Related Pages
- [[heap-priority-queue|Heap & Priority Queue Concept]]
- [[Assignment-3-Binary-Heap|Practice Assignment 3]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 8.1 Priority Queue (Insert and deleteMin)/Lecture 8.1 Priority Queue (Insert and deleteMin).pdf|Lecture 8.1 Priority Queue (Insert and deleteMin).pdf]] (12 pages, 2438 extracted characters) -> `conductor/extracted/ปี67_Lecture_8.1_Priority_Queue_Insert_and_deleteMin_Lecture_8.1_Priority_Queue_Insert_and_deleteMin_.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 8.1 Priority Queue (Insert and deleteMin)/For example Binary Heap.pdf|For example Binary Heap.pdf]] (4 pages, 2567 extracted characters) -> `conductor/extracted/ปี67_Lecture_8.1_Priority_Queue_Insert_and_deleteMin_For_example_Binary_Heap.pdf.txt`

### Deep Notes
- This page is the operational companion to the heap lecture: insertion uses percolate-up, deleteMin uses percolate-down.
- Insert: place the new value at the next open array slot to maintain complete-tree shape, then swap upward while it violates heap order.
- deleteMin: remove root, move last element to root, shrink heap, then swap downward with the smaller child until heap order is restored.
- Worked examples are best studied as arrays plus tree diagrams side by side because the array position is the actual implementation while the tree view explains the invariant.

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_8.1_Priority_Queue_Insert_and_deleteMin_Lecture_8.1_Priority_Queue_Insert_and_deleteMin_.pdf.txt`
```text
--- PAGE 1 ---
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 8.1
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
PRIORITY QUEUES (HEAPS)
Model
Simple Implementations
Binary Heap
Insert
deleteMin

--- PAGE 3 ---
3
class BinaryHeap:
def __init__(self, capacity=100):
# สร้าง list ที่มีขนาด capacity + 1 ( index 0 ไม่ถูกใช้งาน)
self.array = [None] * (capacity + 1)
self.currentSize = 0
def is_empty(self):
return self.currentSize == 0
def is_full(self):
return self.currentSize == len(self.array) – 1
def find_min(self):
if self.is_empty():
print("Queue is empty")
return None
return self.array[1]

--- PAGE 4 ---
4
Basic Heap Operations - insert
Algorithm
create a hole in the next available array 
position
while inserting X in the hole violate heap 
order
Percolate up the hole (by swapping with the 
parent) 
insert X in the hole

--- PAGE 5 ---
5
Example
Attempt to insert 14
Creating a hole
Bubbling the hole up

--- PAGE 6 ---
6
Example
Remaining two steps to insert 14

--- PAGE 7 ---
7
// Insert item x into the priority queue
def insert(self, x):
if self.is_full():
print("Heap is full")
return
self.currentSize += 1
hole = self.currentSize
# การหา parent: hole // 2
while hole > 1 and x < self.array[hole // 2]:
self.array[hole] = self.array[hole // 2]
hole //= 2
self.array[hole] = x

--- PAGE 8 ---
8
Basic Heap Operations-deleteMin
Algorithm
Find the minimum (at the root)
Remove the minimum a hole is created at root
While the last element X can not be inserted in the 
hole without violating the heap order
Percolate down the hole swap with smaller child
Insert X into the hole
Return minimum

--- PAGE 9 ---
9
Example
Creation of the hole at the root
First 13 is removed, and 31 is placed in the heap

--- PAGE 10 ---
10
Example
Next two steps in deleteMin

--- PAGE 11 ---
11
Example
Last two steps in deleteMin

--- PAGE 12 ---
12
// Remove the smallest item from the priority queue
def delete_min(self):
if self.is_empty():
print("Heap is empty")
return 
min_item = self.array[1]
self.array[1] = self.array[self.currentSize]
self.currentSize -= 1
self._percolate_down(1)
return min_item
def _percolate_down(self, hole):
temp = self.array[hole]
while hole * 2 <= self.currentSize:
child = hole * 2
if child != self.currentSize and self.array[child + 1] < 
self.array[child]:
child += 1
if self.array[child] < temp:
self.array[hole] = self.array[child]
else:
break
hole = child
self.array[hole] = temp
```

#### Extract: `conductor/extracted/ปี67_Lecture_8.1_Priority_Queue_Insert_and_deleteMin_For_example_Binary_Heap.pdf.txt`
```text
--- PAGE 1 ---
If there is the exist BinaryHeap's instance variable myheap which has 
10 elements as the Binary Tree following. Write statements in main 
program to insert the instance variable myheap with input is 14 and 
write the outputs to array by using class BinaryHeap 's methods that 
we learned only. แบบที่ 1 
Write the steps for the insert() function when insert element 14 
into the instance variable myheap. In each round,consists of 
1) what are the values of the variable hole, and 
2) what the comparison under the if-else condition that is checked. 
Each iteration must write 2 things. 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ณ เวลานี้ ตัวแปรออบเจค a มีสมาชิก 10 ตัว 
 
19 
31 
24 
16 
21 
13 
ไม่มีข้อมูล 
[0] 
3 
2 
4 
5 
6 
68 
65 
26 
32 
31 
 
[7] 
8 
10 
9 
11 
12 
 
1 
hole 
Left 
Right

--- PAGE 2 ---
def insert(self, x): 
 if self.is_full(): 
 print("Heap is full") 
 return 
 self.currentSize += 1 
 hole = self.currentSize 
 # การหา parent: hole // 2 
 while hole > 1 and x < self.array[hole // 2]: 
 self.array[hole] = self.array[hole // 2] 
 hole //= 2 
 self.array[hole] = x 
การท างานในฟังก์ชัน insert 
hole = 11 
while loop รอบที่ 1 hole = ?, ? > 1 จริง เปรียบเทียบ ? < ? 
while loop รอบที่ 2 hole = ?, ? > 1 จริง เปรียบเทียบ ? < ? 
while loop รอบที่ 3 hole = ? , ? > 1 จริง เปรียบเทียบ ? < ? 
ออกจาก while loop ตัวแปร hole มีค่า เท่ากับเท่าไร = ? 
while loop ท างานกี่รอบ ? รอบ ให้ดูว่า ประโยคค าสั่งที่อยู่ใน while loop ท างานกี่รอบ นั่นเอง

--- PAGE 3 ---
def delete_min(self): 
 if self.is_empty(): 
 print("Heap is empty") 
 return 
 min_item = self.array[1] 
 self.array[1] = self.array[self.currentSize] 
 self.currentSize -= 1 
 self._percolate_down(1) 
 return min_item 
 
def _percolate_down(self, hole): 
 temp = self.array[hole] 
 while hole * 2 <= self.currentSize: 
 child = hole * 2 
 if child != self.currentSize and self.array[child + 1] < self.array[child]: 
 child += 1 
 if self.array[child] < temp: 
 self.array[hole] = self.array[child] 
 else: 
 break 
 hole = child 
 self.array[hole] = temp

--- PAGE 4 ---
การท างานในฟังก์ชัน percolateDown 
hole = 1 
tmp = 
while loop รอบที่ 1 hole = , <= 10 child = (Left Child) เปรียบเทียบ < 
while loop รอบที่ 2 hole =, child = เปรียบเทียบ < ไม่ท ำ child++; 
while loop รอบที่ 3 hole =, child = เปรียบเทียบ < ท ำ child++; 
while loop รอบที่ 4 hole = , child = ? 
 
ออกจาก while loop ตัวแปร child มีค่า เท่ากับเท่าไร = ? 
while loop ท างานกี่รอบ ? รอบ
```
