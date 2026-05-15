---
type: source
tags: [linear, lifo, python]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 4 Stack/Lecture 4 Stack.pdf, raw/Data structure/ปี67/Lecture 4 Stack/Postfix Expression.pdf]
---

# Source: Lecture 4 Stack

## Summary
A comprehensive lecture covering the **Stack ADT**, its implementations in Python (List vs. Linked List), and its primary application in **Postfix Expression** evaluation and conversion.

## Implementation Details

### 1. Python List Implementation
The most common implementation uses a native Python list with a defined size limit to prevent overflow.

```python
class Stack:
    def __init__(self, limit = 10):
        self.items = []
        self.limit = limit
        
    def is_empty(self):
        return len(self.items) <= 0
        
    def push(self, item):
        if len(self.items) >= self.limit:
            print('Stack Overflow, Cannot push', item)
        else:
            self.items.append(item)
            
    def pop(self):
        if self.is_empty():
            print('Stack Underflow!')
            return None
        return self.items.pop()
        
    def top(self):
        if self.is_empty():
            return None
        return self.items[-1]
        
    def size(self):
        return len(self.items)
```

### 2. Postfix Evaluation Algorithm
1. Scan the postfix expression from left to right.
2. If the element is a **number**: Push it onto the stack.
3. If the element is an **operator**:
    - Pop the top two values from the stack (let them be $v_2$ and $v_1$).
    - Apply the operator ($v_1 \text{ op } v_2$).
    - Push the result back onto the stack.
4. The final value remaining on the stack is the result.

*Example*: `6 5 + 8 *`
- Push 6, Push 5
- Operator `+`: Pop 5, Pop 6 -> $6+5=11$. Push 11.
- Push 8
- Operator `*`: Pop 8, Pop 11 -> $11*8=88$. Push 88.
- Result: 88.

## Complexity/Trade-offs
- **Time Complexity**: All basic operations (`push`, `pop`, `top`, `is_empty`) take **$O(1)$** (constant time).
- **Space Complexity**: **$O(n)$** where $n$ is the number of elements in the stack.
- **List Implementation**: Simple and fast, but requires a pre-defined limit or dynamic resizing overhead.
- **Linked List Implementation**: Truly dynamic size, but has higher memory overhead per element due to pointer storage.

## Learning Materials
- [[stack|Stack Concept Page]]
- [[Practice-Implementation-Guide#Test-Program-1-Queue|Related: Queue Test]]
