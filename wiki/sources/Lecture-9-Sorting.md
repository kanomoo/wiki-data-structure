---
type: source
tags: [sorting, comparison-sort, implementation]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Lecture 9 Sorting/Lecture 9 Sorting.pdf]
---

# Source: Lecture 9 - Sorting Algorithms

## Summary
Introduction to comparison-based sorting algorithms, covering their logic, Python implementations, and performance characteristics.

## Implementation Details

### 1. Insertion Sort
Best for small or nearly sorted arrays.
```python
def insertion_sort(a):
    for p in range(1, len(a)):
        tmp = a[p]
        j = p
        while j > 0 and tmp < a[j - 1]:
            a[j] = a[j - 1]
            j -= 1
        a[j] = tmp
```

### 2. Selection Sort
Efficient in terms of memory writes (swaps).
```python
def selection_sort(arr):
    n = len(arr)
    for i in range(n):
        min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        if min_idx != i:
            arr[i], arr[min_idx] = arr[min_idx], arr[i]
```

### 3. Bubble Sort
Repeatedly steps through the list, compares adjacent elements and swaps them if they are in the wrong order.
```python
def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
```

## Complexity Analysis

| Algorithm | Best Case | Average | Worst Case | Space |
|-----------|-----------|---------|------------|-------|
| Insertion | $O(n)$    | $O(n^2)$ | $O(n^2)$    | $O(1)$ |
| Selection | $O(n^2)$  | $O(n^2)$ | $O(n^2)$    | $O(1)$ |
| Bubble    | $O(n)$    | $O(n^2)$ | $O(n^2)$    | $O(1)$ |

## Related Pages
- [[sorting-algorithms|Sorting Concept Deep-Dive]]
- [[Test-Program-2-Sorting|Practice Assessment]]
- [[Lecture-9.1|Advanced Sorts (Next Lecture)]]
