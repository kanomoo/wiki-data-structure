---
type: source
tags: [introduction, foundations]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 1 Introduction/Lecture 1 Introduction.pdf]
---

# Source: Lecture 1 Introduction

## Summary
Introduction to the core principles of Data Structures and Algorithms. Defines the relationship between Abstract Data Types (ADTs), concrete implementations, and complexity analysis.

## Key Takeaways
- **Data Types**: Python categories (Numeric, Sequential, Booleans, Dictionary).
- **ADT vs. Data Structure**: ADT is the logical blueprint (what); Data Structure is the implementation (how).
- **Algorithms**: Step-by-step instructions for problem-solving.
- **Complexity**: Efficiency measured by Time (execution speed) and Space (memory usage). Time optimization is usually the priority in production.

## Related Concepts
- [[wiki-architecture]] (Analogous to the blueprint idea)
- [[persistent-knowledge]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 1 Introduction/Lecture 1 Introduction.pdf|Lecture 1 Introduction.pdf]] (15 pages, 3390 extracted characters) -> `conductor/extracted/ปี67_Lecture_1_Introduction_Lecture_1_Introduction.pdf.txt`
- [[raw/Data structure/สำเนาของ 1.pdf|สำเนาของ 1.pdf]] (15 pages, 3390 extracted characters) -> `conductor/extracted/สำเนาของ_1.pdf.txt`
- [[raw/Data structure/ปี67/planstd060243106.pdf|planstd060243106.pdf]] (2 pages, 1355 extracted characters) -> `conductor/extracted/ปี67_planstd060243106.pdf.txt`
- [[raw/Data structure/ปี67/Screenshot 2026-02-15 170708.png|Screenshot 2026-02-15 170708.png]] visual source
- [[raw/Data structure/ปี67/Screenshot 2026-02-15 170858.png|Screenshot 2026-02-15 170858.png]] visual source
- [[raw/Data structure/ปี67/Screenshot 2026-02-15 170939.png|Screenshot 2026-02-15 170939.png]] visual source

### Deep Notes
- Lecture 1 frames the course as problem solving with Abstract Data Types: understand the interface first, then choose an implementation that controls time and memory cost.
- The course-plan PDF is useful traceability for exam preparation because it anchors the official sequence of topics before the wiki branches into linked lists, stacks, trees, heaps, sorting, graphs, and shortest paths.
- Treat this page as the entry point for concept navigation. It should link outward to [[python-for-data-structures|Python for Data Structures]], [[linked-list|Linked List]], [[stack|Stack]], [[tree-and-binary-tree|Tree and Binary Tree]], [[heap-priority-queue|Heap and Priority Queue]], [[sorting-algorithms|Sorting Algorithms]], and [[graph-algorithms|Graph Algorithms]].
- The duplicate root copy `สำเนาของ 1.pdf` is kept here as corroborating evidence for the same introductory lecture.

### Visual Source Checklist
- ![[raw/Data structure/ปี67/Screenshot 2026-02-15 170708.png|180]]
- ![[raw/Data structure/ปี67/Screenshot 2026-02-15 170858.png|180]]
- ![[raw/Data structure/ปี67/Screenshot 2026-02-15 170939.png|180]]

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_1_Introduction_Lecture_1_Introduction.pdf.txt`
```text
--- PAGE 1 ---
1
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 1
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
Data Types
Abstract Data Types
Algorithms
Data Structures
Time & Space Complexity

--- PAGE 3 ---
3
Data Types
An attribute of data that informs the 
interpreter on how to classify the 
variable.
Python there are four categories 
of data types: numeric, sequential, 
booleans, and dictionary

--- PAGE 4 ---
4
Python Data Types

--- PAGE 5 ---
5
Abstract Data Types (ADT)
A logical process on how we view data 
and allowed operations without the 
regard on how it will be implemented.
(Mathematical abstraction)
Think of an abstract data type as 
a process of the rules and operations
of data.
There is no concrete implementation.

--- PAGE 6 ---
6
Algorithms
A set of step-by-step instructions
used to solved a problem.
One example of an algorithm can be 
a recipe from a cookbook. 
When we follow step-by-step 
instructions from the cook book to 
create our meal.

