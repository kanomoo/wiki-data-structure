# 🎯 DSA MASTER EXAM DOSSIER: รวบรวมแนวข้อสอบภาษาอังกฤษ ภาพหลุดหน้าจอเฉลย และคำพูดบอกข้อสอบทั้งหมด
> **วิชา:** Data Structures and Algorithms (Dr. Pradit Pitaksatheinkul)  
> **แหล่งข้อมูลปฐมภูมิ:** ภาพถ่ายในห้องเรียน 169 ภาพ (`DSA-pic`), ไฟล์เสียงถอดความ 14 ไฟล์ (`03_Data_Structures_and_Algorithms`), ไฟล์เฉลย Word บนจอโปรเจกเตอร์ (`เฉลยแนวข้อสอบ.docx`), ภาพหลุด Discord/Chat และบันทึกกระดานสด

---

## 📌 สรุปสารบัญแนวข้อสอบทั้งหมดที่เจาะลึกได้

1. [หมวดที่ 1: โจทย์ภาษาอังกฤษตรงจากไฟล์ Word บนจอโปรเจกเตอร์ (`เฉลยแนวข้อสอบ.docx` / กลางภาค)](#หมวดที่-1-โจทย์ภาษาอังกฤษตรงจากไฟล์-word-บนจอโปรเจกเตอร์-เฉลยแนวข้อสอบdocx)
2. [หมวดที่ 2: บทที่ 7 Hashing — ข้อสอบ Final ข้อ 1 และข้อสอบข้อเขียน](#หมวดที่-2-บทที่-7-hashing--ข้อสอบ-final-ข้อ-1-และข้อสอบข้อเขียน)
3. [หมวดที่ 3: บทที่ 8 Priority Queue & Binary Heap — โจทย์คำนวณ วาดทรี และโค้ดดิ้ง](#หมวดที่-3-บทที่-8-priority-queue--binary-heap--โจทย์คำนวณ-วาดทรี-และโค้ดดิ้ง)
4. [หมวดที่ 4: บทที่ 9 Comparison Sorting — ข้อสอบแกะรอย Trace ตาราง 5 ข้อ และสูตรลัด](#หมวดที่-4-บทที่-9-comparison-sorting--ข้อสอบแกะรอย-trace-ตาราง-5-ข้อ-และสูตรลัด)
5. [หมวดที่ 5: บทที่ 10 Graph Theory — ข้อสอบคำนวณกระดานสด % เปลืองเมมโมรี่ และกับดักนิยาม](#หมวดที่-5-บทที่-10-graph-theory--ข้อสอบคำนวณกระดานสด--เปลืองเมมโมรี่-และกับดักนิยาม)

---

# หมวดที่ 1: โจทย์ภาษาอังกฤษตรงจากไฟล์ Word บนจอโปรเจกเตอร์ (`เฉลยแนวข้อสอบ.docx`)

### ข้อ 1.1: LinkedList In-Place Insert Manipulation (คะแนน: 5 คะแนน)
* **หลักฐานภาพถ่าย:** `Screenshot_20260826-122139.jpg`, `IMG_20260826_091737_550.jpg`
* **ตัวโจทย์ภาษาอังกฤษต้นฉบับบนจอ:**
  > `"1. Write your answer with Python statements in the space provided below.`  
  > `1.1. If there is an existing LinkedList's instance variable listA which has two elements 5, 2 already. Write statements in main program to insert the ordered inputs 1, 3, 8, 7, 9 into listA so that the resulting output is 9, 5, 1, 3, 7, 2, 8. Use only the LinkedList methods learned in class. //Score 5"`

* **นัยยะสำคัญ & กับดักที่อาจารย์เฉลย:**
  - `listA` เริ่มต้นมีข้อมูลอยู่แล้วคือ `[5, 2]` (Index 0: 5, Index 1: 2)
  - ห้ามสร้าง instance ใหม่ ห้าม override หรือ assign เป็น list ธรรมดา
  - ต้องเรียงลำดับการแทรก (insert) ตาม input ที่โจทย์ระบุ: `1`, `3`, `8`, `7`, `9` ตามลำดับเท่านั้น!
  - ปลายทางที่ต้องการคือ: `9 -> 5 -> 1 -> 3 -> 7 -> 2 -> 8`

* **เฉลยคำตอบ (Python Statements):**
  ```python
  # เริ่มต้น: listA คือ 5, 2
  listA.insert(1, 1)  # ใส่ 1 ที่ index 1 -> ได้ [5, 1, 2]
  listA.insert(3, 2)  # ใส่ 3 ที่ index 2 -> ได้ [5, 1, 3, 2]
  listA.insert(8, 4)  # ใส่ 8 ที่ index 4 (ต่อท้าย) -> ได้ [5, 1, 3, 2, 8]
  listA.insert(7, 3)  # ใส่ 7 ที่ index 3 -> ได้ [5, 1, 3, 7, 2, 8]
  listA.insert(9, 0)  # ใส่ 9 ที่ index 0 (แทรกหน้าสุด) -> ได้ [9, 5, 1, 3, 7, 2, 8]
  ```

---

### ข้อ 1.2: Stack Blacklist Filtering with Auxiliary Stack (คะแนน: 5 คะแนน)
* **หลักฐานภาพถ่าย:** `IMG_20260826_092434_544.jpg`
* **ตัวโจทย์ภาษาอังกฤษต้นฉบับบนจอ:**
  > `"2. If there is the exist Stack instance variable s containing 5 elements 8, 4, 6, 9, 2 already. Write statements in the main program to remove elements 4 and 9 from s using an existing Stack instance variable t, resulting in the output 8, 6, 2. Use only the Stack methods learned in class. (Note: The instance variable s already contains 8, 4, 6, 9, 2. Do not push these values again.). //Score 5"`

* **นัยยะสำคัญ & กับดัก:**
  - อาจารย์เน้นย้ำมาก: **"(Note: The instance variable s already contains 8, 4, 6, 9, 2. Do not push these values again.)"** ใครเขียน `s.push(8)...` โดนตัด 0 คะแนนทันที
  - สมมุติโครงสร้าง `s` ฐานคือ 8 และยอดคือ 2 (`top -> 2, 9, 6, 4, 8`)
  - ต้องใช้คำสั่งพื้นฐานเท่านั้น (`push`, `pop`, `is_empty`, `top`)

* **เฉลยแนวคิดและการเขียนโค้ด:**
  ```python
  # ถ่ายโอนจาก s ไป t โดยกรองเลข 4 และ 9 ทิ้ง
  while not s.is_empty():
      val = s.pop()
      if val != 4 and val != 9:
          t.push(val)

  # เทกลับจาก t ไป s เพื่อให้ลำดับคงเดิม (8 อยู่ล่างสุด, 6, 2 อยู่บน)
  while not t.is_empty():
      s.push(t.pop())
  ```

---

### ข้อ 1.3: Queue Wrap-Around Principle & Implementation (คะแนน: 3 คะแนน)
* **หลักฐานภาพถ่าย:** `IMG_20260826_093016_700.jpg`
* **ตัวโจทย์ภาษาอังกฤษต้นฉบับบนจอ:**
  > `"1) Explain the wrap-around principle as learned in class.`  
  > `2) What is method in the Queue class apply this principle? //Score 3"`

* **เฉลยบนจอโปรเจกเตอร์:**
  - **ข้อ 1) นิยามภาษาไทย/อังกฤษ:**
    > *"การที่ค่า Index วนซ้ำกลับมาที่ 0 ใหม่ เมื่อไปยังขนาดสูงสุดของคิวแล้ว (Index wrapping around to 0 when it reaches capacity using modulo arithmetic)"*
  - **ข้อ 2) Method ที่ประยุกต์ใช้:**
    > **Method:** `_increment` (หรือการคำนวณ `(index + 1) % capacity`)

---

### ข้อ 1.4: Stack Simulation Sequence (คะแนน: 3 คะแนน)
* **หลักฐานภาพถ่าย:** `IMG_20260826_093052_952.jpg`
* **ตัวโจทย์ภาษาอังกฤษต้นฉบับบนจอ:**
  > `"6.1. If an initial stack of size 5 is empty, and the numbers 15, 20, 10, 5 are pushed in that order, then popped 3 times, and then 30, 35, 25 are pushed in that order and popped 1 time, What elements will remain in the stack? [3]"`

* **การ Trace Step-by-Step:**
  1. `push(15)`, `push(20)`, `push(10)`, `push(5)` $\rightarrow$ Stack: `[15, 20, 10, 5]` (Top = 5)
  2. `pop()` 3 ครั้ง $\rightarrow$ pop 5, pop 10, pop 20 หลุดออก $\rightarrow$ Stack เหลือ: `[15]`
  3. `push(30)`, `push(35)`, `push(25)` $\rightarrow$ Stack: `[15, 30, 35, 25]` (Top = 25)
  4. `pop()` 1 ครั้ง $\rightarrow$ pop 25 หลุดออก $\rightarrow$ Stack เหลือ: `[15, 30, 35]`
* **คำตอบสุดท้าย:** **`[15, 30, 35]`** (Bottom to Top)

---

### ข้อ 1.5: Circular Queue Simulation with Array Pointers (คะแนน: 3 คะแนน)
* **หลักฐานภาพถ่าย:** `IMG_20260826_093203_709.jpg`
* **ตัวโจทย์ภาษาอังกฤษต้นฉบับบนจอ:**
  > `"6.2. If an existing queue of size 5 contains the elements [20, 40, 50, 60] and the following operations are executed: dequeue(), dequeue(), enqueue(10), dequeue(), enqueue(30). What elements will remain in the queue? [3]"`

* **การ Trace Step-by-Step:**
  - คิวเริ่มต้นขนาด 5: `[20, 40, 50, 60]`
  - `dequeue()` $\rightarrow$ ดึง 20 ออก
  - `dequeue()` $\rightarrow$ ดึง 40 ออก
  - `enqueue(10)` $\rightarrow$ นำ 10 เข้าคิว
  - `dequeue()` $\rightarrow$ ดึง 50 ออก
  - `enqueue(30)` $\rightarrow$ นำ 30 เข้าคิว
* **คำตอบข้อมูลที่เหลืออยู่ในคิว:**
  - สมาชิกตามลำดับการออกจากคิว: **`[60, 10, 30]`**
  - สถานะ Pointer: `Front = 0`, `Back = 1`
  - สถานะ Array จริงภายใน (`self.the_array`): **`[30, None, None, 60, 10]`**

---

### ข้อ 1.6: Nested Loop Output & Execution Count
* **หลักฐานภาพถ่าย:** `IMG_20260826_093359_987.jpg`
* **ตัวโจทย์บนจอ:** แกะรอยโค้ดลูปซ้อนรูปสามเหลี่ยมดาว
* **คำตอบเฉลย:**
  1. Output ที่แสดงผล:
     ```
     *
     **
     ***
     ****
     *****
     ```
  2. Number of times loop body executed: **`15 time`** (คำนวณจาก $1 + 2 + 3 + 4 + 5 = 15$)

---

# หมวดที่ 2: บทที่ 7 Hashing — ข้อสอบ Final ข้อ 1 และข้อสอบข้อเขียน

### ข้อ 2.1: Final Exam ข้อ 1 (Linear Probing Collision Count)
* **หลักฐานภาพถ่าย:** `Screenshot 2026-09-09 011658.png`, `Screenshot 2026-09-09 011707.png`, `IMG_20260826_114406.jpg`
* **ตัวโจทย์ภาษาอังกฤษบนสไลด์:**
  > `"Insert keys {89, 18, 49, 58, 69} into hash table of size 10 using Linear Probing with hi(x) = (hash(x) + F(i)) % TableSize where F(i) = i"`

* **🚨 คำพูดเตือนสติของอาจารย์ในห้อง (นัยยะสำคัญสูงสุด):**
  > **อาจารย์พูดชัดเจน:** *"จำนวนครั้งการชนของ 58 อย่าตอบว่า 6 นะครับ! ให้นับเฉพาะการชนของตัวมันเอง คือ ชน 18 (index 8), ชน 89 (index 9), ชน 49 (index 0) รวมชน 3 ครั้ง แล้วลงที่ช่องว่าง index 1"*

* **ตารางเฉลยการคำนวณทีละ Step:**

| Key | Hash ($x \bmod 10$) | Probing Sequence & Collisions | Index ที่ลงได้ | จำนวนครั้งที่ชน (Collisions) |
|:---:|:---:|:---|:---:|:---:|
| **89** | 9 | ช่อง 9 ว่าง $\rightarrow$ ลงทันที | 9 | 0 |
| **18** | 8 | ช่อง 8 ว่าง $\rightarrow$ ลงทันที | 8 | 0 |
| **49** | 9 | ช่อง 9 เต็ม (ชน 89) $\rightarrow$ ลอง $(9+1)\%10 = 0$ ว่าง | 0 | 1 |
| **58** | 8 | ช่อง 8 เต็ม (ชน 18) $\rightarrow$ ช่อง 9 เต็ม (ชน 89) $\rightarrow$ ช่อง 0 เต็ม (ชน 49) $\rightarrow$ ช่อง 1 ว่าง | 1 | **3** *(ไม่ใช่ 6!)* |
| **69** | 9 | ชน 9, ชน 0, ชน 1 $\rightarrow$ ช่อง 2 ว่าง | 2 | 3 |

---

### ข้อ 2.2: นิยาม Wrap Around ใน Hashing (ข้อสอบข้อเขียนบรรยาย)
* **หลักฐานภาพถ่าย:** `Screenshot 2026-09-09 011713.png`
* **ข้อความเป๊ะที่อาจารย์ขึ้นบนจอและให้อ่าน:**
  > `"Concept of Wrap around in Hashing is 'When the key was mapped to the last index of hash table, it go back to the first index of hash table by mod tablesize one more time.'"`

---

### ข้อ 2.3: กฎเหล็กของฟังก์ชันแฮชสำรอง $R$ ใน Double Hashing
* **หลักฐานภาพถ่าย:** `Screenshot 2026-09-09 011738.png`
* **สูตร:** $hash_2(x) = R - (x \bmod R)$
* **กับดักที่อาจารย์เฉลย:**
  - $R$ ต้องเป็นจำนวนเฉพาะที่ **น้อยกว่าขนาดตารางอย่างเคร่งครัด ($R < \text{TableSize}$)**
  - ถ้าตารางขนาด 10 ($TableSize = 10$) $\rightarrow R = 7$
  - ถ้าตารางขนาด 11 ($TableSize = 11$) $\rightarrow R = 7$ *(ห้ามตอบ 11 เด็ดขาด เพราะถ้า $R=11$ จะเกิดค่าก้าวเป็น 0 เมื่อ $x \bmod 11 = 0$ ทำให้วนลูปไม่รู้จบ!)*

---

# หมวดที่ 3: บทที่ 8 Priority Queue & Binary Heap — โจทย์คำนวณ วาดทรี และโค้ดดิ้ง

### ข้อ 3.1: สูตรการแปลง Array เป็น Binary Tree (ข้อสอบ Final ข้อเขียน)
* **หลักฐานภาพถ่าย:** `Screenshot 2026-09-09 011759.png`, `IMG_20260909_092253.jpg`
* **ตัวโจทย์:** ระบุสูตร Index ใน Array (1-based index) สำหรับโหนดที่ตำแหน่ง $i$:
  1. **Left child index:** $2i$
  2. **Right child index:** $2i + 1$
  3. **Parent index:** $i // 2$  
     *(🚨 ใน Python อาจารย์ย้ำว่าต้องเขียน Floor Division `//` เท่านั้น เช่น `7 // 2 = 3` ห้ามใช้เครื่องหมาย `/` เด็ดขาด)*
  4. **Index 0:** อาจารย์จงใจใส่สตริง `"ไม่มีข้อมูล"` (Sentinel node)

---

### ข้อ 3.2: คำนวณจำนวนโหนดต่ำสุดและสูงสุดของ Binary Tree (ความสูง $h = 10$)
* **หลักฐานภาพถ่าย:** `IMG_20260902_110748.jpg`, `Transcript_20260902`
* **โจทย์:** ทรีที่มีความสูง $h = 10$ จะมีจำนวนโหนดน้อยที่สุดและมากที่สุดเท่าใด?
* **สูตรและการคำนวณ:**
  - **Minimum nodes (ทรีเบ้ / degenerate tree):**  
    $$N_{\min} = h + 1 = 10 + 1 = \mathbf{11}\text{ nodes}$$
  - **Maximum nodes (Complete/Perfect Binary Tree):**  
    $$N_{\max} = 2^{h+1} - 1 = 2^{11} - 1 = 2048 - 1 = \mathbf{2047}\text{ nodes}$$

---

### ข้อ 3.3: เงื่อนไข If-Else Comparison ในการ Percolate Down ของ Binary Heap
* **หลักฐานภาพถ่าย:** `IMG_20260909_094650.jpg`
* **ตัวโจทย์บนสไลด์:**
  > `"The exact comparison performed in the if-else condition"`
* **คำตอบเชิงลึกของโค้ด:**
  ```python
  # การเปรียบเทียบหาลูกตัวที่ค่าน้อยกว่า เพื่อเตรียมสลับตำแหน่ง
  if child != self.current_size and self.heap[child + 1] < self.heap[child]:
      child += 1
  ```
* **การจำลองข้อสอบวาดทรี 3 `deleteMin()` ติดต่อกัน:**
  - นำค่ารูทออก (ค่าน้อยสุด)
  - นำอิลิเมนต์ตัวสุดท้ายของอาเรย์มาแปะไว้ที่รูท
  - ดันลงไป (Percolate Down) โดยเปรียบเทียบกับลูกที่น้อยกว่าเสมอจนกว่าจะถูกตำแหน่ง

---

# หมวดที่ 4: บทที่ 9 Comparison Sorting — ข้อสอบแกะรอย Trace ตาราง 5 ข้อ และสูตรลัด

### ข้อ 4.1: ใบงานเจาะลึก Bubble Sort (5 ข้อรวด)
* **หลักฐานภาพถ่าย:** `IMG_20260916_092007.jpg`, โค้ดชีต `For Example Bubble sort.pdf`
* **Input Array:** `[64, 34, 25, 12, 22, 11, 90]` ($N = 7$)
* **โจทย์ 5 ข้อย่อยที่อาจารย์ออกสอบ:**
  1. **จำนวน Pass ทั้งหมดที่ต้องทำงาน:**  
     $$N - 1 = 7 - 1 = \mathbf{6}\text{ passes}$$
  2. **จำนวนครั้งการ Swap ทั้งหมดเมื่อจบอัลกอริทึม:**  
     เท่ากับจำนวน Inversion ของอาเรย์ $=\mathbf{14}\text{ swaps}$
  3. **สถานะอาเรย์ใน Pass ที่ 1 ขั้นตอนย่อยที่ 4 (Step 4):**  
     ผลลัพธ์คือ **`[34, 25, 12, 64, 22, 11, 90]`**
  4. **สถานะอาเรย์เมื่อจบ Pass ที่ 1:**  
     เลขมากสุด (90) ลอยไปขวาสุด ได้เป็น **`[34, 25, 12, 22, 11, 64, 90]`**
  5. **จำนวนครั้งการ Swap ใน Pass ที่ 1:**  
     เกิดการสลับ 5 ครั้ง

---

### ข้อ 4.2: สูตรคำนวณการเลื่อนตำแหน่ง (Shifts/Moves) ของ Insertion Sort
* **หลักฐานภาพถ่าย:** `IMG_20260916_102037.jpg`, `Short note Insertion sort.pdf`
* **สูตรลัดข้อสอบ:**
  - **Worst Case (ข้อมูลเรียงย้อนกลับ):**  
    $$\text{Moves} = \frac{N(N-1)}{2}$$
    - ถ้า $N = 6 \rightarrow \frac{6 \times 5}{2} = 15$ ครั้ง
    - ถ้า $N = 8 \rightarrow \frac{8 \times 7}{2} = 28$ ครั้ง
    - ถ้า $N = 10 \rightarrow \frac{10 \times 9}{2} = 45$ ครั้ง
  - **Best Case (ข้อมูลเรียงอยู่แล้ว):**  
    $$\text{Moves} = \mathbf{0}\text{ ครั้ง}$$

---

# หมวดที่ 5: บทที่ 10 Graph Theory — ข้อสอบคำนวณกระดานสด % เปลืองเมมโมรี่ และกับดักนิยาม

### ข้อ 5.1: การคำนวณการสิ้นเปลือง Memory ของ Adjacency Matrix (ภาพกระดานสด)
* **หลักฐานภาพถ่าย:** `IMG_20260923_103736_910.jpg`, `IMG_20260923_103822_425.jpg`
* **ข้อมูลบนกระดาน:** กราฟมี 7 Vertices ($V = 7$), ตารางเมทริกซ์ขนาด $7 \times 7 = 49$ ช่อง มีเส้นเชื่อมจริง (มีเลข 1) อยู่ 12 ช่อง
* **โจทย์บนกระดานและการคิด %:**
  1. **พื้นที่ที่มีข้อมูลจริง (Data Density):**  
     $$\frac{12}{49} \times 100\% = \mathbf{24.48\%}$$
  2. **พื้นที่ที่สูญเปล่า (Space Wasted / Zeros):**  
     $$\frac{37}{49} \times 100\% = \mathbf{75.51\%}$$
  - **บทสรุปที่อาจารย์ใช้สอน:** นี่คือเหตุผลว่าทำไม Sparse Graph จึงห้ามใช้ Adjacency Matrix และต้องเปลี่ยนไปใช้ Adjacency List แทน!

---

### ข้อ 5.2: การคำนวณจำนวนเส้นเชื่อมของ Complete Undirected Graph
* **หลักฐานภาพถ่าย:** `IMG_20260923_104814_788.jpg`
* **โจทย์:** หากกราฟมีจุดยอด $V = 10$ และเป็น Undirected Complete Graph จะมีเส้นเชื่อม (Edges) ทั้งหมดกี่เส้น?
* **สูตร:** $E = \frac{V(V-1)}{2}$
* **คำตอบ:** $\frac{10 \times 9}{2} = \mathbf{45}\text{ edges}$  
  *(🚨 อาจารย์สั่งในคาบ: ในกระดาษคำตอบให้เขียนตัวเลข 45 ห้ามติดรูปสูตร!)*

---

### ข้อ 5.3: กับดักนิยาม Path และ Null Graph
* **หลักฐานภาพถ่าย:** `IMG_20260923_110059_773.jpg`
1. **การเขียนสัญลักษณ์ Path:**  
   - ต้องเขียนเป็นลำดับคั่นด้วยเครื่องหมายจุลภาค เช่น `(A, B, C)` หรือ `A, B, C`
   - **ห้ามเขียนลูกศร `A -> B -> C` เด็ดขาด** เพราะจะถือว่าเป็น Directed Edge representation ไม่ใช่ Path sequence ตามนิยามในชีท
2. **คำถามดักเรื่อง Null Graph:**  
   - โจทย์ถามหาเส้นทางจาก $A$ ไป $C$ บนกราฟที่ไม่มีโหนดดังกล่าว
   - **คำตอบที่ถูกต้อง:** *"No path exists from A to C because neither vertex exists in the graph."*
