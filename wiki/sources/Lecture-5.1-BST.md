---
type: source
tags: [bst, recursion, deletion]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 5.1 Binary Search Tree/Lecture 5.1add in method delete.pdf]
---

# Source: Lecture 5.1 BST

## Summary
Focuses on the **Binary Search Tree (BST)** ADT, specifically its property of sorted storage and the recursive logic for insertion and deletion.

## Implementation Details

### 1. BST Property
For every node $x$:
- All values in the **left subtree** are smaller than $x$.
- All values in the **right subtree** are larger than $x$.

### 2. Recursive Insertion
```python
def _insert_recursive(self, current_node, value):
    if value < current_node.value:
        if current_node.left is None:
            current_node.left = Node(value)
        else:
            self._insert_recursive(current_node.left, value)
    elif value > current_node.value:
        if current_node.right is None:
            current_node.right = Node(value)
        else:
            self._insert_recursive(current_node.right, value)
```

### 3. Node Deletion Algorithm
- **Case 1: Leaf Node**: Simply remove the node.
- **Case 2: One Child**: Link the parent directly to the child.
- **Case 3: Two Children**:
    1. Find the **minimum value node** in the right subtree (the successor).
    2. Replace the current node's value with the successor's value.
    3. Recursively delete the successor node from the right subtree.

## Complexity/Trade-offs
- **Search/Insert/Delete**:
    - **Average**: $O(\log n)$.
    - **Worst Case**: $O(n)$ (when the tree is a linked list).
- **Sorted Data**: An in-order traversal of a BST always yields sorted elements.

## Related Pages
- [[binary-search-tree|BST Concept Page]]
- [[bst-deletion-advanced|Advanced Deletion Details]]
- [[Assignment-2-Binary-Tree|BST Practice]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 5.1 Binary Search Tree/Lecture 5.1add in method delete.pdf|Lecture 5.1add in method delete.pdf]] (12 pages, 2799 extracted characters) -> `conductor/extracted/ปี67_Lecture_5.1_Binary_Search_Tree_Lecture_5.1add_in_method_delete.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 5.1 Binary Search Tree/removebst.pdf|removebst.pdf]] (2 pages, 3860 extracted characters) -> `conductor/extracted/ปี67_Lecture_5.1_Binary_Search_Tree_removebst.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 5.1 Binary Search Tree/For example Binary Search Tree std delete round 4 in insert_s step.pdf|For example Binary Search Tree std delete round 4 in insert_s step.pdf]] (5 pages, 2075 extracted characters) -> `conductor/extracted/ปี67_Lecture_5.1_Binary_Search_Tree_For_example_Binary_Search_Tree_std_delete_round_4_in_insert_s_step.pdf.txt`
- [[raw/Data structure/สำเนาของ For example Binary Search Tree std delete round 4 in insert_s step.pdf.png|สำเนาของ For example Binary Search Tree std delete round 4 in insert_s step.pdf.png]] visual source

### Deep Notes
- BST extends binary tree with the ordering invariant: values in the left subtree are less than the node, values in the right subtree are greater than the node. Search, insert, and delete all preserve this invariant.
- Insert is a guided descent from root to a missing child position. Compare at each node, move left/right, then attach the new node where the search fails.
- The remove handout introduces practical deletion mechanics. Leaf deletion is direct; one-child deletion bypasses the node; two-child deletion requires a replacement value from inorder successor or predecessor, then removal of that replacement node.
- Worked delete-round examples are especially important because the tree shape after each operation depends on the chosen successor/predecessor rule.
- Complexity is O(h), with h as tree height. Balanced trees approach O(log n); skewed trees degrade to O(n).

### Visual Source Checklist
- ![[raw/Data structure/สำเนาของ For example Binary Search Tree std delete round 4 in insert_s step.pdf.png|180]]

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_5.1_Binary_Search_Tree_Lecture_5.1add_in_method_delete.pdf.txt`
```text
--- PAGE 1 ---
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 5.1
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
TREES
Implementation of Trees
Tree Traversals
Binary Trees
The Search Tree ADT-Binary SearchTrees
AVL Trees

--- PAGE 3 ---
3
Binary Search Trees
Each node in tree stores an item
items are integers and distinct
when has no left or ritght child node, mean left 
or ritght point to None.
Properties
A binary tree
for each node x
values at left subtree are smaller
values at right subtree are larger 
than the value of x

--- PAGE 4 ---
4
Binary Search Trees
Which one of the trees below is binary search tree ?

--- PAGE 5 ---
5
Binary Search Trees
class Node:
def __init__(self, value):
self.value = value
self.left = None
self.right = None
class BinarySearchTree:
def __init__(self):
self.root = None
def insert(self, value):
if self.root is None:
self.root = Node(value)
else:
self._insert_recursive(self.root, value)

--- PAGE 6 ---
6
insert into a binary search tree