--- PAGE 7 ---
7
Algorithms
For an example "how to make omelet":

1. Crack the eggs into a bowl.

2. Melt the butter over medium-low heat, and keep the 
temperature low and slow when cooking the eggs.

3. Add the eggs to the skillet and cook without stirring until the 
edges begin to set.

4. Add the filling when the eggs begin to set. Cook for a few 
more seconds.

5. Fold the omelet in half. Slide it onto a plate.

--- PAGE 8 ---
8
Data Structures
A data structure is a format for 
accessing, storing, organizing, or 
structuring data.
The implementation of an abstract data 
type can be referred to a data structure

--- PAGE 9 ---
9
Data Structures
A logical process on how we view data 
and allowed operations without the 
regard on how it will be implemented.
Think of an abstract data type as 
a process of the rules and operations
of data.
There is no concrete implementation.

--- PAGE 10 ---
10
Data Structures
A logical process on how we view data 
and allowed operations without the 
regard on how it will be implemented.
Think of an abstract data type as 
a process of the rules and operations
of data.
There is no concrete implementation.

--- PAGE 11 ---
11
Data Structures and 
Abstract Data Types
ADT gives us the blue print while a data 
structure tells us how to implement it.

--- PAGE 12 ---
12
Data Structures and 
Algorithms 
An algorithm processes data and that 
data is then stored into a data 
structure.

--- PAGE 13 ---
13
Time & Space Complexity
Often, there is more than one way to 
solve the same problem with different 
programs. So how would you be able 
to compare the performance of 
different algorithms, is one program 
better than the other?

--- PAGE 14 ---
14
Time & Space Complexity
There are two ways to determine which 
algorithm is more efficient:
•The amount of space or memory 
an algorithm requires
•The amount of time an algorithm 
requires to execute
Overall time and space complexity can 
be impacted from several factors such 
as hardware, operating system.

--- PAGE 15 ---
15
Time & Space Complexity
If we had to choose between either 
optimizing time or optimizing space.
Overall, it depends on your needs, 
but in a production setting, optimizing 
time is the main priority because we 
can buy memory, but we can't buy time!
This can lead to the best trade off of 
both increasing the space and lowering 
the time!
```

#### Extract: `conductor/extracted/สำเนาของ_1.pdf.txt`
```text
--- PAGE 1 ---
1
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 1
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
Data Types
Abstract Data Types
Algorithms
Data Structures
Time & Space Complexity

--- PAGE 3 ---
3
Data Types
An attribute of data that informs the 
interpreter on how to classify the 
variable.
Python there are four categories 
of data types: numeric, sequential, 
booleans, and dictionary

--- PAGE 4 ---
4
Python Data Types

--- PAGE 5 ---
5
Abstract Data Types (ADT)
A logical process on how we view data 
and allowed operations without the 
regard on how it will be implemented.
(Mathematical abstraction)
Think of an abstract data type as 
a process of the rules and operations
of data.
There is no concrete implementation.

--- PAGE 6 ---
6
Algorithms
A set of step-by-step instructions
used to solved a problem.
One example of an algorithm can be 
a recipe from a cookbook. 
When we follow step-by-step 
instructions from the cook book to 
create our meal.

--- PAGE 7 ---
7
Algorithms
For an example "how to make omelet":

1. Crack the eggs into a bowl.

2. Melt the butter over medium-low heat, and keep the 
temperature low and slow when cooking the eggs.

3. Add the eggs to the skillet and cook without stirring until the 
edges begin to set.

4. Add the filling when the eggs begin to set. Cook for a few 
more seconds.

5. Fold the omelet in half. Slide it onto a plate.

--- PAGE 8 ---
8
Data Structures
A data structure is a format for 
accessing, storing, organizing, or 
structuring data.
The implementation of an abstract data 
type can be referred to a data structure

--- PAGE 9 ---
9
Data Structures
A logical process on how we view data 
and allowed operations without the 
regard on how it will be implemented.
Think of an abstract data type as 
a process of the rules and operations
of data.
There is no concrete implementation.

--- PAGE 10 ---
10
Data Structures
A logical process on how we view data 
and allowed operations without the 
regard on how it will be implemented.
Think of an abstract data type as 
a process of the rules and operations
of data.
There is no concrete implementation.

