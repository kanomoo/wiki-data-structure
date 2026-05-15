---
type: synthesis
tags: [data-structure, exam, thai, complete-notes, revision]
created: 2026-05-16
updated: 2026-05-16
sources:
  - raw/Data structure
  - raw/Data structure/Python_Oop.pdf
  - raw/Data structure/ปี67
  - raw/Data structure/ปีเก่า
---

# Data Structure Complete Exam Notes

หน้านี้เป็นชุดอ่านสอบรวมจากไฟล์ทั้งหมดใน `raw/Data structure` โดยจัดใหม่ให้เป็นลำดับอ่านง่าย: นิยาม, วิธีทำมือ, code logic, จุดที่มักออกสอบ, complexity, และกับดักเวลาทำข้อสอบ เนื้อหานี้เชื่อมกับหน้า concept/source เดิม เช่น [[linked-list|Linked List]], [[stack|Stack & Queue]], [[binary-search-tree|Binary Search Tree]], [[heap-priority-queue|Heap & Priority Queue]], [[hashing|Hashing]], [[sorting-algorithms|Sorting Algorithms]], [[graph-algorithms|Graph Algorithms]], และ [[shortest-path-algorithms|Shortest Path Algorithms]].

> [!tip] วิธีอ่านเร็วสำหรับสอบ
> อ่านตามลำดับนี้: Hashing -> Heap/Priority Queue -> Sorting -> Graph/Topological Sort -> Shortest Path -> Linked List/Stack/Queue -> Tree/BST -> Python OOP. จากโน้ตปีเก่าและข้อสอบเก่า หัวข้อที่ออกบ่อยคือการ trace ตาราง/array ทีละรอบ ไม่ใช่แค่จำคำนิยาม.

## 1. Foundations: ADT, Data Structure, Algorithm

**Data Type** คือชนิดข้อมูลที่ภาษาโปรแกรมรู้วิธีเก็บและประมวลผล เช่น numeric, sequence, boolean, dictionary ใน Python ส่วน **Abstract Data Type (ADT)** คือข้อกำหนดเชิงพฤติกรรมว่าข้อมูลทำอะไรได้บ้าง เช่น Stack มี `push`, `pop`, `top`, `isEmpty`; Queue มี `enqueue`, `dequeue`; List มี insert/delete/search โดยยังไม่สนว่า implement ด้วย array หรือ linked list.

**Data Structure** คือโครงสร้างจริงที่ใช้เก็บข้อมูลในหน่วยความจำ เช่น array, linked list, tree, hash table, heap, graph. ข้อสอบมักถามให้แยก “แนวคิด ADT” กับ “วิธี implement” เช่น Stack เป็น ADT ที่ implement ได้ทั้ง list array และ linked list.

**Algorithm** คือขั้นตอนวิธีที่แก้ปัญหาอย่างมีลำดับ เช่น insertion sort, topological sort, unweighted shortest path. การวิเคราะห์ algorithm มักวัดด้วย:

| สัญลักษณ์ | ความหมาย | ใช้ตอบสอบอย่างไร |
|---|---|---|
| $O(1)$ | คงที่ | ทำครั้งเดียว ไม่ขึ้นกับจำนวนข้อมูล |
| $O(\log n)$ | เพิ่มช้า | มักเกิดในต้นไม้สมดุลหรือ binary search |
| $O(n)$ | ไล่ครบหนึ่งรอบ | traversal/search ใน linked list |
| $O(n \log n)$ | sorting ที่ดีโดยทั่วไป | quicksort/mergesort/heap sort เฉลี่ย |
| $O(n^2)$ | loop ซ้อนหรือ sort พื้นฐาน | bubble/selection/insertion worst case |

จุดสำคัญของวิชานี้คือ “ต้อง trace ได้” มากกว่าท่องสูตรอย่างเดียว เช่น hash ชนกี่ครั้ง, heap `hole` ย้ายกี่รอบ, insertion sort หลัง `p = ?` array เป็นอะไร, topological sort queue ออกอะไรบ้าง.

## 2. Python OOP สำหรับ Data Structure

ไฟล์ `Python_Oop.pdf` เสริมพื้นฐาน Class/Object, Encapsulation, Static, Inheritance และตัวอย่าง Stack/Queue แบบคลาส จุดที่ต้องจำ:

- **Class** คือ blueprint หรือต้นแบบของ object.
- **Object** คือ instance ที่ถูกสร้างจาก class มี state ของตัวเอง.
- **Constructor** ใน Python คือ `__init__` ทำงานตอนสร้าง object.
- **Encapsulation** คือซ่อนข้อมูลไว้หลัง method เพื่อลดการแก้ state ผิดทาง.
- ในการเขียน data structure มักมี private-like attributes เช่น `self.items`, `self.head`, `self.currentSize`.

ตัวอย่าง Stack แบบ Python:

