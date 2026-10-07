---
type: source
tags: [lecture, shortest-path, graph, assignment4, exam-leaks]
created: 2026-10-07
updated: 2026-10-07
sources: [voice-text/03_Data_Structures_and_Algorithms/20261007_092525.txt, IMG_20261007_120504_255.jpg, IMG_20261007_114532_858@2103460530.jpg]
---

# Source: Lecture 11 Shortest Path, Assignment 4 & Final Exam Briefing (7 ตุลาคม 2569)

## สรุปภาพรวมการบรรยาย (Executive Summary)
การบรรยายคาบเรียนสุดท้ายของภาคเรียนที่ 1/2569 โดย ดร.ประดิษฐ์ พิทักษ์เสถียรกุล ถ่ายทอดขั้นตอนวิธี **Unweighted Shortest Path Algorithm** (BFS + Queue), การสร้างตารางประมวลผล `Known`, `Dist (dv)`, `Path (pv)`, การมอบหมายและเฉลยการบ้าน **Assignment 4** ส่งในห้องเรียน และการประกาศ **แนวข้อสอบปลายภาค Final Exam อย่างเป็นทางการ (7 ข้อ 70 คะแนน หาร 2 เหลือ 35 คะแนน, Open Book + เครื่องคิดเลข)**

---

## 1. เนื้อหาหลักการเรียนการสอน (Core Concepts)

### 1.1 ทบทวน Topological Sort (Kahn's Algorithm)
- ใช้จัดลำดับงานบน **DAG (Directed Acyclic Graph)**
- คำนวณอาเรย์ `Indegree` ของทุกจุดยอด
- นำจุดยอดที่มี $\text{Indegree} = 0$ เข้า Queue $Q$
- วนลูป Dequeue $v$ ออกมา ลด $\text{Indegree}[w]$ ของเพื่อนบ้านลง 1 หากเป็น 0 ให้นำเข้า $Q$
- ลำดับผลลัพธ์ที่ได้: $v_1, v_2, v_5, v_4, v_3, v_7, v_6$

### 1.2 Unweighted Shortest Path Algorithm
- ใช้ Queue สำหรับ Breadth-First Search (BFS)
- โครงสร้างตารางประมวลผล 3 ช่องหลัก:
  1. `Known`: สถานะ Boolean (T/F) ยืนยันว่าพบเส้นทางสั้นที่สุดแล้ว
  2. `Dist (dv)`: ระยะทางจากจุดเริ่มต้น (Start Vertex $= 0$, จุดอื่น $= 999/\infty$)
  3. `Path (pv)`: จุดยอดย้อนกลับก่อนหน้า (Predecessor)
- ขั้นตอนวิธี:
```python
while not Q.isEmpty():
    v = Q.dequeue()
    v.known = True
    for w in v.adjacent:
        if w.dist == 999:
            w.dist = v.dist + 1
            w.path = v
            Q.enqueue(w)
```
- **การอ่านผลลัพธ์จากตาราง (Backtracking):**
  - ตัวอย่าง: หาเส้นทางสั้นที่สุดจาก $v_3 \rightarrow v_5$
  - ดูช่อง $v_5$: ได้ระยะทาง $d_v = 3$
  - ย้อนกลับ: $v_5 \leftarrow v_2 \leftarrow v_1 \leftarrow v_3$
  - ตอบ: เส้นทางคือ $(v_3, v_1, v_2, v_5)$ ความยาวเท่ากับ 3 เส้น

---

## 2. เฉลยการบ้าน Assignment 4 (Shortest Path on Graph)

### 2.1 โจทย์
กำหนดกราฟมี 7 จุดยอด ($A, B, C, D, E, F, G$) จุดเริ่มต้นคือ **Vertex A**
- $A \rightarrow B, C$
- $B \rightarrow G, E, C$
- $C \rightarrow E, D$
- $D \rightarrow F, A$
- $E \rightarrow D, F$
- $F \rightarrow \text{Ground}$
- $G \rightarrow E$

