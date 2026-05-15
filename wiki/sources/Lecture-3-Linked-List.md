---
type: source
tags: [linear, pointer, python]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 3 Linked List/Lecture 3 Linked List.pdf]
---

# Source: Lecture 3 Linked List

## Summary
In-depth lecture on the **List ADT** and its implementation using pointers (Linked List) vs. contiguous memory (Arrays).

## Implementation Details

### 1. Node Class
A basic building block containing data and a reference to the next node.

```python
class Node:
    def __init__(self, init_data):
        self.data = init_data
        self.next = None
        
    def get_data(self):
        return self.data
        
    def get_next(self):
        return self.next
        
    def set_next(self, new_next):
        self.next = new_next
```

### 2. LinkedList Class (Singly)
Manages the series of nodes starting from a `head`.

```python
class LinkedList:
    def __init__(self):
        self.head = None
        
    def is_empty(self):
        return self.head == None
        
    def add(self, item):
        """Adds a new item to the HEAD of the list (O(1))."""
        temp = Node(item)
        temp.set_next(self.head)
        self.head = temp
        
    def remove(self, item):
        """Finds and removes an item, relinking the previous node."""
        current = self.head
        previous = None
        found = False
        while not found and current != None:
            if current.get_data() == item:
                found = True
            else:
                previous = current
                current = current.get_next()
        
        if found:
            if previous == None:
                self.head = current.get_next()
            else:
                previous.set_next(current.get_next())
```

## Complexity/Trade-offs

| Operation | Array-based List | Linked List |
|-----------|------------------|-------------|
| **Access (k-th)** | $O(1)$ | $O(n)$ |
| **Insert/Delete (Head)** | $O(n)$ (shift needed) | $O(1)$ |
| **Insert/Delete (Tail)** | $O(1)$ (if capacity) | $O(n)$ (unless has tail pointer) |
| **Search** | $O(n)$ (unsorted) | $O(n)$ |
| **Memory** | Contiguous, Fixed size | Scattered, Dynamic |