```python
class Stack:
    def __init__(self, capacity):
        self.items = []
        self.capacity = capacity

    def is_empty(self):
        return len(self.items) == 0

    def is_full(self):
        return len(self.items) == self.capacity

    def push(self, item):
        if self.is_full():
            raise OverflowError("Stack Overflow")
        self.items.append(item)

    def pop(self):
        if self.is_empty():
            raise IndexError("Stack Underflow")
        return self.items.pop()

    def top(self):
        if self.is_empty():
            raise IndexError("Stack Underflow")
        return self.items[-1]
```

ข้อสอบที่ถาม code มักเน้นว่า object ถูกสร้างเมื่อใด, constructor รับ parameter อะไร, และ state หลังเรียก method เป็นอย่างไร.

## 3. Linked List

Linked List เป็น linear data structure ที่ node ไม่จำเป็นต้องอยู่ติดกันในหน่วยความจำ แต่เชื่อมกันด้วย pointer/reference ดูเพิ่มที่ [[linked-list|Linked List]] และ [[Lecture-3-Linked-List|Lecture 3 Linked List]].

### โครงสร้างพื้นฐาน

```python
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None
```

ใน singly linked list:

- `head` คือจุดเริ่มต้นของ list.
- node สุดท้ายมี `next = None`.
- การเดิน list ต้องเริ่มจาก `head` แล้วตาม `next`.
- ไม่มี random access แบบ array จึงหา index ที่ k เป็น $O(n)$.

### การ add หน้า list

```python
def add(self, item):
    temp = Node(item)
    temp.next = self.head
    self.head = temp
```

ถ้าเรียก `add(1), add(2), add(3)` ผลลัพธ์คือ `3 -> 2 -> 1` เพราะทุกตัวแทรกที่หัว list. นี่เป็นกับดักจากแบบฝึกหัด: ถ้าโจทย์ต้องการ output `1,2,3,4,5` แต่ใช้ `add` ที่หัว ต้องใส่ย้อนลำดับหรือใช้ method append/insert ที่เหมาะสม.

### การ remove

ขั้นตอนลบค่า `item`:

1. ตั้ง `current = head`, `previous = None`.
2. เดินไปจนเจอค่าหรือจบ list.
3. ถ้าลบตัวแรก ให้ `head = current.next`.
4. ถ้าลบตัวกลาง/ท้าย ให้ `previous.next = current.next`.
5. ถ้าไม่เจอ ไม่ควรเปลี่ยน pointer.

กรณีพิเศษที่ชอบออก:

- list ว่าง
- ลบ node แรก
- ลบ node สุดท้าย
- ลบค่าที่ไม่มีใน list
- list มี node เดียว

### Complexity

| Operation | Singly Linked List | เหตุผล |
|---|---:|---|
| insert head | $O(1)$ | เปลี่ยน pointer สองตัว |
| search | $O(n)$ | ต้องเดินทีละ node |
| delete by value | $O(n)$ | ต้องหา node และ previous |
| append ไม่มี tail | $O(n)$ | ต้องเดินถึงท้าย |
| append มี tail | $O(1)$ | ชี้ท้ายได้ทันที |

## 4. Stack, Queue, และ Postfix

ดูเพิ่มที่ [[stack|Stack & Queue]], [[postfix-logic|Postfix Logic]], [[Lecture-4-Stack|Lecture 4 Stack & Postfix]], และ [[Test-Program-1-Queue|Test Program 1 Queue]].

### Stack

Stack ใช้หลัก **LIFO**: Last In, First Out. คำสั่งหลักคือ:

- `push(x)` เพิ่มข้อมูลบน top
- `pop()` เอาข้อมูลบน top ออก
- `top()` หรือ `peek()` ดูข้อมูลบน top
- `isEmpty()`, `isFull()`

ถ้า stack capacity = 5 และ push `5,10,15,20`, pop 4 ครั้ง, push `25,30,35`, pop 2 ครั้ง:

- หลัง push แรก: `[5,10,15,20]`
- pop 4 ครั้ง: `[]`
- push 25,30,35: `[25,30,35]`
- pop 2 ครั้ง: `[25]`
- เหลือ `25`

ข้อสอบ stack มักให้ trace แล้วถาม “เหลือค่าอะไร” หรือ “เกิด overflow/underflow ไหม”.

### Queue

Queue ใช้หลัก **FIFO**: First In, First Out.

- `enqueue(x)` เพิ่มท้ายคิว
- `dequeue()` เอาหน้าคิวออก
- `front` ชี้ตัวแรกที่จะออก
- `back/rear` ชี้ตำแหน่งท้าย

Circular Queue ใช้ modulo เพื่อ wraparound:

```text
rear = (rear + 1) % capacity
front = (front + 1) % capacity
```

กับดักคือเมื่อ `rear` ถึงช่องสุดท้ายแล้วไม่ใช่ว่า queue เต็มเสมอ ต้องดูจำนวนข้อมูลหรือเงื่อนไขว่าง/เต็มที่ class กำหนด.

### Postfix Evaluation

การคำนวณ postfix ใช้ stack:

