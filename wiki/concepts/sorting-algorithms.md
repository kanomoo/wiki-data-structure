---
type: concept
tags: [data-structure, algorithm, sorting]
created: 2026-05-15
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 9 Sorting/Lecture 9 Sorting.pdf]
---

# Concept: Sorting Algorithms

Sorting is the process of arranging data in a specific order (ascending or descending).

## 1. Simple $O(n^2)$ Sorts
These algorithms are intuitive but inefficient for large datasets.

### Bubble Sort
Repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. 
- **Best Case**: $O(n)$ (already sorted).
- **Worst/Average Case**: $O(n^2)$.

### Selection Sort
Divides the list into a sorted and unsorted part. Repeatedly picks the smallest element from the unsorted part and moves it to the end of the sorted part.
- **Complexity**: Always $O(n^2)$ because it always scans the remaining unsorted part.

### Insertion Sort
Takes one element at a time and "inserts" it into its correct position relative to the elements already sorted.
- **Efficiency**: Very fast for nearly sorted data.
- **Manual Tracing Tip**: On each pass $i$, the element at index $i$ is moved left until it finds its spot.

## 2. Advanced Sorts (Preview)
- **Quicksort**: A divide-and-conquer algorithm. Uses a **Pivot** to partition the array. Average complexity $O(n \log n)$.
- **Merge Sort**: Recursively splits the array in half, sorts them, and merges them back together. Guaranteed $O(n \log n)$.

## Learning Materials
- **Lecture**: [[Lecture-9-Sorting|Lecture 9 Sorting]]
- **Deep Dive**: [[Lecture-9.1|Lecture 9.1]] (Advanced Sorting)
- **Visual Examples**:
    - Bubble: `raw/Data structure/ปี67/Lecture 9 Sorting/For Example Bubble sort.pdf`
    - Selection: `raw/Data structure/ปี67/Lecture 9 Sorting/For Example Selection sort.pdf`
    - Insertion: `raw/Data structure/ปี67/Lecture 9 Sorting/Short note Insertion sort.pdf`

## Detailed Concept Expansion

Sorting algorithms rearrange data into order, but each algorithm has a different movement pattern. The course emphasis is not only final sorted output, but also trace states after each pass.

### Mental Model
Bubble sort moves large items right through adjacent swaps. Selection sort selects the next smallest item. Insertion sort grows a sorted prefix by shifting items to insert a key.

### Invariants and Rules
- Bubble: after pass k, the largest k items are fixed at the end.
- Selection: before pass i, positions before i contain the sorted smallest values.
- Insertion: before inserting index i, the prefix before i is sorted.
- In-place versions use constant extra memory.

### Implementation Patterns
Bubble sort uses nested loops and adjacent comparisons. Selection sort tracks min index in the unsorted suffix. Insertion sort stores key, shifts larger elements right, then writes key into the gap.

### Complexity and Trade-offs
Bubble, selection, and insertion are O(n^2) average/worst in the basic forms. Insertion can be O(n) on nearly sorted input. Selection uses O(n) swaps, while bubble/insertion may move many adjacent items.

### Practice and Exam Checklist
- Record array after each pass exactly as requested.
- Do not confuse swaps in selection with shifts in insertion.
- Mention stability if asked: insertion and bubble can be stable; selection is typically not stable.
- For code, check loop bounds carefully.

### Source Connections
- [[Lecture-9-Sorting|Lecture 9 Sorting]]
- [[Lecture-9.1|Lecture 9.1 Sorting Notes]]
- [[Test-Program-2-Sorting|Test Program 2 Sorting]]
