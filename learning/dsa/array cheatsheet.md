This is a comprehensive review and reorganization of your notes. I have structured them into a "Cheatsheet" format, added the **"When to Use"** section for each technique, and refined the formatting for better readability.

# Array Algorithmic Techniques Cheatsheet

---

## 1. Prefix Sum
Pre-calculates cumulative totals to allow for $O(1)$ range queries.

### The Logic
For an array $A$, the prefix sum array $P$ is:
$P[i] = P[i-1] + A[i]$



### When to Use
* **Range Sum Queries:** When you need to calculate the sum of elements between indices $L$ and $R$ multiple times.
* **Static Data:** When the underlying array doesn't change frequently (updates are $O(n)$).
* **Keyword:** "Sum of subarray," "Cumulative total," "Range query."

### Range Sum Formula
$$\text{Sum}(L, R) = P[R] - P[L-1]$$
*(If $L=0$, $\text{Sum} = P[R]$)*

---

## 2. Two Pointer Technique
Uses two indices to traverse the data structure, typically reducing $O(n^2)$ problems to $O(n)$.



### Variations & Usage
| Variation | When to Use | Logic |
| :--- | :--- | :--- |
| **Opposite Ends** | **Sorted Arrays.** Finding pairs, reversing arrays, or palindromes. | `left` at 0, `right` at end. Move toward middle. |
| **Fast & Slow** | **Linked Lists.** Detecting cycles or finding the middle element. | `fast` moves 2 steps, `slow` moves 1 step. |
| **Same Direction** | **In-place updates.** Removing duplicates or moving zeros. | Both start at 0; one pointer "filters" while the other "writes." |

### Keywords
* "Sorted array," "Pair sum," "Triplet," "In-place," "Cycle detection."

---

## 3. Sliding Window
A specialized two-pointer technique where the distance between pointers represents a contiguous subsegment.

### Variations & Usage
* **Fixed-Size Window ($K$):** * **When to Use:** When the problem specifies a exact length (e.g., "average of every 5 elements").
    * **Logic:** Maintain a running total; add the "new" element and subtract the "old" one as you slide.
* **Variable-Size Window:**
    * **When to Use:** When seeking the **shortest** or **longest** subarray meeting a condition (e.g., "smallest subarray with sum $\ge S$").
    * **Logic:** Expand `right` to find a valid window; shrink `left` to find the *optimal* window.



### Keywords
* "Contiguous subarray," "Longest/Shortest substring," "Maximum/Minimum sum of size K."

---

## 4. HashMap (Hashing)
Trading space ($O(n)$) for time ($O(1)$) to track frequencies, existence, or indices.

### Problem Patterns
* **Frequency Counting:** Tracking occurrences (e.g., "Top K frequent").
* **Complement Search:** Finding a "partner" value (e.g., Two Sum: `target - current`).
* **Grouping:** Categorizing items by a common key (e.g., Group Anagrams).
* **Optimization:** Reducing $O(n^2)$ searches to $O(1)$ lookups.

### When to Use
* **Unsorted Data:** When Two Pointers isn't an option because sorting isn't allowed or efficient.
* **Distinct Elements:** Finding the first unique character or longest sequence.
* **Keywords:** "Frequencies," "Existence," "Unique," "Check if seen before."

---

## Summary Decision Matrix

| If the problem involves... | Try this first... |
| :--- | :--- |
| **Multiple range sum queries** | Prefix Sum |
| **A sorted array + searching for a pair** | Two Pointers (Opposite Ends) |
| **Contiguous subarray/substring length** | Sliding Window |
| **Frequencies or "Has this been seen?"** | HashMap |
| **Linked list cycle or midpoint** | Two Pointers (Fast & Slow) |
| **Subarray sum equals K (unsorted)** | Prefix Sum + HashMap |

---

### Implementation Refinement: Subarray Sum Equals K
Since you mentioned this high-level pattern, here is a concise Python implementation:

```python
def subarray_sum(nums, k):
    count = 0
    current_sum = 0
    # Map stores {prefix_sum : frequency}
    # Initialize with 0:1 to handle subarrays starting from index 0
    prefix_map = {0: 1}
    
    for x in nums:
        current_sum += x
        # If (current_sum - k) exists, it means a subarray with sum k exists
        if (current_sum - k) in prefix_map:
            count += prefix_map[current_sum - k]
            
        prefix_map[current_sum] = prefix_map.get(current_sum, 0) + 1
        
    return count
```

Does this organized structure help you visualize the differences between these techniques more clearly?