1. เจอ operand ให้ push.
2. เจอ operator ให้ pop สองตัว.
3. ตัวที่ pop ทีหลังคือ left operand, ตัวที่ pop ก่อนคือ right operand.
4. คำนวณแล้ว push ผลลัพธ์กลับ.

ตัวอย่าง `6 5 2 3 + 8 * + 3 + * /` ให้ไล่ stack ทีละ token อย่าสลับ operand ตอน `-` หรือ `/`.

### Infix to Postfix

หลักการแปลง:

- operand ออก output ทันที
- operator เข้า stack ตาม precedence
- `(` push เข้า stack
- `)` pop จนเจอ `(`
- operator precedence สูงกว่าออกก่อน เช่น `* / %` ก่อน `+ -`

จุดสอบคือดู precedence และวงเล็บ ไม่ใช่แค่จำสูตร.

## 5. Tree และ Binary Tree

ดูเพิ่มที่ [[tree-and-binary-tree|Tree & Binary Tree]], [[Lecture-5-Tree|Lecture 5 Tree]], และ [[Assignment-2-Binary-Tree|Assignment 2 Binary Tree]].

คำศัพท์:

- **Root**: node บนสุด
- **Parent/Child**: ความสัมพันธ์บนลงล่าง
- **Leaf**: node ไม่มีลูก
- **Sibling**: node ที่มี parent เดียวกัน
- **Path**: ลำดับ node ที่เชื่อมกัน
- **Depth**: ระยะจาก root ถึง node
- **Height**: ระยะจาก node ถึง leaf ที่ลึกสุด

Binary Tree คือ tree ที่แต่ละ node มีลูกได้ไม่เกิน 2 ตัว: left และ right.

### Traversal

| Traversal | ลำดับ | จำง่าย |
|---|---|---|
| Preorder | Root, Left, Right | เจอ root ก่อน |
| Inorder | Left, Root, Right | BST จะได้เรียงจากน้อยไปมาก |
| Postorder | Left, Right, Root | root มาทีหลัง |

โจทย์ Assignment 2 ให้สร้าง binary tree จาก postorder และ inorder:

1. ตัวสุดท้ายของ postorder คือ root.
2. หา root ใน inorder เพื่อแบ่งซ้าย/ขวา.
3. จำนวนตัวฝั่งซ้ายใน inorder บอกจำนวน node ของ subtree ซ้าย.
4. ทำซ้ำแบบ recursive.
5. เมื่อต้นไม้เสร็จ ให้ตอบ preorder.

ถ้ามีเลขซ้ำ ต้องใช้ตำแหน่งตามโจทย์และแบ่ง subtree อย่างระวัง อย่าเลือก root occurrence แบบเดาสุ่ม.

## 6. Binary Search Tree และการลบ

ดูเพิ่มที่ [[binary-search-tree|Binary Search Tree]], [[bst-deletion-advanced|BST Deletion Advanced]], [[Lecture-5.1-BST|Lecture 5.1 BST]], และ [[Lecture-5.2-BST-Remove|Lecture 5.2 BST Remove]].

BST มีกฎ:

- ค่าฝั่งซ้ายของ node น้อยกว่า node
- ค่าฝั่งขวาของ node มากกว่า node
- กฎนี้ต้องจริงในทุก subtree

### Insert

เริ่มจาก root:

1. ถ้าค่าน้อยกว่า current ไปซ้าย.
2. ถ้าค่ามากกว่า current ไปขวา.
3. ถ้าช่องถัดไปว่าง ให้แทรกตรงนั้น.
4. ถ้ามีเลขซ้ำ ให้ดู convention ของวิชา/โจทย์ว่าไปซ้าย ขวา หรือไม่รับซ้ำ.

### Search

เหมือน insert แต่หยุดเมื่อเจอค่าหรือถึง `None`. เวลาเฉลี่ย $O(\log n)$ ถ้าต้นไม้สมดุล แต่ worst case $O(n)$ ถ้าต้นไม้เอียงเหมือน linked list.

### Delete: 3 กรณีสำคัญ

1. **ลบ leaf**: ตัด pointer จาก parent เป็น `None`.
2. **ลบ node มีลูก 1 ตัว**: ให้ parent ชี้ข้าม node ไปยังลูกตัวนั้น.
3. **ลบ node มีลูก 2 ตัว**: หา replacement แล้วค่อยลบ replacement จากตำแหน่งเดิม.

Replacement ที่ใช้บ่อย:

- **Inorder successor**: ค่าน้อยสุดใน subtree ขวา.
- **Inorder predecessor**: ค่ามากสุดใน subtree ซ้าย.

ข้อสอบ/ชีทเน้น “remove node with 2 children” มาก ต้องเขียนให้ชัดว่าเอาค่า successor/predecessor มาแทน แล้วลบ node เดิมของค่านั้น ซึ่งมักกลายเป็นกรณี leaf หรือมีลูกเดียว.

## 7. Hashing

