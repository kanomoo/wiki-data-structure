---
type: source
tags: [bst, deletion, algorithms]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 5.2 Binary Search Tree Remove/]
---

# Source: Lecture 5.2 - BST Node Removal

## Summary
Advanced operations on **Binary Search Trees**, specifically focusing on the complex logic required for node deletion while maintaining the BST property.

## Implementation Details

### The Removal Algorithm
Deletion in a BST involves three distinct cases based on the number of children the target node has:

#### Case 1: Leaf Node (0 Children)
Simply remove the node and set the parent's pointer to `None`.

#### Case 2: One Child
Replace the target node with its only child.

#### Case 3: Two Children (The Complex Case)
1. **Find Successor**: Locate the smallest node in the **Right Subtree** (the In-order Successor).
2. **Replace Value**: Copy the successor's data into the target node.
3. **Delete Successor**: Recursively delete the successor node (which is guaranteed to have at most one child).

### Python Logic: Find Minimum
To support Case 3, we need a helper to find the leftmost node:
```python
def _min_value_node(self, node):
    current = node
    while current.left is not None:
        current = current.left
    return current
```

### Full Removal Method
```python
def remove(self, val, node):
    if node is None:
        return node
    
    if val < node.val:
        node.left = self.remove(val, node.left)
    elif val > node.val:
        node.right = self.remove(val, node.right)
    else:
        # Node with only one child or no child
        if node.left is None:
            return node.right
        elif node.right is None:
            return node.left
        
        # Node with two children: Get inorder successor
        temp = self._min_value_node(node.right)
        node.val = temp.val
        node.right = self.remove(temp.val, node.right)
        
    return node
```

## Complexity/Trade-offs
- **Time Complexity**: $O(h)$, where $h$ is the height of the tree ($O(\log n)$ for balanced trees, $O(n)$ for skewed trees).
- **Logic**: Using the **In-order Successor** (min of right) is standard, but using the **In-order Predecessor** (max of left) is also valid and symmetrical.

## Related Pages
- [[bst-deletion-advanced|Advanced BST Deletion Deep-Dive]]
- [[binary-search-tree|BST Concept]]
- [[tree-and-binary-tree|Tree Basics]]
