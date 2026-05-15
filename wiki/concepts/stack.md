---
type: concept
tags: [data-structure, linear, lifo]
created: 2026-05-15
updated: 2026-05-16
sources: [Lecture-4-Stack]
---

# Concept: Stack

A **Stack** is a linear data structure that follows the **Last-In, First-Out (LIFO)** principle. It behaves like a physical stack of plates—the last item placed on top is the first one to be removed.

## Core Operations
- **Push**: Adds an element to the top of the stack.
- **Pop**: Removes and returns the top element.
- **Top/Peek**: Returns the top element without removing it.
- **isEmpty**: Checks if the stack has no elements.
- **isFull**: Checks if the stack has reached its maximum capacity (relevant for array-based implementations).

## Implementation Detail
Stacks can be implemented using two main approaches:
1. **Array/List Based**: Uses a contiguous block of memory. Fast access but usually has a fixed size (Static) or resizing overhead (Dynamic).
2. **Linked List Based**: Uses nodes with pointers. Dynamic size and efficient insertion/deletion at the head, but requires more memory for pointers.

### Special Cases (Errors)
- **Stack Overflow**: Attempting to `push` an item into a full stack.
- **Stack Underflow**: Attempting to `pop` or `top` from an empty stack.

## Application: Postfix Expressions
Stacks are crucial for expression parsing:
- **Infix to Postfix Conversion**: Using a stack to store operators based on precedence (PEMDAS).
- **Postfix Evaluation**: Using a stack to store operands and perform calculations as operators appear.

### Precedence Rules (PEMDAS)
1. **P**arentheses `()`
2. **E**xponents `**`
3. **M**ultiplication `*`, **D**ivision `/`, Modulo `%`
4. **A**ddition `+`, **S**ubtraction `-`

## Learning Materials
- **Lecture**: [[Lecture-4-Stack|Lecture 4 Stack]]
- **Deep Dive**: [[postfix-logic|Postfix Logic]]
- **Practice**: [[Test-Program-1-Queue|Queue & Stack Practice]]
- **Visual Example**: `raw/Data structure/ปี67/Lecture 4 Stack/For example Stack.pdf`

## Big O Analysis
| Operation | Complexity |
|-----------|------------|
| Push      | $O(1)$      |
| Pop       | $O(1)$      |
| Peek      | $O(1)$      |
| Search    | $O(n)$      |
