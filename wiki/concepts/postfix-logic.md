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

## Detailed Concept Expansion

Postfix logic removes ambiguity from arithmetic expressions by placing operators after operands. Because operands appear before the operator that consumes them, a stack can evaluate the expression in one left-to-right pass.

### Mental Model
In infix, precedence and parentheses decide when operations happen. In postfix, order is already encoded. The stack holds values waiting for the next operator.

### Invariants and Rules
- Every binary operator must find at least two operands on the stack.
- After applying an operator, push exactly one result back.
- A valid complete postfix expression leaves exactly one value on the stack.
- For non-commutative operators, operand order matters: left op right, where right is popped first.

### Implementation Patterns
Evaluation algorithm: for each token, push operands; on operator, pop right then left, compute, push result. Conversion algorithm: output operands immediately; push operators; pop operators with higher/equal precedence before pushing a new operator; use parentheses to delay popping until matching close parenthesis.

### Complexity and Trade-offs
Evaluation is O(n) time and O(n) stack space. Infix-to-postfix conversion is also O(n) if each token is pushed and popped at most once.

### Practice and Exam Checklist
- Trace stack after every token, not just after every operator.
- Check invalid expressions: too few operands, too many operands, unmatched parentheses.
- For exponentiation, verify whether the course treats it as right-associative.
- Keep tokenization separate from stack logic in code.

### Source Connections
- [[Lecture-4-Stack|Lecture 4 Stack]]
- [[stack|Stack]]
- [[Practice-Implementation-Guide|Practice Implementation Guide]]