--- PAGE 11 ---
11
Data Structures and 
Abstract Data Types
ADT gives us the blue print while a data 
structure tells us how to implement it.

--- PAGE 12 ---
12
Data Structures and 
Algorithms 
An algorithm processes data and that 
data is then stored into a data 
structure.

--- PAGE 13 ---
13
Time & Space Complexity
Often, there is more than one way to 
solve the same problem with different 
programs. So how would you be able 
to compare the performance of 
different algorithms, is one program 
better than the other?

--- PAGE 14 ---
14
Time & Space Complexity
There are two ways to determine which 
algorithm is more efficient:
•The amount of space or memory 
an algorithm requires
•The amount of time an algorithm 
requires to execute
Overall time and space complexity can 
be impacted from several factors such 
as hardware, operating system.

--- PAGE 15 ---
15
Time & Space Complexity
If we had to choose between either 
optimizing time or optimizing space.
Overall, it depends on your needs, 
but in a production setting, optimizing 
time is the main priority because we 
can buy memory, but we can't buy time!
This can lead to the best trade off of 
both increasing the space and lowering 
the time!
```

#### Extract: `conductor/extracted/ปี67_planstd060243106.pdf.txt`
```text
--- PAGE 1 ---
1
คณะเทคโนโลยีและการจัดการอุตสาหกรรม 
แผนการสอน ภาคเรียนที่ 1 ปีการศึกษา 2568 
 
รหัสวิชา 060243106 ชื่อวิชา Data Structures and Algorithms 
 
ภาควิชา เทคโนโลยีสารสนเทศ 
ตอนที่ 1 
จ านวน คน 
 
หน่วยกิต 3(3-0-6) (ทฤษฎี-ปฏิบัติ-ศึกษาค้นคว้าด้วยตนเอง) 
ชื่อผู้สอน 
นายประดิษฐ์ พิทักษ์เสถียรกุล 
เอกสาร ต ารา หรือ หนังสือที่ใช้ประกอบการสอน : 
 
 
1.ชื่อหนังสือ 
Data Structures and Algorithms in Python 
ชื่อส านักพิมพ์ Wiley ชื่อผู้แต่ง Michael T. Goodrich,Roberto Tamassia, 
Michael H. Goldwasser 
วิชาบังคับก่อน : 060243102 การโปรแกรมคอมพิวเตอร์ 
การวัดผล : 
 
 
1.คะแนนรวม 
100 
คะแนน 
 
 
2.คะแนนเก็บ 
65 
คะแนน 
 
2.1 การสอบกลางภาค 1 ครั้ง 
35 
คะแนน 
 
2.2 การบ้าน 
 
 
20 
คะแนน 
 
2.3 ปฏิบัติการเขียนโปรแกรม 
10 
คะแนน 
 
 
3.คะแนนสอบปลายภาค 
 
35 
คะแนน 
Assignment อาจเปลี่ยนแปลงได้ตามความเหมาะสม 
หลักสูตรเสริมทักษะภาษาอังกฤษ 
แนวทางการตัดเกรดและมาตรฐานอ้างอิง : 
ใช้วิธีการแบบอิงเกณฑ์ โดยมีเกณฑ์คะแนน ดังนี้ 
ระดับเกรด 
ค่าคะแนน 
 
 
 
 
 
A 
80-100 
 
 
 
 
 
B+ 
75-79 
 
 
 
 
 
B 
70-74 
 
 
 
 
 
C+ 
65-69 
 
 
 
 
 
C 
60-64 
 
 
 
 
 
D+ 
55-59 
 
 
 
 
 
D 
50-54 
 
 
 
 
 
F 
0-49

--- PAGE 2 ---
2
 
หัวข้อที่ใช้สอน : 
สัปดาห์
ที่/ครั้งที่ 
หัวข้อ 
 
1. 
INTRODUCTION 
 
2.-5. 
LISTS, STACKS, AND QUEUES 
 
6.-8. 
TREES 
 
9.-10. 
HASHING 
 
11. 
PRIORITY QUEUES (HEAPS) 
 
12.-13. 
SORTING 
 
14.-15. 
GRAPH ALGORITHMS
```
