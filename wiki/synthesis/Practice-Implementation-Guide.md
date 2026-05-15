---
type: synthesis
tags: [practice, assignment, implementation]
created: 2026-05-15
updated: 2026-05-15
sources: [raw/Data structure/ปี67/Assignment 1 Linked List, raw/Data structure/ปี67/Assignment 2 Construct Binary Tree, raw/Data structure/ปี67/Assignment 3 Binary Heap, raw/Data structure/ปี67/Assignment 4 Shortest Path]
---

# Synthesis: Data Structure Practice & Implementation

Overview of practical assignments and test programs to reinforce theoretical concepts.

## 🔗 Assignment 1: Linked List
Focus: Implementing basic pointer manipulation.
- **Task**: Create a linked list and perform basic operations (Insert/Delete).
- **Key Note**: Watch for edge cases (empty list, deleting the head).

## 🌳 Assignment 2: Binary Tree Construction
Focus: Understanding traversals.
- **Logic**: Construct a tree given **Post-order** and **In-order** sequences.
- **Rule**: The last element of Post-order is always the **Root**. Use the Root to split the In-order sequence into Left and Right subtrees.

## 🏔️ Assignment 3: Binary Heap
Focus: The "Percolate" logic.
- **Task**: Step-by-step insertion of a series of numbers into a Min-Heap.
- **Checklist**:
    1. Satisfy **Structure Property** (Complete Tree).
    2. Satisfy **Heap-Order Property** (Parent $\le$ Children).

## 🕸️ Assignment 4: Graph Algorithms
Focus: Topological Sort and Shortest Path.
- **Topological Sort**: Based on **Indegree**. Enqueue nodes with 0 incoming edges.
- **Shortest Path**: Implementation of the unweighted BFS-based algorithm. Tracks `dist` and `path`.

## 🧪 Test Programs
1. **Queue Implementation**: Basic FIFO logic.
2. **Sorting performance**: Comparing Bubble, Selection, and Insertion sorts.

## Related Concepts
- [[linked-list]]
- [[tree-and-binary-tree]]
- [[heap-priority-queue]]
- [[graph-algorithms]]
- [[shortest-path-algorithms]]
- [[sorting-algorithms]]
