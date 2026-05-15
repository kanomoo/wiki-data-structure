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

## Detailed Concept Expansion

A Binary Search Tree is a binary tree with an ordering rule that turns tree shape into searchable structure. Each comparison discards one side of the remaining tree.

### Mental Model
At every node, ask one question: is the target less than, greater than, or equal to this node? That answer chooses the next subtree.

### Invariants and Rules
- Left subtree values are less than the node value.
- Right subtree values are greater than the node value.
- The invariant must hold recursively for every subtree.
- Inorder traversal of a valid BST yields sorted order.
- Duplicate handling must be defined explicitly if duplicates appear.

### Implementation Patterns
Search and insert are guided descents. Delete has three cases: leaf, one child, two children. The two-child case replaces the node with inorder successor or predecessor, then deletes that replacement from its original position.

### Complexity and Trade-offs
Operations are O(h). If the tree is balanced, h = O(log n). If inserts arrive sorted and no balancing is used, h = O(n), making the BST behave like a linked list.

### Practice and Exam Checklist
- Validate a BST using min/max bounds, not only local parent-child comparisons.
- For deletion, state whether you use successor or predecessor.
- After each insert/delete, redraw the affected subtree and check inorder order.
- Watch duplicate student-ID digits in reconstruction problems.

### Source Connections
- [[Lecture-5.1-BST|Lecture 5.1 BST]]
- [[Lecture-5.2-BST-Remove|Lecture 5.2 BST Remove]]
- [[bst-deletion-advanced|BST Deletion Advanced]]
