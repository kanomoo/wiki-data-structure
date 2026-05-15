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

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Test Program 1_ Queue/Screenshot 2026-02-15 172518.png|Screenshot 2026-02-15 172518.png]] visual source
- [[raw/Data structure/ปี67/Test Program 1_ Queue/work/Screenshot 2026-02-15 172649.png|Screenshot 2026-02-15 172649.png]] visual source
- [[raw/Data structure/ปี67/Test Program 1_ Queue/work/Screenshot 2026-02-15 172659.png|Screenshot 2026-02-15 172659.png]] visual source
- [[raw/Data structure/ปี67/Test Program 1_ Queue/work/Screenshot 2026-02-15 172709.png|Screenshot 2026-02-15 172709.png]] visual source

### Deep Notes
- This test program is screenshot-based and centers on Queue implementation behavior.
- The safest implementation pattern is a circular queue: fixed array, `front`, `rear`, `size`, modulo wraparound, and explicit full/empty checks.
- If the problem permits Python list usage, avoid `pop(0)` for performance explanations because it shifts all remaining elements. Use front index or deque-like logic.
- Test cases should cover enqueue into empty queue, dequeue until empty, wraparound after removals, full queue overflow, and underflow.

### Visual Source Checklist
- ![[raw/Data structure/ปี67/Test Program 1_ Queue/Screenshot 2026-02-15 172518.png|180]]
- ![[raw/Data structure/ปี67/Test Program 1_ Queue/work/Screenshot 2026-02-15 172649.png|180]]
- ![[raw/Data structure/ปี67/Test Program 1_ Queue/work/Screenshot 2026-02-15 172659.png|180]]
- ![[raw/Data structure/ปี67/Test Program 1_ Queue/work/Screenshot 2026-02-15 172709.png|180]]
