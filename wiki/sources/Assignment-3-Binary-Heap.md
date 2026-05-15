---
type: source
tags: [practice, heap, priority-queue]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Assignment 3 Binary Heap/Assignment 3 Inclass.pdf]
---

# Source: Assignment 3 Binary Heap

## Summary
A deep-dive assignment into the mechanics of **Min-Heaps**, specifically the "Percolate Up" process during insertion to maintain the **Heap Order Property**.

## Implementation Details

### The Task
Insert the following sequence into an empty min-binary heap:
`10, 12, 1, 14, 6, 5, 8, 15, 3, 9, 7, 4, 11, 13, 2`

### Step-by-Step Logic (Percolate Up)
1. **Insert 10, 12**: Structure OK, Order OK.
2. **Insert 1**: 
    - Placed as left child of 10.
    - **Percolate**: 1 is smaller than 10. Swap.
    - New Heap: `1 (root), 12, 10`.
3. **Insert 6, 5**:
    - 5 is smaller than its parent (12). Swap.
    - New Heap: `1, 5, 10, 14, 6`.

### Array Representation
Heaps are typically stored in arrays for efficiency:
- `heap[0]` is often left empty to simplify index math.
- Parent of `i` is at `i // 2`.
- Left child of `i` is at `2i`.
- Right child of `i` is at `2i + 1`.

## Complexity/Trade-offs
- **Insertion**: $O(\log n)$ as we only traverse up the height of the tree.
- **Find Min**: $O(1)$ (always at index 1).
- **Structure**: Always a **Complete Binary Tree**, ensuring the height is always $\log n$.

## Related Pages
- [[heap-priority-queue|Heap & Priority Queue Concept]]
- [[Lecture-8-Priority-Queue|Main Heap Lecture]]
- [[Practice-Implementation-Guide|Practice Implementation Guide]]