ดูเพิ่มที่ [[hashing|Hashing]], [[Lecture-7-Hashing|Lecture 7 Hashing]], และโน้ตปีเก่า `Noteอู้ดง.pdf`.

Hash Table ใช้ array ขนาดคงที่ `TableSize` และ hash function เพื่อ map key ไป index.

### Hash Function ในอุดมคติ

จากโน้ตปีเก่า จุดที่อาจออกสอบ:

1. คำนวณง่าย/เร็ว
2. key ต่างกันควรไปคนละตำแหน่งให้มากที่สุด
3. กระจายข้อมูลทั่วตาราง

ในโลกจริง collision เลี่ยงไม่ได้ เพราะจำนวน key เป็นไปได้มากกว่าจำนวนช่องใน table.

### Integer Hash

```text
hash(x) = x % TableSize
```

ถ้า `x = 23`, `TableSize = 7`, index คือ `23 % 7 = 2`.

### String Hash แบบบวก ASCII

แนวจากโน้ต: `hashVal += key[i]` แล้ว `% TableSize`.

ตัวอย่าง `"ANN"`:

- ASCII `A = 65`, `N = 78`, `N = 78`
- `hashVal = 65 + 78 + 78 = 221`
- ถ้า `TableSize = 7`, index = `221 % 7 = 4`
- loop ทำงาน 3 รอบ รอบที่ 4 เงื่อนไข false

### Collision Resolution

**Separate Chaining**: ช่องใน table ชี้ไป linked list ของ key ที่ hash มา index เดียวกัน. ข้อดีคือลบง่ายกว่า open addressing แต่ต้องเก็บ pointer/list เพิ่ม.

**Open Addressing**: ถ้าชนให้หา “ช่องใหม่” ใน table เดิม.

สูตรรวม:

```text
h_i(x) = (hash(x) + f(i)) % TableSize
```

#### Linear Probing

```text
f(i) = i
```

ข้อดี: เข้าใจง่าย. ข้อเสีย: เกิด **primary clustering** ข้อมูลเกาะกลุ่ม, ลบยาก ต้องมีสถานะ deleted.

#### Quadratic Probing

```text
f(i) = i^2
```

ช่วยลด primary clustering แต่ยังมี secondary clustering และต้องระวัง TableSize.

#### Double Hashing

หัวข้อที่เด่นในข้อสอบ:

```text
h_i(x) = (hash(x) + i * hash2(x)) % TableSize
hash2(x) = R - (x % R)
```

โดย `R` คือจำนวนเฉพาะที่น้อยกว่า `TableSize` มากที่สุดหรือโจทย์กำหนด.

ตัวอย่างถ้า `TableSize = 10`, `R = 7`, key `60`:

- `hash(60) = 60 % 10 = 0`
- ถ้า index 0 ชน, `hash2(60) = 7 - (60 % 7) = 7 - 4 = 3`
- ชนครั้งที่ 1: `(0 + 1*3) % 10 = 3`
- ชนครั้งที่ 2: `(0 + 2*3) % 10 = 6`
- ชนครั้งที่ 3: `(0 + 3*3) % 10 = 9`
- ชนครั้งที่ 4: `(0 + 4*3) % 10 = 2`

ข้อสอบมักถาม “ชนกี่ครั้ง” ให้นับเฉพาะตอนช่องที่คำนวณได้มีข้อมูลอยู่แล้ว แล้วจึงขยับ `i`.

### Rehashing

Rehashing คือสร้าง table ใหม่ที่ใหญ่กว่าเดิม แล้ว insert ข้อมูลทั้งหมดใหม่ตาม hash function ใหม่. เงื่อนไขมักเป็น load factor มากกว่า 70%, 75% หรือค่าที่โจทย์กำหนด.

```text
load factor = จำนวน active / TableSize
```

ถ้า `TableSize = 7`, active = 5:

```text
5 * 100 / 7 = 71.42%
```

ถ้าเกณฑ์ rehash คือมากกว่า 70% ก็ต้อง rehash. ขนาดใหม่มักเลือกจำนวนเฉพาะที่มากกว่าหรือเท่ากับ 2 เท่าของขนาดเดิม เช่น 7 -> 17 ไม่ใช้ 14.

### สถานะใน Hash Table

ข้อสอบบางชุดให้เขียน `Info`:

- `ACTIVE`: ช่องมีข้อมูลใช้งานอยู่
- `EMPTY`: ช่องว่างไม่เคยใช้
- `DELETED`: เคยมีข้อมูลแต่ลบแล้ว ใช้เพื่อให้ search/probing ยังเดินต่อได้

คำถามเชิง code ที่พบในโน้ต:

```cpp
array[currentPos] = HashEntry(x, ACTIVE);
```

เขียนแทนได้เป็น:

```cpp
array[currentPos].element = x;
array[currentPos].info = ACTIVE;
```

## 8. Heap และ Priority Queue

