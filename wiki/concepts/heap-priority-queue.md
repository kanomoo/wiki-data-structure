---
type: concept
tags: [data-structure, priority-queue, heap]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 8 Priority Queue (Heap)/Lecture 8 Priority Queue (Heap).pdf]
---

# Concept: Heap and Priority Queue

A Priority Queue is an Abstract Data Type (ADT) that allows for the retrieval of the minimum (or maximum) element in $O(\log n)$ time, typically implemented using a **Binary Heap**.

## 1. Binary Heap Properties
- **Structure Property**: A **Complete Binary Tree** (all levels filled except possibly the last, which is filled left-to-right).
- **Heap-Order Property**: Parent $\le$ Children (Min-Heap) or Parent $\ge$ Children (Max-Heap).

## 2. Array Implementation
We use a 1-based array to simplify indexing (ignoring `array[0]`):
- **Root**: `array[1]`
- **Children of `array[i]`**: `2i` (Left) and `2i + 1` (Right).
- **Parent of `array[i]`**: `i // 2`.

## 3. Core Operations
- **Insert** ($O(\log n)$):
    1. Place the new element at the next available leaf spot (to maintain structure).
    2. "Percolate Up": Compare with parent and swap if order is violated.
- **DeleteMin** ($O(\log n)$):
    1. Remove the root (the minimum element).
    2. Move the last leaf to the root position.
    3. "Percolate Down": Compare with children and swap with the *smaller* child until order is restored.

## 4. Use Cases
- **Task Scheduling**: Managing processes in an OS.
- **Dijkstra's Algorithm**: Finding the weighted shortest path.

## Learning Materials
- **Lecture**: [[Lecture-8-Priority-Queue]]
- **Step-by-Step Logic**: [[Lecture-8.1-Priority-Queue-Ops]]
- **Visual Example**: `raw/Data structure/ปี67/Lecture 8.1 Priority Queue (Insert and deleteMin)/For example Binary Heap.pdf`

## Detailed Concept Expansion

A priority queue removes items by priority. A binary heap implements this efficiently by combining complete-tree shape with heap-order property.

### Mental Model
The heap is drawn as a tree but stored as an array. Shape is controlled by array position; order is repaired by swapping along one root-to-leaf or leaf-to-root path.

### Invariants and Rules
- Complete binary tree shape: all levels filled except possibly the last, filled left to right.
- Min-heap order: every parent is <= its children. Max-heap reverses this.
- The minimum of a min-heap is always at the root.
- Operations must preserve both shape and order.

### Implementation Patterns
Insert appends at the next position, then percolates up. deleteMin removes the root, moves the last element to root, shrinks the heap, then percolates down with the smaller child. Array index formulas depend on 0-based or 1-based indexing.

### Complexity and Trade-offs
findMin is O(1). insert and deleteMin are O(log n). Building a heap from an array can be O(n) with bottom-up heapify. Space is O(n).

### Practice and Exam Checklist
- Show both array and tree after each operation.
- For deleteMin, move last item to root before percolating down.
- Compare with BST: heap is not sorted globally, only parent-child ordered.
- In traces, choose the smaller child when percolating down in min-heap.

### Source Connections
- [[Lecture-8-Priority-Queue|Lecture 8 Priority Queue]]
- [[Lecture-8.1-Priority-Queue-Ops|Priority Queue Operations]]
- [[Assignment-3-Binary-Heap|Assignment 3 Binary Heap]]
