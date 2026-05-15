---
type: source
tags: [linked-list, python, implementation]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Assignment 1 Linked List/]
---

# Source: Assignment 1 - Linked List Implementation

## Summary
A foundational assignment on implementing a **Singly Linked List** in Python, focusing on node traversal and list manipulation.

## Implementation Details

### Core Classes
The implementation consists of a `Node` class for data storage and a `LinkedList` class for management.

```python
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None

    def insert_at_end(self, data):
        new_node = Node(data)
        if not self.head:
            self.head = new_node
            return
        last = self.head
        while last.next:
            last = last.next
        last.next = new_node

    def delete_node(self, key):
        temp = self.head
        if temp is not None:
            if temp.data == key:
                self.head = temp.next
                temp = None
                return
        while temp is not None:
            if temp.data == key:
                break
            prev = temp
            temp = temp.next
        if temp == None:
            return
        prev.next = temp.next
        temp = None
```

### Key Operations
1. **Insertion**: $O(n)$ to find the end, $O(1)$ if keeping a `tail` pointer.
2. **Deletion**: $O(n)$ to search for the key.
3. **Traversal**: $O(n)$ to visit all nodes.

## Complexity/Trade-offs
- **Pros**: Dynamic size, $O(1)$ insertion at the head.
- **Cons**: $O(n)$ search time, extra memory for `next` pointers.

## Related Pages
- [[linked-list|Linked List Concept]]
- [[Lecture-3-Linked-List|Main Linked List Lecture]]
