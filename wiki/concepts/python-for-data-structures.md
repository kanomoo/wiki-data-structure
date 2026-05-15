---
type: concept
tags: [python, oop, basics]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 2 Review Python/Lecture 2 Review Python.pdf]
---

# Concept: Python for Data Structures

Review of Python's essential features for implementing data structures, focusing on Functions and Object-Oriented Programming (OOP).

## 1. Functions
A function is a named group of statements performing a specific task.
- **Syntax**: `def function_name(params):`
- **Example**: BMI calculator.

## 2. Object-Oriented Programming (OOP)
Classes allow us to bundle data and operations together, which is the foundation of building custom data structures (like Nodes, Trees, or Graphs).

### Core Components
- **Data Members**: Attributes used to store data.
- **Methods**: Operations that can be performed on the data.
- **Constructor (`__init__`)**: The initialization method called when an object is created.
- **`self`**: A reference to the current instance of the class. Must be the first parameter in methods.

### Example: Point Class
```python
class Point:
    def __init__(self, x_input, y_input):
        self.x = x_input # Data member
        self.y = y_input # Data member
        
    def show(self):
        print(self.x, ',', self.y)

# Creating an object (Instance)
myPoint = Point(3, 7)
myPoint.show()
```

## Significance for Data Structures
We use Classes to create:
- **Node objects** (for Linked Lists and Trees).
- **Structure objects** (to manage pointers and logic).

## Detailed Concept Expansion

Python is the implementation language that turns the abstract structures in this wiki into concrete classes, lists, pointers, and method calls. The important habit is to separate the ADT contract from the Python representation: a Stack promises push/pop/top behavior, while its implementation may be a list or a linked list.

### Mental Model
- Treat every data structure as a small object with state plus methods.
- State stores the representation: list array, node chain, heap array, graph adjacency list, distance table.
- Methods protect the invariants: no underflow, no broken links, no heap-order violation, no invalid queue wraparound.
- Python lists are dynamic arrays, so append/pop-at-end are efficient, but inserting/removing at the front shifts elements.

### Invariants and Rules
- Keep representation private enough that methods can guard it.
- Empty states must be explicit: None for missing nodes, empty list for empty stack, size 0 for queues/heaps.
- Every method that mutates state should leave the object ready for the next method call.
- Classroom code should print or return clear underflow/overflow behavior where the prompt expects it.

### Implementation Patterns
- Use classes when the structure has persistent state: Stack.items, LinkedList.head, CircularQueue.front/rear/size.
- Prefer explicit guard methods such as is_empty, is_full, and size because they make test cases and edge cases visible.
- Use None for missing child/next pointers.
- For recursive tree code, return a node/subtree reference so parent calls can reconnect correctly.
- For graph algorithms, use dictionaries/lists of neighbors and keep algorithm tables separate from the graph representation.

### Complexity and Trade-offs
Python syntax can hide costs. append and pop at the end are O(1) amortized, but pop(0) is O(n). List slicing copies data, so recursive examples using slices are clearer but can add extra O(n) work.

### Practice and Exam Checklist
- Before coding, write the invariant in one sentence.
- Test empty, one-item, normal, and boundary/full cases.
- Trace values of indexes/pointers after every mutation.
- In exams, mention both the ADT operation and the Python cost.

### Source Connections
- [[Lecture-2-Review-Python|Lecture 2 Review Python]]
- [[Lecture-4-Stack|Lecture 4 Stack]]
- [[Test-Program-1-Queue|Test Program 1 Queue]]
