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

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171110.png|Screenshot 2026-02-15 171110.png]] visual source
- [[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171249.png|Screenshot 2026-02-15 171249.png]] visual source
- [[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171601.png|Screenshot 2026-02-15 171601.png]] visual source
- [[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171614.png|Screenshot 2026-02-15 171614.png]] visual source
- [[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171637.png|Screenshot 2026-02-15 171637.png]] visual source
- [[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171703.png|Screenshot 2026-02-15 171703.png]] visual source
- [[raw/Data structure/ปี67/Assignment 1 Linked List/Assign 1.1_ Linked List (For students who do their homework incorrectly)/Screenshot 2026-02-15 171848.png|Screenshot 2026-02-15 171848.png]] visual source
- [[raw/Data structure/ปี67/Assignment 1 Linked List/Assign 1.1_ Linked List (For students who do their homework incorrectly)/Screenshot 2026-02-15 171901.png|Screenshot 2026-02-15 171901.png]] visual source

### Deep Notes
- This assignment is visual-source driven. The screenshots should be read as the authoritative problem statement and correction material.
- The likely grading focus is linked-list operation correctness: creating nodes, connecting `next`, traversing safely, inserting/removing without losing references, and printing the final list state.
- To solve linked-list screenshots, convert each visual instruction into a state transition: before chain, operation, pointer movement, after chain.
- Cross-check with [[Lecture-3-Linked-List|Lecture 3 Linked List]] because the assignment depends on the same `Node` and `LinkedList` invariants.

### Visual Source Checklist
- ![[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171110.png|180]]
- ![[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171249.png|180]]
- ![[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171601.png|180]]
- ![[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171614.png|180]]
- ![[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171637.png|180]]
- ![[raw/Data structure/ปี67/Assignment 1 Linked List/Screenshot 2026-02-15 171703.png|180]]
- ![[raw/Data structure/ปี67/Assignment 1 Linked List/Assign 1.1_ Linked List (For students who do their homework incorrectly)/Screenshot 2026-02-15 171848.png|180]]
- ![[raw/Data structure/ปี67/Assignment 1 Linked List/Assign 1.1_ Linked List (For students who do their homework incorrectly)/Screenshot 2026-02-15 171901.png|180]]
