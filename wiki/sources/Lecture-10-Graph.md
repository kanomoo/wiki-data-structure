---
type: source
tags: [graph, topology, representation]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 10 Graph/Lecture 10 Graph.pdf, raw/Data structure/ปี67/Lecture 10 Graph/Topological sort.pdf]
---

# Source: Lecture 10 Graph

## Summary
Introduction to **Graph Theory**, graph representations (Matrix vs. List), and the **Topological Sort** algorithm for Directed Acyclic Graphs (DAGs).

## Implementation Details

### 1. Graph Representations
- **Adjacency Matrix**: A 2D array `A[u][v]`.
    - `1` if edge exists, `0` otherwise (or `weight` if weighted).
    - **Space**: $O(V^2)$.
    - **Usage**: Dense graphs where $|E| \approx |V|^2$.
- **Adjacency List**: An array of linked lists.
    - Each index `i` stores a list of vertices adjacent to vertex `i`.
    - **Space**: $O(V + E)$.
    - **Usage**: Sparse graphs (most real-world applications).

### 2. Topological Sort Algorithm
Used to order vertices in a DAG such that for every directed edge $u \to v$, $u$ comes before $v$.

**Pseudocode**:
```python
def topsort(graph):
    # 1. Calculate Indegree for all vertices
    indegree = [0] * num_vertices
    for v in graph:
        for neighbor in v.adjacent:
            indegree[neighbor] += 1
            
    # 2. Enqueue all vertices with Indegree 0
    q = Queue()
    for i in range(num_vertices):
        if indegree[i] == 0:
            q.enqueue(i)
            
    # 3. Process Queue
    while not q.is_empty():
        v = q.dequeue()
        print(v) # Or add to sorted list
        for neighbor in v.adjacent:
            indegree[neighbor] -= 1
            if indegree[neighbor] == 0:
                q.enqueue(neighbor)
```

## Complexity/Trade-offs
- **Matrix Space**: $V^2$ is wasteful for sparse graphs (lots of zeros).
- **Topological Sort Time**: $O(V + E)$ using an adjacency list and a queue.
- **Cycles**: Topological sort is **impossible** if the graph contains a cycle.

## Related Pages
- [[graph-algorithms|Graph Concept Page]]
- [[shortest-path-algorithms|Shortest Path (Dijkstra)]]
- [[Assignment-4-Shortest-Path|Graph Assignment]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 10 Graph/Lecture 10 Graph.pdf|Lecture 10 Graph.pdf]] (15 pages, 3833 extracted characters) -> `conductor/extracted/ปี67_Lecture_10_Graph_Lecture_10_Graph.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 10 Graph/Topological sort.pdf|Topological sort.pdf]] (6 pages, 1913 extracted characters) -> `conductor/extracted/ปี67_Lecture_10_Graph_Topological_sort.pdf.txt`

### Deep Notes
- Graph lecture introduces vertices, edges, directed/undirected graphs, weighted/unweighted graphs, adjacency matrix, adjacency list, and topological sort.
- Representation decision: matrix is simple and O(1) for edge lookup but uses O(V^2) space; adjacency list is compact for sparse graphs and supports O(V+E) traversal.
- Topological sort only works on DAGs. Compute indegree, enqueue all zero-indegree vertices, repeatedly remove one and decrement outgoing neighbors. If not all vertices are output, a cycle exists.
- This page is the bridge from basic graph representation to [[shortest-path-algorithms|Shortest Path Algorithms]].

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_10_Graph_Lecture_10_Graph.pdf.txt`
```text
--- PAGE 1 ---
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 10
Prepared by Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
GRAPH ALGORITHMS
Definition
Representation of Graphs
Topological Sort

--- PAGE 3 ---
3
GRAPHS
A graph is a tuple G=(V,E)
V : set of vertices /nodes
E : set of edges เส้น 
each edge is a pair (v,w), where v,w Є V
If the pairs are ordered, then the graph is 
directed
directed graphs are sometimes refered as 
digraphs
Vertex w is adjacent to v iff (v,w) Є E

--- PAGE 4 ---
4
GRAPHS
A path is a sequence of vertices
w1, w2, …, wN where (wi, wi+1) Є E for 1≤i<N
The length of a path is the number of edges on the 
path, which is equal to N-1
if path contains no edges, length is 0
If the graph contains an edge (v,v) from a vertex to 
itself, then the path (v,v) is sometimes refered to a 
loop.
A simple path is a path such that all vertices are 
distinct, except that the first and last could be the 
same

--- PAGE 5 ---
5
GRAPHS
A cycle is a path with length ≥ 1 where w1 = wN
Cycle is simple, if the path is simple
In an undirected graph edges should be distinct for simple cycle
A directed graph is acyclic if it has no cycles
A directed acyclic graph is refered to DAG
An undirected graph is connected if there is a path
between each pair of vertices
A directed graph is strongly connected if there is a path 
between each pair of vertices
A directed graph is weakly connected if the underlying 
undirected graph is connected
A complete graph is a graph in which there is an edge
between every pair of vertices

--- PAGE 6 ---
6
Representation of Graphs
We will consider directed graphs
We number the vertices, starting at 1.
The graph below represents 7 vertices and 12 edges

--- PAGE 7 ---
7
Representation of Graphs
Adjacency Matrix Representation
Use a two dimensional array to represent a graph
For each edge (u,v) Є E we set A [u][v] = 1 
A [u][v] = 0 , otherwise
If the edge has a weight we set A[u][v] = weight
we can use -∞ / ∞to indicate nonexistent edges
Space requirement = θ(|v|2)
An adjacency matrix is an appropriate 
representation if the graph is dense: |E| = θ (|v|2)
is it true in most applications ?

--- PAGE 8 ---
8
Representation of Graphs
Adjacency List Representation
If the graph is not dense (is sparse) 
a better solution is adjacency list 
representation
For each vertex, we keep a list of all 
adjacent vertices.
The space requirement is O(|E|+|V|) 
O อย่างมาก ไม่เกิน 
12 + 7= 19ช่อง
ก าหนด Direct Graph มี 10 vertex มี edge 20
เส้นถามว่า adjacency list จะใช้ ? ช่อง

--- PAGE 9 ---
9
Representation of Graphs
Adjacency list representation of a graph

--- PAGE 10 ---
10
Topological Sort
A topological sort is an ordering of 
vertices in a directed acyclic graph
If there is a path vi to vj, vj appears after vi
in the ordering
Example : course prerequisite structure

--- PAGE 11 ---
11
Topological Sort
course 
prerequisite 
example

--- PAGE 12 ---
12
Topological Sort

If a graph has a cycle, a topological sort is not possible

Ordering is not necessarily unique, any legal ordering will do

On the example below, v1, v2, v5, v4, v3, v7, v6 and 
v1, v2, v5, v4, v7, v3, v6 are both topological orderings

--- PAGE 13 ---
13
Topological Sort
Algorithm
Repeat
find a vertex with no incoming edges
print the node
remove it and its edges
Until the graph is empty
How to find a vertex with no coming edges ?

--- PAGE 14 ---
14
Result of Applying topological sort to the graph below

--- PAGE 15 ---
15
/* Pseudocode ซูโดโค๊ด ค ำสั่งเทียม to perform topological sort
class Graph():
def topsort():
q = Queue(NUM_VERTICES)
define v, w as vertex
for each vertex v:
if v.indegree == 0:
q.enqueue(v) 
while (!q.isEmpty()):
v = q.items[0]
q.dequeue()
for each w adjacent to v:
w.indegree -= 1 
if w.indegree == 0:
q.enqueue(w)
```