ดูเพิ่มที่ [[heap-priority-queue|Heap & Priority Queue]], [[Lecture-8-Priority-Queue|Lecture 8 Priority Queue]], [[Lecture-8.1-Priority-Queue-Ops|Lecture 8.1 Heap Ops]], และ [[Assignment-3-Binary-Heap|Assignment 3 Binary Heap]].

Priority Queue คือ queue ที่ไม่ได้ออกตามเวลามาถึงเสมอ แต่ออกตาม priority. ในวิชานี้ใช้ **Binary Min-Heap** เป็นหลัก.

### Heap Properties

1. **Structure property**: เป็น complete binary tree คือเต็มทุกระดับ ยกเว้นระดับสุดท้าย และเติมจากซ้ายไปขวา.
2. **Heap order property**: สำหรับ min-heap, parent <= child ทุกตัว ดังนั้น root คือค่าน้อยสุด.

Array representation ใช้ index เริ่มที่ 1:

```text
parent(i) = i // 2
left(i) = 2i
right(i) = 2i + 1
```

ช่อง index 0 ไม่ใช้ใน implementation แบบ Mark Allen Weiss/ชีทเรียน เพื่อให้สูตรง่าย.

### Insert: Percolate Up

ขั้นตอน:

1. เพิ่ม `currentSize`.
2. สร้าง `hole` ที่ตำแหน่งท้าย.
3. เปรียบเทียบ `x` กับ parent.
4. ถ้า `x < parent`, เลื่อน parent ลงมาใน hole.
5. ขยับ `hole = hole // 2`.
6. ทำซ้ำจน root หรือ parent <= x.
7. ใส่ `x` ที่ hole สุดท้าย.

Pseudo C++:

```cpp
int hole = ++currentSize;
for (; hole > 1 && x < array[hole / 2]; hole /= 2) {
    array[hole] = array[hole / 2];
}
array[hole] = x;
```

จุดออกสอบจากโน้ต: ให้บอก `hole` แต่ละรอบ, เปรียบเทียบเลขใดกับเลขใด, loop ทำงานกี่รอบ, และประโยคใน loop ทำงานกี่รอบ.

### DeleteMin: Percolate Down

ขั้นตอน:

1. เก็บ root เป็นค่าที่ลบออก (`minItem = array[1]`).
2. เอาค่าท้ายสุดมาเป็น `tmp`.
3. ลด `currentSize`.
4. เริ่ม `hole = 1`.
5. เลือกลูกที่เล็กกว่า (`child`).
6. ถ้า `child < tmp`, เลื่อน child ขึ้นมา.
7. ขยับ `hole = child`.
8. ใส่ `tmp` ในตำแหน่งสุดท้าย.

Pseudo C++:

```cpp
void percolateDown(int hole) {
    int child;
    Comparable tmp = array[hole];
    for (; hole * 2 <= currentSize; hole = child) {
        child = hole * 2;
        if (child != currentSize && array[child + 1] < array[child]) {
            child++;
        }
        if (array[child] < tmp) {
            array[hole] = array[child];
        } else {
            break;
        }
    }
    array[hole] = tmp;
}
```

ข้อสอบมักให้ heap หลัง insert แล้วให้ `deleteMin` 1-2 ครั้ง จากนั้น insert เพิ่มอีกตัว ต้องวาด array หลังแต่ละ operation.

### Complexity

| Operation | Complexity |
|---|---:|
| findMin | $O(1)$ |
| insert | $O(\log n)$ |
| deleteMin | $O(\log n)$ |
| buildHeap | $O(n)$ |

## 9. Sorting

ดูเพิ่มที่ [[sorting-algorithms|Sorting Algorithms]], [[Lecture-9-Sorting|Lecture 9 Sorting]], และ [[Lecture-9.1|Lecture 9.1 Advanced Sorting]].

### Insertion Sort

แนวคิด: มองซ้ายมือเป็นส่วนที่ sorted แล้ว นำตัวที่ตำแหน่ง `p` แทรกเข้าไปในตำแหน่งถูกต้อง.

```cpp
template <class Comparable>
void insertionSort(vector<Comparable> &a) {
    for (int p = 1; p < a.size(); p++) {
        Comparable tmp = a[p];
        int j;
        for (j = p; j > 0 && tmp < a[j - 1]; j--) {
            a[j] = a[j - 1];
        }
        a[j] = tmp;
    }
}
```

คำที่ข้อสอบชอบใช้:

- `p`: รอบนอก กำลังหยิบตัวไหนมาแทรก
- `tmp`: ค่าที่หยิบออกมา
- `j`: ตำแหน่งที่เลื่อนถอย
- `position move`: จำนวนครั้งที่เลื่อนข้อมูล
- `After p = ?`: array หลังจบรอบนั้น

ตัวอย่าง `34, 8, 64, 51, 32, 21`:

