---
type: source
tags: [hashing, collision-resolution, open-addressing]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 7 Hashing/Lecture 7 Hashing.pdf]
---

# Source: Lecture 7 - Hashing

## Summary
Core concepts of **Hash Tables**, hash functions, and strategies for resolving collisions. The goal is to achieve $O(1)$ average time complexity for search, insert, and delete operations.

## Implementation Details

### 1. Hash Function
Maps a **Key** to an array index.
- **Integer Keys**: `Key % TableSize`. `TableSize` should ideally be a **Prime Number**.
- **String Keys**: Summing ASCII values of characters.
```python
def hash_string(key, table_size):
    hash_val = 0
    for char in key:
        hash_val += ord(char)
    return hash_val % table_size
```

### 2. Collision Resolution Strategies

#### A. Separate Chaining
Maintain a list (linked list) of all elements that hash to the same index.
- **Pros**: Simple to implement, never "fills up".
- **Cons**: Requires extra memory for pointers.

#### B. Open Addressing (Probing)
If a collision occurs, try alternative cells: $h_i(x) = (hash(x) + F(i)) \mod TableSize$.
- **Linear Probing**: $F(i) = i$. Check the next immediate slot. Leads to **Primary Clustering**.
- **Quadratic Probing**: $F(i) = i^2$. Check slots $1, 4, 9 \dots$ away. Solves primary clustering but can have **Secondary Clustering**.
- **Double Hashing**: $F(i) = i \cdot hash_2(x)$. A second hash function determines the step size. Good choice: $hash_2(x) = R - (x \mod R)$ where $R$ is a prime $< TableSize$.

### 3. Rehashing
When the table becomes too full (typically Load Factor $\lambda > 0.5$ or $0.7$), a new table is created with a size roughly **double** the original (the next prime number), and all elements are re-inserted.

## Complexity/Trade-offs
- **Average Case**: $O(1)$ for all operations.
- **Worst Case**: $O(n)$ if all keys hash to the same index (rare with good hash functions).
- **Space**: $O(TableSize + n)$.

## Related Pages
- [[hashing|Hashing Concept Deep-Dive]]
- [[linked-list|Linked List (used in Separate Chaining)]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 7 Hashing/Lecture 7 Hashing.pdf|Lecture 7 Hashing.pdf]] (20 pages, 4497 extracted characters) -> `conductor/extracted/ปี67_Lecture_7_Hashing_Lecture_7_Hashing.pdf.txt`
- [[raw/Data structure/สำเนาของ  7.pdf|สำเนาของ  7.pdf]] visual source

### Deep Notes
- Hashing maps a key to an array index using a hash function. The goal is near O(1) average search/insert/delete by avoiding linear scans.
- Collision handling is the main design issue. Separate chaining stores multiple keys at a bucket; open addressing probes alternative positions.
- Good exam answers must name the hash function, table size, collision method, and load-factor implication. Poor table size or clustering can turn expected O(1) into longer probe chains.
- `สำเนาของ  7.pdf` appears to be visual-only/root supplemental material for this topic, so it is kept as a visual trace here.

### Visual Source Checklist
- ![[raw/Data structure/สำเนาของ  7.pdf|180]]

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_7_Hashing_Lecture_7_Hashing.pdf.txt`
```text
--- PAGE 1 ---
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 7
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
HASHING
General Idea
Hash Function 
Separate Chaining
Open Adressing
Rehashing

--- PAGE 3 ---
3
Hashing
Hashing: implementation of hash tables
hash table: an array of elements (python ใช้ datatype list)
fixed size TableSize
Search is performed on a part of the item: key
Each key is mapped into a number ต ำแหน่งในอะเรย์
in the range 0 to TableSize-1
Used as array index ตัวชี้ต ำแหน่งในอะเรย์
Mapping by hash function ในทางอุดมคติ
Simple to compute
Ensure that any two distinct keys get different cells เป็นไปไม่ได้
How to perform insert, delete and find operations in O(1) time ?

--- PAGE 4 ---
4
An ideal hash table
Each key is mapped to a 
different index ! 
Not always possible 
many keys, finite indexes
Even distribution
Considerations :
Choose a hash function
Decide what to do when two 
keys hash to the same value
Decide on table size

