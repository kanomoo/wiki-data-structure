---
type: source
tags: [python, oop]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 2 Review Python/Lecture 2 Review Python.pdf]
---

# Source: Lecture 2 Review Python

## Summary
Review of Python programming essentials required for implementing data structures, with a focus on Object-Oriented Programming (OOP).

## Key Takeaways
- **Functions**: Fundamental blocks of reusable logic.
- **OOP Principles**: Classes, Data Members, and Methods.
- **Classes**: Essential for creating custom structures like Nodes.

## Related Concepts
- [[python-for-data-structures]]

## Detailed Raw Source Integration

ส่วนนี้เติมจาก raw material ใน `raw/Data structure` เพื่อให้ source page นี้เป็นหน้าใช้งานจริงตามหลัก LLM Wiki: อ่านแล้วรู้ที่มา, เห็น implementation logic, และโยงกลับไปตรวจต้นฉบับได้ทันที.

### Source Coverage Added
- [[raw/Data structure/ปี67/Lecture 2 Review Python/Lecture 2 Review Python.pdf|Lecture 2 Review Python.pdf]] (12 pages, 2636 extracted characters) -> `conductor/extracted/ปี67_Lecture_2_Review_Python_Lecture_2_Review_Python.pdf.txt`
- [[raw/Data structure/สำเนาของ 2.pdf|สำเนาของ 2.pdf]] (12 pages, 2636 extracted characters) -> `conductor/extracted/สำเนาของ_2.pdf.txt`
- [[raw/Data structure/Python_Oop.pdf|Python_Oop.pdf]] (52 pages, 10269 extracted characters) -> `conductor/extracted/Python_Oop.pdf.txt`

### Deep Notes
- This page now covers both the official Python review and the larger OOP handout. The lecture review supplies syntax and collection basics; `Python_Oop.pdf` supplies class/object vocabulary, encapsulation, inheritance, static class usage, and examples that later become Stack and Queue classes.
- Key implementation bridge: ADTs in this course are almost always represented as Python classes with state plus methods. For example, Stack stores `items` and exposes `push`, `pop`, `top`, `isEmpty`; Queue stores front/rear or an array/list and exposes enqueue/dequeue.
- Exam relevance: when a problem asks for a data structure implementation, write the class boundary first, then fill in invariant-preserving methods. Watch underflow/overflow cases because the source repeatedly highlights Stack/Queue error states.
- The duplicate root copy `สำเนาของ 2.pdf` is the same review material and is preserved here for source traceability.

### Raw Extracted Text
Page markers are preserved from the extraction layer so the notes can be checked against the original PDF page-by-page.

#### Extract: `conductor/extracted/ปี67_Lecture_2_Review_Python_Lecture_2_Review_Python.pdf.txt`
```text
--- PAGE 1 ---
1
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 2
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
Review Functions
Review Classes
previous knowledge

--- PAGE 3 ---
3
Function
A function is a group of statements 
that has a defined name that is used to 
refer to that group of statements 
so that they can be called. 
The groups of statements that make up 
a function perform a specific task.

--- PAGE 4 ---
Syntax
def functionname(parameter1, parameter2,… ):
statements
Example
def bmiCal(name , weight , height):
bmi = weight / height ** 2
print(’Hello’, name) 
print(’Your BMI is’ , bmi) 
4
Function

--- PAGE 5 ---
5
Function
def Function(n):
i = s = 1
while s < n:
i = i+1
s = s+i
print("*")
Function(20)
1. What’s the result of this program?
2. How many times the command 
“print” running?

--- PAGE 6 ---
6
Classes
Creating a class is an object-oriented 
language's ability to manipulate data to 
solve problems. 
There are two things involved: 
refer to data or store what data (data 
members) and
what operations can be performed 
(member functions or methods).

--- PAGE 7 ---
7
Classes
In python language, a new class is 
created by giving a name and defining 
a method associated with the definition.
Syntax
class classname:
methods
After create class, we create instant or 
object variable to use class.

--- PAGE 8 ---
8
Classes
class Point:
def __init__(self,x_input ,y_input):
self.x = x_input
self.y = y_input
myPoint = Point(3,7)
First method is constructor function.
In Python, constructor is called with 
__init__ (with two underscores).

--- PAGE 9 ---
9
Classes
The three parameters are (self, x_input, 
y_input). 
self is a special parameter that will 
always be used as a reference to the 
object variable. It must always be the 
first parameter. However, it does not 
need to be set when called.

--- PAGE 10 ---
10
Classes
self.x and self.y in the constructor are 
data members of object variable that hold 
an internal data named x and y. 
Parameter values ​are initialized to x and 
y when the object variable is created.

--- PAGE 11 ---
11
Classes 
To create an instance of a Point class 
(or create an object variable), we do by 
taking the name of the class and 
passing it the necessary values 
(note that we do not call __init__ 
directly). 
For example:
myPoint = Point(3,7)

--- PAGE 12 ---
12
Classes
The variable myPoint is an object variable of 
Class Point (it is a instant of Class Point). 
class Point:
def __init__(self,x_input ,y_input):
self.x = x_input
self.y = y_input
def show(self):
print(self.x, ’ , ’ ,self.y)
myPoint = Point(3,7)
myPoint.show()
```