| p | tmp | ผลหลังจบรอบ | move |
|---:|---:|---|---:|
| 1 | 8 | 8, 34, 64, 51, 32, 21 | 1 |
| 2 | 64 | 8, 34, 64, 51, 32, 21 | 0 |
| 3 | 51 | 8, 34, 51, 64, 32, 21 | 1 |
| 4 | 32 | 8, 32, 34, 51, 64, 21 | 3 |
| 5 | 21 | 8, 21, 32, 34, 51, 64 | 4 |

Best case คือข้อมูลเรียงอยู่แล้ว $O(n)$, worst case คือเรียงกลับด้าน $O(n^2)$.

### Bubble Sort

เปรียบเทียบคู่ติดกันแล้วสลับ ถ้าตัวซ้ายมากกว่าตัวขวา หลังหนึ่ง pass ค่ามากสุดจะลอยไปท้าย. Complexity โดยทั่วไป $O(n^2)$. ข้อสอบตัวอย่างมักถามผลหลังรอบที่ 1/2.

### Selection Sort

แต่ละรอบหา minimum จากส่วนที่ยังไม่ sorted แล้วสลับมาไว้ตำแหน่งหน้า. จำนวน swap น้อย แต่จำนวน comparison ยัง $O(n^2)$.

### Shellsort

Shellsort คือปรับปรุง insertion sort โดยใช้ gap/increment sequence. ทำ insertion sort แยกตามระยะ gap ก่อน แล้วค่อยลด gap จนเหลือ 1.

ตัวอย่าง gap:

- `n/2`, แล้วหาร 2 ไปเรื่อย ๆ
- ในชีท/โน้ตมีพูดถึง increment sequence เช่น `1,3,5` หรือ `2,4,6` ตามโจทย์

ข้อสอบมักให้ “After sort 1” หรือ “หลัง increment รอบนี้” ต้องจัดเฉพาะกลุ่มที่ห่างกันตาม gap ไม่ใช่ sort ทั้ง array ทันที.

### Quicksort

แนวคิด:

1. เลือก pivot.
2. partition array ให้ค่าน้อยกว่า pivot ไปซ้าย มากกว่า pivot ไปขวา.
3. pivot อยู่ตำแหน่งถูกต้อง.
4. recurse ซ้ายและขวา.

คำถามจากปีเก่า: “ข้อมูลตัวใดไม่ได้ถูกนำไป partition อีก เพราะเหตุใด” ตอบคือ pivot หลัง partition แล้ว เพราะ pivot ถูกวางในตำแหน่งสุดท้ายที่ถูกต้อง จึงไม่ต้องถูก partition ในรอบ recursive ต่อไป.

Average $O(n \log n)$, worst $O(n^2)$ ถ้า pivot แย่มากต่อเนื่อง.

## 10. Graph

ดูเพิ่มที่ [[graph-algorithms|Graph Algorithms]], [[topological-sort|Topological Sort]], [[Lecture-10-Graph|Lecture 10 Graph]], และ [[Lecture-11-Shortest-Path|Lecture 11 Shortest Path]].

Graph คือ `G = (V, E)`:

- `V` คือ set ของ vertices/nodes
- `E` คือ set ของ edges
- Directed graph ใช้ ordered pair เช่น `(A, B)` แปลว่า A ไป B ไม่ได้แปลว่า B ไป A
- Undirected graph ไม่มีทิศทาง คู่ `(A, B)` และ `(B, A)` ถือเป็นเส้นเดียวกัน

คำศัพท์:

- **Adjacent**: `w` adjacent to `v` ถ้ามี edge `(v, w)`
- **Path**: ลำดับ vertex ที่เดินตาม edge ได้
- **Simple path**: path ที่ vertex ไม่ซ้ำ ยกเว้นอาจเริ่ม/จบจุดเดียวกันใน cycle
- **Cycle**: path ที่กลับมาจุดเริ่มต้น
- **Acyclic**: ไม่มี cycle
- **Connected**: กราฟต่อเนื่อง
- **Strongly connected**: directed graph ที่ไปถึงกันได้ทุกคู่ตามทิศทาง
- **Weakly connected**: ถ้าลบทิศทางแล้วต่อเนื่อง

### Complete Graph

กราฟสมบูรณ์แบบไม่มีทิศทางที่มี `n` vertex มี edge:

```text
n(n - 1) / 2
```

ตัวอย่าง `n = 10`: `10 * 9 / 2 = 45` edges.

ถ้า directed complete graph อาจใช้ `n(n - 1)` ตามนิยามที่นับทิศทาง ต้องอ่านโจทย์ให้ชัด.

### Representation

#### Adjacency Matrix

ใช้ array 2 มิติ `A[u][v]`:

- 1 ถ้ามี edge
- 0 ถ้าไม่มี edge
- ถ้ามี weight อาจใส่ weight แทน 1

