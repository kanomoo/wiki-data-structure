---
type: concept
tags: [data-structure, bst, search]
created: 2026-05-15
updated: 2026-05-16
sources: [Lecture-5.1-BST]
---

# Concept: Binary Search Tree (BST)

A **Binary Search Tree (BST)** is a binary tree that maintains a specific ordering property, making it highly efficient for searching, insertion, and deletion.

## The BST Property
For any node $N$:
- **Left Subtree**: All nodes in the left subtree have values **less than** $N.value$.
- **Right Subtree**: All nodes in the right subtree have values **greater than** $N.value$.

## Core Operations

### 1. Search
Compare the target value with the current node:
- If equal, return found.
- If less, move to the left child.
- If greater, move to the right child.

### 2. Insertion
Similar to search. Traverse down the tree until a `None` spot is found that satisfies the BST property, then create a new node there.

### 3. Deletion (Complex)
Deletion requires maintaining the BST property after the node is removed. It involves three cases:
- **No Children**: Delete the node.
- **One Child**: Replace node with its child.
- **Two Children**: Replace node with its **In-order Successor** (smallest in right subtree).
- *See [[bst-deletion-advanced|Advanced Deletion]] for details.*

## Complexity Analysis
- **Average Case**: $O(\log n)$ for search, insert, and delete.
- **Worst Case**: $O(n)$ if the tree becomes "skewed" (effectively a linked list).
- **Optimization**: To prevent the worst case, self-balancing trees like **AVL Trees** or **Red-Black Trees** are used.

## Learning Materials
- **Lecture**: [[Lecture-5.1-BST|Lecture 5.1 Binary Search Tree]]
- **Advanced Deletion**: [[bst-deletion-advanced]]
- **Practice**: `raw/Data structure/ปี67/Lecture 5.1 Binary Search Tree/removebst.pdf`
