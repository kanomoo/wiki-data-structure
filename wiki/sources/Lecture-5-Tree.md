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

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 5 Tree/Lecture 5 Tree.pdf|Lecture 5 Tree.pdf]] (21 pages, 4122 extracted characters) -> `conductor/extracted/ปี67_Lecture_5_Tree_Lecture_5_Tree.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 5 Tree/For example Binary Tree.pdf|For example Binary Tree.pdf]] (3 pages, 663 extracted characters) -> `conductor/extracted/ปี67_Lecture_5_Tree_For_example_Binary_Tree.pdf.txt`
- [[raw/Data structure/สำเนาของ แบบฝึกหัดบท5.png|สำเนาของ แบบฝึกหัดบท5.png]] visual source

### Deep Notes
- Tree sources introduce hierarchical data: root, parent, child, sibling, leaf, subtree, height/depth, and binary tree constraints.
- Binary tree traversal is the implementation core. Preorder visits root-left-right, inorder visits left-root-right, and postorder visits left-right-root. Every reconstruction or assignment question depends on recognizing these visit orders.
- Worked binary-tree examples should be used to practice drawing subtrees and tracing recursive calls. Recursive base case is an empty node/subtree; recursive step visits or builds left/right children.
- Complexity for traversals is O(n) time because every node is processed once; recursion depth is O(h), where h is tree height.

### Visual Source Checklist
- ![[raw/Data structure/สำเนาของ แบบฝึกหัดบท5.png|180]]

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_5_Tree_Lecture_5_Tree.pdf.txt`
```text
--- PAGE 1 ---
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 5
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
TREES
Definitions and Terminology
Implementation of Trees
Tree Traversals
Binary Trees
The Search Tree ADT-Binary Search Trees

--- PAGE 3 ---
3
TREES: Definition
Recursive Definition :
Tree is a collection of nodes
A tree can be empty
A tree contains zero or more subtrees T1, T2,… Tk
connected to a root node by edges

--- PAGE 4 ---
4
TREES: Terminology
Family Tree Terminology
child F is child of A 
parent A is the parent of F
each node is connected to a parent except the root
sibling nodes with same parents (K, L, M) 
leaf nodes with no children (P, Q)
Ancestor / Descendant

--- PAGE 5 ---
5
• Path : a sequence of nodes n1, n2, … nk, where ni is the 
parent of ni+1 1≤i<k , path from node A to node Q is ?
• Lenght : number of edges on the path (k-1)
• Depth : depth of ni is the lenght of unique path from the 
root to ni
– depth of root is 0 , depth of node F is 1, depth of node M is 2
– depth of a tree = depth of the deepest leaf
• Height : height of ni is the lenght of the longest path from 
ni to a leaf
– height of a leaf is 0 , height of node E is 2, height of node A is 3
– height of a tree = height of the root = depth of the tree

--- PAGE 6 ---
6
Implementation of Trees 
1. Each node contains a pointer to each of its children

number of children would be large
2. Each node contains an array of pointers to its children

number of children may vary greatly (waste of 
space)

--- PAGE 7 ---
7
Implementation of Trees
3. Each node contains a linked list of the children
class Node:
def __init__(self, value):
self.value = value
self.firstChild = None
self.nextSibling = None

--- PAGE 8 ---
8
ROAD MAP
TREES
Implementation of Trees
Tree Traversals
Binary Trees
The Search Tree ADT-Binary Search Trees

--- PAGE 9 ---
9
Tree Traversals
Pre Order:
root
left right
In Order:
left
root right 
Post Order:
left
right root

--- PAGE 10 ---
10
ROAD MAP
TREES
Implementation of Trees
Tree Traversals
Binary Trees
The Search Tree ADT-Binary Search Trees

--- PAGE 11 ---
11
Binary Trees
Definition : A tree in which nodes have at 
most two children 
Generic Binary Tree

--- PAGE 12 ---
12
Binary Trees
Binary Tree 
Worst case binary tree

--- PAGE 13 ---
13
Implementation of Binary Trees
keep a pointer to left child and right 
child
class Node:
def __init__(self, value):
self.value = value
self.left = None
self.right = None

--- PAGE 14 ---
14
Example: Expression Trees
Leaves contain operands
Internal nodes contain operators
Inorder traversal => infix expression
Preorder traversal => prefix expression
Postorder traversal => postfix expression

--- PAGE 15 ---
15
Expression Trees
Entire tree represents (a+(b*c))+(((d*e)+f)*g)
Left subtree represents a+(b*c)
Right subtree represents ((d*e)+f)*g

--- PAGE 16 ---
16
Constructing an Expression Tree
Algorithm to convert a postfix expresion 
into an expression tree
read the expression one symbol at a time.
if the symbol is operand
create a one-node tree
push the tree onto a stack
if the symbol is operator
pop two trees T1 and T2 from the stack
form a new tree whose root is the operator and whose 
left and right subtrees are T2 and T1 respectively ตามล าดับ
This new tree is pushed onto the stack

--- PAGE 17 ---
17
Example:
input is ab+cde+**
First two symbols are 
operands
create one-node trees
push pointers to them onto a 
stack
Next + is read
pointers to trees are poped
a new tree is formed
a pointer to it is pushed onto 
the stack
[0]
[1]
[2]
[3]
[4]

--- PAGE 18 ---
18
Example:
input is ab+cde+**
c, d, e are read
for each a one-node tree 
is created
A pointer to the 
corresponding tree is 
pushed onto the stack.

--- PAGE 19 ---
19
Example:
input is ab+cde+**
+ is read
two trees are merged

--- PAGE 20 ---
20
Example:
input is ab+cde+**
* is read
pop two tree pointers 
and form a new tree 
with a * as root

--- PAGE 21 ---
21
Example:
input is ab+cde+**
Last symbol is read
two trees are merged
a pointer to the final tree is left on the stack
```

#### Extract: `conductor/extracted/ปี67_Lecture_5_Tree_For_example_Binary_Tree.pdf.txt`
```text
--- PAGE 1 ---
Write the path from node A to node Q A, E, J, Q 
Write the path from node Q to node A

--- PAGE 2 ---
Pre Order: root left right 
In Order: left root right 
Post Order: left right root 
 
 
 
 
 
 
 
 
 
Pre Order : 
In Order : 
Post Order : 
 
 
 
 
 
 
 
 
10 
3 
19 
15 
24 
8 
5

--- PAGE 3 ---
For example 1: Construct a binary tree by using pre-order 
and in-order sequences given below. Write the output in 
post-order traversal. 
In-order: 1, 6, 8, 7 
Pre-order: 1, 6, 7, 8 
Explanation: The tree will look like this: 
 
Output is : ? 
For example 2: 
Create an Expression Tree from the following infix 
Expression. 
(a+(b*c))+(((d*e)+f)*g)
```