#### Extract: `conductor/extracted/ปี67_Lecture_10_Graph_Topological_sort.pdf.txt`
```text
--- PAGE 1 ---
บทที10 
กราฟไม่มีทิศทาง Undirect G 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
V= { A ,B , C, D } 
E = { (A,B), (B,C), (C,D), (D,A) } 
 
จงเขียน path จาก vertex A ไป vertex D 
A ,B , C ,D 
อย่าเขียน A  B  C  D 0 คะแนน 
 
 
 
 
 
 
 
 
 
 
 
 
Connect = ต่อเนือง ไม่ใช่ ต่อเชือม 
AB 
B 
C 
D 
AC 
B
C 
D 
AD 
B 
C 
D 
 
 
 
 
A 
B 
D
C

--- PAGE 2 ---
กราฟมีทิศทาง Direct G 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
V= { E ,F , G, H } 
E= {(E , F) , ( F, G), (G ,H ), (H , E) } 
 (F, E) 
 
F adjacent E เพราะมี คู่อันดับ (E,F) 
แต่ E ไม่ได้ adjacent กับ F เพราะไม่มี คู่อันดับ (F,E) 
 
จงเขียนเส้นทาง(path) จาก จุด E ไป G 
E, F ,G 
อย่าเขียน E  F  G 0 คะแนน 
 
Connect 
EF 
FE
G
H
EG
F 
G
H
EH 
F 
G 
H 
 
 
 
 
 
E 
F 
H 
G

--- PAGE 3 ---
Complete Graph 
 
 
2 vertex 
 
3 vertex 
4 vertex 
5 vertex 
มี edge 1 เส้น มี edge ? เส้น มี edge ? เส้น มี edge ? เส้น 
 
 
N*(N-1) / 2 
 *( ) / 2 = 
 *( ) / 2 = 
 *( ) / 2 = 
 *( ) / 2 = 
 
Complete Graph ทีมี 10 vertex ถามว่า มี edge กี เส้น

--- PAGE 4 ---
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
 
 
 
 
 
 
 
2 
 
 
 
 
 
 
 
3 
 
 
 
4 
 
 
 
 
5 
 
 
6
 
7 
 
 
 
Adjacency Matrix ไม่นิยมใช้ เพราะ เปลืองเนื(อทีในหน่วยความจํา 
 
49 ช่อง มีช่องทีเป็น 1 อยู่ 12 ช่อง 
100 ช่อง มีช่องทีเป็น 1 อยู่ = = % 
มีช่องทีเป็น 0 หรือไม่ได้ใช้งาน อยู่ %

--- PAGE 5 ---
Topological Sort 
 
 
 
1. แปลงภาพกราฟ มาเป็น adjacency list ก่อน

--- PAGE 6 ---
2. Indegree Array อะเรย์ของจํานวน edge ทีชีเข้าหา vertex 
v 
เริมต้น 
รอบที 1 รอบที รอบที รอบที รอบที รอบที 
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
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
จงเขียน Topological Sort ทีเป็นผลลัพธ์ จากกราฟดังกล่าว
```
