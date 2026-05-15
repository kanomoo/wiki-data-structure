---
type: concept
tags: [data-structure, tree, hierarchy]
created: 2026-05-15
updated: 2026-05-16
sources: [Lecture-5-Tree]
---

# Concept: Tree & Binary Tree

A **Tree** is a hierarchical data structure consisting of nodes connected by edges. It is a recursive structure where each node is the root of its own subtree.

## Key Terminology
- **Root**: The top node of the tree.
- **Child/Parent**: A node is a child of the node directly above it (parent).
- **Leaf**: A node with no children.
- **Sibling**: Nodes that share the same parent.
- **Depth**: Length of the path from the root to the node.
- **Height**: Length of the longest path from the node to a leaf.

## Binary Tree
A specific type of tree where every node has **at most two children**, typically referred to as the **left** and **right** child.

### Implementations
1. **Reference-based**: Each node object contains data and pointers (`self.left`, `self.right`).
2. **Array-based**: (For complete binary trees) Node at index $i$ has children at $2i$ and $2i+1$.

## Expression Trees
A binary tree used to represent mathematical expressions.
- **Operators**: Stored in internal nodes.
- **Operands**: Stored in leaf nodes.
- **Traversals**:
    - **In-order**: Gives Infix expression.
    - **Post-order**: Gives Postfix expression.
    - **Pre-order**: Gives Prefix expression.

## Big O Analysis
| Tree Type | Height | Search Complexity |
|-----------|--------|-------------------|
| Balanced  | $\log n$ | $O(\log n)$ |
| Skewed    | $n$ | $O(n)$ |

## Learning Materials
- **Lecture**: [[Lecture-5-Tree|Lecture 5 Tree]]
- **Deep Dive**: [[binary-search-tree|Binary Search Tree]]
- **Practice**: [[Assignment-2-Binary-Tree|Binary Tree Assignment]]
- **Visual Example**: `raw/Data structure/ปี67/Lecture 5 Tree/For example Binary Tree.pdf`
