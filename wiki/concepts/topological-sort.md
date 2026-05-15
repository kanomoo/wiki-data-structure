---
type: concept
tags: [graph, topological-sort, dag, scheduling]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 10 Graph/Topological sort.pdf]
---

# Topological Sort Logic

## Summary
**Topological Sort** is a linear ordering of vertices in a **Directed Acyclic Graph (DAG)** such that for every directed edge $(u, v)$, vertex $u$ comes before $v$ in the ordering. It is essentially a dependency-based scheduling algorithm.

## Implementation Details

### The Algorithm (Kahn's Algorithm / Indegree-based)
1. **Initialize Indegrees**: Calculate the **In-degree** (number of incoming edges) for each vertex.
2. **Queue Sources**: Enqueue all vertices with an in-degree of `0` into a Queue.
3. **Process Queue**:
    - Dequeue a vertex $v$ and add it to the topological order.
    - For each neighbor $w$ of $v$:
        - Decrement the in-degree of $w$.
        - If in-degree of $w$ becomes `0`, enqueue $w$.
4. **Cycle Detection**: If the number of vertices in the result is less than the total vertices in the graph, the graph contains a **Cycle**, and a topological sort is impossible.

### Python Implementation
```python
from collections import deque

def topological_sort(graph):
    # 1. Calculate in-degrees
    indegree = {u: 0 for u in graph}
    for u in graph:
        for v in graph[u]:
            indegree[v] += 1

    # 2. Find all vertices with 0 in-degree
    queue = deque([u for u in indegree if indegree[u] == 0])
    topo_order = []

    # 3. Process the queue
    while queue:
        u = queue.popleft()
        topo_order.append(u)

        for v in graph[u]:
            indegree[v] -= 1
            if indegree[v] == 0:
                queue.append(v)

    if len(topo_order) != len(graph):
        return "Cycle detected! Topological sort impossible."
    
    return topo_order
```

## Complexity Analysis
- **Time Complexity**: $O(V + E)$, where $V$ is the number of vertices and $E$ is the number of edges. We visit every vertex and edge exactly once.
- **Space Complexity**: $O(V)$ to store the in-degree array and the queue.

## Use Cases
- **Task Scheduling**: Determining the order of tasks with dependencies (e.g., course prerequisites).
- **Build Systems**: Compiling source files in the correct order (e.g., `make` or `bazel`).
- **Data Pipelines**: Ensuring data is processed in the correct sequence.

## Related Pages
- [[graph-algorithms|Graph Algorithms Overview]]
- [[Lecture-10-Graph|Graph Lecture Notes]]

## Detailed Concept Expansion

Topological sort orders vertices so every directed prerequisite appears before the dependent vertex. It is a scheduling algorithm for DAGs.

### Mental Model
Imagine repeatedly removing tasks that currently have no prerequisites. Each removal may unlock more tasks.

### Invariants and Rules
- Only directed acyclic graphs have valid topological order.
- A vertex with indegree 0 has no unmet prerequisites.
- Removing a vertex decrements indegree of its outgoing neighbors.
- If vertices remain but none has indegree 0, there is a cycle.

### Implementation Patterns
Kahn's algorithm: compute indegree for all vertices, enqueue all zero-indegree vertices, repeatedly dequeue/output a vertex and decrement its outgoing neighbors. DFS alternative outputs vertices after finishing descendants, then reverses finish order.

### Complexity and Trade-offs
Using adjacency lists, Kahn's algorithm is O(V+E) time and O(V) extra space for indegree and queue. With a matrix, scanning outgoing edges can cost O(V^2).

### Practice and Exam Checklist
- Build the indegree table carefully.
- If multiple zero-indegree vertices exist, more than one valid answer may exist.
- Show queue contents when the problem asks for step-by-step work.
- Use cycle detection: output count must equal V.

### Source Connections
- [[Lecture-10-Graph|Lecture 10 Graph]]
- [[graph-algorithms|Graph Algorithms]]
- [[Assignment-4-Shortest-Path|Assignment 4 Shortest Path]]
