---
type: concept
tags: [python, oop, basics]
created: 2026-05-15
updated: 2026-05-15
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
