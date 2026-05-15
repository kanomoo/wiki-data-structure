---
type: concept
tags: [data-structure, algorithm, sorting]
created: 2026-05-15
updated: 2026-05-15
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