#### Extract: `conductor/extracted/สำเนาของ_2.pdf.txt`
```text
--- PAGE 1 ---
1
DATA STRUCTURES 
AND
ALGORITHMS
Lecture Notes 2
Pradit Pitaksathienkul

--- PAGE 2 ---
2
ROAD MAP
Review Functions
Review Classes
previous knowledge

--- PAGE 3 ---
3
Function
A function is a group of statements 
that has a defined name that is used to 
refer to that group of statements 
so that they can be called. 
The groups of statements that make up 
a function perform a specific task.

--- PAGE 4 ---
Syntax
def functionname(parameter1, parameter2,… ):
statements
Example
def bmiCal(name , weight , height):
bmi = weight / height ** 2
print(’Hello’, name) 
print(’Your BMI is’ , bmi) 
4
Function

--- PAGE 5 ---
5
Function
def Function(n):
i = s = 1
while s < n:
i = i+1
s = s+i
print("*")
Function(20)
1. What’s the result of this program?
2. How many times the command 
“print” running?

--- PAGE 6 ---
6
Classes
Creating a class is an object-oriented 
language's ability to manipulate data to 
solve problems. 
There are two things involved: 
refer to data or store what data (data 
members) and
what operations can be performed 
(member functions or methods).

--- PAGE 7 ---
7
Classes
In python language, a new class is 
created by giving a name and defining 
a method associated with the definition.
Syntax
class classname:
methods
After create class, we create instant or 
object variable to use class.

--- PAGE 8 ---
8
Classes
class Point:
def __init__(self,x_input ,y_input):
self.x = x_input
self.y = y_input
myPoint = Point(3,7)
First method is constructor function.
In Python, constructor is called with 
__init__ (with two underscores).

--- PAGE 9 ---
9
Classes
The three parameters are (self, x_input, 
y_input). 
self is a special parameter that will 
always be used as a reference to the 
object variable. It must always be the 
first parameter. However, it does not 
need to be set when called.

--- PAGE 10 ---
10
Classes
self.x and self.y in the constructor are 
data members of object variable that hold 
an internal data named x and y. 
Parameter values ​are initialized to x and 
y when the object variable is created.

--- PAGE 11 ---
11
Classes 
To create an instance of a Point class 
(or create an object variable), we do by 
taking the name of the class and 
passing it the necessary values 
(note that we do not call __init__ 
directly). 
For example:
myPoint = Point(3,7)

--- PAGE 12 ---
12
Classes
The variable myPoint is an object variable of 
Class Point (it is a instant of Class Point). 
class Point:
def __init__(self,x_input ,y_input):
self.x = x_input
self.y = y_input
def show(self):
print(self.x, ’ , ’ ,self.y)
myPoint = Point(3,7)
myPoint.show()
```

