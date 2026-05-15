---
type: synthesis
tags: [exam, midterm, final, revision]
created: 2026-05-15
updated: 2026-05-15
sources: [raw/Data structure/ปีเก่า/midterm1.pdf, raw/Data structure/ปีเก่า/สำเนาของ DataStrucFinal2-xxAnd2-61-1.pdf]
---

# Synthesis: Exam Preparation & Key Focuses

Analysis of past exam papers (Midterm and Final) to identify recurring patterns and high-yield topics.

## 🏁 Midterm Focuses
1. **Linked Lists**: Implementation of `insert` and `delete` logic. Handling first and last elements.
2. **Stacks**: 
    - Infix to Postfix conversion.
    - Evaluation of Postfix expressions.
3. **Queues**: `enqueue` and `dequeue` operations. Circular queue logic (Wrap Around).
4. **Trees**:
    - **Expression Trees**: Building a tree from an expression using a stack.
    - **BST**: Insertion and the 3 cases of Deletion.

## 🏆 Final Focuses
1. **Hashing**:
    - Calculating indices using Hash Functions.
    - Collision Resolution: **Double Hashing** formula $h_i(x) = (hash(x) + i \cdot hash_2(x)) \mod TableSize$.
    - Rehashing thresholds (typically 70-75% load factor).
2. **Priority Queues (Heap)**:
    - Step-by-step visual of `insert` (percolate up).
    - Step-by-step visual of `deleteMin` (percolate down).
3. **Sorting**:
    - **Insertion Sort**: Worst-case analysis and manual tracing.
    - **Quicksort**: Selecting Pivots, Partitioning logic, and the significance of "Cutoff" (switching to Insertion Sort for small arrays).
4. **Graphs**:
    - **Topological Sort**: Finding the ordering based on Indegree.
    - **Shortest Path**: Tracing the unweighted algorithm using a table (Known, Dv, Pv).

## 💡 Pro-Tips for Success
- **Trace Manually**: Past exams heavily feature "Show the result after round X". Practice manual tracing of sorting and heap operations.
- **Formulas**: Memorize the Double Hashing and Heap indexing ($2i, 2i+1, i//2$) formulas.

## Related Concepts
- [[bst-deletion-advanced]]
- [[hashing]]
- [[heap-priority-queue]]
- [[graph-algorithms]]
- [[sorting-algorithms]]
