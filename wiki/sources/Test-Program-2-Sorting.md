---
type: source
tags: [test, sorting, performance]
created: 2026-05-16
updated: 2026-05-16
sources: [raw/Data structure/ปี67/Test Program 2_ Sorting/]
---

# Source: Test Program 2 - Sorting

## Summary
A practical assessment involving the implementation and performance comparison of basic sorting algorithms: **Bubble Sort**, **Selection Sort**, and **Insertion Sort**.

## Implementation Details

### 1. Selection Sort Logic
Finds the minimum element from the unsorted part and puts it at the beginning.
```python
def selection_sort(arr):
    n = len(arr)
    for i in range(n):
        min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
```

### 2. Insertion Sort Logic
Builds the sorted array one item at a time by "inserting" it into its correct position.
```python
def insertion_sort(arr):
    for i in range(1, len(arr)):
        key = arr[i]
        j = i - 1
        while j >= 0 and key < arr[j]:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
```

### 3. Comparison of $O(n^2)$ Sorts
| Algorithm | Best Case | Average | Worst Case | Swaps |
|-----------|-----------|---------|------------|-------|
| Bubble    | $O(n)$    | $O(n^2)$ | $O(n^2)$    | Many  |
| Selection | $O(n^2)$  | $O(n^2)$ | $O(n^2)$    | Few ($O(n)$) |
| Insertion | $O(n)$    | $O(n^2)$ | $O(n^2)$    | Many  |

## Complexity/Trade-offs
- **Selection Sort** is preferred when memory writes (swaps) are expensive because it only performs $O(n)$ swaps.
- **Insertion Sort** is extremely efficient for small datasets or arrays that are already "mostly sorted".

## Related Pages
- [[sorting-algorithms|Sorting Algorithms Concept]]
- [[Lecture-9-Sorting|Main Sorting Lecture]]
- [[Practice-Implementation-Guide|Practice Implementation Guide]]
