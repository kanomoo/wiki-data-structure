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

## Detailed Concept Expansion

A linked list is a linear collection where order is represented by pointers rather than contiguous memory. Its power is cheap local insertion/deletion once the position is known; its cost is that finding that position usually requires traversal.

### Mental Model
Think of head as the only doorway into the chain. Each node knows only its own data and the next node. If you overwrite a next reference before saving the rest of the chain, the remaining nodes become unreachable.

### Invariants and Rules
- head is either None or points to the first node.
- The final node has next = None.
- Every node except the head must be reachable through the chain.
- Traversal stops when current is None.
- Remove/insert operations must reconnect the previous node to the correct next node.

### Implementation Patterns
- add(item): create new node, set its next to old head, move head to new node.
- search(item): walk current = current.next until found or end.
- remove(item): keep previous and current; if removing head, move head; otherwise set previous.next = current.next.
- Tail insertion is O(n) unless the list stores a tail pointer.
- Doubly linked lists add prev to make backward movement and deletion easier, with extra memory and pointer updates.

### Complexity and Trade-offs
Access by index/search is O(n). Insertion/removal at head is O(1). Insertion/removal after a known node is O(1). Memory is O(n), with extra pointer overhead per node.

### Practice and Exam Checklist
- Draw head, previous, and current before writing code.
- Check remove-from-empty, remove-head, remove-tail, remove-missing, and remove-only-node.
- After every mutation, ask: can I still reach the whole list from head?
- For screenshot assignments, translate each visual step into pointer state changes.

### Source Connections
- [[Lecture-3-Linked-List|Lecture 3 Linked List]]
- [[Assignment-1-Linked-List|Assignment 1 Linked List]]
- [[Practice-Implementation-Guide|Practice Implementation Guide]]
