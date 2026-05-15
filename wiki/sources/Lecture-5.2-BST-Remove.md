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

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 5.2 Binary Search Tree Remove/Lecture 5.2 Binary Search Tree (Remove node which has 2 children).pdf|Lecture 5.2 Binary Search Tree (Remove node which has 2 children).pdf]] (5 pages, 814 extracted characters) -> `conductor/extracted/ปี67_Lecture_5.2_Binary_Search_Tree_Remove_Lecture_5.2_Binary_Search_Tree_Remove_node_which_has_2_children_.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 5.2 Binary Search Tree Remove/Example for Binary Search Tree remove 2 std.pdf|Example for Binary Search Tree remove 2 std.pdf]] (4 pages, 1315 extracted characters) -> `conductor/extracted/ปี67_Lecture_5.2_Binary_Search_Tree_Remove_Example_for_Binary_Search_Tree_remove_2_std.pdf.txt`
- [[raw/Data structure/สำเนาของ แบบฝึกหัด5.2.png|สำเนาของ แบบฝึกหัด5.2.png]] visual source

### Deep Notes
- This source page focuses narrowly on the hardest BST case: removing a node with two children.
- Standard process: find target, choose replacement from the right subtree minimum or left subtree maximum, copy replacement data into target, then delete replacement from its old location.
- The reason this works is inorder ordering. The successor is the smallest value greater than the target, so copying it keeps every left value smaller and every right value greater.
- Implementation detail: do not detach subtrees blindly. Keep parent pointers or return subtree roots from recursive delete so the caller can reconnect correctly.

### Visual Source Checklist
- ![[raw/Data structure/สำเนาของ แบบฝึกหัด5.2.png|180]]

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_5.2_Binary_Search_Tree_Remove_Lecture_5.2_Binary_Search_Tree_Remove_node_which_has_2_children_.pdf.txt`
```text
--- PAGE 1 ---
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 5.2
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
TREES
Implementation of Trees
Tree Traversals
Binary Trees
The Search Tree ADT-Binary SearchTrees

--- PAGE 3 ---
3
Binary Search Trees
Each node in tree stores an item
items are integers and distinct
when has no left or ritght child node, mean left 
or right point to None.
Properties
A binary tree
for each node x
values at left subtree are smaller
values at right subtree are larger 
than the value of x

--- PAGE 4 ---
4
find

--- PAGE 5 ---
5
Find min
/* Find min value node in the tree - Return the current node 
that minimum */ 
def _min_value_node(self, node):
current = node
while current.left is not None:
current = current.left
return current

What else to find the max value?
```

#### Extract: `conductor/extracted/ปี67_Lecture_5.2_Binary_Search_Tree_Remove_Example_for_Binary_Search_Tree_remove_2_std.pdf.txt`
```text
--- PAGE 1 ---
Example for Binary Search Tree: Remove (2), two 
children. 
For example 5.3: if there is the exist BinarySearchTree's 
instance variable name bst contains the elements as 
the image following: 
 
Write the steps for the _delete_recursive() function 
when remove 2 from the instance variable bst. In each 
round,consists of 
1) what are the values of the parameters value and 
current_node of the _delete_recursive() function, and 
2) what statements are executed under the if-else 
condition that is checked as true. 
Each iteration must write 2 things.

--- PAGE 2 ---
Answer: 
 
 
 
 
 
 
 
 
 
 
 
 
 
Each iteration for the _delete_recursive() function 
when remove 2 
First round value = 2 , current_node = 
current_node.left = 
_delete_recursive(current_node.left, value) 
 
 
 
 
 
 
 
 
 
round 2: value = 2 , current_node = 
temp_node = 
 
 
 
 
 
 
6 
2 
5 
3 
5

--- PAGE 3 ---
Each iteration for the _min_value_node () function to 
find minimum of right subtree 
First round current_node = 
 
_min_value_node(self, node): 
 current = node 
 while current.left is not None: 
 current = current.left 
 return current 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
5 
5 
3 
3

--- PAGE 4 ---
round 3: value = , current_node = 
 
 
 
 
round 4: value = , current_node = 
 
 
 
 
 
 
 
 
 
 
5 
3 
3 
4 
4
```
