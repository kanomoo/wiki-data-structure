---
type: source
tags: [hashing, collision-resolution, open-addressing]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 7 Hashing/Lecture 7 Hashing.pdf]
---

# Source: Lecture 7 - Hashing

## Summary
Core concepts of **Hash Tables**, hash functions, and strategies for resolving collisions. The goal is to achieve $O(1)$ average time complexity for search, insert, and delete operations.

## Implementation Details

### 1. Hash Function
Maps a **Key** to an array index.
- **Integer Keys**: `Key % TableSize`. `TableSize` should ideally be a **Prime Number**.
- **String Keys**: Summing ASCII values of characters.
```python
def hash_string(key, table_size):
    hash_val = 0
    for char in key:
        hash_val += ord(char)
    return hash_val % table_size
```

### 2. Collision Resolution Strategies

#### A. Separate Chaining
Maintain a list (linked list) of all elements that hash to the same index.
- **Pros**: Simple to implement, never "fills up".
- **Cons**: Requires extra memory for pointers.

#### B. Open Addressing (Probing)
If a collision occurs, try alternative cells: $h_i(x) = (hash(x) + F(i)) \mod TableSize$.
- **Linear Probing**: $F(i) = i$. Check the next immediate slot. Leads to **Primary Clustering**.
- **Quadratic Probing**: $F(i) = i^2$. Check slots $1, 4, 9 \dots$ away. Solves primary clustering but can have **Secondary Clustering**.
- **Double Hashing**: $F(i) = i \cdot hash_2(x)$. A second hash function determines the step size. Good choice: $hash_2(x) = R - (x \mod R)$ where $R$ is a prime $< TableSize$.

### 3. Rehashing
When the table becomes too full (typically Load Factor $\lambda > 0.5$ or $0.7$), a new table is created with a size roughly **double** the original (the next prime number), and all elements are re-inserted.

## Complexity/Trade-offs
- **Average Case**: $O(1)$ for all operations.
- **Worst Case**: $O(n)$ if all keys hash to the same index (rare with good hash functions).
- **Space**: $O(TableSize + n)$.

## Related Pages
- [[hashing|Hashing Concept Deep-Dive]]
- [[linked-list|Linked List (used in Separate Chaining)]]
