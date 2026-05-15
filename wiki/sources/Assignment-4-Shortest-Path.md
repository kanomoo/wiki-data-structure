---
type: source
tags: [practice, graph, shortest-path]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Assignment 4 Shortest Path/For Example Graph.pdf]
---

# Source: Assignment 4 Shortest Path

## Summary
Implementation of **Dijkstra's Algorithm** to calculate the shortest weighted path from a source vertex to all other vertices in a directed graph.

## Implementation Details

### Task Requirements
1. Represent the graph using an **Adjacency List**.
2. Implement a `dijkstra(start_node)` method.
3. Use a **Min-Priority Queue** (from `heapq` or a custom Binary Heap) to store pairs of `(distance, vertex)`.

### Logic Flow
1. Initialize `distances` array with $\infty$ and `source` with 0.
2. While the Priority Queue is not empty:
    - Pop the vertex `u` with the smallest `dist`.
    - If `u` is already known, skip.
    - For each neighbor `v` of `u`:
        - Calculate `new_dist = dist[u] + weight(u, v)`.
        - If `new_dist < dist[v]`:
            - Update `dist[v] = new_dist`.
            - Push `(new_dist, v)` into the Priority Queue.

## Related Pages
- [[shortest-path-algorithms|Shortest Path Concept]]
- [[graph-algorithms|Graph Algorithms]]
- [[heap-priority-queue|Min-Priority Queue Logic]]
- [[Practice-Implementation-Guide|Practice Implementation Guide]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Assignment 4 Shortest Path/For Example Graph.pdf|For Example Graph.pdf]] (5 pages, 2423 extracted characters) -> `conductor/extracted/ปี67_Assignment_4_Shortest_Path_For_Example_Graph.pdf.txt`
- [[raw/Data structure/ปีเก่า/สำเนาของ Assignment 4.pdf|สำเนาของ Assignment 4.pdf]] (2 pages, 814 extracted characters) -> `conductor/extracted/ปีเก่า_สำเนาของ_Assignment_4.pdf.txt`
- [[raw/Data structure/ปีเก่า/สำเนาของ Ass4.1.jpg|สำเนาของ Ass4.1.jpg]] visual source
- [[raw/Data structure/ปีเก่า/สำเนาของ Ass4.2.jpg|สำเนาของ Ass4.2.jpg]] visual source

### Deep Notes
- Assignment 4 is shortest-path practice using graph examples. The expected solution style is a table of tentative distances and previous vertices, not just a final path.
- For Dijkstra, initialize source to 0 and all other vertices to infinity, repeatedly choose the unknown vertex with minimum distance, and relax its outgoing edges.
- Final path is recovered backward through previous pointers, then reversed for source-to-destination order.
- Old assignment images are included as additional visual practice for graph/shortest-path exam style.

### Visual Source Checklist
- ![[raw/Data structure/ปีเก่า/สำเนาของ Ass4.1.jpg|180]]
- ![[raw/Data structure/ปีเก่า/สำเนาของ Ass4.2.jpg|180]]

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Assignment_4_Shortest_Path_For_Example_Graph.pdf.txt`
```text
--- PAGE 1 ---
Representation of Graph 
Adjacency Matrix 
u\v 
1
2
3
4 
5
6
7
1 
0 
1 
1 
1 
0 
0 
0 
2 
0 
0 
0 
1 
1 
0 
0 
3 
0 
0 
0 
0 
0 
1 
0 
4 
0 
0 
1 
0 
0 
1 
1 
5 
0 
0 
0 
1 
0 
0 
1 
6
0 
0 
0 
0 
0 
0 
0 
7 
0 
0 
0 
0 
0 
1 
0 
Adjacency Matrix ไม่นิยมใช้ เพราะ เปลืองเนือทีในหน่วยความจํา 
 
49 ช่อง มีช่องทีเป็น 1 อยู่ 12 ช่อง 
100 ช่อง มีช่องทีเป็น 1 อยู่ = = 24.48 % 
มีช่องทีเป็น 0 หรือไม่ได้ใช้งาน อยู่ 75.52 % 
What percentage of the memory space is used for entries with 
a value of 1, and what percentage is used for entries with 
a value of 0?

--- PAGE 2 ---
Topological Sort 
 
 
 
1. แปลงภาพกราฟ มาเป็น adjacency list ก่อน 
 
 
 
 
 
 
 
 
 
 
V

