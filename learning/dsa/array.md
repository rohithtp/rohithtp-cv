## Prefix Sum

A **Prefix Sum** (also known as a cumulative sum) is a powerful technique used to pre-process an array so that the sum of any subarray (a range of elements) can be calculated in **constant time**, $O(1)$.

Essentially, you create a new array where each element at index $i$ stores the sum of all elements from the original array starting from the beginning up to index $i$.

***

## 1. The Logic

If you have an array $A$ of size $n$, the prefix sum array $P$ is defined as:  
$P[i] = A[0] + A[1] + \dots + A[i]$

Or, more efficiently through recurrence:

- **Base Case:** $P[0] = A[0]$
- **Recursive Step:** $P[i] = P[i-1] + A[i]$



***

## 2. Example Walkthrough

Let's take a sample array and build its prefix sum.

| Index                | 0 | 1 | 2 | 3 | 4  |
| :------------------- | :-- | :-- | :-- | :-- | :-- |
| **Array** **A**      | 3 | 1 | 4 | 1 | 5  |
| **Prefix Sum** **P** | 3 | 4 | 8 | 9 | 14 |

**Calculations:**

- $P[0] = 3$
- $P[1] = 3 + 1 = 4$
- $P[2] = 4 + 4 = 8$
- ...and so on.

***

## 3. Why Use It? (Range Sum Queries)

The primary advantage is calculating the sum of elements between two indices $L$ and $R$ ($sum(L, R)$).

Instead of looping through the array every time—which takes $O(N)$—you can use the formula:  
$\text{Sum}(L, R) = P[R] - P[L-1]$  
*(Note: If* *L=0**, the sum is simply* *P[R]**).*

**Example:** Find the sum of elements from index 2 to 4 in the array above.

- $L = 2, R = 4$
- Using the formula: $P[4] - P[1] \implies 14 - 4 = \mathbf{10}$
- Manual check: $4 + 1 + 5 = \mathbf{10}$

***

## 4. Complexity Analysis

