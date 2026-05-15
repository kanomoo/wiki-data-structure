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

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 4 Stack/Lecture 4 Stack.pdf|Lecture 4 Stack.pdf]] (16 pages, 3425 extracted characters) -> `conductor/extracted/ปี67_Lecture_4_Stack_Lecture_4_Stack.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 4 Stack/For example Stack.pdf|For example Stack.pdf]] (2 pages, 992 extracted characters) -> `conductor/extracted/ปี67_Lecture_4_Stack_For_example_Stack.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 4 Stack/Postfix Expression.pdf|Postfix Expression.pdf]] (4 pages, 2276 extracted characters) -> `conductor/extracted/ปี67_Lecture_4_Stack_Postfix_Expression.pdf.txt`
- [[raw/Data structure/ปี67/Lecture 4 Stack/postfix.pdf|postfix.pdf]] (6 pages, 9381 extracted characters) -> `conductor/extracted/ปี67_Lecture_4_Stack_postfix.pdf.txt`
- [[raw/Data structure/สำเนาของ 4.pdf|สำเนาของ 4.pdf]] (16 pages, 3425 extracted characters) -> `conductor/extracted/สำเนาของ_4.pdf.txt`
- [[raw/Data structure/สำเนาของ แบบฝึกหัดบท4.pdf|สำเนาของ แบบฝึกหัดบท4.pdf]] (2 pages, 992 extracted characters) -> `conductor/extracted/สำเนาของ_แบบฝึกหัดบท4.pdf.txt`
- [[raw/Data structure/สำเนาของ วิธีการทำตามระดับให้ดูคู่กับชีทบท4.pdf|สำเนาของ วิธีการทำตามระดับให้ดูคู่กับชีทบท4.pdf]] (6 pages, 9381 extracted characters) -> `conductor/extracted/สำเนาของ_วิธีการทำตามระดับให้ดูคู่กับชีทบท4.pdf.txt`
- [[raw/Data structure/สำเนาของ แบบฝึกหัด4.1.png|สำเนาของ แบบฝึกหัด4.1.png]] visual source

### Deep Notes
- Stack is the LIFO structure used for temporary reversal, nested delimiter checking, postfix evaluation, and expression conversion. The sources include both class implementation and worked postfix examples.
- Implementation invariant: only the top of stack is accessible. `push` appends, `pop` removes the newest item, `top/peek` reads without removal, and `is_empty` guards underflow.
- Balanced-symbol algorithm: scan left-to-right, push opening symbols, pop on closing symbols, and require the popped opener to match the closer. End with an empty stack. This is linear and one-pass.
- Postfix evaluation: numbers are pushed; operators pop right operand first, then left operand, compute `left op right`, and push the result. Operand order is a common exam trap for subtraction/division.
- Infix-to-postfix logic uses precedence and parentheses: operands output immediately; operators wait on the stack until precedence/parenthesis rules allow them to move to output.
- Root copies and exercise files are integrated here because they repeat or extend Lecture 4 stack/postfix practice.

### Visual Source Checklist
- ![[raw/Data structure/สำเนาของ แบบฝึกหัด4.1.png|180]]

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_4_Stack_Lecture_4_Stack.pdf.txt`
```text
--- PAGE 1 ---
1
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 4
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
Abstract Data Types (ADT)
The List ADT
List implementation of lists
Linked list implementation of lists
The Stack ADT
Linked list implementation of stacks
List implementation of stacks
The Queue ADT
Link list implementation of queues
List implementation of queues

--- PAGE 3 ---
3
THE STACK ADT
A stack is a list
Insertions and deletions from one end (top)
LIFO (Last In Fist Out)
Operations:
Push
Pop
Top
isEmpty
isFull

--- PAGE 4 ---
4
THE STACK ADT
Only the top element is accessible !

--- PAGE 5 ---
5
Implementation of Stacks
1. Linked List Implementation

insert / delete at the end of the list

performs “push” by inserting

performs “pop” by deleting

all operations take constant time

--- PAGE 6 ---
6
ROAD MAP
Abstract Data Types (ADT)
The List ADT
List implementation of lists
Linked list implementation of lists
The Stack ADT
Linked list implementation of stacks
List implementation of stacks
The Queue ADT
Link list implementation of queues
List implementation of queues

