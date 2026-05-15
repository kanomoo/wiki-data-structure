---
type: concept
tags: [stack, postfix, expression-evaluation, parsing]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 4 Stack/Postfix Expression.pdf]
---

# Postfix Logic (RPN)

## Summary
**Postfix notation**, also known as **Reverse Polish Notation (RPN)**, is a mathematical notation in which every operator follows all of its operands. It eliminates the need for parentheses and complex precedence rules required by **Infix notation** (e.g., $a + b$).

## Implementation Details

### 1. Evaluating Postfix Expressions
Using a **Stack**, evaluation is straightforward and highly efficient for machines:
1. Iterate through the expression from left to right.
2. If the token is a **Number**: Push it onto the stack.
3. If the token is an **Operator**:
    - Pop the top two values ($op2$ then $op1$).
    - Apply the operator ($op1 \text{ operator } op2$).
    - Push the result back onto the stack.
4. Final Result: The value remaining in the stack is the final answer.

### 2. Infix to Postfix Conversion (Shunting-yard)
1. If token is an **Operand**: Append to Output.
2. If token is **'('**: Push to Stack.
3. If token is **')'**: Pop from Stack and append to Output until '(' is found. Pop '(' and discard.
4. If token is an **Operator**:
    - While Stack is not empty AND Stack Top is not '(' AND Stack Top Precedence $\ge$ Token Precedence:
        - Pop Stack to Output.
    - Push Token to Stack.
5. Pop remaining stack to Output.

### Python Evaluation Code
```python
def evaluate_postfix(expression):
    stack = []
    tokens = expression.split()
    
    for token in tokens:
        if token.isdigit():
            stack.append(int(token))
        else:
            op2 = stack.pop()
            op1 = stack.pop()
            if token == '+': stack.append(op1 + op2)
            elif token == '-': stack.append(op1 - op2)
            elif token == '*': stack.append(op1 * op2)
            elif token == '/': stack.append(op1 / op2)
            
    return stack.pop()
```

## Complexity Analysis
- **Evaluation**: $O(n)$ time, $O(n)$ space.
- **Conversion**: $O(n)$ time, $O(n)$ space.
- **Benefit**: Computers can process postfix expressions in a single pass without back-tracking or looking ahead for precedence.

## Related Pages
- [[stack|Stack Concept]]
- [[Lecture-4-Stack|Stack Lecture Notes]]
- [[Practice-Implementation-Guide|Expression Tree Practice]]
