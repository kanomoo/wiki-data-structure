---
type: concept
tags: [data-structure, searching, hashing]
created: 2026-05-15
updated: 2026-05-15
sources: [raw/Data structure/ปี67/Lecture 7 Hashing/Lecture 7 Hashing.pdf]
---

# Concept: Hashing

Hashing is a technique to map data of arbitrary size (Keys) to fixed-size values (Indices) in a **Hash Table**, aiming for $O(1)$ average time complexity for search, insert, and delete.

## 1. Core Components
- **Hash Table**: A fixed-size array of size `TableSize`.
- **Key**: The unique identifier being mapped (e.g., string, ID).
- **Hash Function**: The formula mapping Key -> Index.
    - *Example (Integers)*: `index = Key % TableSize`
    - *Best Practice*: `TableSize` should be a **prime number** to reduce collisions.

## 2. Collision Resolution
A collision occurs when two distinct keys map to the same index.

### Separate Chaining
Maintain a **linked list** (or another structure) at each index. Colliding items are simply appended to the list.
- **Pros**: Easy implementation, handles unlimited items (but search degrades).

### Open Addressing
Find an alternate empty cell using a probe sequence: $h_i(x) = (hash(x) + F(i)) \mod TableSize$.
1. **Linear Probing**: $F(i) = i$. Check index $H, H+1, H+2, ...$
    - *Risk*: **Primary Clustering** (large blocks of occupied cells).
2. **Quadratic Probing**: $F(i) = i^2$. Check index $H, H+1^2, H+2^2, ...$
    - *Risk*: **Secondary Clustering**.
3. **Double Hashing**: $F(i) = i \cdot hash_2(x)$. Use a second hash function for the step size.

## 3. Rehashing
As the **Load Factor** ($\lambda = N / TableSize$) increases, performance drops.
- **Action**: Create a new table roughly **twice the size** (next prime number).
- **Transfer**: Re-calculate indices for all existing elements and move them. Typically done when $\lambda > 0.5$ for quadratic probing.

## Learning Materials
- **Lecture**: [[Lecture-7-Hashing|Lecture 7 Hashing]]
- **Code Logic**:
  ```python
  def simple_hash(key, table_size):
      return hash(key) % table_size
  ```
