---
type: source
tags: [bst, recursion, deletion]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 5.1 Binary Search Tree/Lecture 5.1add in method delete.pdf]
---

# Source: Lecture 5.1 BST

## Summary
Focuses on the **Binary Search Tree (BST)** ADT, specifically its property of sorted storage and the recursive logic for insertion and deletion.

## Implementation Details

### 1. BST Property
For every node $x$:
- All values in the **left subtree** are smaller than $x$.
- All values in the **right subtree** are larger than $x$.

### 2. Recursive Insertion
```python
def _insert_recursive(self, current_node, value):
    if value < current_node.value:
        if current_node.left is None:
            current_node.left = Node(value)
        else:
            self._insert_recursive(current_node.left, value)
    elif value > current_node.value:
        if current_node.right is None:
            current_node.right = Node(value)
        else:
            self._insert_recursive(current_node.right, value)
```

### 3. Node Deletion Algorithm
- **Case 1: Leaf Node**: Simply remove the node.
- **Case 2: One Child**: Link the parent directly to the child.
- **Case 3: Two Children**:
    1. Find the **minimum value node** in the right subtree (the successor).
    2. Replace the current node's value with the successor's value.
    3. Recursively delete the successor node from the right subtree.

## Complexity/Trade-offs
- **Search/Insert/Delete**:
    - **Average**: $O(\log n)$.
    - **Worst Case**: $O(n)$ (when the tree is a linked list).
- **Sorted Data**: An in-order traversal of a BST always yields sorted elements.

## Related Pages
- [[binary-search-tree|BST Concept Page]]
- [[bst-deletion-advanced|Advanced Deletion Details]]
- [[Assignment-2-Binary-Tree|BST Practice]]
