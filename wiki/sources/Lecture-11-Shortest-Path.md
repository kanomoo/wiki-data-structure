---
type: source
tags: [graph, shortest-path, bfs, dijkstra]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 11 Shortest path/Lecture 11 Shortest path.pdf]
---

# Source: Lecture 11 Shortest path

## Summary
Focuses on the **Single Source Shortest Path** problem, covering algorithms for both unweighted graphs (BFS-based) and weighted graphs (Dijkstra's intuition).

## Implementation Details

### 1. Unweighted Shortest Path (BFS)
In unweighted graphs, the shortest path is simply the path with the minimum number of edges. This is solved efficiently using Breadth-First Search.

**Algorithm Pseudocode**:
```python
def unweighted_shortest_path(graph, start_node):
    q = Queue()
    # Initialize distances to Infinity and known to False
    for v in graph.vertices:
        v.dist = INFINITY
        v.path = None
        
    start_node.dist = 0
    q.enqueue(start_node)
    
    while not q.is_empty():
        v = q.dequeue()
        for w in v.adjacent:
            if w.dist == INFINITY:
                w.dist = v.dist + 1
                w.path = v # Keep track of the actual path
                q.enqueue(w)
```

### 2. Distance Table Trace
The algorithm maintains a table to track:
- **$D_v$**: Distance from source to vertex $v$.
- **$P_v$**: The previous vertex in the shortest path to $v$.
- **Known**: Boolean flag indicating if the shortest path to $v$ is finalized.

### 3. Dijkstra's Algorithm (Weighted)
For weighted graphs, the algorithm selects the "unknown" vertex with the smallest distance ($D_v$) and relaxes its neighbors:
- If $D_v + \text{weight}(v, w) < D_w$, then update $D_w$ and $P_w$.

## Complexity/Trade-offs
- **Unweighted Complexity**: $O(V + E)$ using a queue.
- **Weighted Complexity**: $O(E \log V)$ with a Priority Queue (Binary Heap).
- **Negative Edges**: Shortest path algorithms fail or become undefined if the graph contains a **Negative Cost Cycle**.

## Related Pages
- [[shortest-path-algorithms|Shortest Path Concept Page]]
- [[graph-algorithms|Graph Algorithms]]
- [[Assignment-4-Shortest-Path|Practice: Implementing Dijkstra]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 11 Shortest path/Lecture 11 Shortest path.pdf|Lecture 11 Shortest path.pdf]] (14 pages, 2908 extracted characters) -> `conductor/extracted/ปี67_Lecture_11_Shortest_path_Lecture_11_Shortest_path.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 11 Shortest path/For Example Graph.pdf|For Example Graph.pdf]] (5 pages, 2423 extracted characters) -> `conductor/extracted/ปี67_Lecture_11_Shortest_path_For_Example_Graph.pdf.txt`
- [[raw/Data structure/ปีเก่า/Data structure & Algorithm.pdf|Data structure & Algorithm.pdf]] (31 pages, 20304 extracted characters) -> `conductor/extracted/ปีเก่า_Data_structure_Algorithm.pdf.txt`

### Deep Notes
- Shortest-path sources distinguish unweighted shortest paths from weighted shortest paths. Unweighted graphs can use BFS-style level expansion; weighted nonnegative graphs use Dijkstra.
- Dijkstra table columns usually track `known`, `Dv` distance, and `Pv` previous vertex. Initialize source distance to 0, all others to infinity, then repeatedly mark the unknown vertex with minimum tentative distance.
- Relaxation rule: for edge v -> w, if Dv + weight(v,w) < Dw, update Dw and set Pw = v.
- The old Thai note `Data structure & Algorithm.pdf` is integrated here because its extracted pages focus on shortest-path algorithm vocabulary and worked Dijkstra table logic.

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_11_Shortest_path_Lecture_11_Shortest_path.pdf.txt`
```text
--- PAGE 1 ---
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 11
Prepared by Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
GRAPH ALGORITHMS
Definition
Representation of Graphs
Topological Sort
Shortest Path Algorithms
Unweighted Shortest Paths

--- PAGE 3 ---
3
Shortest Path Algorithms

Single Shortest Path Problem :
Given as input a weighted graph, G=(V,E), and a 
distinguished vertex, s, find the shortest weighted 
path from s to every other vertex in G

Input is a weighted graph : associated with each edge (vi , vj) is 
a cost ci,j to traverse the edge.

Cost of a path v1 v2 … vN (weighted path lenght ) is

Unweighted path lenght is merely the number of edges on the 
path, N-1




1
1
1
,
N
i
i
ic

--- PAGE 4 ---
4
Shortest Path Algorithms
Example :
On the figure 
Cost of shortest 
weighted path
from v1 to v6 is 6
v1 to v4 to v7 to v6
Shortest 
unweighted path
between these 
vertices is 2
v1 to v4 to v6

--- PAGE 5 ---
5
Shortest Path Algorithms

Negative edges can cause problems!

Path from v5 to v4 has cost 1 but a shorter path exists by 
following the loop v5, v4, v2, v5, v4, has a cost -5

Shortest path is undefined if there is a negative cost cycle

--- PAGE 6 ---
6
Shortest Path Algorithms
Shortest Path Algorithms
Unweighted Shortest Paths

--- PAGE 7 ---
7
Unweighted Shortest Paths
We are only interested in the number of edges
contained on the path
There are no weights on the edges

--- PAGE 8 ---
8
Unweighted Shortest Paths
Suppose we choose s to be v3
Shortest path from s to v3 is then a path of length 0

--- PAGE 9 ---
9
Unweighted Shortest Paths
We can start looking for all vertices that are a 
distance 1 away from s
Can be found by looking at the vertices adjacent to s
v1 and v6 are one edge distance from s

--- PAGE 10 ---
10
Unweighted Shortest Paths
We can find vertices whose shortest path from s is 
exactly 2
Look at all the vertices adjacent to v1 and v6 which are one 
edge from s
So shortest path to v2 and v4 has length 2

--- PAGE 11 ---
11
Unweighted Shortest Paths
Finally we can find, by examining vertices adjacent to 
the recently evaluated v2 and v4, that v5 and v7 have 
a shortest path of three edges.
Now all vertices have been calculated

--- PAGE 12 ---
12
Unweighted Shortest Paths
Initial configuration of table used in 
unweighted shortest-path computation
Dv ย่อมาจาก ค าว่า distance แปลว่า ระยะทางค่ามากไว้ก่อน 999
Pv ย่อมาจาก ค าว่า path แปลว่า เส้นทาง 0

--- PAGE 13 ---
13
/*Pseudocode for unweighted shortest-path 
algorithm USE this Code*/
class Graph():
def unweighted(s):
q = Queue(NUM_VERTICES)
define v, w as vertex
q.enqueue( s )
s.dist = 0
while (!q.isEmpty()):
v = q.items[0]
q.dequeue()
v.known = true
for each w adjacent to v:
if w.dist == INFINITY :
w.dist = v.dist + 1
w.path = v
q.enqueue (w)

--- PAGE 14 ---
14
How the data change during the unweighted shortest-path algorithm
```