### 2.2 ข้อ 1: Adjacency List
```text
A -> [ B ] -> [ C ] -||
B -> [ G ] -> [ E ] -> [ C ] -||
C -> [ E ] -> [ D ] -||
D -> [ F ] -> [ A ] -||
E -> [ D ] -> [ F ] -||
F -> -||
G -> [ E ] -||
```

### 2.3 ข้อ 2: ตารางประมวลผล Shortest Path (เริ่มต้น A)

| Vertex | Known | Dist ($d_v$) | Path ($p_v$) | รอยขีดฆ่าในกระดาษ |
| :---: | :---: | :---: | :---: | :--- |
| **A** | **T** | **0** | **0** | $F \rightarrow T$, $999 \rightarrow 0$ |
| **B** | **T** | **1** | **A** | $F \rightarrow T$, $999 \rightarrow 1$, $0 \rightarrow A$ |
| **C** | **T** | **1** | **A** | $F \rightarrow T$, $999 \rightarrow 1$, $0 \rightarrow A$ |
| **D** | **T** | **2** | **C** | $F \rightarrow T$, $999 \rightarrow 2$, $0 \rightarrow C$ |
| **E** | **T** | **2** | **B** | $F \rightarrow T$, $999 \rightarrow 2$, $0 \rightarrow B$ |
| **F** | **T** | **3** | **E** | $F \rightarrow T$, $999 \rightarrow 3$, $0 \rightarrow E$ |
| **G** | **T** | **2** | **B** | $F \rightarrow T$, $999 \rightarrow 2$, $0 \rightarrow B$ |

---

## 3. สรุปแนวข้อสอบปลายภาค (Final Exam Leaks: 7 ข้อ 70 คะแนน)

- **กติกา:** Open Book, เครื่องคิดเลขได้, ห้ามโทรศัพท์
- **คะแนน:** 70 คะแนน $\div 2 = 35$ คะแนน
1. **Hashing (10 คะแนน):** Separate Chaining, Linear Probing, Quadratic Probing, Double Hashing, Load Factor $\lambda$, Rehashing
2. **Binary Heap (10 คะแนน):** Insert (Percolate Up), DeleteMin (Percolate Down), Array Index ($2i, 2i+1, \lfloor i/2 \rfloor$), BuildHeap
3. **Insertion Sort (10 คะแนน):** Tracing ทีละ Pass $p$, สถานะ Array หลังจบ Pass, Inversions & Comparisons
4. **Selection Sort หรือ Bubble Sort (10 คะแนน):** Tracing ทีละรอบตามตัวอย่าง Test Program 2
5. **Topological Sort (10 คะแนน):** ตาราง Indegree, Queue Tracing, ผลลัพธ์ Topological Order
6. **Unweighted Shortest Path (10 คะแนน):** เหมือน Assignment 4! ตาราง Known, Dist, Path, Queue และการตอบเส้นทาง
7. **คำถามย่อย Properties & Calculations (10 คะแนน):**
   - โครงสร้างที่มี 2 Properties $\rightarrow$ Binary Heap (Structure Property + Heap Order Property)
   - โครงสร้างที่มี 3 Properties $\rightarrow$ AVL / Red-Black Tree
   - Memory Waste Adjacency Matrix $\rightarrow$ 75.51% waste (ใช้จริง 24.48%)
   - เส้นเชื่อม Complete Graph $\rightarrow \frac{V(V-1)}{2}$

---

## หน้าที่เชื่อมโยง
- [[Assignment-4-Shortest-Path|บันทึกการบ้าน Assignment 4]]
- [[shortest-path-algorithms|แนวคิด Shortest Path Algorithms]]
- [[topological-sort|แนวคิด Topological Sort]]
- [[master-dsa-exam-leaks-all-problems|คลังข้อสอบและแนวข้อสอบปลายภาคทั้งหมด]]