--- PAGE 7 ---
7
Implementation of Stacks
2. List Implementation

more popular solution

need to declare the size

usually the max stack size is known

keep a list of Stack (in Python)

--- PAGE 8 ---
8
List Implementation of Stacks
Push use method append()
Pop use method pop()
Top find how many data in stack(len)
return data at position(len-1)

--- PAGE 9 ---
9
class Stack:
def __init__(self,limit = 10):
self.items = []
self.limit = limit
def is_empty(self):
return len(self.items) <= 0
def push(self, item):
self.items.append(item)
def pop(self):
return self.items.pop()
def top(self):
return self.items[len(self.items)-1]
def size(self):
return len(self.items)
def prinstack(self):
for i in range(len(self.items)):
print(self.items[i], end=' ')

--- PAGE 10 ---
10
For example: at main program
s = stack(5)
s.push(1)
s.push(2)
s.push(3)
s.push(4)
s.push(5)
print('Stack has data: ', end=' ')
s.prinstack()
print()
print('Stack has size: ', s.size())
Result:
Stack has data: 1 2 3 4 5 
Stack has size: 5

--- PAGE 11 ---
11
For example: at main program (continue)
s.pop()
s.pop()
print('Stack has data: ', end=' ')
s.prinstack()
print()
print('Stack has size: ', s.size())
Result:
Stack has data: 1 2 3 
Stack has size: 3

--- PAGE 12 ---
12
Special cases of Stacks
1. Stack is full, when push
2. Stack is empty, when pop or top

--- PAGE 13 ---
13
Special cases of Stacks
1. Stack is full, when push:
We check the size of stack before push.
def push(self, item):
if len(self.items) >= self.limit:
print ('Stack Overflow, Cannot push ',item)
else:
self.items.append(item)

