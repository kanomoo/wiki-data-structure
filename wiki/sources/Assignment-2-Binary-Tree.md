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

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Assignment 2 Construct Binary Tree/Assign 2 Binary Tree.pdf|Assign 2 Binary Tree.pdf]] (2 pages, 963 extracted characters) -> `conductor/extracted/ปี67_Assignment_2_Construct_Binary_Tree_Assign_2_Binary_Tree.pdf.txt`
- [[raw/Data structure/ปี67/Assignment 2 Construct Binary Tree/work/Screenshot 2026-02-15 172409.png|Screenshot 2026-02-15 172409.png]] visual source
- [[raw/Data structure/ปี67/Assignment 2 Construct Binary Tree/work/Screenshot 2026-02-15 172428.png|Screenshot 2026-02-15 172428.png]] visual source
- [[raw/Data structure/สำเนาของ Assign 2 Binary Tree.pdf.png|สำเนาของ Assign 2 Binary Tree.pdf.png]] visual source

### Deep Notes
- The assignment asks students to reconstruct a binary tree from traversal data, commonly inorder plus postorder, then output preorder.
- Reconstruction rule: postorder last element is root; root position in inorder splits left and right subtrees. Recurse on each side.
- If student ID digits repeat, reconstruction can become ambiguous unless the problem supplies a deterministic duplicate-handling rule. Note this explicitly when documenting solutions.
- Work screenshots are included as evidence of hand-solving steps and should be used to verify intermediate tree shapes.

### Visual Source Checklist
- ![[raw/Data structure/ปี67/Assignment 2 Construct Binary Tree/work/Screenshot 2026-02-15 172409.png|180]]
- ![[raw/Data structure/ปี67/Assignment 2 Construct Binary Tree/work/Screenshot 2026-02-15 172428.png|180]]
- ![[raw/Data structure/สำเนาของ Assign 2 Binary Tree.pdf.png|180]]

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Assignment_2_Construct_Binary_Tree_Assign_2_Binary_Tree.pdf.txt`
```text
--- PAGE 1 ---
Assign 2: Construct Binary Tree 
Construct a binary tree by using the last 5 digits of your 
student’s id as the post-order sequence include repeating 
numbers and zeros. Create the in-order sequence by 
move the last digit to the second digit and swap the 
fourth and fifth digits at the end. 
Write the output in pre-order traversal. 
 
For Example: if student's id is 6706021 632032 
then the last 6 digits are 32032 
So the post-order sequence is 3, 2, 0, 3, 2 
The in-order sequence is 3, 2, 2 , 3, 0 
Hint 1: Root node of tree is the last visiting node in Post-
order traversal. Thus, Root Node = 2. 
Hint 2: With the in-order sequence, we can construct 
binary tree from hint1 
 
 
 
 
 
 
3, 2 , 2, 3, 0 
 
The second last node in post-order traversal is 3. Thus, 
node 2 becomes left child of node 3 and node 0 becomes 
right child of node 3. Thus, the final tree is 
 
3 
2, 3 , 0

--- PAGE 2 ---
Result: 
 
Output is : ? 
 
3 
2 
3 
2 
0
```
