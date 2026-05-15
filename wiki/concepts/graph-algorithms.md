---
type: concept
tags: [data-structure, graph, network]
created: 2026-05-15
updated: 2026-05-16
sources: [Lecture-10-Graph]
---

# Concept: Graph Algorithms

A **Graph** $G = (V, E)$ is a non-linear data structure consisting of a set of vertices $V$ and a set of edges $E$ connecting them.

## Types of Graphs
- **Directed (Digraph)**: Edges have a direction ($u \to v$ is not $v \to u$).
- **Undirected**: Edges are bidirectional.
- **Weighted**: Edges have associated values (costs, distances).
- **Acyclic**: No path starts and ends at the same vertex.
- **DAG (Directed Acyclic Graph)**: A directed graph with no cycles. Essential for task scheduling and topological sorting.

## Graph Representations
1. **Adjacency Matrix**: Useful for dense graphs. Constant time $O(1)$ to check if an edge exists.
2. **Adjacency List**: Efficient for sparse graphs. Better for traversing neighbors.

## Fundamental Operations
- **Traversal**:
    - **Breadth-First Search (BFS)**: Uses a Queue. Finds the shortest path in unweighted graphs.
    - **Depth-First Search (DFS)**: Uses Recursion/Stack. Used for cycle detection and topological sort.
- **Topological Sort**: Linear ordering of vertices in a DAG.
- **Shortest Path**: Finding the minimum cost path (e.g., Dijkstra).

## Key Terminology
- **Adjacency**: $v$ is adjacent to $u$ if $(u, v) \in E$.
- **Path**: A sequence of vertices where each consecutive pair is an edge.
- **Cycle**: A path that starts and ends at the same vertex.
- **Indegree**: Number of edges pointing **to** a vertex.
- **Outdegree**: Number of edges pointing **from** a vertex.

## Big O Analysis
| Representation | Space | Edge Check | Find Neighbors |
|----------------|-------|------------|----------------|
| Adj. Matrix    | $O(V^2)$ | $O(1)$      | $O(V)$         |
| Adj. List      | $O(V+E)$ | $O(\text{degree}(v))$ | $O(\text{degree}(v))$ |

## Learning Materials
- **Lecture**: [[Lecture-10-Graph|Lecture 10 Graph]]
- **Detailed Sorting**: [[topological-sort|Topological Sort Logic]]
- **Practice**: [[Assignment-4-Shortest-Path|Shortest Path Dijkstra Practice]]
- **Visual Example**: `raw/Data structure/ปี67/Lecture 10 Graph/Lecture 10 Graph.pdf`