#### Extract: `conductor/extracted/ปี67_Lecture_11_Shortest_path_For_Example_Graph.pdf.txt`
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

#### Extract: `conductor/extracted/ปีเก่า_Data_structure_Algorithm.pdf.txt`
```text
--- PAGE 1 ---
Shortest Path (เส้นทางที่สั้นที่สุด)
การหาค่าเส้นทางที่มีน้ำหนักรวมต่ำสุดระหว่างโหนดสองโหนดในกราฟ
อัลกอริทึมที่นิยม:
เนื้อหาในวิชา Shortest Path Algorithms:
Unweighted Shortest Paths
เมื่ออาจาร์ยให้กราฟมาแต่ไม่มี weight
Dijkstra’s Algorithm:(อาจาร์ยสอน)
ใช้สำหรับกราฟที่ไม่มี weight ติดลบ
เลือกโหนดที่มีระยะทางสั้นที่สุดจากจุดเริ่มต้นแล้วอัปเดตระยะทางของโหนดข้างเคียง
Bellman-Ford Algorithm:
รองรับกราฟที่มี weight ติดลบ
สามารถตรวจจับวงจรที่มีน้ำหนักรวมลบได้
Floyd-Warshall Algorithm:
หาเส้นทางที่สั้นที่สุดระหว่างทุกคู่ของโหนด
ใช้ Dynamic Programming เพื่ออัปเดตระยะทาง
Unweighted Shortest Paths
Dijkstra’s Algorithm

--- PAGE 2 ---
การคำนวณ weight โดยกำหนด s = v3
การหาเส้นทางที่สั้นที่สุด
Dv ย่อมาจาก คำว่า distance แปลว่า ระยะทาง 999
Pv ย่อมาจาก คำว่า path แปลว่า เส้นทาง 0
known หมายถึง node ที่เราเคยไปเยี่ยมหรือเราคำนวณแล้ว
เริ่มจากตั้งระยะทางเริ่มต้นเป็น 0 สำหรับ node ต้นทาง (1) และ ∞ (Infinity) สำหรับทุก node อื่น
ทำเครื่องหมาย node ทั้งหมดว่ายังไม่ได้เยี่ยมชม(known = F)
แสดงวิธีทำแต่ละ step และทำให้ known เป็น T ให้หมด
ถาม v3 →v7 ใช้เส้นทางอะไร
ตอบ: v7 →v4 →v1 →v3 = v3 →v1 →v4 →v7 ระยะทาง = 3
Dijkstra’s Algorithm
ทำเหมือน unweighted แต่ d แต่ละ node = weight ที่วิ่งมา
ตัวอย่าง

--- PAGE 3 ---
ในการทำ Dijkstra’s Algorithm เพื่อนำทางจาก node 1 ไป node 5 จะต้องคำนวณระยะทางที่สั้นที่สุดจาก node เริ่มต้น
ไปยังทุก node อื่น ๆ อย่างเป็นขั้นตอน ในแต่ละขั้นตอน เราจะอัปเดตระยะทางที่น้อยที่สุดจนกว่าจะถึงปลายทาง
ตารางเริ่มต้น:
Node
ระยะทางจาก Node 1
Node ก่อนหน้า
สถานะ
0
∞
-
F
1
0
-
T
2
∞
-
F
3
∞
-
F
4
∞
-
F
5
∞
-
F
6
∞
-
F
7
∞
-
F
8
∞
-
F
Node
ระยะทางจาก Node 1
Node ก่อนหน้า
สถานะ
0
∞
-
F
1
0
-
T
2
8
1
F
3
∞
-
F
4
∞
-
F
5
∞
-
F
6
∞
-
F
7
11
1
F
8
∞
-
F
1. เริ่มต้นที่ Node 1:
Node 1 เชื่อมกับ Node 2 (ระยะทาง 8) และ Node 7 (ระยะทาง 11)
อัปเดตระยะทางสำหรับ Node 2 และ 7

--- PAGE 4 ---
Node
ระยะทางจาก Node 1
Node ก่อนหน้า
สถานะ
0
∞
-
F
1
0
-
T
2
8
1
T
3
15
2
F
4
∞
-
F
5
∞
-
F
6
∞
-
F
7
11
1
F
8
10
2
F
Node
ระยะทางจาก Node 1
Node ก่อนหน้า
สถานะ
0
∞
-
F
1
0
-
T
2
8
1
T
3
15
2
F
4
∞
-
F
5
∞
-
F
6
12
7
F
7
11
1
T
8
10
2
F
Node
ระยะทางจาก Node 1
Node ก่อนหน้า
สถานะ
0
∞
-
F
1
0
-
T
2
8
1
T
3
15
2
F
2. เยี่ยมชม Node 2 (ระยะทาง 8):
Node 2 เชื่อมกับ Node 3 (ระยะทาง 7) และ Node 8 (ระยะทาง 2)
อัปเดตระยะทางสำหรับ Node 3 และ Node 8
3. เยี่ยมชม Node 7 (ระยะทาง 11):
Node 7 เชื่อมกับ Node 6 (ระยะทาง 1) และ Node 8 (ระยะทาง 7)
อัปเดตระยะทางสำหรับ Node 6
4. เยี่ยมชม Node 8 (ระยะทาง 10):
Node 8 เชื่อมกับ Node 6 (ระยะทาง 6) และ Node 5 (ระยะทาง 4)
อัปเดตระยะทางสำหรับ Node 5

--- PAGE 5 ---
Node
ระยะทางจาก Node 1
Node ก่อนหน้า
สถานะ
4
∞
-
F
5
14
8
F
6
12
7
F
7
11
1
T
8
10
2
T
Node
ระยะทางจาก Node 1
Node ก่อนหน้า
สถานะ
0
∞
-
F
1
0
-
T
2
8
1
T
3
15
2
F
4
∞
-
F
5
14
6
F
6
12
7
T
7
11
1
T
8
10
2
T
Graph
วิธีทำ:
5. เยี่ยมชม Node 6 (ระยะทาง 12):
Node 6 เชื่อมกับ Node 5 (ระยะทาง 2)
อัปเดตระยะทางสำหรับ Node 5 เป็น 14
ระยะทางรวม: 14
เส้นทาง: 1 → 2 → 8 → 6 → 5
การแทนกราฟ:
Adjacency List: ใช้ลิสต์เก็บ neighbor ของแต่ละโหนด (ประหยัดพื้นที่)
Adjacency Matrix: ใช้เมทริกซ์สองมิติเก็บการเชื่อมต่อระหว่างโหนด (ง่ายต่อการตรวจสอบการเชื่อมต่อ)
การ Traversal:
- DFS (Depth-First Search): ใช้สแต็กหรือการเรียกแบบ recursive เพื่อสำรวจโหนด
- BFS (Breadth-First Search): ใช้คิวในการสำรวจโหนดในระดับที่กว้างขึ้น
การใช้งาน:
การวิเคราะห์เครือข่ายสังคม, การค้นหาเส้นทางในแผนที่, การจัดการโครงสร้างข้อมูลอื่น ๆ
กราฟ (Graph) คือ ทูเพิล G = (V , E):
V : เซตของ จุดยอด (vertices) หรือ โหนด (nodes)
E: เซตของ เส้นเชื่อม (edges)
เส้นเชื่อมแต่ละเส้นคือคู่ (v, w) โดยที่ v, w ∈V
หากคู่ของจุดยอดเป็นลำดับ (ordered) กราฟนั้นเรียกว่า กราฟมีทิศทาง (directed)

--- PAGE 6 ---
การแทนด้วยเมทริกซ์การเชื่อมต่อ (Adjacency Matrix Representation)
การแทนด้วยรายการเชื่อมต่อ (Adjacency List Representation)
กราฟมีทิศทางบางครั้งเรียกว่า กราฟทิศทาง (digraphs)
จุดยอด w ติดกัน (adjacent) กับ v ก็ต่อเมื่อ (v, w) ∈E
หมายเหตุเพิ่มเติม:
เราจะพิจารณาเฉพาะ กราฟมีทิศทาง
จุดยอดจะถูกกำหนดหมายเลขโดยเริ่มที่ 1
กราฟด้านล่างมี 7 จุดยอด และ 12 เส้นเชื่อม
ใช้อาร์เรย์สองมิติ (two-dimensional array) ในการแทนกราฟ
สำหรับแต่ละเส้นเชื่อม (u, v) ∈E เรากำหนด A[u][v] = 1
A[u][v] = 0 ถ้าไม่มีเส้นเชื่อม
ถ้าเส้นเชื่อมมีค่าน้ำหนัก (weight) ให้กำหนด A[u][v] = weight
ใช้ −∞ หรือ ∞ เพื่อแสดงว่าไม่มีเส้นเชื่อม
การใช้หน่วยความจำ (Space Requirement): θ(∣V ∣2)
เมทริกซ์ติดกันเหมาะสมที่จะใช้ในกรณีที่กราฟมีความหนาแน่น (dense)
- เมื่อจำนวนเส้นเชื่อม ∣E ∣= θ(∣V ∣2)
หากกราฟ ไม่หนาแน่น (เป็น กราฟบาง) วิธีที่ดีกว่าคือการแทนด้วย รายการเชื่อมต่อ
สำหรับแต่ละจุดยอด เราจะเก็บรายการของจุดยอดที่อยู่ติดกัน
ความต้องการพื้นที่คือ O(∣E ∣+ ∣V ∣)
- ตัวอย่าง: 12 + 7 = 19

--- PAGE 7 ---
Topological Sort
แนวคิดหลัก:
วิธีทำ:
การแทนกราฟ (Representation of Graphs)
การจัดลำดับโหนดในกราฟที่เป็นกราฟทิศทางและไม่มีวงจร (DAG) โดยให้ถ้าโหนด A ชี้ไปยังโหนด B, A จะมาอยู่
ก่อน B ในลำดับ
Kahn’s Algorithm:
1. หาโหนดที่ไม่มีขาเข้า (in-degree = 0)
2. นำโหนดเหล่านั้นมาใส่ในลำดับ
3. ลบโหนดเหล่านั้นและขาออกจากกราฟ
4. ทำซ้ำจนกว่าจะไม่มีโหนดเหลือ
DFS-based Algorithm:
1. ทำ DFS บนกราฟ

--- PAGE 8 ---
การใช้งาน:
โค้ด
2. เมื่อจบการสำรวจโหนด ให้ใส่โหนดนั้นเข้าไปในสแต็ก
3. นำโหนดจากสแต็กออกมาเป็นลำดับท็อปโปลอจิก
การจัดลำดับงานที่ต้องทำตามลำดับ, การคอมไพล์โปรแกรมที่มี dependencies
#include <iostream>
#include <vector>
#include <queue>
#include <stdexcept>
class Graph {
public:
 Graph(int numVertices);
 void addEdge(int from, int to);
 void topsort();
private:
 int NUM_VERTICES;
 std::vector<std::vector<int>> adjList; // Adjacency list
 std::vector<int> indegree; // In-degree of each vertex
};
Graph::Graph(int numVertices)
 : NUM_VERTICES(numVertices), adjList(numVertices, std::vector<int>()), 
indegree(numVertices, 0) {}
void Graph::addEdge(int from, int to) {
 adjList[from].push_back(to);
 indegree[to]++;
}
void Graph::topsort() {
 std::queue<int> q;
 int counter = 0;
 std::vector<int> topNum(NUM_VERTICES, 0);
 // Enqueue vertices with in-degree 0
 for (int v = 0; v < NUM_VERTICES; ++v) {
 if (indegree[v] == 0) {
 q.push(v);
 }
 }
 while (!q.empty()) {
 int v = q.front();
 q.pop();
 topNum[v] = ++counter; // Assign next number
 // Iterate through all adjacent vertices
 for (int w : adjList[v]) {

--- PAGE 9 ---
ตัวอย่าง 1:
 if (--indegree[w] == 0) {
 q.push(w);
 }
 }
 }
 // Check if there was a cycle
 if (counter != NUM_VERTICES) {
 throw std::runtime_error("Cycle detected in the graph");
 }
 // Optional: Print topological order
 std::cout << "Topological Order: ";
 for (int v = 0; v < NUM_VERTICES; ++v) {
 std::cout << v << " ";
 }
 std::cout << std::endl;
}
// Example usage
int main() {
 int numVertices = 6;
 Graph g(numVertices);
 // Adding edges
 g.addEdge(5, 2);
 g.addEdge(5, 0);
 g.addEdge(4, 0);
 g.addEdge(4, 1);
 g.addEdge(2, 3);
 g.addEdge(3, 1);
 try {
 g.topsort();
 } catch (const std::runtime_error& e) {
 std::cerr << e.what() << std::endl;
 }
 return 0;
}

--- PAGE 10 ---
ตัวอย่างปีที่แล้ว
เขียน Indegree Array สำหรับคำนวณ Topologogy Sort
v
1
2
3
4
5
6
7
1
1
1
1
0
2
1
1
0
3
1
1
1
1
0
4
3
3
3
2
1
0

--- PAGE 11 ---
v
1
2
3
4
5
6
7
5
0
6
4
3
2
1
1
1
0
7
1
0
Enqueue
5
7
2
1
3
4
6
Dequeue
5
7
2
1
3
4
6
จะได้ผลลัพท์ Topologogy Sort จากการ Dequeue แต่ละตัวเป็น
Sorting
การเรียงลำดับเลขใน array
3 เคสที่สามารถเกิดขึ้นในทุก algorithms
algorithms
1. InsertSort
ตัวอย่าง 1
ตัวอย่าง 2
5, 7, 2, 1, 3, 4, 6
Best Case(ดีที่สุด)
Worst Case(แย่ที่สุด)
Average Case(โดยปกติ)
1. Insertion Sort
2. Shellsort

--- PAGE 12 ---
โค้ดการ Insertion Sort ใน c++
2. Shellsort
shellsort เป็นการเรียงข้อมูลโดยเอา gap = n/2 และทำการเรียงและวนไปเรื่อยๆจน gap = 1 แล้วจะไปใช้ insert sort
ตามปกติ
ตัวอย่าง 1
33, 31 , 40, 8, 12, 17, 25, 42
โดยเราจะเริ่มจากการคำนวนโดยในที่นี้ n =8 ก็จะได้เป็น gap = 8/2 = 4
ต่อไปมาจับทำ shellsort ต่อตามรูป
// Insertion sort routine
template <class Comparable>
void insertionSort(vector<Comparable> &a) {
 for (int p = 1; p < a.size(); p++) {
 Comparable tmp = a[p];
 int j;
 for (j = p; j > 0 && tmp < a[j - 1]; j--)
 a[j] = a[j - 1];
 
 a[j] = tmp;
 }
}

--- PAGE 13 ---
จะสังเกตว่าเราแบ่งข้อมูลได้ 2 ชุดชุดละ 4 ค่าซึ่งได้ตาม gap ที่เราคำนวนเลย
นำ gap ไปรันสมการต่อก็จะได้ gap = 4/2 = 2 ก็จะแบบข้อมูลได้ชุดละ 2 ค่า
ต่อไปนำ gap ไปหารต่อ gap = 2/2 = 1 เมือเป็น 1 ให้เราไปทำ insertion sort และจะได้ผลลัพท์

--- PAGE 14 ---
ตอบ: 8, 12, 17, 25, 31, 33, 40, 42
โค้ดการ shellsort โดยอาจาร์ยสุดตึงแต่ทำไมแกเอา n/2.6 ว้า 555
3. Quick Sort
#include <vector>
template <class Comparable>
void shellsort(std::vector<Comparable> &a) {
 int j;
 for (int gap = a.size() / 2.6; gap > 0; gap = (gap == 2) ? 1 : (gap / 2)) {
 for (int i = gap; i < a.size(); i++) {
 Comparable tmp = a[i];
 for (j = i; j >= gap && tmp < a[j - gap]; j -= gap) {
 a[j] = a[j - gap];
 }
 a[j] = tmp;
 }
 }
}
int partition(vector<int>& arr, int low, inที่t high) {
 
 // Choose the pivot
 int pivot = arr[high];
 
 // Index of smaller element and indicates

--- PAGE 15 ---
// the right position of pivot found so far
 int i = low - 1;
 // Traverse arr[;ow..high] and move all smaller
 // elements on left side. Elements from low to 
 // i are smaller after every iteration
 for (int j = low; j <= high - 1; j++) {
 if (arr[j] < pivot) {
 i++;
 swap(arr[i], arr[j]);
 }
 }
 
 // Move pivot after smaller elements and
 // return its position
 swap(arr[i + 1], arr[high]); 
 return i + 1;
}
// The QuickSort function implementation
void quickSort(vector<int>& arr, int low, int high) {
 
 if (low < high) {
 
 // pi is the partition return index of pivot
 int pi = partition(arr, low, high);
 // Recursion calls for smaller elements
 // and greater or equals elements
 quickSort(arr, low, pi - 1);
 quickSort(arr, pi + 1, high);
 }
}

--- PAGE 16 ---
Heap

--- PAGE 17 ---
Heap คือตัวที่จะเอาไปสารต่อทำ priority queue
แนวคิดหลัก:
คุณสมบัติของ Heap
โค้ดของ Heap
โครงสร้างข้อมูลแบบ Heap เป็นต้นไม้แบบเต็ม (complete binary tree) ที่แต่ละโหนดมีค่ามากกว่า (max-heap)
หรือ น้อยกว่า (min-heap) โหนดลูกทุกโหนด
Priority Queue ใช้ Heap ในการจัดลำดับความสำคัญของข้อมูล
วิธีทำ:
Insertion: แทรกข้อมูลที่ด้านท้ายของ Heap แล้วปรับตำแหน่งขึ้น (Heapify Up)
Extract-Max/Min: นำค่าที่สูงสุดหรือต่ำสุดออก แล้วย้ายค่าจากท้ายขึ้นมาใหม่ แล้วปรับตำแหน่งลง (Heapify
Down)
การใช้งาน:
การจัดการคิวที่ต้องการลำดับความสำคัญ เช่น การจัดการงานในระบบปฏิบัติการ, อัลกอริทึมการค้นหาเส้นทาง
สำหรับทุกโหนด X คีย์ในโหนดพาเรนต์ parent จะมีค่าน้อยกว่าคีย์ใน X (ยกเว้น root)
องค์ประกอบที่มีค่าน้อยที่สุดจะสามารถพบได้ที่ root เสมอ
// Class interface for priority queues
template <class Comparable>
class BinaryHeap {
public:
 explicit BinaryHeap(int capacity = 100);
 bool isEmpty() const;
 bool isFull() const;

--- PAGE 18 ---
const Comparable& findMin() const;
 void insert(const Comparable& x);
 void deleteMin();
 void deleteMin(Comparable& minItem);
 void makeEmpty();
private:
 int currentSize; // Number of elements in heap
 std::vector<Comparable> array; // The heap array
 void buildHeap();
 void percolateDown(int hole);
};
/* Construct the binary heap. */
template <class Comparable>
BinaryHeap<Comparable>::BinaryHeap(int capacity)
 : array(capacity + 1), currentSize(0) { }
/* Test if the priority queue is logically empty. */
template <class Comparable>
bool BinaryHeap<Comparable>::isEmpty() const {
 return currentSize == 0;
}
/* Test if the priority queue is logically full. */
template <class Comparable>
bool BinaryHeap<Comparable>::isFull() const {
 return currentSize == array.size() - 1;
}
/* Make the priority queue logically empty. */
template <class Comparable>
void BinaryHeap<Comparable>::makeEmpty() {
 currentSize = 0;
}
/* Insert item x into the priority queue. */
template <class Comparable>
void BinaryHeap<Comparable>::insert(const Comparable& x) {
 if (isFull())
 throw std::overflow_error("Overflow: Priority queue is full.");
 // Percolate up
 int hole = ++currentSize;
 for (; hole > 1 && x < array[hole / 2]; hole /= 2) {
 array[hole] = array[hole / 2];
 }
 array[hole] = x;
}
/* Remove the smallest item from the priority queue. */
template <class Comparable>
void BinaryHeap<Comparable>::deleteMin(Comparable& minItem) {

--- PAGE 19 ---
ตัวอย่าง Heap
insert(14)
 if (isEmpty())
 throw std::underflow_error("Underflow: Priority queue is empty.");
 minItem = array[1];
 array[1] = array[currentSize--];
 percolateDown(1);
}
/* Internal method to percolate down in the heap. */
template <class Comparable>
void BinaryHeap<Comparable>::percolateDown(int hole) {
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
/* Establish heap order property. */
template <class Comparable>
void BinaryHeap<Comparable>::buildHeap() {
 for (int i = currentSize / 2; i > 0; i--) {
 percolateDown(i);
 }
}

--- PAGE 20 ---
DeleteMin()

--- PAGE 21 ---
percolateDown
Hashing
ในบทนี้มี 2 algorithms
1. ที่อาจารสอนแล้วน่าจะออก(Double Hashing)
2. ที่อาจารสอนแต่ไม่น่าจะออก

--- PAGE 22 ---
เมื่ออาจาร์ยให้เขียนตารางเขียนช่องที่มีค่าว่า active ถ้าไม่มี เขียน empty
1. ที่อาจารน่าจะออก(Double Hashing)
สมการที่จำเป็น
คำนวณแฮช
ตัวอย่าง
h0 = key % table_size
Pseudorandomness``\`
คำนวณหากชน
``\`js
h0 = key % table_size
// prime จำนวณเฉพาะที่ค่าใกล้ table_size ที่สุด
// n คือจำนวณครั้งที่ชนเริ่มด้วย 1
f(n) = n * (prime - (h0 % prime))
h0 = key % table_sizeshellsort โดยอาจาร์ยสุดตึงแต่ทำไมแกเอา n/2.6 ว้า 
// ตัวอย่างชนรอบที่ 1
f1 = 1 * (prime - (h0 % prime))
h1 = (f1 + h0) % table_size
// ถ้าชนอีก
f2 = 2 * (prime - (h0 % prime))
h2 = (f2 + h0) % table_size

--- PAGE 23 ---
ตัวอย่าง 1
Input 1 array ตัวเลข
Input 2 ขนาดตาราง(table size)
ทำ array เก็บ table hash ที่คำนวนแล้วใว่ว่า
ขั้นแรกให้นำ key mod table_size จะได้ h1
แล้วนำผลลัพท์ไปใส่ใน table
[10, -, -, -, -, -, -, -, -]
ถ้าชนเช่น key = 20
[10, 20, -, -, -, -, -, -, -]
ทำต่อเองนะไอน้อง
ตารางจำนวนเฉพาะ
[10, 20, 31, 4, 15, 28, 17, 88, 59]
10
tables = []
h0 = key % table_size // 10 % 10 = 0
tables[h0] = key
h0 = 20 % 10 // = 0
// แต่มี 10 อยู่ใน index ที่ 0 อยู่แล้วให้เราคิดการชน
// การชนครั้งแรก
prime = 7 // เพราะจำนวนเฉพาะ 7 ใกล้ 10 ที่สุด
f1 = 1 * (prime - (h0 % prime)) // 1 * (7 - (0 % 7)) = 7
h1 = (f1 + h0) % table_size // (7 + 0) % 10 = 7
// จะได้ 7 ดูว่า index ที่ 7 มีค่ายังถ้าไม่มีใส่ได้เลย
tables[h1] = key

--- PAGE 25 ---
2. ที่อาจาร์ยไม่น่าจะออก
Linear Probing is used to resolve collision
Problem: It is not easy to delete an element
Quadratic Probing
F(i) is a quadratic functionprobing is used to resolve collis
Ex : F(i) = i^2
Rehashing
สมการที่จำเป็น
May have caused a collision before
Mark the element deleted
Problem: Primary Clustering การเกาะกลุ่ม
h0 = key % table_size

--- PAGE 26 ---
คำถามอื่นปีที่แล้ว
limit = percentage * table_size / 100 
1. คุณสมบัติของ hash function ตามทฤษฎีในทางอุดมคติ มี 3 ข้อ คืออะไร
ตอบ: ทฤษดีในอดมคติ
ในการออกแบบและพัฒนาฟังก์ชันแฮช (Hash Function) ที่มีประสิทธิภาพสูงตามทฤษฎีในทางอุดมคติ ฟังก์ชันแฮ
ชควรมีคุณสมบัติหลักๆ ดังต่อไปนี้:
1. ความแน่นอน (Deterministic)
ฟังก์ชันแฮชควรให้ผลลัพธ์เดียวกันสำหรับอินพุตที่เหมือนกันทุกครั้ง กล่าวคือ หากมีการแฮชข้อมูล
เดียวกันหลายครั้ง ผลลัพธ์ที่ได้จะต้องเหมือนกันเสมอ
2. ประสิทธิภาพ (Efficiency)
ฟังก์ชันแฮชควรสามารถคำนวณค่าแฮชได้อย่างรวดเร็วและมีประสิทธิภาพ ไม่ว่าจะเป็นการประมวลผล
ข้อมูลขนาดเล็กหรือขนาดใหญ่
3. ความต้านทานการย้อนกลับ (Pre-image Resistance)
ไม่ควรสามารถหาค่าอินพุตที่ให้ผลลัพธ์แฮชเฉพาะเจาะจงได้ในเวลาเชิงสมเหตุสมผล กล่าวคือ หากทราบ
ค่าแฮชแล้ว ไม่สามารถหาข้อมูลต้นฉบับที่ให้ค่าแฮชนั้นได้
4. ความต้านทานการหาค่าอินพุตอื่น (Second Pre-image Resistance)
หากมีอินพุตหนึ่งแล้ว ไม่ควรสามารถหาข้อมูลอื่นที่มีค่าแฮชเหมือนกันได้ในเวลาเชิงสมเหตุสมผล ซึ่ง
หมายความว่าไม่สามารถหาค่าอินพุตอื่นที่แตกต่างแต่ให้ค่าแฮชเดียวกันได้ง่ายๆ
5. ความต้านทานการเกิดการชน (Collision Resistance)
ไม่ควรสามารถหาสองค่าอินพุตที่แตกต่างกันแต่ให้ค่าแฮชเหมือนกันได้ในเวลาเชิงสมเหตุสมผล ความ
สามารถในการป้องกันการชนเป็นสิ่งสำคัญเพื่อรักษาความปลอดภัยของข้อมูล
6. ผลกระทบแบบ Avalanche (Avalanche Effect)
การเปลี่ยนแปลงเล็กน้อยในอินพุต เช่น การเปลี่ยนแปลงเพียงบิตเดียว ควรส่งผลให้ค่าแฮชที่ได้มีการ
เปลี่ยนแปลงอย่างมากและดูเหมือนไม่มีรูปแบบที่สามารถทำนายได้
7. ความสุ่มปลอม (Pseudorandomness)

--- PAGE 27 ---
ผลลัพธ์ของฟังก์ชันแฮชควรมีลักษณะเหมือนสุ่ม ไม่มีรูปแบบหรือลำดับที่สามารถทำนายได้จากค่าอินพุต
8. ขนาดผลลัพธ์คงที่ (Fixed Output Length)
ฟังก์ชันแฮชควรผลิตค่าแฮชที่มีขนาดคงที่ไม่ว่าจะเป็นข้อมูลอินพุตที่มีขนาดใดก็ตาม เช่น แฮชขนาด
256 บิตสำหรับทุกอินพุต
9. การต่อต้านการขยายความยาว (Resistance to Length Extension Attacks)
ข้อใดเป็นไปไม่ได้ ในโลกแห่งความเป็นจริง
ความต้านทานการเกิดการชน (Collision Resistance)
- สำหรับฟังก์ชันแฮชบางประเภท ควรมีความต้านทานต่อการโจมตีที่พยายามเพิ่มข้อมูลเข้าไปในอินพุตโดยไม่รู้ค่าแฮช
เดิม
2. จงเขียนประโยคคำสั่ง (Statement) เพื่อใช้แทนฟังก์ชัน HashEntry ใน member function insert ของ
Class HashTable โดยใน member function insert มีการเรียกใช้งานฟังก์ชัน HashEntry ดังนี้
array[ currentPos ] = HashEntry( x, ACTIVE );
ตอบ:
array[currentPos].element = x;
array[currentPos].info = ACTIVE;
3. ในการทำ Quick Sort ขั้นตอนการทำ Partitioning แต่ละรอบนั้น พบว่า มีข้อมูลบางตัวที่ไม่ได้นำไปทำ Partition
ด้วยถามว่า มีข้อมูลตัวใดใน array ที่ไม่ได้ถูกทำ Partition เพราะเหตุผลใด
ตอบ: ในการทำ Quick Sort ขั้นตอนการทำ Partitioning แต่ละครั้งจะมีการเลือก Pivot (จุดกึ่งกลาง) เพื่อแบ่ง
ข้อมูลใน array ออกเป็นสองส่วน คือ ส่วนที่มีค่าต่ำกว่า pivot และส่วนที่มีค่าสูงกว่า pivot หลังจากการแบ่งนี้
Pivot จะถูกวางไว้ในตำแหน่งที่ถูกต้องใน array ซึ่งหมายความว่า Pivot นั้นไม่จำเป็นต้องถูกทำการ partition อีก
ครั้งในรอบถัดไป
ดังนั้น ข้อมูลที่ไม่ได้ถูกทำ Partition ในแต่ละรอบคือ Pivot เอง เนื่องจาก:
สรุป: ในแต่ละรอบของการทำ Partitioning ใน Quick Sort ข้อมูลที่เป็น Pivot จะไม่ได้ถูกนำไปทำ Partition อีก
เพราะมันได้ถูกจัดวางไว้ในตำแหน่งที่ถูกต้องเรียบร้อยแล้ว
1. Pivot ได้ถูกจัดวางไว้ในตำแหน่งที่ถูกต้องแล้วใน array
2. ไม่มีความจำเป็นต้องเปรียบเทียบหรือย้าย Pivot อีก เนื่องจากมันอยู่ในตำแหน่งที่ถูกต้องตามลำดับ
4. Complete Binary Tree ที่มีความสูงเท่ากับ 16 จะมีจำนวน node อย่างน้อยที่สุดและมากที่สุดเท่าไร ให้ตอบเป็น
จำนวนเต็มของจำนวน node โดยไม่ให้อยู่ในรูปของเลขยกกำลัง
ตอบ: ใน Complete Binary Tree ที่มีความสูงเท่ากับ 16:
ใน Complete Binary Tree ที่มีความสูงเท่ากับ 16:
จำนวนโหนดขั้นต่ำ คือ
216 = 65, 536โหนด
จำนวนโหนดสูงสุด คือ
217 −1 = 131, 071โหนด
ดังนั้น:
จำนวนโหนดขั้นต่ำ: 65,536
จำนวนโหนดสูงสุด: 131,071

--- PAGE 28 ---
อื่นๆที่จำเป็น
Decimal Hex Char
 
Decimal Hex Char
Decimal Hex Char
Decimal Hex Char
สรุปสมการและสูตรที่สำคัญ
5. กราฟครบ (Complete Graph) ที่มีจำนวนจุดยอด (vertex) เท่ากับ 16 จะมีจำนวนเส้นเชื่อม (edge) ทั้งหมด
เท่าไร? จงตอบเป็นจำนวนเต็มของจำนวนเส้นเชื่อม (edge) เท่านั้น โดยไม่แสดงในรูปของสมการ.
ตอบ: 120
วิธีคำนวณจำนวนเส้นเชื่อม (edge) ในกราฟครบที่มีจำนวนจุดยอด (vertex) เท่ากับ n คือใช้สูตร:
จำนวนเส้นเชื่อม= n × (n −1)
2
เหตุผล:
1. การเชื่อมต่อระหว่างจุดยอด: ในกราฟครบ แต่ละจุดยอดจะเชื่อมต่อกับจุดยอดอื่นทั้งหมด ซึ่งมี n −1 จุดยอด
ที่เหลือ
2. รวมจำนวนการเชื่อมต่อ: ดังนั้น จำนวนการเชื่อมต่อทั้งหมดคือ n ∗(n −1)
3. การนับเส้นเชื่อมที่ไม่ซ้ำกัน: เนื่องจากเส้นเชื่อมระหว่างจุดยอด A และ B กับระหว่าง B และ A เป็นเส้นเดียวกัน
เราจึงต้องหารด้วย 2 เพื่อไม่ให้นับซ้ำ
นำมาคำนวณสำหรับ n = 16
จำนวนเส้นเชื่อม= 16 × (16 −1)
2
= 16 × 15
2
= 240
2
= 120

--- PAGE 30 ---
รายละเอียดเพิ่มเติมสำหรับแต่ละบท
Hashing
Double Hashing:
Heap/Priority Queue
Max-Heap vs Min-Heap:
ใช้สองฟังก์ชันแฮชเพื่อหาตำแหน่งใหม่เมื่อเกิดการชน
ช่วยกระจายข้อมูลได้ดีขึ้นและลดการ clustering
Rehashing:
เมื่อตารางแฮชเต็มหรือมีการชนกันมากเกินไป
ขยายขนาดตารางและคำนวณแฮชใหม่สำหรับทุกคีย์
Max-Heap: โหนดแต่ละโหนดมีค่ามากกว่าลูก
Min-Heap: โหนดแต่ละโหนดมีค่าน้อยกว่าลูก
การใช้งาน:
Priority Queue ใช้ในอัลกอริทึมเช่น Dijkstra’s, A* Search
Heap ใช้ในการจัดการข้อมูลแบบเรียงลำดับและการหา k-largest/k-smallest elements

--- PAGE 31 ---
Queue
ประเภทของ Queue:
Stack
การใช้งาน:
Binary Tree
ประเภทของ Binary Tree:
การดำเนินการใน Binary Tree:
Circular Queue: ใช้ modulo เพื่อจัดการตำแหน่ง Front และ Rear
Priority Queue: คิวที่มีการจัดลำดับความสำคัญของแต่ละองค์ประกอบ
Deque (Double-Ended Queue): สามารถแทรกและลบได้ทั้งสองด้าน
การดำเนินการแบบย้อนกลับ (Backtracking)
การประมวลผลทางภาษา เช่น การตรวจสอบวงเล็บ
การเรียกใช้งานฟังก์ชัน (Call Stack)
Binary Search Tree (BST): แต่ละโหนดมีค่าต่ำกว่าหรือเท่ากับข้างซ้าย และสูงกว่าหรือเท่ากับข้างขวา
Balanced Trees (เช่น AVL, Red-Black Trees): ต้นไม้ที่มีความสูงสมดุลเพื่อเพิ่มประสิทธิภาพการค้นหา
Complete Binary Tree: ทุกระดับเต็ม (ยกเว้นระดับสุดท้าย)
Full Binary Tree: ทุกโหนดมีลูกเต็มสองลูก
Insertion: ค้นหาตำแหน่งที่เหมาะสมตามกฎของต้นไม้
Deletion: มีสามกรณีหลัก (โหนดไม่มีลูก, มีลูกเดียว, มีลูกสอง)
```
