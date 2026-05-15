---
type: concept
tags: [data-structure, searching, hashing]
created: 2026-05-15
updated: 2026-05-16
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

## Detailed Concept Expansion

Hashing stores keys in an array-like table by computing an index from the key. It trades ordered structure for expected constant-time lookup.

### Mental Model
A hash table is a parking lot plus a rule for choosing spaces. Collisions are inevitable, so the collision policy is part of the data structure, not an afterthought.

### Invariants and Rules
- Equal keys must hash to the same index.
- Collision resolution must never make an inserted key unreachable.
- Search must follow the same probe/chain path as insert.
- Deletion in open addressing must preserve probe chains, often using tombstones.
- Load factor controls performance.

### Implementation Patterns
Separate chaining stores a list/bucket at each table index. Linear probing tries the next slot; quadratic probing jumps by squared offsets; double hashing uses a second hash step. Classroom problems often ask for table state after each insert, so record hash value, collision, probe sequence, and final slot.

### Complexity and Trade-offs
Expected insert/search/delete is O(1) with good hashing and low load. Worst case is O(n), especially with poor hash functions or heavy clustering. Space is O(m+n), depending on table size m and stored keys n.

### Practice and Exam Checklist
- Always write the table size and hash formula first.
- For open addressing, list every probed index.
- For deletion, know whether the source expects tombstones.
- Compare collision methods by clustering risk.

### Source Connections
- [[Lecture-7-Hashing|Lecture 7 Hashing]]
- [[past-exam-pattern-bank|Past Exam Pattern Bank]]
- [[data-structure-complete-exam-notes|Complete Exam Notes]]
