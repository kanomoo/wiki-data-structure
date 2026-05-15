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