#### Extract: `conductor/extracted/Python_Oop.pdf.txt`
```text
--- PAGE 1 ---
Object-oriented Programming
with Python
SOMCHAI CHEINGPONGPAN
DEPARTMENT OF INFORMATION TECHNOLOGY
FACULTY OF INDUSTRIAL AND TECHNOLOGY MANAGEMENT

--- PAGE 2 ---
Object-oriented Programming with Python
Class and Object
Principles of Object-oriented
การสร้างและใช้งาน Class เบื้องต้น
Constructor
Class แบบEncapsulation
การใช้งานClass แบบ Static
Class แบบ Inheritance 
การเขียนโปรแกรม การท างานแบบStack
2

--- PAGE 3 ---
Class and Object
คลาส (Class) คือ ต้นแบบของวัตถุ(blueprint of object)
การสร้างวัตถุขึ้นมาอย่างหนึ่ง จะต้องสร้างคลาสขึ้นมาเป็น
โครงสร้างต้นแบบส าหรับวัตถุก่อนเสมอ
วัตถุ (Object) คือ วัตถุหรือสิ่งของที่มีอยู่จริงบนโลกเป็นได้ทั้ง
รูปธรรม และนามธรรม วัตถุแต่ละชิ้นสามารถก าหนด
คุณสมบัติเฉพาะของตัวเองได้ ท าให้แต่ละวัตถุมีความแตกต่าง
กัน แต่คุณสมบัติพื้นฐาน ยังได้รับมาจากคลาส หรือแม่แบบ
เหมือนเดิม
3

--- PAGE 4 ---
Class and Object
คลาสในการเขียนโปรแกรม คือการรวบรวมกลุ่มของค าสั่งที่มีความสัมพันธ์กัน 
ซึ่งมีส่วนประกอบ 2 อย่างคือ
คุณลักษณะ (Attribute หรือ Data) คือข้อมูลที่บอกคุณลักษณะทั่วไป หรือ
คุณสมบัติเฉพาะตัวของวัตถุว่ามีข้อมูลอะไรบ้าง 
พฤติกรรม (Behavior หรือ Method) คือ สิ่งที่วัตถุสามารถกระท าออกมาได้
โดยเกี่ยวข้องกับข้อมูล เช่น การค านวณ หารแสดงข้อมูล
 
โดยจะเรียก Attribute และ Behavior ว่าเป็น member ของคลาส
 
การเขียนโปรแกรมเชิงวัตถุ (Object-Oriented Programing : OOP) คือ
แนวคิดการเขียนโปรแกรม ที่มองทุกสิ่งทุกอย่างให้เป็นวัตถุ (object)
4

--- PAGE 5 ---
Principles of Object-oriented
Encapsulation
Inheritance
Polymorphism
5

--- PAGE 6 ---
การสร้างและใช้งาน Class เบื้องต้น
การสร้าง Class ใน Python ใช้ค าสั่ง class ตามด้วยชื่อ Class
ตัวอย่างการสร้าง Class ใน Python:
class Dog:
 def __init__(self):
 self.name = 'Buddy'
 self.age = 3
การสร้าง Object จาก Class ใช้ค าสั่งตามนี้:
my_dog = Dog( ) # instance
6

--- PAGE 7 ---
การสร้างและใช้งาน Class เบื้องต้น
7

--- PAGE 8 ---
Constructor
Constructor เป็นเมธอดตัวหนึ่งภายในคลาส จะท างานโดยอัตโนมัติ
ทันทีหลังจากสร้าง object ในภาษาโปรแกรมอย่าง Java จะเป็นเมธอดที่มี
ชื่อเดียวกับชื่อคลาส แต่ในภาษา Python จะเป็นเมธอดพิเศษที่มีชื่อว่า 
__init__()
 
Constructor ใน Python มี 2 ชนิด คือ
 Constructor แบบไม่มีพารามิเตอร์ (Non-Parameterized Constructor)
 Constructor แบบมีพารามิเตอร์ (Parameterized Constructor)
8

--- PAGE 9 ---
Non-Parameterized Constructor
9

--- PAGE 10 ---
Parameterized Constructor
10

--- PAGE 11 ---
Constructor
ข้อควรระวังในการก าหนด Constructor
 
ในภาษา Python ไม่แนะน าให้มี Constructor อยู่ในคลาสเดียวกัน
มากกว่า 1 ตัวเนื่องจาก Interpreter ของ Python จะเลือกท างานใน 
Constructor ตัวหลังสุดและมีจ านวน parameter ที่มากกว่า
11

--- PAGE 12 ---
Parameterized Constructor
12

--- PAGE 13 ---
Parameterized Constructor
parameter ที่อยู่ใน constructor สามารถก าหนดเป็นค่า default ได้ และเมื่อ
มีการสร้าง object จะระบุค่าที่ส่งไปใน parameter หรือไม่ก็ได้
13

--- PAGE 14 ---
Class แบบ Encapsulation
การห่อหุ้ม (Encapsulation) คือคลาสที่ประกอบตัวแปรและเมธอด โดยมี
การก าหนดสิทธิ์ในการเข้าถึงสมาชิกภายในคลาส ไม่ว่าจะมาจากภายในหรือ
ภายนอกคลาสก็ตาม ท าให้ข้อมูลมีความปลอดภัย และเป็นความลับ
 
ระดับความสามารถในการเข้าถึงตัวแปร และเมธอดในคลาส มี 3 ระดับ คือ
- เข้าถึงตัวแปรและเมธอดได้ทั้งภายในคลาส และภายนอกคลาส
- เข้าถึงตัวแปรและเมธอดได้เฉพาะภายในคลาสตัวเอง และคลาสที่สืบ
ทอดมา
- เข้าถึงตัวแปรและเมธอดได้เฉพาะภายในคลาสตัวเองเท่านั้น
14

--- PAGE 15 ---
Class แบบ Encapsulation
คีย์เวิร์ดที่ใช้ระบุระดับความสามารถในการเข้าถึงตัวแปร และเมธอดของคลาส
ในภาษา Java และ Python
15
ระดับสิทธิ์การเข้าถึง
ภาษา Java
ภาษา Python
เข้าถึงได้ทุกคลาส
public
ไม่มีคีย์เวิร์ด
เข้าถึงได้ในคลาสตัวเอง
และคลาสที่สืบทอด
protected
_ (single underscore)
เข้าถึงได้เฉพาะในคลาสตัวเอง
private
__ (double underscore)

--- PAGE 16 ---
ตังอย่าง Class แบบ Encapsulation 
16

--- PAGE 17 ---
Encapsulation : private accessing
หลักการส าคัญอย่างหนึ่งของ Encapsulation คือ การก าหนดตัวแปร 
หรือเมธอดให้เป็น private เพื่อควบคุมไม่ให้มีการเข้าถึงข้อมูลแบบ 
public แต่ถ้าจะต้องการเข้าถึงตัวแปร หรือเมธอดที่เป็น private ใน
ภาษา Python ก็สามารถท าได้หลายวิธี เช่น
Underscore accessing
Getter & Setter
Property
17

--- PAGE 18 ---
Encapsulation : Underscore accessing
การเรียกชื่อ object เชื่อมด้วยจุด ตามด้วยเครื่องหมาย _ 
(underscore) หน้าชื่อคลาส ต่อด้วย __ (double underscore) 
หน้าชื่อตัวแปร หรือเมธอด
ตัวแปร -> object_name._Class_name__attribute_name
เมธอด -> object_name._Class_name__method_name()
18

--- PAGE 19 ---
ตัวอย่าง Encapsulation : Underscore accessing
19

--- PAGE 20 ---
ตัวอย่าง Encapsulation : Getter & Setter
20
ตัวอย่าง การใช้ Getter & Setter

--- PAGE 21 ---
ตัวอย่าง Encapsulation : Getter & Setter
21

--- PAGE 22 ---
Encapsulation : Property
property คือการสร้าง getter และ setter ในสไตล์ของภาษา 
Python ท าได้ 2 วิธี
ใช้ฟังก์ชัน property() แล้วรับค่าพารามิเตอร์ที่เป็น getter และ 
setter
แอด Decorator ชื่อว่า @property ครอบไว้ด้านบนเมธอดที่เป็น 
getter ส่วนเมธอดที่เป็น setter ให้แอด Decorator เป็นชื่อ 
@method_name.setter ครอบไว้บนเมธอดที่เป็น setter โดยชื่อ
เมธอดจะเหมือนกันทั้ง getter และ setter
22

--- PAGE 23 ---
ตัวอย่าง Encapsulation : Property 1
ตัวอย่าง การเข้าถึงตัวแปร __amount โดยใช้ฟังก์ชัน property()
23

--- PAGE 24 ---
ตัวอย่าง Encapsulation : Property 1
การเข้าถึงตัวแปร __amount โดยใช้ฟังก์ชัน property()
24

--- PAGE 25 ---
ตัวอย่าง Encapsulation : Property 2
ตัวอย่าง การใช้ แอด Decorator property ในไพธอน
25

--- PAGE 26 ---
ตัวอย่าง Encapsulation : Property 2
การใช้ แอด Decorator property ในไพธอน
26

--- PAGE 27 ---
Workshop 1 : Student.py
27

--- PAGE 28 ---
Workshop 1 : Student.py
28

--- PAGE 29 ---
Workshop 1 : WS_student.py
29

--- PAGE 30 ---
Workshop 1 :
30

--- PAGE 31 ---
การใช้งาน Class แบบ Static
Static เป็นวิธีการเรียกใช้งานตัวแปร หรือเมธอด โดยไม่ต้อง
สร้าง object ซึ่งจะใช้งานหน่วยความจ าเฉพาะการท างานในครั้ง
แรกเท่านั้น เมื่อจบการท างานแล้ว จะคืนหน่วยความจ าทันที และ
การใช้งานครั้งต่อไป จะใช้ค่าจากหน่วยความจ าเดิม
 
ควรใช้ static ในกรณีดังต่อไปนี้
- เป็นค่าคงที่ หรือไม่ต้องการเปลี่ยนแปลงค่า
- น าค่าตัวแปร หรือเมธอดไปใช้กับหลายๆ คลาส
31

--- PAGE 32 ---
การใช้งาน Class แบบ Static
ในภาษา Python แอตทริบิวต์ (ตัวแปร) ในคลาส จะเป็น static อยู่
แล้ว สามารถเรียกใช้ผ่าน “ชื่อคลาส.ชื่อตัวแปร” ได้เลย แต่ส าหรับ
เมธอดนั้น ถ้าต้องการก าหนดให้เมธอดใด เป็น static ไม่ต้องใส่ self ไว้
ในพารามิเตอร์ แต่สามารถรับค่าพารามิเตอร์รูปแบบอื่นๆ ได้ตามปกติ
การเรียกใช้งานตัวแปร หรือเมธอดnon-static และ static ภายในคลาส
เรียกใช้งานตัวแปร-> class_name.attribute_name
เรียกใช้งานฟังก์ชั่น-> class_name.method_name();
32

--- PAGE 33 ---
การใช้งาน Static
สรุปการเรียกใช้งานเมธอด non-static และ static กับคลาส
33
การเรียกใช้งาน
เมธอด
ภายในคลาส
ภายนอกคลาส
ไม่เป็น static
ต้องสร้าง object
และเรียกใช้งานผ่าน object
ต้องสร้าง object
และเรียกใช้งานผ่าน object
เป็น static
เรียกชื่อคลาส.ชื่อเมธอด
เรียกชื่อคลาส.ชื่อเมธอด

--- PAGE 34 ---
ตัวอย่างการสร้างและใช้งาน Static
34

--- PAGE 35 ---
ตัวอย่างการสร้างและใช้งาน Static
35

--- PAGE 36 ---
Class แบบ Inheritance
การสืบทอด (Inheritance) คือการที่คลาสลูก(sub class)รับตัวแปรและ
เมธอดมาจากคลาสแม่ (super class) คลาสลูกที่สืบทอดมาจากคลาสแม่ 
จะมีความสามารถ 2 อย่าง
ใช้งานตัวแปร และเมธอดจากคลาสแม่ได้
เพิ่มตัวแปร และเมธอดในคลาสตัวเองได้
 
วิธีการสืบทอดคลาสในภาษา Python จะใช้ชื่อคลาสแม่ ไปอยู่ในวงเล็บ
ต่อท้ายชื่อคลาสลูก และสามารถสืบทอดได้มากกว่า 1 คลาสในเวลา
เดียวกัน
36

--- PAGE 37 ---
Inheritance: การใช้ inheritance ในไพธอน
ตัวอย่าง: Class Person กับ Class Student
37

--- PAGE 38 ---
Inheritance: การใช้ inheritance ในไพธอน
ตัวอย่าง: Class Person กับ Class Student
38

--- PAGE 39 ---
Inheritance : (method overriding)
override คือการท าให้เมธอดของคลาสลูก (sub class) ท างานแตกต่างจาก
เมธอด ของคลาสแม่ (super class) โดยจะมีรูปแบบของเมธอดที่เหมือนกัน ซึ่ง
เรียกแบบ ง่ายๆ ว่า “การเขียนทับ” นั่นเอง ให้ใช้ค าสั่ง super().method_name()
39

--- PAGE 40 ---
Inheritance : (method overriding)
40

--- PAGE 41 ---
การเขียนโปรแกรม การท างานแบบ Stack
Stack (สแตก) เป็นโครงสร้างข้อมูลแบบหนึ่งที่ท างานตามหลักการ LIFO 
(Last In, First Out) หรือ “เข้าหลังออกก่อน” หมายความว่า ข้อมูลที่ถูกเพิ่ม
เข้ามาล่าสุดจะถูกน าออกก่อนเสมอ
 
หลักการท างานของ Stack Stack มีการท างานหลัก ๆ อยู่ 2 อย่างคือ: 
1. Push – การเพิ่มข้อมูลเข้าไปใน Stack 
2. Pop – การน าข้อมูลออกจาก Stack (เอาตัวบนสุดออก) 
นอกจากนี้ยังมีฟังก์ชันเสริมที่มักใช้ร่วมกัน เช่น: 
- size () – ตรวจสอบขนาดของ Stack
- peek (หรือ Top) – ดูค่าบนสุดของ Stack โดยไม่เอาออก 
- isEmpty – ตรวจสอบว่า Stack ว่างหรือไม่ 
41

--- PAGE 42 ---
การเขียนโปรแกรม การท างานแบบ Stack
### ตัวอย่างการท างาน 
สมมุติว่าเรามี Stack ว่างอยู่ แล้วท าการ Push 
ตัวเลขเข้าไปตามล าดับ:
 
Push(1) → Stack: [1]
 
Push(2) → Stack: [1, 2]
 
Push(3) → Stack: [1, 2, 3]
 
ตอนนี้ Stack มีค่า [1, 2, 3] โดยที่ 3 อยู่บนสุด
ถ้าเราท า Pop():
 
Pop() → ได้ค่า 3 → Stack: [1, 2]
42

--- PAGE 43 ---
การเขียนโปรแกรม การท างานแบบ Stack
### การใช้งาน Stack ในชีวิตจริง
- การย้อนกลับ (Undo) ในโปรแกรมต่าง ๆ
- การจัดการวงเล็บในนิพจน์ทางคณิตศาสตร์
- การเรียกใช้ฟังก์ชันแบบซ้อน (Function Call Stack)
- การแปลงเลขฐาน หรือการเดินทางแบบย้อนกลับ (Backtracking)
43

--- PAGE 44 ---
ตัวอย่างการสร้างคลาสStack
44

--- PAGE 45 ---
ตัวอย่างการสร้างคลาส Stack
45

--- PAGE 46 ---
ตัวอย่างการเรียกใช้งานคลาสStack
46

--- PAGE 47 ---
การเขียนโปรแกรม การท างานแบบ Queue
 Queue (คิว) เป็นโครงสร้างข้อมูลที่ท างานตามหลักการ FIFO (First 
In, First Out) หรือ “เข้าแรกออกก่อน” หมายความว่า ข้อมูลที่ถูกเพิ่ม
เข้ามาก่อนจะถูกน าออกก่อนเสมอ
หลักการท างานของ Queue Queue มีการท างานหลัก ๆ อยู่ 2 อย่าง:
1. Enqueue – การเพิ่มข้อมูลเข้าไปที่ท้ายคิว
2. Dequeue – การน าข้อมูลออกจากหัวคิว
นอกจากนี้ยังมีฟังก์ชันเสริมที่มักใช้ร่วมกัน เช่น:
- size () – ตรวจสอบขนาดของ Queue
- peek (หรือ front) – ดูค่าที่หัวคิวโดยไม่เอาออก
- isEmpty* – ตรวจสอบว่าคิวว่างหรือไม่
47

--- PAGE 48 ---
การเขียนโปรแกรม การท างานแบบ Queue
### ตัวอย่างการท างาน
สมมุติว่าเรามี Queue ว่างอยู่ แล้วท าการ Enqueue ตัวเลขเข้าไป
ตามล าดับ:
 
Enqueue(1) → Queue: [1]
 
Enqueue(2) → Queue: [1, 2]
 
Enqueue(3) → Queue: [1, 2, 3]
 
ตอนนี้ Queue มีค่า [1, 2, 3] โดยที่ 1 อยู่หัวคิว
ถ้าเราท า Dequeue():
 
Dequeue() → ได้ค่า 1 → Queue: [2, 3]
48

--- PAGE 49 ---
การเขียนโปรแกรม การท างานแบบ Queue
### การใช้งาน Queue ในชีวิตจริง
- การต่อแถวซื้อของหรือรอรับบริการ
- การจัดการงานในระบบพิมพ์ (Print Queue)
- การส่งข้อมูลในระบบเครือข่าย
- การจ าลองเหตุการณ์ (Simulation) เช่น การจราจร
49

--- PAGE 50 ---
ตัวอย่างการสร้างคลาส Queue
50

--- PAGE 51 ---
ตัวอย่างการสร้างคลาส Queue
51

--- PAGE 52 ---
ตัวอย่างการเรียกใช้คลาส Queue
52
```
