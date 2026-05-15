---
type: concept
tags: [data-structure, linear, pointer]
created: 2026-05-15
updated: 2026-05-16
sources: [Lecture-3-Linked-List]
---

# Concept: Linked List

A **Linked List** is a dynamic linear data structure where elements (Nodes) are not stored in contiguous memory locations. Instead, each node points to the next using a reference/pointer.

## Structure
- **Node**: The basic unit.
    - **Data**: The actual value stored.
    - **Next**: A pointer to the succeeding node.
- **Head**: The entry point of the list.
- **None (Null)**: Indicates the end of the list.

## Core Operations
- **Insertion**: Adding a node. Efficient at the head ($O(1)$).
- **Deletion**: Removing a node. Requires re-pointing the `previous` node's `next` reference.
- **Traversal**: Visiting nodes sequentially.
- **Search**: Finding a value by iterating through nodes.

## Advantages vs. Arrays
1. **Dynamic Size**: Can grow/shrink during execution; no need to pre-allocate memory.
2. **Efficient Mod**: Insertions and deletions don't require shifting all other elements.

## Disadvantages
1. **No Random Access**: To get the $k$-th element, you must traverse from the head ($O(n)$).
2. **Memory Overhead**: Each element requires extra space for the pointer.

## Variations
- **Singly Linked List**: Each node points only to the next.
- **Doubly Linked List**: Each node has pointers to both `next` and `previous`. Allows backwards traversal.
- **Circular Linked List**: The last node points back to the head.

## Big O Analysis
| Operation | Singly | Doubly |
|-----------|--------|--------|
| Prepend (Head) | $O(1)$ | $O(1)$ |
| Append (Tail) | $O(n)$* | $O(1)$ (if has tail pointer) |
| Delete (given node) | $O(n)$ (to find prev) | $O(1)$ |
| Search | $O(n)$ | $O(n)$ |

## Learning Materials
- **Lecture**: [[Lecture-3-Linked-List|Lecture 3 Linked List]]
- **Practice**: [[Assignment-1-Linked-List|Linked List Assignment]]
- **Visual Example**: `raw/Data structure/ปี67/Lecture 3 Linked List/For example.pdf`
