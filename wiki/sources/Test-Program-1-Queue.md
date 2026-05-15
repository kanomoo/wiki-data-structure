---
type: source
tags: [test, queue, circular-buffer]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Test Program 1_ Queue/]
---

# Source: Test Program 1 - Queue

## Summary
A timed coding evaluation focusing on the implementation of a **Circular Queue** using an array to maximize memory efficiency.

## Implementation Details

### The Challenge
Implementing a Queue where the `enqueue` and `dequeue` operations wrap around the end of the array to reuse empty slots at the beginning.

### Python Implementation (Circular Queue)
```python
class CircularQueue:
    def __init__(self, capacity):
        self.capacity = capacity
        self.queue = [None] * capacity
        self.front = 0
        self.rear = 0
        self.size = 0

    def is_empty(self):
        return self.size == 0

    def is_full(self):
        return self.size == self.capacity

    def enqueue(self, item):
        if self.is_full():
            print("Queue Overflow")
            return
        self.queue[self.rear] = item
        self.rear = (self.rear + 1) % self.capacity
        self.size += 1

    def dequeue(self):
        if self.is_empty():
            print("Queue Underflow")
            return None
        item = self.queue[self.front]
        self.queue[self.front] = None
        self.front = (self.front + 1) % self.capacity
        self.size -= 1
        return item
```

### Key Logic: Modulo Operator
The `% capacity` operation is what makes the queue "circular". It ensures that once `rear` or `front` reaches the last index, the next increment resets it to `0`.

## Complexity/Trade-offs
- **Enqueue/Dequeue**: $O(1)$ constant time.
- **Space**: $O(n)$ fixed allocation.
- **Efficiency**: Significantly better than a simple list-based queue in Python where `pop(0)` takes $O(n)$ time due to element shifting.

## Related Pages
- [[stack|Stack & Queue Concept]]
- [[Practice-Implementation-Guide|Practice Implementation Guide]]
