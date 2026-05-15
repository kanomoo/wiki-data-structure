---
type: source
tags: [tree, binary-tree, recursion]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 5 Tree/Lecture 5 Tree.pdf]
---

# Source: Lecture 5 Tree

## Summary
Foundational lecture on tree terminology, recursive definitions, and binary tree implementations.

## Implementation Details

### 1. General Tree (First-Child Next-Sibling)
To handle trees with an arbitrary number of children without wasting space, the "First-Child Next-Sibling" representation is used.

```python
class Node:
    def __init__(self, value):
        self.value = value
        self.firstChild = None
        self.nextSibling = None
```

### 2. Binary Tree Implementation
A tree where each node has at most two children (`left` and `right`).

```python
class BinaryNode:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None
```

### 3. Tree Traversals
- **Pre-Order** (Root, Left, Right): Used for creating a copy of the tree or prefix expressions.
- **In-Order** (Left, Root, Right): Used for BSTs (produces sorted output) and infix expressions.
- **Post-Order** (Left, Right, Root): Used for deleting trees or postfix expressions.

### 4. Expression Trees
Specialized binary trees where:
- **Leaves**: Operands (a, b, 5, etc.).
- **Internal Nodes**: Operators (+, -, *, /).
- Construction from Postfix: Use a Stack to store tree pointers. Pop 2 trees and merge under a new operator node when an operator is read.

## Complexity/Trade-offs
- **Depth/Height**: $O(n)$ in the worst case (skewed tree), $O(\log n)$ in balanced trees.
- **Space Complexity**: $O(n)$ to store $n$ nodes.

## Related Pages
- [[tree-and-binary-tree|Tree Concept Page]]
- [[binary-search-tree|Binary Search Tree Concept]]
- [[stack|Application: Postfix Stack]]