--- PAGE 14 ---
14
Special cases of Stacks
2. Stack is empty, when pop or top:
We check the size of stack before pop.
def pop(self):
if len(self.items) <= 0:
print ('Stack Underflow!’)
else:
return self.items.pop()

--- PAGE 15 ---
15
Applications
PostFix Expressions
5+4*2
infix expressions
(5+4)*2
paranthesis is necessary
What if you have a simple calculator ? 
5 4 + 2 *
5 4 2 * +
How to evaluate postfix expressions ?
use a stack
a number is seen push onto stack
an operator is seen pop two values from stack
apply operation
push the result onto stack

--- PAGE 16 ---
16
Applications
PostFix Expressions
Example : 
6 5 + 8 *
6
5
Top of Stack
11
Top of Stack
11
8
Top of Stack
88
Top of Stack
```

#### Extract: `conductor/extracted/ปี67_Lecture_4_Stack_For_example_Stack.pdf.txt`
```text
--- PAGE 1 ---
For example 1: If the initial stack with size=5 is empty and 
the numbers 5, 10, 15, 20 are pushed in that order and 
popped 4 times, then 25, 30, 35 are pushed in that order 
and popped 2 times, what value will remain on the stack? 
Answer: 
 
For example 2: If the initial stack with size=5 contains the 
numbers [10, 20, 30, 40] , and is popped twice, then 
pushed 50, 60 in that order, then popped 3 times, what 
value will remain on the stack? 
Answer: 
 
For example 3: if there is no stack's instance variable 
before, write statements in main program to create the 
instance variable mystack with size=5. Then push the 
number 1, 2, 3, 4, 5 in that order,and pop 3 times by 
using class Stack's methods that we learned. 
Finally write the element that remain on the stack's 
instance variable mystack.

--- PAGE 2 ---
İs
 
Different from
For example
 
3.1: if there is the exist stack's instance 
variable mystack with size=5
 
contains the numbers [10,
20, 30, 40] ...
```

#### Extract: `conductor/extracted/ปี67_Lecture_4_Stack_Postfix_Expression.pdf.txt`
```text
--- PAGE 1 ---
1 
 
Expression is a mathematic statement that consist of 
operand and operator. Normally we use Infix Expression. 
2 + 3 * 5 = 
2 + 3 * 5 = 
 
Precedence rules 
Python's arithmetic operator precedence follows the standard 
mathematical order of operations, often remembered by the 
acronym PEMDAS: 
 Parentheses (): Expressions within parentheses are evaluated first, 
overriding other precedence rules. 
 Exponents **: Exponentiation operations are performed next. 
 Multiplication *, Division /, Floor Division //, Modulo %: These operators 
have the same precedence and are evaluated from left to right. 
 Addition +, Subtraction -: These operators have the lowest precedence 
among arithmetic operators and are evaluated from left to right. 
Example: 
Python 
result = 3 + 4 * 5 
In this example, the multiplication 4 * 5 is performed first due to higher 
precedence, resulting in 20. Then, 3 + 20 is calculated, yielding 23. 
Using Parentheses to Override Precedence: 
Python 
result = (3 + 4) * 5 
Here, the addition 3 + 4 is performed first because it is enclosed in 
parentheses, resulting in 7. Then, 7 * 5 is calculated, yielding 35.

--- PAGE 2 ---
2 
 
Postfix expression 
How to evaluate a postfix expression (read postfix.pdf in google classroom) 
6 5 2 3 + 8 * + 3 + * 
/ 
 
 
 
 
 
 
 
 
Algorithm: 
 use a stack 
 a number is seen  push onto stack 
 an operator is seen  pop two values from stack 
 
 
 
 
 
 
 apply operation 
 
 
 
 
 
 
 push the result onto stack 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
[0] 
1 
2 
3 
4 
5 
6

--- PAGE 3 ---
3 
 
Infix to Postfix Conversion (read postfix.pdf in google classroom) 
 
a + b * c + (d* e + f) * g 
/ 
 
 
 
 
 
 
 
=+ 
Output 
 
 
 / 
 
 
 
 
 
 
 
 
 
 
 
 
 
[0] 
1 
2 
3 
4 
5 
6 
 
 
 
 
 
 
 
[0] 
1 
2 
3 
4 
5 
6 
 
 
 
 
 
 
 
[0] 
1 
2 
3 
4 
5 
6 
 
 
 
 
 
 
 
[0] 
1 
2 
3 
4 
5 
6 
 
 
 
 
 
 
 
[0] 
1 
2 
3 
4 
5 
6 
 
 
 
 
 
 
 
[0] 
1 
2 
3 
4 
5 
6 
 
 
 
 
 
 
 
[0] 
1 
2 
3 
4 
5 
6 
 
 
 
 
 
 
 
[0] 
1 
2 
3 
4 
5 
6 
 
 
 
 
 
 
 
[0] 
1 
2 
3 
4 
5 
6 
topOfSta
topOfSta
topOfStack 
topOfSta
topOfSta
topOfSta
topOfSta

--- PAGE 4 ---
4 
 
For Example 4: Convert infix expression to postfix 
expression and evaluate that postfix expression. 
(a+(b*c))+(((d*e)+f)*g)
```

#### Extract: `conductor/extracted/ปี67_Lecture_4_Stack_postfix.pdf.txt`
```text
--- PAGE 1 ---
3.6 The Stack ADT
105
The sequence [()] is legal, but [(]) is wrong. Obviously, it is not worthwhile writing a
huge program for this, but it turns out that it is easy to check these things. For simplicity,
we will just check for balancing of parentheses, brackets, and braces and ignore any other
character that appears.
The simple algorithm uses a stack and is as follows:
Make an empty stack. Read characters until end of ﬁle. If the character is an opening
symbol, push it onto the stack. If it is a closing symbol and the stack is empty, report
an error. Otherwise, pop the stack. If the symbol popped is not the corresponding
opening symbol, then report an error. At end of ﬁle, if the stack is not empty, report an
error.
You should be able to convince yourself that this algorithm works. It is clearly linear
and actually makes only one pass through the input. It is thus online and quite fast. Extra
work can be done to attempt to decide what to do when an error is reported—such as
identifying the likely cause.
Postﬁx Expressions
Suppose we have a pocket calculator and would like to compute the cost of a shopping
trip. To do so, we add a list of numbers and multiply the result by 1.06; this computes the
purchase price of some items with local sales tax added. If the items are 4.99, 5.99, and
6.99, then a natural way to enter this would be the sequence
4.99 + 5.99 + 6.99 ∗1.06 =
Depending on the calculator, this produces either the intended answer, 19.05, or the sci-
entiﬁc answer, 18.39. Most simple four-function calculators will give the ﬁrst answer, but
many advanced calculators know that multiplication has higher precedence than addition.
On the other hand, some items are taxable and some are not, so if only the ﬁrst and
last items were actually taxable, then the sequence
4.99 ∗1.06 + 5.99 + 6.99 ∗1.06 =
would give the correct answer (18.69) on a scientiﬁc calculator and the wrong answer
(19.37) on a simple calculator. A scientiﬁc calculator generally comes with parentheses, so
we can always get the right answer by parenthesizing, but with a simple calculator we need
to remember intermediate results.
A typical evaluation sequence for this example might be to multiply 4.99 and 1.06,
saving this answer as A1. We then add 5.99 and A1, saving the result in A1. We multiply
6.99 and 1.06, saving the answer in A2, and ﬁnish by adding A1 and A2, leaving the ﬁnal
answer in A1. We can write this sequence of operations as follows:
4.99 1.06 ∗5.99 + 6.99 1.06 ∗+
This notation is known as postﬁx, or reverse Polish notation, and is evaluated exactly as
we have described above. The easiest way to do this is to use a stack. When a number is
seen, it is pushed onto the stack; when an operator is seen, the operator is applied to the

--- PAGE 2 ---
106
Chapter 3
Lists, Stacks, and Queues
two numbers (symbols) that are popped from the stack, and the result is pushed onto the
stack. For instance, the postﬁx expression
6 5 2 3 + 8 ∗+3 + ∗
is evaluated as follows:
The ﬁrst four symbols are placed on the stack. The resulting stack is
3
2
5
6
topOfStack
→
Next, a ‘+’ is read, so 3 and 2 are popped from the stack, and their sum, 5, is pushed.
5
5
6
topOfStack →
Next, 8 is pushed.
5
5
8
6
topOfStack →
Now a ‘∗’ is seen, so 8 and 5 are popped, and 5 ∗8 = 40 is pushed.
40
5
6
topOfStack
→

--- PAGE 3 ---
3.6 The Stack ADT
107
Next, a ‘+’ is seen, so 40 and 5 are popped, and 5 + 40 = 45 is pushed.
45
6
topOfStack
→
Now, 3 is pushed.
45
6
3
topOfStack
→
Next, ‘+’ pops 3 and 45 and pushes 45 + 3 = 48.
48
6
topOfStack
→
Finally, a ‘∗’ is seen and 48 and 6 are popped; the result, 6 ∗48 = 288, is pushed.
288
topOfStack
→
The time to evaluate a postﬁx expression is O(N), because processing each element in
the input consists of stack operations and therefore takes constant time. The algorithm to
do so is very simple. Notice that when an expression is given in postﬁx notation, there is
no need to know any precedence rules; this is an obvious advantage.

--- PAGE 4 ---
108
Chapter 3
Lists, Stacks, and Queues
Inﬁx to Postﬁx Conversion
Not only can a stack be used to evaluate a postﬁx expression, but we can also use a stack
to convert an expression in standard form (otherwise known as inﬁx) into postﬁx. We will
concentrate on a small version of the general problem by allowing only the operators +, *,
(, ), and insisting on the usual precedence rules. We will further assume that the expression
is legal. Suppose we want to convert the inﬁx expression
a + b * c + ( d * e + f ) * g
into postﬁx. A correct answer is a b c * + d e * f + g * +.
When an operand is read, it is immediately placed onto the output. Operators are
not immediately output, so they must be saved somewhere. The correct thing to do is to
place operators that have been seen, but not placed on the output, onto the stack. We will
also stack left parentheses when they are encountered. We start with an initially empty
stack.
If we see a right parenthesis, then we pop the stack, writing symbols until we encounter
a (corresponding) left parenthesis, which is popped but not output.
If we see any other symbol (+, *, (), then we pop entries from the stack until we ﬁnd
an entry of lower priority. One exception is that we never remove a ( from the stack except
when processing a ). For the purposes of this operation, + has lowest priority and ( highest.
When the popping is done, we push the operator onto the stack.
Finally, if we read the end of input, we pop the stack until it is empty, writing symbols
onto the output.
The idea of this algorithm is that when an operator is seen, it is placed on the stack.
The stack represents pending operators. However, some of the operators on the stack that
have high precedence are now known to be completed and should be popped, as they will
no longer be pending. Thus prior to placing the operator on the stack, operators that are
on the stack, and which are to be completed prior to the current operator, are popped.
This is illustrated in the following table:
Stack When Third
Expression
Operator Is Processed
Action
a*b-c+d
-
- is completed; + is pushed
a/b+c*d
+
Nothing is completed; * is pushed
a-b*c/d
- *
* is completed; / is pushed
a-b*c+d
- *
* and - are completed; + is pushed
Parentheses simply add an additional complication. We can view a left parenthesis as
a high-precedence operator when it is an input symbol (so that pending operators
remain pending) and a low-precedence operator when it is on the stack (so that it is
not accidentally removed by an operator). Right parentheses are treated as the special
case.
To see how this algorithm performs, we will convert the long inﬁx expression above
into its postﬁx form. First, the symbol a is read, so it is passed through to the output.

--- PAGE 5 ---
3.6 The Stack ADT
109
Then + is read and pushed onto the stack. Next b is read and passed through to the output.
The state of affairs at this juncture is as follows:
a b
Output
Stack
+
Next, a * is read. The top entry on the operator stack has lower precedence than *, so
nothing is output and * is put on the stack. Next, c is read and output. Thus far, we have
a b c
Output
Stack
+
*
The next symbol is a +. Checking the stack, we ﬁnd that we will pop a * and place it on
the output; pop the other +, which is not of lower but equal priority, on the stack; and then
push the +.
a b c * +
Output
Stack
+
The next symbol read is a (. Being of highest precedence, this is placed on the stack. Then
d is read and output.
a b c * + d
Output
Stack
+
(
We continue by reading a *. Since open parentheses do not get removed except when a
closed parenthesis is being processed, there is no output. Next, e is read and output.
a b c * + d e
Output
Stack
+
(
*

--- PAGE 6 ---
110
Chapter 3
Lists, Stacks, and Queues
The next symbol read is a +. We pop and output * and then push +. Then we read and
output f.
a b c * + d e * f
Output
Stack
+
(
+
Now we read a ), so the stack is emptied back to the (. We output a +.
a b c * + d e * f +
Output
Stack
+
We read a * next; it is pushed onto the stack. Then g is read and output.
a b c * + d e * f + g
Output
Stack
+
*
The input is now empty, so we pop and output symbols from the stack until it is empty.
a b c * + d e * f + g * +
Output
Stack
As before, this conversion requires only O(N) time and works in one pass through
the input. We can add subtraction and division to this repertoire by assigning subtraction
and addition equal priority and multiplication and division equal priority. A subtle point
is that the expression a - b - c will be converted to a b - c - and not a b c - -. Our
algorithm does the right thing, because these operators associate from left to right. This
is not necessarily the case in general, since exponentiation associates right to left: 223 =
28 = 256, not 43 = 64. We leave as an exercise the problem of adding exponentiation to
the repertoire of operators.
Function Calls
The algorithm to check balanced symbols suggests a way to implement function calls in
compiled procedural and object-oriented languages. The problem here is that when a call
is made to a new function, all the variables local to the calling routine need to be saved
by the system, since otherwise the new function will overwrite the memory used by the
calling routine’s variables. Furthermore, the current location in the routine must be saved
```

#### Extract: `conductor/extracted/สำเนาของ_4.pdf.txt`
```text
--- PAGE 1 ---
1
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 4
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
Abstract Data Types (ADT)
The List ADT
List implementation of lists
Linked list implementation of lists
The Stack ADT
Linked list implementation of stacks
List implementation of stacks
The Queue ADT
Link list implementation of queues
List implementation of queues

--- PAGE 3 ---
3
THE STACK ADT
A stack is a list
Insertions and deletions from one end (top)
LIFO (Last In Fist Out)
Operations:
Push
Pop
Top
isEmpty
isFull

--- PAGE 4 ---
4
THE STACK ADT
Only the top element is accessible !

--- PAGE 5 ---
5
Implementation of Stacks
1. Linked List Implementation

insert / delete at the end of the list

performs “push” by inserting

performs “pop” by deleting

all operations take constant time

--- PAGE 6 ---
6
ROAD MAP
Abstract Data Types (ADT)
The List ADT
List implementation of lists
Linked list implementation of lists
The Stack ADT
Linked list implementation of stacks
List implementation of stacks
The Queue ADT
Link list implementation of queues
List implementation of queues

--- PAGE 7 ---
7
Implementation of Stacks
2. List Implementation

more popular solution

need to declare the size

usually the max stack size is known

keep a list of Stack (in Python)

--- PAGE 8 ---
8
List Implementation of Stacks
Push use method append()
Pop use method pop()
Top find how many data in stack(len)
return data at position(len-1)

--- PAGE 9 ---
9
class Stack:
def __init__(self,limit = 10):
self.items = []
self.limit = limit
def is_empty(self):
return len(self.items) <= 0
def push(self, item):
self.items.append(item)
def pop(self):
return self.items.pop()
def top(self):
return self.items[len(self.items)-1]
def size(self):
return len(self.items)
def prinstack(self):
for i in range(len(self.items)):
print(self.items[i], end=' ')

--- PAGE 10 ---
10
For example: at main program
s = stack(5)
s.push(1)
s.push(2)
s.push(3)
s.push(4)
s.push(5)
print('Stack has data: ', end=' ')
s.prinstack()
print()
print('Stack has size: ', s.size())
Result:
Stack has data: 1 2 3 4 5 
Stack has size: 5

--- PAGE 11 ---
11
For example: at main program (continue)
s.pop()
s.pop()
print('Stack has data: ', end=' ')
s.prinstack()
print()
print('Stack has size: ', s.size())
Result:
Stack has data: 1 2 3 
Stack has size: 3

--- PAGE 12 ---
12
Special cases of Stacks
1. Stack is full, when push
2. Stack is empty, when pop or top

--- PAGE 13 ---
13
Special cases of Stacks
1. Stack is full, when push:
We check the size of stack before push.
def push(self, item):
if len(self.items) >= self.limit:
print ('Stack Overflow, Cannot push ',item)
else:
self.items.append(item)

--- PAGE 14 ---
14
Special cases of Stacks
2. Stack is empty, when pop or top:
We check the size of stack before pop.
def pop(self):
if len(self.items) <= 0:
print ('Stack Underflow!’)
else:
return self.items.pop()

--- PAGE 15 ---
15
Applications
PostFix Expressions
5+4*2
infix expressions
(5+4)*2
paranthesis is necessary
What if you have a simple calculator ? 
5 4 + 2 *
5 4 2 * +
How to evaluate postfix expressions ?
use a stack
a number is seen push onto stack
an operator is seen pop two values from stack
apply operation
push the result onto stack

--- PAGE 16 ---
16
Applications
PostFix Expressions
Example : 
6 5 + 8 *
6
5
Top of Stack
11
Top of Stack
11
8
Top of Stack
88
Top of Stack
```

#### Extract: `conductor/extracted/สำเนาของ_แบบฝึกหัดบท4.pdf.txt`
```text
--- PAGE 1 ---
For example 1: If the initial stack with size=5 is empty and 
the numbers 5, 10, 15, 20 are pushed in that order and 
popped 4 times, then 25, 30, 35 are pushed in that order 
and popped 2 times, what value will remain on the stack? 
Answer: 
 
For example 2: If the initial stack with size=5 contains the 
numbers [10, 20, 30, 40] , and is popped twice, then 
pushed 50, 60 in that order, then popped 3 times, what 
value will remain on the stack? 
Answer: 
 
For example 3: if there is no stack's instance variable 
before, write statements in main program to create the 
instance variable mystack with size=5. Then push the 
number 1, 2, 3, 4, 5 in that order,and pop 3 times by 
using class Stack's methods that we learned. 
Finally write the element that remain on the stack's 
instance variable mystack.

--- PAGE 2 ---
İs
 
Different from
For example
 
3.1: if there is the exist stack's instance 
variable mystack with size=5
 
contains the numbers [10,
20, 30, 40] ...
```

#### Extract: `conductor/extracted/สำเนาของ_วิธีการทำตามระดับให้ดูคู่กับชีทบท4.pdf.txt`
```text
--- PAGE 1 ---
3.6 The Stack ADT
105
The sequence [()] is legal, but [(]) is wrong. Obviously, it is not worthwhile writing a
huge program for this, but it turns out that it is easy to check these things. For simplicity,
we will just check for balancing of parentheses, brackets, and braces and ignore any other
character that appears.
The simple algorithm uses a stack and is as follows:
Make an empty stack. Read characters until end of ﬁle. If the character is an opening
symbol, push it onto the stack. If it is a closing symbol and the stack is empty, report
an error. Otherwise, pop the stack. If the symbol popped is not the corresponding
opening symbol, then report an error. At end of ﬁle, if the stack is not empty, report an
error.
You should be able to convince yourself that this algorithm works. It is clearly linear
and actually makes only one pass through the input. It is thus online and quite fast. Extra
work can be done to attempt to decide what to do when an error is reported—such as
identifying the likely cause.
Postﬁx Expressions
Suppose we have a pocket calculator and would like to compute the cost of a shopping
trip. To do so, we add a list of numbers and multiply the result by 1.06; this computes the
purchase price of some items with local sales tax added. If the items are 4.99, 5.99, and
6.99, then a natural way to enter this would be the sequence
4.99 + 5.99 + 6.99 ∗1.06 =
Depending on the calculator, this produces either the intended answer, 19.05, or the sci-
entiﬁc answer, 18.39. Most simple four-function calculators will give the ﬁrst answer, but
many advanced calculators know that multiplication has higher precedence than addition.
On the other hand, some items are taxable and some are not, so if only the ﬁrst and
last items were actually taxable, then the sequence
4.99 ∗1.06 + 5.99 + 6.99 ∗1.06 =
would give the correct answer (18.69) on a scientiﬁc calculator and the wrong answer
(19.37) on a simple calculator. A scientiﬁc calculator generally comes with parentheses, so
we can always get the right answer by parenthesizing, but with a simple calculator we need
to remember intermediate results.
A typical evaluation sequence for this example might be to multiply 4.99 and 1.06,
saving this answer as A1. We then add 5.99 and A1, saving the result in A1. We multiply
6.99 and 1.06, saving the answer in A2, and ﬁnish by adding A1 and A2, leaving the ﬁnal
answer in A1. We can write this sequence of operations as follows:
4.99 1.06 ∗5.99 + 6.99 1.06 ∗+
This notation is known as postﬁx, or reverse Polish notation, and is evaluated exactly as
we have described above. The easiest way to do this is to use a stack. When a number is
seen, it is pushed onto the stack; when an operator is seen, the operator is applied to the

--- PAGE 2 ---
106
Chapter 3
Lists, Stacks, and Queues
two numbers (symbols) that are popped from the stack, and the result is pushed onto the
stack. For instance, the postﬁx expression
6 5 2 3 + 8 ∗+3 + ∗
is evaluated as follows:
The ﬁrst four symbols are placed on the stack. The resulting stack is
3
2
5
6
topOfStack
→
Next, a ‘+’ is read, so 3 and 2 are popped from the stack, and their sum, 5, is pushed.
5
5
6
topOfStack →
Next, 8 is pushed.
5
5
8
6
topOfStack →
Now a ‘∗’ is seen, so 8 and 5 are popped, and 5 ∗8 = 40 is pushed.
40
5
6
topOfStack
→

--- PAGE 3 ---
3.6 The Stack ADT
107
Next, a ‘+’ is seen, so 40 and 5 are popped, and 5 + 40 = 45 is pushed.
45
6
topOfStack
→
Now, 3 is pushed.
45
6
3
topOfStack
→
Next, ‘+’ pops 3 and 45 and pushes 45 + 3 = 48.
48
6
topOfStack
→
Finally, a ‘∗’ is seen and 48 and 6 are popped; the result, 6 ∗48 = 288, is pushed.
288
topOfStack
→
The time to evaluate a postﬁx expression is O(N), because processing each element in
the input consists of stack operations and therefore takes constant time. The algorithm to
do so is very simple. Notice that when an expression is given in postﬁx notation, there is
no need to know any precedence rules; this is an obvious advantage.

--- PAGE 4 ---
108
Chapter 3
Lists, Stacks, and Queues
Inﬁx to Postﬁx Conversion
Not only can a stack be used to evaluate a postﬁx expression, but we can also use a stack
to convert an expression in standard form (otherwise known as inﬁx) into postﬁx. We will
concentrate on a small version of the general problem by allowing only the operators +, *,
(, ), and insisting on the usual precedence rules. We will further assume that the expression
is legal. Suppose we want to convert the inﬁx expression
a + b * c + ( d * e + f ) * g
into postﬁx. A correct answer is a b c * + d e * f + g * +.
When an operand is read, it is immediately placed onto the output. Operators are
not immediately output, so they must be saved somewhere. The correct thing to do is to
place operators that have been seen, but not placed on the output, onto the stack. We will
also stack left parentheses when they are encountered. We start with an initially empty
stack.
If we see a right parenthesis, then we pop the stack, writing symbols until we encounter
a (corresponding) left parenthesis, which is popped but not output.
If we see any other symbol (+, *, (), then we pop entries from the stack until we ﬁnd
an entry of lower priority. One exception is that we never remove a ( from the stack except
when processing a ). For the purposes of this operation, + has lowest priority and ( highest.
When the popping is done, we push the operator onto the stack.
Finally, if we read the end of input, we pop the stack until it is empty, writing symbols
onto the output.
The idea of this algorithm is that when an operator is seen, it is placed on the stack.
The stack represents pending operators. However, some of the operators on the stack that
have high precedence are now known to be completed and should be popped, as they will
no longer be pending. Thus prior to placing the operator on the stack, operators that are
on the stack, and which are to be completed prior to the current operator, are popped.
This is illustrated in the following table:
Stack When Third
Expression
Operator Is Processed
Action
a*b-c+d
-
- is completed; + is pushed
a/b+c*d
+
Nothing is completed; * is pushed
a-b*c/d
- *
* is completed; / is pushed
a-b*c+d
- *
* and - are completed; + is pushed
Parentheses simply add an additional complication. We can view a left parenthesis as
a high-precedence operator when it is an input symbol (so that pending operators
remain pending) and a low-precedence operator when it is on the stack (so that it is
not accidentally removed by an operator). Right parentheses are treated as the special
case.
To see how this algorithm performs, we will convert the long inﬁx expression above
into its postﬁx form. First, the symbol a is read, so it is passed through to the output.

--- PAGE 5 ---
3.6 The Stack ADT
109
Then + is read and pushed onto the stack. Next b is read and passed through to the output.
The state of affairs at this juncture is as follows:
a b
Output
Stack
+
Next, a * is read. The top entry on the operator stack has lower precedence than *, so
nothing is output and * is put on the stack. Next, c is read and output. Thus far, we have
a b c
Output
Stack
+
*
The next symbol is a +. Checking the stack, we ﬁnd that we will pop a * and place it on
the output; pop the other +, which is not of lower but equal priority, on the stack; and then
push the +.
a b c * +
Output
Stack
+
The next symbol read is a (. Being of highest precedence, this is placed on the stack. Then
d is read and output.
a b c * + d
Output
Stack
+
(
We continue by reading a *. Since open parentheses do not get removed except when a
closed parenthesis is being processed, there is no output. Next, e is read and output.
a b c * + d e
Output
Stack
+
(
*

--- PAGE 6 ---
110
Chapter 3
Lists, Stacks, and Queues
The next symbol read is a +. We pop and output * and then push +. Then we read and
output f.
a b c * + d e * f
Output
Stack
+
(
+
Now we read a ), so the stack is emptied back to the (. We output a +.
a b c * + d e * f +
Output
Stack
+
We read a * next; it is pushed onto the stack. Then g is read and output.
a b c * + d e * f + g
Output
Stack
+
*
The input is now empty, so we pop and output symbols from the stack until it is empty.
a b c * + d e * f + g * +
Output
Stack
As before, this conversion requires only O(N) time and works in one pass through
the input. We can add subtraction and division to this repertoire by assigning subtraction
and addition equal priority and multiplication and division equal priority. A subtle point
is that the expression a - b - c will be converted to a b - c - and not a b c - -. Our
algorithm does the right thing, because these operators associate from left to right. This
is not necessarily the case in general, since exponentiation associates right to left: 223 =
28 = 256, not 43 = 64. We leave as an exercise the problem of adding exponentiation to
the repertoire of operators.
Function Calls
The algorithm to check balanced symbols suggests a way to implement function calls in
compiled procedural and object-oriented languages. The problem here is that when a call
is made to a new function, all the variables local to the calling routine need to be saved
by the system, since otherwise the new function will overwrite the memory used by the
calling routine’s variables. Furthermore, the current location in the routine must be saved
```