--- PAGE 3 ---
2. Indegree Array อะเรย์ของจํานวน edge ทีชีเข้าหา vertex 
v
เริมต้น 
รอบที 1 รอบที รอบที รอบที รอบที รอบที 
q 
1
 
 
 
 
 
6 
2
 
 
 
 
5
3
 
 
 
 
4
4
 
 
 
 
 
3
5
 
 
 
 
2
6
 
 
 
 
1
7
 
 
 
 
0
 
 
 
 
 
 
 
 
 
 
Currentsize=? 
 
 
 
 
 
 
 
 
 
 
Front= ? back =? 
 
 
Indegree array q.enqueue() 
V= 
for each w adjacent to v W= 
 
 
 
 
 
 
 
 
 
 
จงเขียน Topological Sort ทีเป็นผลลัพธ์ จากกราฟดังกล่าว 
After computing the topological sort, write down the 
topological ordering that is the solution for this graph. 
 
 
 
 
W

--- PAGE 4 ---
Shortest Path 
1. แปลงภาพกราฟ มาเป็น adjacency list ก่อน 
 
 
 
 
 
 
 
 
 
 
 
 
2. สร้าง อะเรย์สําหรับใช้ในการประมวลผล Shortest Path 
Known Dist 
(Dv) 
Path 
(Pv) 
 q 
1 
 
 
 
6 
 
2 
 
 
 
5 
 
3 
 
 
 
4 
 
4 
 
 
 
3 
 
5 
 
 
 
2 
 
6 
 
 
 
1 
 
7 
 
 
 
0 
 
 V = front = ? back = ? 
W = 
 
 
 
 
 
 
 2 
 1 
4 
1 
2 
3 
4 
 4 
 5 
 3 
5 
 7 
6 
7 
 6 
 6 
6 
 5 
 7 
V 
W
V 
if w.dist == INFINITY : 
 w.dist = v.dist + 1 
 w.path = v 
 q.enqueue (w)

--- PAGE 5 ---
จงหาเส้นทางทีสันทีสุด จาก v3 ไป v5 จาก ตารางทีคํานวณได้ และ ความยาวของเส้นทางนัน 
เท่ากับเท่าไร 
After computing the shortest path, write down the length of the 
shortest path and the shortest path and from Vertex 3 to Vertex 5 from 
the calculated table. 
ตอบ The length of the shortest path from Vertex 3 to Vertex 5 = 
The shortest path from Vertex 3 to Vertex 5 = 
 
 
 
 
 
 
 
 
 
After computing the shortest path, write down the length of the 
shortest path and the shortest path and from Vertex 3 to Vertex 7 from 
the calculated table. 
ตอบ The length of the shortest path from Vertex 3 to Vertex 7 = 
The shortest path from Vertex 3 to Vertex 7 = 
 
 
 
 
 
 
 
 
v4 ไป v5
```

#### Extract: `conductor/extracted/ปีเก่า_สำเนาของ_Assignment_4.pdf.txt`
```text
--- PAGE 1 ---
Assignment 4 : ชื่อ-นามสกุล ....................................................... รหัสประจำตัว ........................ 
 
กำหนดกราฟมาให้ ดังภาพ ให้ vertex B เป็นจุดเริ่มต้น จงแสดงวิธีหาเส้นทางที่สั้นที่สุดจาก 
vertex B ไปยังทุก ๆ vertex ในกราฟ 
 
 
1. แปลงรูปกราฟให้เป็น Adjacency List 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
A 
B 
C 
D 
 
 
 
 
E 
F 
 
 
 
 
G

--- PAGE 2 ---
2. อะเรย์สำหรับประมวลผล Shortest Path 
 
 
Known 
Dist 
(Dv) 
Path 
(Pv) 
 Queue 
A 
F 
999 
0 
6 
B 
F 
999 0 
0 
5 
C 
F 
999 
0 
4 
D 
F 
999 
0 
3 
E 
F 
999 
0 
2 
F 
F 
999 
0 
1 
G 
F 
999 
0 
0 
 
ให้นักศึกษาพิมพ์ใส่กระดาษ แล้วเขียนด้วยลายมือตนเอง แสดงวิธีหาเส้นทางที่สั้นที่สุด 
โดยเขียนค่าต่าง ๆ ลงในข้อ 1 และ 2 สำหรับข้อ 2 สามารถขีดฆ่า เพื่อแสดงค่าที่เปลี่ยนไป 
 
แล้วถ่ายรูป หรือ สแกน ส่งในงานห้องส่งการบ้าน
```
