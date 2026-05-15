---
type: source
tags: [practice, binary-tree, traversal]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Assignment 2 Construct Binary Tree/Assign 2 Binary Tree.pdf]
---

# Source: Assignment 2 Binary Tree Construction

## Summary
A practical assignment on reconstructing a **Binary Tree** from its **In-order** and **Post-order** traversal sequences.

## Implementation Details

### The Problem
Given:
- **Post-order**: Last 6 digits of Student ID (e.g., `3, 2, 0, 3, 2`).
- **In-order**: Derived by swapping digits from the ID (e.g., `3, 2, 2, 3, 0`).
- **Goal**: Construct the tree and write the **Pre-order** traversal.

### Reconstructive Logic
1. **Identify Root**: The last element in a **Post-order** traversal is always the **Root** of the tree (or subtree).
2. **Split In-order**: Locate the root in the **In-order** sequence. All elements to the left belong to the **Left Subtree**, and elements to the right belong to the **Right Subtree**.
3. **Recursive Build**: Repeat the process for the left and right sub-sequences.

### Python logic (Simplified)
```python
def build_tree(inorder, postorder):
    if not inorder or not postorder:
        return None

    # Root is the last element in postorder
    root_val = postorder.pop()
    root = Node(root_val)

    # Find index of root in inorder to split subtrees
    idx = inorder.index(root_val)

    # Build right subtree first because we are popping from the end of postorder
    root.right = build_tree(inorder[idx+1:], postorder)
    root.left = build_tree(inorder[:idx], postorder)

    return root
```

## Complexity/Trade-offs
- **Time Complexity**: $O(n^2)$ for simple array searching of the root index, or $O(n)$ if using a hash map to store inorder indices.
- **Space Complexity**: $O(n)$ for storing node objects and the recursion stack.
- **Constraint**: This reconstruction only works if all values in the tree are **unique**. If there are duplicates (as in the Student ID example), the tree structure might be ambiguous without additional metadata.

## Related Pages
- [[tree-and-binary-tree|Tree & Binary Tree Concept]]
- [[Practice-Implementation-Guide|Practice Implementation Guide]]
