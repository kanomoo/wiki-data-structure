---
type: source
tags: [linear, pointer, python]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 3 Linked List/Lecture 3 Linked List.pdf]
---

# Source: Lecture 3 Linked List

## Summary
In-depth lecture on the **List ADT** and its implementation using pointers (Linked List) vs. contiguous memory (Arrays).

## Implementation Details

### 1. Node Class
A basic building block containing data and a reference to the next node.

```python
class Node:
    def __init__(self, init_data):
        self.data = init_data
        self.next = None
        
    def get_data(self):
        return self.data
        
    def get_next(self):
        return self.next
        
    def set_next(self, new_next):
        self.next = new_next
```

### 2. LinkedList Class (Singly)
Manages the series of nodes starting from a `head`.

```python
class LinkedList:
    def __init__(self):
        self.head = None
        
    def is_empty(self):
        return self.head == None
        
    def add(self, item):
        """Adds a new item to the HEAD of the list (O(1))."""
        temp = Node(item)
        temp.set_next(self.head)
        self.head = temp
        
    def remove(self, item):
        """Finds and removes an item, relinking the previous node."""
        current = self.head
        previous = None
        found = False
        while not found and current != None:
            if current.get_data() == item:
                found = True
            else:
                previous = current
                current = current.get_next()
        
        if found:
            if previous == None:
                self.head = current.get_next()
            else:
                previous.set_next(current.get_next())
```

## Complexity/Trade-offs

| Operation | Array-based List | Linked List |
|-----------|------------------|-------------|
| **Access (k-th)** | $O(1)$ | $O(n)$ |
| **Insert/Delete (Head)** | $O(n)$ (shift needed) | $O(1)$ |
| **Insert/Delete (Tail)** | $O(1)$ (if capacity) | $O(n)$ (unless has tail pointer) |
| **Search** | $O(n)$ (unsorted) | $O(n)$ |
| **Memory** | Contiguous, Fixed size | Scattered, Dynamic |

## Related Pages
- [[linked-list|Linked List Concept Page]]
- [[Assignment-1-Linked-List|Practice Assignment 1]]
- [[Practice-Implementation-Guide|Implementation Guide]]