## Related Pages
- [[linked-list|Linked List Concept Page]]
- [[Assignment-1-Linked-List|Practice Assignment 1]]
- [[Practice-Implementation-Guide|Implementation Guide]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 3 Linked List/Lecture 3 Linked List.pdf|Lecture 3 Linked List.pdf]] (30 pages, 6312 extracted characters) -> `conductor/extracted/ปี67_Lecture_3_Linked_List_Lecture_3_Linked_List.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 3 Linked List/For example.pdf|For example.pdf]] (2 pages, 1112 extracted characters) -> `conductor/extracted/ปี67_Lecture_3_Linked_List_For_example.pdf.txt`
- [[raw/Data structure/สำเนาของ  3.pdf|สำเนาของ  3.pdf]] (30 pages, 6312 extracted characters) -> `conductor/extracted/สำเนาของ_3.pdf.txt`
- [[raw/Data structure/สำเนาของ โจทย์ลองทำบทที่4.pdf|สำเนาของ โจทย์ลองทำบทที่4.pdf]] (2 pages, 1112 extracted characters) -> `conductor/extracted/สำเนาของ_โจทย์ลองทำบทที่4.pdf.txt`

### Deep Notes
- The linked-list lecture focuses on pointer-based list representation: each node owns data and a reference to the next node. The list object mainly protects the `head` reference and performs traversal.
- Core invariant: every mutating operation must leave the chain connected. `add` changes the head; `remove` must remember both `current` and `previous`; search walks node-by-node until it finds a target or reaches `None`.
- The example PDFs reinforce manual pointer tracing. When solving by hand, draw `head`, `current`, and `previous`, then update one pointer at a time. Most mistakes come from losing the rest of the chain before relinking.
- Complexity pattern: linked list makes insertion/removal at a known node cheap, but indexed access/search is linear because there is no random access.
- `สำเนาของ 3.pdf` is a root-level copy of the linked-list lecture and is included here as duplicate source coverage.

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_3_Linked_List_Lecture_3_Linked_List.pdf.txt`
```text
--- PAGE 1 ---
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 3
Pradit Pitaksathienkul

--- PAGE 2 ---
2
The missing of last exercise
Python use tab or space to identify
a group of statements.
def Function(n):
i = s = 1
while s < n:
i = i+1
s = s+i
print("*")
def Function(n):
i = s = 1
while s < n:
i = i+1
s = s+i
print("*")
It is different !!!

--- PAGE 3 ---
3
Where is the main program?
The main program or main function is
at the last where out of block of function 
or class definition.
def Function(n):
i = s = 1
while s < n:
i = i+1
s = s+i
print("*")
Function(20)
main program

--- PAGE 4 ---
4
ROAD MAP
Abstract Data Types (ADT)
The List ADT
Implementation of Lists
List implementation of lists
Linked list implementation of lists

--- PAGE 5 ---
5
THE LIST ADT
Ordered sequence of data items called 
elements but not necessary Sorted.
A1, A2, A3, …,AN is a list of size N
size of an empty list is 0
Ai+1 succeeds Ai
Ai-1 preceeds Ai
position of Ai is i
first element is A1 called “head”
last element is AN called “tail”
Operations ?

--- PAGE 6 ---
6
THE LIST ADT
Operations
PrintList
Find
FindKth
Insert
Delete
Next
Previous
MakeEmpty

--- PAGE 7 ---
7
THE LIST ADT
Example:
the elements of a list are
34, 12, 52, 16, 15
Find (12) Found
Insert (20, 3) 34, 12, 52, 20, 16, 15
Delete (52) 34, 12, 20, 16, 15
FindKth (5) 15

--- PAGE 8 ---
8
Special case in implementation
May be special cases we must careful 
when implementation.
Example:
the elements of a list are
34, 12, 52, 16, 15
Find (22) ?
Insert (20, 10) 34, 12, 52, 16, 15 ?
Delete (60) 34, 12, 52, 16, 15 ?
FindKth (10) ?

--- PAGE 9 ---
9
Implementation of Lists
Many Implementations
List (It is one of data type in Python)
Linked List

--- PAGE 10 ---
10
ROAD MAP
Abstract Data Types (ADT)
The List ADT
Implementation of Lists
List implementation of lists
Linked list implementation of lists

--- PAGE 11 ---
11
List implementation of lists
List is a data type in Python. It is like 
array in any language.
List is a group of data which order in 
List is important.
It can has 0 to any data. 
When we create List ,we use [ ] .

--- PAGE 12 ---
12
List implementation of lists
Example:
list1 = ["apple", "banana", "cherry"]
list2 = [1, 5, 7, 9, 3]
print('list1 = ',list1)
print('list2 = ',list2)
list2[0] = 37
print('After changing, list2 = ',list2)
Result:
list1 = ['apple', 'banana', 'cherry']
list2 = [1, 5, 7, 9, 3]
After changing, list2 = [37, 5, 7, 9, 3]

--- PAGE 13 ---
13
Array Implementation of List ADT
Disadvantages :
insertion and deletion is very slow
need to move elements of the list
redundant memory space
it is difficult to estimate the size of array

--- PAGE 14 ---
14
ROAD MAP
Abstract Data Types (ADT)
The List ADT
Implementation of Lists
List implementation of lists
Linked list implementation of lists

--- PAGE 15 ---
15
Linked List Implementation of Lists
Series of nodes โหนด
not adjacent in memory
contain the element and a pointer to a node containing its 
successor
None นัน มีค่า เท่ากับ 0 ในทางคอมพิวเตอร์
Avoids the linear cost of insertion and deletion !
 A1
 A4
 A2
 A3
 A1 500
 A4 0
 A2 400
 A3 666
350
500
400
666

--- PAGE 16 ---
16
Linked List Implementation of Lists
Insertion into a linked list
 A2 400
 X
 A1 500
 A4 0
 A3 666
350
500
400
666
 A2 530
 X 400
 A1 500
 A4 0
 A3 666
350
500
400
666
530
530

--- PAGE 17 ---
17
Linked List Implementation of Lists
Deletion from a linked list
 A2 400
 A1 500
 A4 0
 A3 666
350
500
400
666
 A2 666
 A1 500
 A4 0
350
500
666

--- PAGE 18 ---
18
Linked List Implementation of Lists
Need to know where the first node is
the rest of the nodes can be accessed
No need to move the list for insertion 
and deletion operations
No memory waste

--- PAGE 19 ---
19
Programming Details
Example of LinkedList in Python
Each node is not adjacent in memory.

--- PAGE 20 ---
20
Define linked list node
class Node:
def __init__(self,init_data):
self.data = init_data
self.next = None
def get_data(self):
return self.data
def get_next(self):
return self.next
def set_data(self, new_data):
self.data = new_date
def set_next(self, new_next):
self.next = new_next
There are 2 data members in class Node 
data + next
There are 5 member functions in class Node

--- PAGE 21 ---
21
Class for linked lists
Example:in main program 
temp = Node(75)
print(temp.get_data())
Result:
75
Then we define Class LinkedList (Series of Nodes).
class LinkedList:
def __init__(self):
self.head = None
def is_empty(self):
return self.head == None
Example: in main program
mylist = LinkedList()

--- PAGE 22 ---
22
Add routine
def add(self,item):
temp = Node(item)
temp.set_next(self.head)
self.head = temp
Example: 
mylist.add(31)
mylist.add(76)

--- PAGE 23 ---
23
Search routine
def search(self,item):
current = self.head
found = False
while current != None and not found:
if current.get_data() == item:
found = True
else:
current = current.get_next()
return found
Example: If we’ve a Linked List with data as picture:
mylist.search(18)

--- PAGE 24 ---
24
Remove routine
def remove(self,item):
current = self.head
previous = None
found = False
while not found:
if current.get_data() == item:
found = True
else:
previous = current
current = current.get_next()
if previous == None:
self.head = current.get_next()
else:
previous.set_next(current.get_next())

--- PAGE 25 ---
25
Remove routine
Example: 
mylist.remove(18)

--- PAGE 26 ---
26
How to print linked lists
def getdata(self):
current = self.head
if current != None:
print(current.get_data(),end=' ')
current = current.get_next()
else:
print("LinkedList is Empty")
return
while current != None:
print(current.get_data())
current = current.get_next(),end=' '}

--- PAGE 27 ---
27
Insert by position
def insert(self,item,pos):
current = self.head
i = 0
previous = None
temp = Node(item)
for i in range(pos):
previous = current
current = current.get_next() 
temp.set_next(current)
previous.set_next(temp)

--- PAGE 28 ---
28
Insert by position
Example: 
mylist.insert(32,3)

--- PAGE 29 ---
29
Doubly Linked List
Traversing list backwards
not easy with regular lists
Insertion and deletion more pointer fixing
Deletion is easier
Previous node is easy to find
 A1
 A2
 A3

--- PAGE 30 ---
30
Circulary Linked List
Last node points the first
 A1
 A2
 A3
```