--- PAGE 5 ---
5
Hash function
If keys are integers
hash function return Key mod TableSize
Ex: TableSize = 10
Keys = 120, 330, 1000
TableSize should be prime จ ำนวนเฉพำะ
ตัวเลขที่มีตัวมันเอง กับ 1 ที่หำรลงตัว เท่ำนั้น เช่น
3 , 1 , 7 ,13 , 17, 19 , 9

--- PAGE 6 ---
6
Hash function
If keys are strings ข้อควำม ตัวอักษรหลำยตัวอยู่ติดกัน เช่น ชื่อคน
Add ASCII values of the characters
If TableSize is large and number of characters is small
TableSize = 10000 & number of characters in a key = 8
127*8=1016 < 10000
def hash(key,table_size):
hash_val = 0
for char in key:
hash_val += ord(char)
return hash_val % table_size

--- PAGE 7 ---
7
Collision กำรชนกัน
Main programming detail is collision 
resolution กำรแก้กำรชนกัน 
If when an element is inserted, it hashes to 
the same value as an already inserted 
element, there is collision. 
There are several methods to deal with this 
problem
Separate แยกchaining ต่อกันเป็นโซ่
Open addressing

--- PAGE 8 ---
8
Separate Chaining Hash Table
Keep a list of all 
elements that hash 
to the same value
TableSize = 10
is not good
not prime

--- PAGE 9 ---
9
Open Adressing
If collision try an alternate cell
h0(x), h1(x), h2(x), …
hi(x) = (hash(x) + F(i)) mod TableSize
F(0) = 0

--- PAGE 10 ---
10
Linear Probing
• F is a linear function of I สมการเชิงเส้น ไม่มีเลขยกก าลัง
– F(i) = i ง่ำยที่สุด 
Insert keys
{89, 18, 49, 58, 69} 
•
When 49 is 
inserted collision 
occurs
– Put into the 
next available 
spot 0
•
58 collidates with 
18, 89, 49

--- PAGE 11 ---
11
Linear Probing
Problem: It is not easy to delete an 
element
May have caused a collision before
Mark the element deleted
Problem: Primary Clustering กำรเกำะกลุ่ม

--- PAGE 12 ---
12
Quadratic Probing
F(i) is a quadratic function เลขยกก ำลัง 
Ex : F(i) = i2

--- PAGE 13 ---
13
Quadratic Probing
When 49 collides 
with 89, next 
position 
attemped is one 
cell away
58 collides at 
position 8. The 
cell one away is 
tried, another 
collision occurs. 
It is inserted into 
the cell 22=4 
away

--- PAGE 14 ---
14
Quadratic Probing
Solves primary clustering problem
All empty cells may not be accessed
A loop around full cells may happen
Hash table not full but empty space not 
found 
Problem : Secondary clustering!...

--- PAGE 15 ---
15
Double Hashing
Use second hash function ฟังก์ชันแฮช ที่สอง 
F(i) = i * hash2(x) ฟังก์ชันแฮช ที่สอง ของ x
Poor example : 
hash2(x) = X mod 9
hash1(x) = X mod 10
TableSize = 10
If X = 99 what happens ?
hash2(x) ≠ 0 for any X

--- PAGE 16 ---
16
Double Hashing
Good choice : 
hash2(x) = R – (X mod R)
R is a prime and < TableSize
R เป็นเลขจ ำนวนเฉพำะที่มากที่สุด แต่น้อยกว่ำTableSize
ถ้ำ TableSize เป็น 10 , R จะเท่ำกับ 7 ท ำไมไม่เป็น 8,9
ถ้ำ TableSize เป็น 11 R จะเท่ำกับ7

--- PAGE 17 ---
17
Double Hashing
hash2(x) = 7 – (X mod 7)

--- PAGE 18 ---
18
Rehashing
If the elements in the table gets too large, 
number of probes increases.
Running time of operations starts taking 
too long and insertions might fail
Solution : Rehashing with larger TableSize 
(usually *2)
When to rehash
if the elements in the table > 0.5
if more insertion fails

--- PAGE 19 ---
19
Rehashing Example
Elements 13, 15, 24 and 6 is inserted into an open 
addressing hash table of size 7
H(X) = X mod 7
Linear probing is used to resolve collisions

--- PAGE 20 ---
20
Rehashing Example
If 23 is inserted, the 
table is over 70 percent 
full. 
A new table is created
17 is the first prime
twice as large as the 
old one; so
Hnew (X) = X mod 17

```
