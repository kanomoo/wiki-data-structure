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