- **Preprocessing Time:** $O(n)$ to build the prefix sum array.
- **Query Time:** $O(1)$ to retrieve any range sum.
- **Space Complexity:** $O(n)$ to store the additional array (though this can be done in-place if you don't need to preserve the original array).

***

## 5. Implementations

```python
def build_prefix_sum(arr):
    n = len(arr)
    prefix_sum = [0] * n
    prefix_sum[0] = arr[0]
    
    for i in range(1, n):
        prefix_sum[i] = prefix_sum[i-1] + arr[i]
        
    return prefix_sum

# Usage
data = [3, 1, 4, 1, 5]
p_sum = build_prefix_sum(data) # [3, 4, 8, 9, 14]
```



```java
public class PrefixSum {
    public static int[] buildPrefixSum(int[] arr) {
        int n = arr.length;
        if (n == 0) return new int[0];

        int[] prefixSum = new int[n];
        prefixSum[0] = arr[0];

        for (int i = 1; i < n; i++) {
            prefixSum[i] = prefixSum[i - 1] + arr[i];
        }
        return prefixSum;
    }

    // Usage example
    public static void main(String[] args) {
        int[] data = {3, 1, 4, 1, 5};
        int[] pSum = buildPrefixSum(data); // [3, 4, 8, 9, 14]
        for (int v : pSum) {
            System.out.print(v + " ");
        }
    }
}

```

## Two Pointer Technique

The **Two Pointer Technique** is one of the most efficient ways to search for pairs or subsegments in a linear data structure (like an array or linked list). It typically reduces a nested loop $O(n^2)$ solution down to a linear $O(n)$ solution.

It works by using two indices (the "pointers") that move through the data independently based on specific conditions.

---

## 1. Common Variations

### A. Opposite Ends (The "Squeeze")
This is used when the array is **sorted**. You place one pointer at the start (`left`) and one at the end (`right`).
* **Scenario:** Finding two numbers that sum to a target (the sorted version of Two Sum).
* **Logic:**
    * If `sum < target`, move the `left` pointer forward to increase the sum.
    * If `sum > target`, move the `right` pointer backward to decrease the sum.
    * If `sum == target`, you found it!



### B. Same Direction (The "Fast and Slow")
Both pointers start at the same side but move at different speeds or intervals.
* **Scenario:** Detecting a cycle in a linked list (Floyd’s Cycle-Finding Algorithm) or finding the middle of a list.
* **Logic:** The `fast` pointer moves two steps while the `slow` pointer moves one. If they ever meet, there is a cycle.

### C. Sliding Window
A specific type of two-pointer technique where the distance between the two pointers represents a "window."
* **Scenario:** Finding the longest substring with unique characters or the smallest subarray with a sum $\ge K$.
* **Logic:** Move the `right` pointer to expand the window and the `left` pointer to contract it when a condition is met.



---

## 2. Code Example: Two Sum (Sorted Array)
If you are given a **sorted** array, the two-pointer approach is more space-efficient ($O(1)$) than a Hash Map.

```python
def two_sum_sorted(nums, target):
    left = 0
    right = len(nums) - 1
    
    while left < right:
        current_sum = nums[left] + nums[right]
        
        if current_sum == target:
            return [left, right]
        elif current_sum < target:
            left += 1  # Need a larger sum
        else:
            right -= 1 # Need a smaller sum
            
    return []
```

---

## 3. When to use Two Pointers?
You should reach for this tool if you see these keywords:
* **Sorted array/list:** This is the biggest hint for the "opposite ends" approach.
* **Pairs or Triplets:** Searching for combinations that meet a criteria.
* **Subarrays:** Looking for a specific range within the data.
* **In-place manipulation:** Removing duplicates from a sorted array without using extra space.

---

## 4. Complexity Analysis
* **Time Complexity:** $O(n)$ — Since each pointer usually traverses the array at most once.
* **Space Complexity:** $O(1)$ — You are only storing two integer variables (the pointers).

## Sliding Window (explained)
The **Sliding Window** technique is a specific variation of the Two-Pointer approach. It is primarily used to convert nested loops ($O(n^2)$) into a single pass ($O(n)$) when dealing with **subarrays** or **substrings**.

Instead of recalculating everything from scratch for every possible range, you "slide" a window across the data, adding one element at the front and removing one from the back.

---

## 1. The Two Types of Windows

### A. Fixed-Size Window
The window size $k$ remains constant. You move the window by adding the next element and subtracting the element that is no longer in the range.

* **Goal:** Find the max sum of any subarray of size $k$.
* **Example:** `[2, 1, 5, 1, 3, 2]`, $k=3$
    * Window 1: `[2, 1, 5]` (Sum = 8)
    * Window 2: `[1, 5, 1]` (Sum = 7) — *We added 1, subtracted 2.*



### B. Variable-Size Window
The window grows or shrinks dynamically based on a condition (like a target sum or a count of unique characters).

* **Goal:** Smallest subarray with a sum $\ge S$.
* **Logic:** 1.  Expand the `right` pointer to add elements.
    2.  Once the condition is met, shrink the `left` pointer to find the "minimum" valid window.



---

## 2. Implementation (Python)
Here is a classic example: **Maximum sum of a subarray of size $K$**.

```python
def max_sum_subarray(arr, k):
    n = len(arr)
    if n < k:
        return -1
    
    # Calculate sum of first window
    window_sum = sum(arr[:k])
    max_val = window_sum
    
    # Slide the window
    for i in range(n - k):
        # Subtract the element leaving, add the element entering
        window_sum = window_sum - arr[i] + arr[i + k]
        max_val = max(max_val, window_sum)
        
    return max_val
```

---

## 3. When to Use It
Look for these "green flags" in a problem description:
* The input is a **linear data structure** (array, string, or linked list).
* You are asked to find a **subsegment** (subarray or substring).
* The problem mentions **longest, shortest, or target sum/length**.

---

## 4. Complexity Comparison

| Feature | Brute Force | Sliding Window |
| :--- | :--- | :--- |
| **Time Complexity** | $O(n \times k)$ or $O(n^2)$ | $O(n)$ |
| **Space Complexity** | $O(1)$ | $O(1)$ (usually) |

## HashMap-based Problems for Arrays
HashMaps (or Dictionaries) are the "cheat code" of array problems. They allow you to trade a little bit of **Space** ($O(n)$) for a massive gain in **Time** ($O(1)$ lookup). 

If you see a problem asking about frequencies, existence, or pairs, a HashMap is likely the answer. Here are the most essential problem patterns you'll encounter.

---

## 1. Frequency Counting
The most basic use: counting how many times each element appears.

* **Problem:** Find the **Top K Frequent Elements**.
* **Logic:**
    1. Iterate through the array and store counts in a HashMap: `{num: count}`.
    2. Sort the map by values or use a Heap to find the top $K$.
* **Time Complexity:** $O(n)$.



---

## 2. Existence & Complement (The "Two Sum" Pattern)
Checking if a value (or its "partner") has been seen before.

* **Problem:** **Two Sum** or **Contains Duplicate**.
* **Logic:** As you traverse, check if `target - current` is in the map. If not, add `current` to the map and move on.
* **Why it works:** It turns a search problem into a lookup problem.

---

## 3. Grouping & Categorization
Using a sorted version or a property of the data as the "Key."

* **Problem:** **Group Anagrams**.
* **Logic:** For an array of strings like `["eat", "tea", "tan", "ate", "nat", "bat"]`:
    1. Sort each string alphabetically (e.g., `"eat"` becomes `"aet"`).
    2. Use the sorted string as a **Key** in your HashMap.
    3. The **Value** is a list of all original strings that match that key.
* **Result:** `{"aet": ["eat", "tea", "ate"], "ant": ["tan", "nat"], "abt": ["bat"]}`.

---

## 4. Subarray Sum Equals K (Prefix Sum + HashMap)
This is a high-level pattern that combines two techniques we've discussed.

* **Problem:** Find the total number of continuous subarrays whose sum equals $k$.
* **Logic:**
    1. Maintain a running `current_sum`.
    2. Store how many times each `prefix_sum` has occurred in a HashMap.
    3. At each step, check if `current_sum - k` exists in the map. If it does, those previous points are the "starts" of valid subarrays.
* **Time Complexity:** $O(n)$ (vs $O(n^2)$ without the map).



---

## 5. Longest Consecutive Sequence
Finding the length of the longest sequence of integers (e.g., `[1, 2, 3, 4]`) in an unsorted array.

* **Problem:** `[100, 4, 200, 1, 3, 2]` $\rightarrow$ Result is 4 (for `1, 2, 3, 4`).
* **Logic:**
    1. Dump all numbers into a **HashSet** for $O(1)$ lookups.
    2. Only start counting a sequence if the number `n-1` is **not** in the set (this ensures you only start at the "beginning" of a sequence).
* **Time Complexity:** $O(n)$.

---

## Summary Table

| Problem Type | HashMap Key | HashMap Value |
| :--- | :--- | :--- |
| **Frequency** | Element | Count |
| **Two Sum** | Element | Index |
| **Anagrams** | Sorted String | List of original strings |
| **Subarray Sum** | Prefix Sum | Occurrences |
| **Longest Seq** | Element | Boolean/Presence |