#### Extract: `conductor/extracted/ปี67_Lecture_3_Linked_List_For_example.pdf.txt`
```text
--- PAGE 1 ---
For example: if there is no list's instance variable before, 
write statements in main program to create the instance variable 
mylist with ordered inputs are 1, 2, 3, 4, 5 and has result outputs 
are 1, 2, 3, 4, 5 by using class LinkedList's methods that we 
learned. 
 
First of all, I suggest you to use pencil or pen to underline or circle 
the important parts of Question, ask yourself, 
1. What is the question want to do? 
2. What are inputs and what are outputs? 
 
The wrong solution is: 
mylist = LinkedList() 
mylist.add(1) 
mylist.add(2) 
mylist.add(3) 
mylist.add(4) 
mylist.add(5) 
 
Why is it wrong? 
 
 
The right solution is:

--- PAGE 2 ---
For example: if there is the exist list's instance variable mylist 
which has one input 3 already, 
write statements in main program to create the instance variable 
mylist with ordered inputs are 1, 2, 4, 5 and has result outputs are 
1, 2, 3, 4, 5 by using class LinkedList's methods that we learned. 
The solution is: 
mylist = LinkedList() x no need to create a new instance variable 
mylist.add(1) 
mylist.add(2) x not use add method
```

#### Extract: `conductor/extracted/สำเนาของ_3.pdf.txt`
```text
--- PAGE 1 ---
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 3
Pradit Pitaksathienkul

--- PAGE 2 ---
2
The missing of last exercise
Python use tab or space to identify
a group of statements.
def Function(n):
i = s = 1
while s < n:
i = i+1
s = s+i
print("*")
def Function(n):
i = s = 1
while s < n:
i = i+1
s = s+i
print("*")
It is different !!!

--- PAGE 3 ---
3
Where is the main program?
The main program or main function is
at the last where out of block of function 
or class definition.
def Function(n):
i = s = 1
while s < n:
i = i+1
s = s+i
print("*")
Function(20)
main program

--- PAGE 4 ---
4
ROAD MAP
Abstract Data Types (ADT)
The List ADT
Implementation of Lists
List implementation of lists
Linked list implementation of lists

--- PAGE 5 ---
5
THE LIST ADT
Ordered sequence of data items called 
elements but not necessary Sorted.
A1, A2, A3, …,AN is a list of size N
size of an empty list is 0
Ai+1 succeeds Ai
Ai-1 preceeds Ai
position of Ai is i
first element is A1 called “head”
last element is AN called “tail”
Operations ?

--- PAGE 6 ---
6
THE LIST ADT
Operations
PrintList
Find
FindKth
Insert
Delete
Next
Previous
MakeEmpty

--- PAGE 7 ---
7
THE LIST ADT
Example:
the elements of a list are
34, 12, 52, 16, 15
Find (12) Found
Insert (20, 3) 34, 12, 52, 20, 16, 15
Delete (52) 34, 12, 20, 16, 15
FindKth (5) 15

--- PAGE 8 ---
8
Special case in implementation
May be special cases we must careful 
when implementation.
Example:
the elements of a list are
34, 12, 52, 16, 15
Find (22) ?
Insert (20, 10) 34, 12, 52, 16, 15 ?
Delete (60) 34, 12, 52, 16, 15 ?
FindKth (10) ?

--- PAGE 9 ---
9
Implementation of Lists
Many Implementations
List (It is one of data type in Python)
Linked List

--- PAGE 10 ---
10
ROAD MAP
Abstract Data Types (ADT)
The List ADT
Implementation of Lists
List implementation of lists
Linked list implementation of lists

--- PAGE 11 ---
11
List implementation of lists
List is a data type in Python. It is like 
array in any language.
List is a group of data which order in 
List is important.
It can has 0 to any data. 
When we create List ,we use [ ] .

--- PAGE 12 ---
12
List implementation of lists
Example:
list1 = ["apple", "banana", "cherry"]
list2 = [1, 5, 7, 9, 3]
print('list1 = ',list1)
print('list2 = ',list2)
list2[0] = 37
print('After changing, list2 = ',list2)
Result:
list1 = ['apple', 'banana', 'cherry']
list2 = [1, 5, 7, 9, 3]
After changing, list2 = [37, 5, 7, 9, 3]

--- PAGE 13 ---
13
Array Implementation of List ADT
Disadvantages :
insertion and deletion is very slow
need to move elements of the list
redundant memory space
it is difficult to estimate the size of array

--- PAGE 14 ---
14
ROAD MAP
Abstract Data Types (ADT)
The List ADT
Implementation of Lists
List implementation of lists
Linked list implementation of lists

--- PAGE 15 ---
15
Linked List Implementation of Lists
Series of nodes โหนด
not adjacent in memory
contain the element and a pointer to a node containing its 
successor
None นัน มีค่า เท่ากับ 0 ในทางคอมพิวเตอร์
Avoids the linear cost of insertion and deletion !
 A1
 A4
 A2
 A3
 A1 500
 A4 0
 A2 400
 A3 666
350
500
400
666

--- PAGE 16 ---
16
Linked List Implementation of Lists
Insertion into a linked list
 A2 400
 X
 A1 500
 A4 0
 A3 666
350
500
400
666
 A2 530
 X 400
 A1 500
 A4 0
 A3 666
350
500
400
666
530
530

--- PAGE 17 ---
17
Linked List Implementation of Lists
Deletion from a linked list
 A2 400
 A1 500
 A4 0
 A3 666
350
500
400
666
 A2 666
 A1 500
 A4 0
350
500
666

--- PAGE 18 ---
18
Linked List Implementation of Lists
Need to know where the first node is
the rest of the nodes can be accessed
No need to move the list for insertion 
and deletion operations
No memory waste

--- PAGE 19 ---
19
Programming Details
Example of LinkedList in Python
Each node is not adjacent in memory.

--- PAGE 20 ---
20
Define linked list node
class Node:
def __init__(self,init_data):
self.data = init_data
self.next = None
def get_data(self):
return self.data
def get_next(self):
return self.next
def set_data(self, new_data):
self.data = new_date
def set_next(self, new_next):
self.next = new_next
There are 2 data members in class Node 
data + next
There are 5 member functions in class Node

--- PAGE 21 ---
21
Class for linked lists
Example:in main program 
temp = Node(75)
print(temp.get_data())
Result:
75
Then we define Class LinkedList (Series of Nodes).
class LinkedList:
def __init__(self):
self.head = None
def is_empty(self):
return self.head == None
Example: in main program
mylist = LinkedList()

--- PAGE 22 ---
22
Add routine
def add(self,item):
temp = Node(item)
temp.set_next(self.head)
self.head = temp
Example: 
mylist.add(31)
mylist.add(76)

--- PAGE 23 ---
23
Search routine
def search(self,item):
current = self.head
found = False
while current != None and not found:
if current.get_data() == item:
found = True
else:
current = current.get_next()
return found
Example: If we’ve a Linked List with data as picture:
mylist.search(18)

--- PAGE 24 ---
24
Remove routine
def remove(self,item):
current = self.head
previous = None
found = False
while not found:
if current.get_data() == item:
found = True
else:
previous = current
current = current.get_next()
if previous == None:
self.head = current.get_next()
else:
previous.set_next(current.get_next())

--- PAGE 25 ---
25
Remove routine
Example: 
mylist.remove(18)

--- PAGE 26 ---
26
How to print linked lists
def getdata(self):
current = self.head
if current != None:
print(current.get_data(),end=' ')
current = current.get_next()
else:
print("LinkedList is Empty")
return
while current != None:
print(current.get_data())
current = current.get_next(),end=' '}

--- PAGE 27 ---
27
Insert by position
def insert(self,item,pos):
current = self.head
i = 0
previous = None
temp = Node(item)
for i in range(pos):
previous = current
current = current.get_next() 
temp.set_next(current)
previous.set_next(temp)

--- PAGE 28 ---
28
Insert by position
Example: 
mylist.insert(32,3)

--- PAGE 29 ---
29
Doubly Linked List
Traversing list backwards
not easy with regular lists
Insertion and deletion more pointer fixing
Deletion is easier
Previous node is easy to find
 A1
 A2
 A3

--- PAGE 30 ---
30
Circulary Linked List
Last node points the first
 A1
 A2
 A3
```

#### Extract: `conductor/extracted/สำเนาของ_โจทย์ลองทำบทที่4.pdf.txt`
```text
--- PAGE 1 ---
For example: if there is no list's instance variable before, 
write statements in main program to create the instance variable 
mylist with ordered inputs are 1, 2, 3, 4, 5 and has result outputs 
are 1, 2, 3, 4, 5 by using class LinkedList's methods that we 
learned. 
 
First of all, I suggest you to use pencil or pen to underline or circle 
the important parts of Question, ask yourself, 
1. What is the question want to do? 
2. What are inputs and what are outputs? 
 
The wrong solution is: 
mylist = LinkedList() 
mylist.add(1) 
mylist.add(2) 
mylist.add(3) 
mylist.add(4) 
mylist.add(5) 
 
Why is it wrong? 
 
 
The right solution is:

--- PAGE 2 ---
For example: if there is the exist list's instance variable mylist 
which has one input 3 already, 
write statements in main program to create the instance variable 
mylist with ordered inputs are 1, 2, 4, 5 and has result outputs are 
1, 2, 3, 4, 5 by using class LinkedList's methods that we learned. 
The solution is: 
mylist = LinkedList() x no need to create a new instance variable 
mylist.add(1) 
mylist.add(2) x not use add method
```