Space = $\Theta(|V|^2)`. เหมาะกับ dense graph. ตัวอย่าง 7 vertex ใช้ 49 ช่อง ถ้ามี 12 edge ใช้ช่องที่เป็น 1 แค่:

```text
12 * 100 / 49 = 24.48%
```

เหลือช่อง 0 ประมาณ 75.52% จึงเปลืองสำหรับ sparse graph.

#### Adjacency List

แต่ละ vertex เก็บ list ของ neighbor. Space = $O(|V| + |E|)`. ถ้า 7 vertex, 12 edge ใช้ประมาณ `7 + 12 = 19` entries. ชีทเน้นว่า adjacency list นิยมกว่าเมื่อกราฟมีเส้นน้อย.

## 11. Topological Sort

Topological Sort ใช้กับ Directed Acyclic Graph (DAG) เท่านั้น ถ้ามี cycle จะทำไม่ได้.

แนวคิด: เรียง vertex ให้ถ้ามี edge `u -> v`, `u` ต้องมาก่อน `v`.

### วิธีทำด้วย Indegree และ Queue

1. แปลงกราฟเป็น adjacency list.
2. สร้าง indegree array: นับจำนวน edge ที่ชี้เข้าแต่ละ vertex.
3. enqueue vertex ที่ indegree = 0.
4. dequeue ออกมาเป็นคำตอบ.
5. สำหรับ neighbor ของ vertex ที่ถูก dequeue ให้ลด indegree ลง 1.
6. ถ้า indegree ของ neighbor กลายเป็น 0 ให้ enqueue.
7. ทำจน queue ว่าง.
8. ถ้าจำนวน vertex ที่ออกมาไม่ครบ แปลว่ามี cycle.

Pseudo:

```text
for each vertex v:
    if indegree[v] == 0:
        q.enqueue(v)

while not q.is_empty():
    v = q.dequeue()
    print(v)
    for each w adjacent to v:
        indegree[w] -= 1
        if indegree[w] == 0:
            q.enqueue(w)
```

ข้อสอบมักให้กราฟแล้วให้เขียน:

- adjacency list
- indegree array เริ่มต้น
- queue แต่ละรอบ
- dequeue sequence ซึ่งคือ topological order

จากโน้ตปีเก่า แนวข้อสอบให้เขียนค่าในตาราง indegree และผล dequeue เป็นคำตอบ.

## 12. Shortest Path

ดูเพิ่มที่ [[shortest-path-algorithms|Shortest Path Algorithms]], [[Assignment-4-Shortest-Path|Assignment 4 Shortest Path]], และ [[Lecture-11-Shortest-Path|Lecture 11 Shortest Path]].

Shortest Path คือหาเส้นทางที่สั้นที่สุดจาก source `s` ไปยัง vertex อื่น ๆ. ในวิชานี้เน้น **Unweighted Shortest Path** ใช้ BFS/Queue และตาราง `Known, Dv, Pv`.

### ความหมายในตาราง

| Field | ความหมาย |
|---|---|
| `Known` | vertex นี้ประมวลผลเสร็จหรือยัง |
| `Dv` | distance จาก source ถึง vertex |
| `Pv` | previous vertex ใช้ย้อนเส้นทาง |
| `Queue` | vertex ที่รอประมวลผล |

ค่าเริ่มต้น:

- source `s`: `Dv = 0`
- vertex อื่น: `Dv = 999` หรือ infinity
- `Pv = 0` หรือ blank
- `Known = F`

### Algorithm แบบ Unweighted

```text
q.enqueue(s)
dist[s] = 0

while queue not empty:
    v = q.dequeue()
    known[v] = True
    for each w adjacent to v:
        if dist[w] == infinity:
            dist[w] = dist[v] + 1
            path[w] = v
            q.enqueue(w)
```

จุดที่ต้องเขียนในข้อสอบ:

1. แปลงกราฟเป็น adjacency list ก่อน.
2. ตั้งค่าตารางเริ่มต้นให้ครบ.
3. ไล่ queue ทีละตัว.
4. เมื่อเจอ neighbor ที่ยังไม่เคยได้ระยะ ให้ update `Dv` และ `Pv`.
5. เส้นทางจาก source ไป target ให้ย้อน `Pv` จาก target กลับ source แล้วกลับลำดับ.

ตัวอย่างจากโน้ต: ถ้าต้องหา `v3 -> v7` แล้วได้ `Pv` ย้อนเป็น `v7 <- v4 <- v1 <- v3`, คำตอบเส้นทางคือ `v3 -> v1 -> v4 -> v7`, ระยะทาง 3.

### Dijkstra

บางไฟล์ปีเก่ากล่าวถึง Dijkstra สำหรับ weighted graph ที่ไม่มี weight ติดลบ หลักต่างจาก unweighted คือเลือก vertex ที่ `Dv` น้อยสุดทุกครั้ง และ relax edge ด้วย weight:

```text
if Dv[w] > Dv[v] + weight(v, w):
    Dv[w] = Dv[v] + weight(v, w)
    Pv[w] = v
```

แต่จาก lecture หลักและ assignment ปี 67 เน้น unweighted shortest path มากกว่า.

## 13. Assignment และ Test Program ที่ควรฝึก

### Assignment 1 Linked List

