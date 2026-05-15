---
type: concept
tags: [data-structure, priority-queue, heap]
created: 2026-05-15
updated: 2026-05-15
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