--- PAGE 7 ---
7
insert into a binary search tree
def _insert_recursive(self, current_node, value):
if value < current_node.value:
if current_node.left is None:
current_node.left = Node(value)
else:
self._insert_recursive(current_node.left, value)
elif value > current_node.value:
if current_node.right is None:
current_node.right = Node(value)
else:
self._insert_recursive(current_node.right, value)
else:
pass

--- PAGE 8 ---
8
insert into a binary search tree
We write recursive function.
Follow the definition as we learned with Tree.
the single underscore function like as 
_insert_recursive() mean this function is used 
internal in class, we will not write this single 
underscore function at main program. 
we interested in the steps in each round or 
each iteration ,what statements are executed
under the if-else condition that is checked as 
true.

--- PAGE 9 ---
9
Remove from a binary search 
tree
When the node has one child. (4)

--- PAGE 10 ---
10
Remove from a binary search 
tree
When the node has two children. (2)

--- PAGE 11 ---
11
Remove from a binary search 
tree 
def delete(self, value):
self.root = self._delete_recursive(self.root, value)
def _delete_recursive(self, current_node, value):
if current_node is None:
return current_node 
if value < current_node.value:
current_node.left
self._delete_recursive(current_node.left, value)

--- PAGE 12 ---
12
elif value > current_node.value:
current_node.right = 
self._delete_recursive(current_node.right, value)
else:
if current_node.left is None:
return current_node.right
elif current_node.right is None:
return current_node.left
temp_node = self._min_value_node(current_node.right)
current_node.value = temp_node.value
current_node.right = 
self._delete_recursive(current_node.right, 
temp_node.value)
return current_node
```

#### Extract: `conductor/extracted/ปี67_Lecture_5.1_Binary_Search_Tree_removebst.pdf.txt`
```text
--- PAGE 1 ---
139
6
2
8
1
4
3
6
2
8
1
4
3
Figure 4.24 Deletion of a node (4) with one child, before and after
4.3
 
The
 
Search
 
Tree
 
ADT—Binary
 
Search
 
Trees
4.3.4
 
remove
As
 
is
 
common
 
with
 
many
 
data
 
structures,
 
the
 
hardest
 
operation
 
is
 
deletion.
 
Once
 
we
 
have
found
 
the
 
node
 
to
 
be
 
deleted,
 
we
 
need
 
to
 
consider
 
several
 
possibilities.
 
 
If
 
the
 
node
 
is
 
a
 
leaf,
 
it
 
can
 
be
 
deleted
 
immediately.
 
If
 
the
 
node
 
has
 
one
 
child,
 
the
 
node
can
 
be
 
deleted
 
after
 
its
 
parent
 
adjusts
 
a
 
link
 
to
 
bypass
 
the
 
node
 
(we
 
will
 
draw
 
the
 
link
directions
 
explicitly
 
for
 
clarity).
 
See
 
Figure
 
4.24.
 
 
The
 
complicated
 
case
 
deals
 
with
 
a
 
node
 
with
 
two
 
children.
 
The
 
general
 
strategy
 
is
 
to
replace
 
the
 
data
 
of
 
this
 
node
 
with
 
the
 
smallest
 
data
 
of
 
the
 
right
 
subtree
 
(which
 
is
 
easily
found)
 
and
 
recursively
 
delete
 
that
 
node
 
(which
 
is
 
now
 
empty).
 
Because
 
the
 
smallest
 
node
in
 
the
 
right
 
subtree
 
cannot
 
have
 
a
 
left
 
child,
 
the
 
second
 
remove
 
is
 
an
 
easy
 
one.
 
Figure
 
4.25
shows
 
an
 
initial
 
tree
 
and
 
the
 
result
 
of
 
a
 
deletion.
 
The
 
node
 
to
 
be
 
deleted
 
is
 
the
 
left
 
child
 
of
the
 
root;
 
the
 
key
 
value
 
is
 
2.
 
It
 
is
 
replaced
 
with
 
the
 
smallest
 
data
 
in
 
its
 
right
 
subtree
 
(3),
 
and
then
 
that
 
node
 
is
 
deleted
 
as
 
before.
 
 
The
 
code
 
in
 
Figure
 
4.26
 
performs
 
deletion.
 
It
 
is
 
inefﬁcient
 
because
 
it
 
makes
 
two
 
passes
down
 
the
 
tree
 
to
 
ﬁnd
 
and
 
delete
 
the
 
smallest
 
node
 
in
 
the
 
right
 
subtree
 
when
 
this
 
is
 
appro-
priate.
 
It
 
is
 
easy
 
to
 
remove
 
this
 
inefﬁciency
 
by
 
writing
 
a
 
special
 
removeMin
 
method,
 
and
 
we
have
 
left
 
it
 
in
 
only
 
for
 
simplicity.
 
 
If
 
the
 
number
 
of
 
deletions
 
is
 
expected
 
to
 
be
 
small,
 
then
 
a
 
popular
 
strategy
 
