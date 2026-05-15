---
type: source
tags: [priority-queue, heap, implementation]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 8.1 Priority Queue (Insert and deleteMin)/]
---

# Source: Lecture 8.1 - Priority Queue Operations

## Summary
Technical implementation of a **Binary Heap** (Min-Heap) using an array, focusing on the `insert` and `deleteMin` operations.

## Implementation Details

### Python Class Structure
```python
class BinaryHeap:
    def __init__(self, capacity=100):
        # Index 0 is unused for easier parent/child math
        self.array = [None] * (capacity + 1)
        self.currentSize = 0

    def is_empty(self):
        return self.currentSize == 0
```

### 1. Insert (Percolate Up)
Add the element at the end and "bubble" it up until the heap property is restored.
```python
def insert(self, x):
    if self.currentSize == len(self.array) - 1:
        return # Full
    
    self.currentSize += 1
    hole = self.currentSize
    # While x is smaller than parent (hole // 2)
    while hole > 1 and x < self.array[hole // 2]:
        self.array[hole] = self.array[hole // 2]
        hole //= 2
    self.array[hole] = x
```

### 2. DeleteMin (Percolate Down)
Remove the root (index 1), move the last element to the root, and "bubble" it down.
```python
def delete_min(self):
    if self.is_empty():
        return None
    
    min_item = self.array[1]
    self.array[1] = self.array[self.currentSize]
    self.currentSize -= 1
    self._percolate_down(1)
    return min_item

def _percolate_down(self, hole):
    temp = self.array[hole]
    while hole * 2 <= self.currentSize:
        child = hole * 2 # Left child
        # Pick the smaller of the two children
        if child != self.currentSize and self.array[child + 1] < self.array[child]:
            child += 1
        
        if self.array[child] < temp:
            self.array[hole] = self.array[child]
        else:
            break
        hole = child
    self.array[hole] = temp
```

## Complexity/Trade-offs
- **Insert**: $O(\log n)$ average and worst case.
- **DeleteMin**: $O(\log n)$ as it always traverses the height.
- **FindMin**: $O(1)$ constant time access.

## Related Pages
- [[heap-priority-queue|Heap & Priority Queue Concept]]
- [[Assignment-3-Binary-Heap|Practice Assignment 3]]