ฝึกแยกโจทย์ว่า “มี instance เดิมแล้วหรือยัง” ถ้ามี `mylist` อยู่แล้ว ห้ามสร้าง `mylist = LinkedList()` ใหม่ เพราะจะทำข้อมูลเดิมหาย. ถ้า method `add` เพิ่มหัว list แต่โจทย์ต้องเรียง output จากน้อยไปมาก ต้องเลือกวิธีใส่ให้ถูก.

### Test Program 1 Queue

ควรฝึก queue/circular queue:

- ค่า `front`, `back`, `currentSize`
- enqueue เมื่อท้ายชนขอบ array
- dequeue แล้วช่องว่างกลับมาใช้ได้ไหม
- queue empty/full condition

### Assignment 2 Binary Tree

ใช้ inorder + postorder เพื่อสร้าง tree และตอบ preorder. ต้องระวังเลขซ้ำ.

### Assignment 3 Binary Heap

ฝึก insert sequence ลง heap และ trace `deleteMin`. ต้องบอก array representation และรูป tree ได้.

### Test Program 2 Sorting

ฝึกเขียนผลหลังแต่ละ pass/routine โดยเฉพาะ insertion sort, shellsort, quicksort partition.

### Assignment 4 Shortest Path

แปลงกราฟเป็น adjacency list และเติมตาราง `Known, Dv, Pv, Queue` ให้ครบทุก step.

## 14. แนวข้อสอบจากปีเก่า/โน้ตอู้ดง

จาก `Noteอู้ดง.pdf`, `DataStrucFinal2-xxAnd2-61-1.pdf`, `Data structure & Algorithm.pdf`, `Db.pdf`, `NW.pdf`, และรูปข้อสอบปีเก่า แนวที่ซ้ำคือ:

1. **Hashing 15 คะแนนโดยประมาณ**: Double hashing, collision count, active/deleted/empty, rehashing threshold, hash string ASCII.
2. **Heap/Priority Queue**: insert/deleteMin, ค่า `hole`, `child`, เปรียบเทียบเลขใด, array หลังแต่ละรอบ.
3. **Insertion Sort**: `After p = ?`, ค่า `tmp`, จำนวน position move.
4. **Shellsort**: ให้ increment sequence แล้วถามผลหลัง sort รอบที่กำหนด.
5. **Topological Sort**: เขียน indegree array, queue, dequeue order.
6. **Shortest Path**: เติมตาราง `Known, Dv, Pv` และเขียน path.
7. **คำถามอธิบาย/code statement**: เช่น complete graph edge formula, `HashEntry`, ทำไม pivot ไม่ partition ต่อ, complete binary tree min/max nodes.

## 15. สูตรที่ต้องจำก่อนเข้าสอบ

| เรื่อง | สูตร/หลัก |
|---|---|
| Hash integer | `x % TableSize` |
| Double hashing | `(hash(x) + i * (R - x % R)) % TableSize` |
| Load factor | `active / TableSize` |
| Rehash size | prime >= `2 * oldTableSize` |
| Heap parent | `i // 2` |
| Heap left child | `2i` |
| Heap right child | `2i + 1` |
| Complete graph edge | `n(n - 1) / 2` |
| Matrix space | `Theta(V^2)` |
| List graph space | `O(V + E)` |
| Insertion sort worst | `O(n^2)` |
| Heap insert/deleteMin | `O(log n)` |
| Unweighted shortest path | BFS with queue |

## 16. เช็กลิสต์ทำข้อสอบแบบไม่พลาด

- อ่านก่อนว่าโจทย์ถาม “ผลลัพธ์สุดท้าย” หรือ “แสดงทุกรอบ”.
- ถ้าเป็น hash ให้เขียน `TableSize`, `R`, `h0`, `i`, collision count แยกให้ชัด.
- ถ้าเป็น heap ให้เขียน array index เริ่มที่ 1 และช่อง 0 ไม่ใช้.
- ถ้าเป็น insertion sort ให้เขียน `p`, `tmp`, `j`, array หลังจบรอบ.
- ถ้าเป็น graph ให้แปลงเป็น adjacency list ก่อนทำ topological/shortest path.
- ถ้าเป็น shortest path ให้จำว่า `Pv` ใช้ย้อนจากปลายทางกลับต้นทาง.
- ถ้าเป็น linked list/stack/queue ให้เช็กกรณี empty/full/head/tail.
- ถ้าเป็น BST delete ให้แยก 0 child, 1 child, 2 children และระบุ successor/predecessor.

## Source Coverage

ไฟล์ทั้งหมดใน `raw/Data structure` ถูกทำ inventory พร้อม embed/link ไว้ที่ [[raw-data-structure-source-inventory|Raw Data Structure Source Inventory]]. PDF ที่มี text layer ถูก extract ลง `conductor/extracted` เพื่อใช้สรุป เนื้อหาที่เป็นรูปหรือ PDF ภาพล้วนถูกผูกเป็น visual source ใน inventory เพื่อเปิดดูใน Obsidian ได้โดยตรง.

