---
type: concept
tags: [bst, algorithm, logic]
created: 2026-05-16
updated: 2026-05-16
sources: [Lecture-5.1-BST, Lecture-5.2-BST-Remove]
---

# Concept: BST Deletion (Advanced)

Deleting a node from a Binary Search Tree is the most complex basic operation because the tree must maintain its **ordering property** (Left < Root < Right) after the change.

## The Three Cases

### Case 1: The node is a Leaf
If the node has no children, simply set the parent's pointer (left or right) to `None`.

### Case 2: The node has One Child
If the node has only one child, bypass the node by linking the parent directly to that child. 
- *Visual*: It is like removing a link in a chain and connecting the neighbors.

### Case 3: The node has Two Children
This is the most complex scenario. You cannot simply delete the node as it would orphan two subtrees.
1. **Identify the Successor**: Find the smallest node in the **Right Subtree** (the "In-order Successor").
2. **Value Replacement**: Copy the successor's data into the node you intended to delete.
3. **Recursive Deletion**: Delete the original successor node (which is guaranteed to have at most one child, making it a Case 1 or Case 2 deletion).

## Python Implementation Logic
```python
def _delete_recursive(self, current_node, value):
    if current_node is None:
        return current_node
    
    if value < current_node.value:
        current_node.left = self._delete_recursive(current_node.left, value)
    elif value > current_node.value:
        current_node.right = self._delete_recursive(current_node.right, value)
    else:
        # Case 1 & 2: Zero or One child
        if current_node.left is None:
            return current_node.right
        elif current_node.right is None:
            return current_node.left
            
        # Case 3: Two children
        temp_node = self._min_value_node(current_node.right)
        current_node.value = temp_node.value
        current_node.right = self._delete_recursive(current_node.right, temp_node.value)
        
    return current_node
```

## Why the In-order Successor?
The in-order successor is the smallest value that is still larger than all values in the left subtree. Replacing the root with this value ensures the BST property remains valid for both sides.

## Learning Materials
- **Lecture Notes**: [[Lecture-5.2-BST-Remove|Lecture 5.2 BST Remove]]
- **Visual Examples**: `raw/Data structure/ปี67/Lecture 5.2 Binary Search Tree Remove/Example for Binary Search Tree remove 2 std.pdf`