to
 
use
 
is 
lazy
 
deletion:
 
When
 
an
 
element
 
is
 
to
 
be
 
deleted,
 
it
 
is
 
left
 
in
 
the
 
tree
 
and
 
merely
 
marked 
as
 
being
 
deleted.
 
This
 
is
 
especially
 
popular
 
if
 
duplicate
 
items
 
are
 
present,
 
because
 
then
 
the 
data
 
member
 
that
 
keeps
 
count
 
of
 
the
 
frequency
 
of
 
appearance
 
can
 
be
 
decremented.
 
If
 
the 
number
 
of
 
real
 
nodes
 
in
 
the
 
tree
 
is
 
the
 
same
 
as
 
the
 
number
 
of
 
“deleted”
 
nodes,
 
then
 
the 
depth
 
of
 
the
 
tree
 
is
 
only
 
expected
 
to
 
go
 
up
 
by
 
a
 
small
 
constant
 
(why?),
 
so
 
there
 
is
 
a
 
very 
small
 
time
 
penalty
 
associated
 
with
 
lazy
 
deletion.
 
Also,
 
if
 
a
 
deleted
 
item
 
is
 
reinserted,
 
the 
overhead
 
of
 
allocating
 
a
 
new
 
cell
 
is
 
avoided.

--- PAGE 2 ---
140
Trees
Chapter 4
6
2
8
1
5
3
 4
6
3
8
1
5
3
4
Figure
 
4.25
 
Deletion
 
of
 
a
 
node
 
(2)
 
with
 
two
 
children,
 
before
 
and
 
after
 
 
def
 
delete(self,
 
value):
 
 
self.root
 
=
 
self._delete_recursive(self.root,
 
value)
 
 
def _delete_recursive(self,
 
current_node,
 
value):
 
 
if
 
current_node
 
is
 
None:
 
 
 
return
 
current_node
 if value < current_node.value:
 current_node.left = self._delete_recursive(current_node.left, value)
 elif value > current_node.value:
 current_node.right = self._delete_recursive(current_node.right, value) 
 
 
else:
 
 
 
if
 
current_node.left
 
is
 
None:
 
 
 
return
 
current_node.right
 
 
 
elif
 
current_node.right
 
is
 
None:
 
 
 
return
 
current_node.left
 temp_node = self._min_value_node(current_node.right)
 current_node.value = temp_node.value
 current_node.right = self._delete_recursive(current_node.right, temp_node.value)
 return current_node
Figure
 
4.26
 
Deletion
 
routine
 
for
 
binary
 
search
 
trees
```

#### Extract: `conductor/extracted/ปี67_Lecture_5.1_Binary_Search_Tree_For_example_Binary_Search_Tree_std_delete_round_4_in_insert_s_step.pdf.txt`
```text
--- PAGE 1 ---
Example for Binary Search Tree: Insert 
For example 5.1: if there is the exist BinarySearchTree's 
instance variable name bst contains the numbers [1, 2, 3, 
4, 6, 8] (In-order traversal) as the image following: 
 
Write the steps for the _insert_recursive() function when 
insert 5 into the instance variable bst. In each 
round,consists of 
1) what are the values of the parameters value and 
current_node of the _insert_recursive() function, and 
2) what statements are executed under the if-else 
condition that is checked as true. 
Each iteration must write 2 things.

--- PAGE 2 ---
in main program 
bst = BinarySearchTree() 
... 
bst.insert(5) 
 
Answer: 
Each iteration for the _insert_recursive() function when 
insert 5 
First round value = 5 , current_node = 
_insert_recursive(current_node.left, value) 
 
 
 
 
 
 
 
 
 
 
 
round 2: value = 5 , current_node = 
 
round 3: value = 5 , current_node = 
 
 
6 
2 
4

--- PAGE 3 ---
round 4: value = 5 , current_node = None 
if current_node.right is None: is True 
 current_node.right = Node(value)

--- PAGE 4 ---
Example for Binary Search Tree: Remove (4), one child. 
For example 5.2: if there is the exist BinarySearchTree's 
instance variable name bst contains the numbers [1, 2, 3, 
4, 6, 8] (In-order traversal) as the image following: 
 
Write the steps for the _delete_recursive() function when 
remove 4 from the instance variable bst. In each 
round,consists of 
1) what are the values of the parameters value and 
current_node of the _delete_recursive() function, and 
2) what statements are executed under the if-else 
condition that is checked as true. 
Each iteration must write 2 things.

--- PAGE 5 ---
Answer: 
 
Each iteration for the _delete_recursive() function when 
remove 4 
First round value = 4 , current_node = 
current_node.left = 
_delete_recursive(current_node.left, value) 
 
 
 
 
 
 
 
 
 
round 2: value = 4 , current_node = 
current_node.right = 
 
round 3: value = 4 , current_node = 
elif current_node.right is None: is True 
 return current_node.left 
 
 
6 
2 
4
```
