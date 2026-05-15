---
type: concept
tags: [algorithm, graph, optimization]
created: 2026-05-15
updated: 2026-05-16
sources: [Lecture-11-Shortest-path]
---

# Concept: Shortest Path Algorithms

The **Shortest Path** problem involves finding a path between two vertices in a graph such that the sum of the weights of its constituent edges is minimized.

## Problem Types
1. **Single-Source Shortest Path**: Find the shortest path from a starting vertex $s$ to all other vertices.
2. **All-Pairs Shortest Path**: Find shortest paths between every pair of vertices $(u, v)$.

## Core Algorithms

### 1. Unweighted Graphs (BFS)
When all edges have a weight of 1, **Breadth-First Search (BFS)** is the optimal algorithm. It explores the graph layer by layer, ensuring that the first time a vertex is reached, it is via the shortest path.
- **Complexity**: $O(V + E)$.

### 2. Weighted Graphs (Dijkstra's Algorithm)
Works for graphs with **non-negative weights**. It is a greedy algorithm that always picks the nearest unvisited vertex.
- **Key Step (Relaxation)**: `if dist[u] + weight(u, v) < dist[v]: dist[v] = dist[u] + weight(u, v)`.
- **Complexity**: $O(E \log V)$ with a Priority Queue.

### 3. Graphs with Negative Weights (Bellman-Ford)
Dijkstra's fails if weights are negative. Bellman-Ford can handle negative weights and detect negative cycles.
- **Complexity**: $O(V \cdot E)$.

## Key Constraints
- **Negative Cycles**: If a graph has a cycle where the sum of weights is less than zero, an algorithm could loop infinitely to reach a distance of $-\infty$. Shortest path is undefined here.
- **DAGs**: Shortest paths in Directed Acyclic Graphs can be found in $O(V+E)$ using topological sort.

## Big O Comparison
| Algorithm | Graph Type | Complexity |
|-----------|------------|------------|
| BFS       | Unweighted | $O(V + E)$ |
| Dijkstra  | Weighted ($\ge 0$) | $O(E \log V)$ |
| Bellman-Ford | Weighted (any) | $O(V \cdot E)$ |

## Learning Materials
- **Lecture**: [[Lecture-11-Shortest-path|Lecture 11 Shortest Path]]
- **Practice**: [[Assignment-4-Shortest-Path|Dijkstra Implementation]]
- **Visual Example**: `raw/Data structure/ปี67/Lecture 11 Shortest path/For Example Graph.pdf`

## Detailed Concept Expansion

Shortest-path algorithms find minimum-cost routes through a graph. The correct algorithm depends on whether edges are weighted and whether any weights are negative.

### Mental Model
Maintain a best-known distance table and improve it by relaxation. The previous-pointer table records how to reconstruct the route after distances are finalized or stabilized.

### Invariants and Rules
- Source distance starts at 0; other distances start at infinity.
- Relaxing edge v -> w checks whether going through v improves w.
- Dijkstra finalizes the nearest unknown vertex when all weights are nonnegative.
- Previous pointers should form the final path tree.

### Implementation Patterns
Unweighted shortest path can use BFS levels. Dijkstra uses a table with known flag, Dv distance, and Pv previous vertex. Each step chooses the unknown vertex with smallest Dv, marks it known, and relaxes outgoing edges.

### Complexity and Trade-offs
Simple table Dijkstra is O(V^2). With adjacency list and priority queue it can be O((V+E) log V). BFS for unweighted graphs is O(V+E). Space is O(V+E) for graph plus O(V) for tables.

### Practice and Exam Checklist
- Write Dv/Pv/known table after every selected vertex.
- Do not use Dijkstra with negative edges.
- Reconstruct path by walking previous pointers backward from target to source.
- Distinguish shortest number of edges from shortest weighted distance.

### Source Connections
- [[Lecture-11-Shortest-Path|Lecture 11 Shortest Path]]
- [[Assignment-4-Shortest-Path|Assignment 4 Shortest Path]]
- [[graph-algorithms|Graph Algorithms]]
