---
type: source
tags: [priority-queue, heap]
created: 2026-05-15
updated: 2026-05-15
sources: [raw/Data structure/ปี67/Lecture 8 Priority Queue (Heap)/Lecture 8 Priority Queue (Heap).pdf]
---

# Source: Lecture 8 Priority Queue (Heap)

## Summary
Introduction to Priority Queues and their implementation using Binary Heaps.

## Key Takeaways
- **Priority Queue**: Supports `insert` and `deleteMin`. Unlike regular queues, items are processed based on priority.
- **Binary Heap**: A complete binary tree that satisfies the heap-order property.
- **Heap-Order Property**: For every node $X$, the key in its parent is $\le$ the key in $X$. The root is always the minimum.
- **Array Representation**: Because it's a complete tree, it maps perfectly to an array:
    - Left child of $i$ is $2i$.
    - Right child of $i$ is $2i + 1$.
    - Parent of $i$ is $i // 2$.

## Related Concepts
- [[heap-priority-queue]]
