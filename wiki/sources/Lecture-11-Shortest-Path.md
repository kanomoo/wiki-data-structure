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
