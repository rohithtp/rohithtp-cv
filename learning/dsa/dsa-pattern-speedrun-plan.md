This DSA plan is designed for efficiency. Instead of grinding hundreds of random problems, you will master **16 core patterns**. By learning the "keyword triggers" and the standard template for each, you can solve most interview questions by simply adapting the base logic.

### 🚀 The Speedrun Strategy
1.  **Template First:** For each pattern, write the generic boilerplate code (e.g., the `while right < len(s):` loop for Sliding Window) from memory.
2.  **Keyword Recognition:** If you see "Shortest Path" in an unweighted graph, your brain should immediately scream **BFS**.
3.  **Variant Speedrun:** Solve the first 2 problems in each category slowly to understand the "why." Then, try to outline the logic for the rest in under 10 minutes each.

---

## 🛠️ DSA Pattern Roadmap

### 1. Sliding Window
* **Keywords:** Contiguous, Substring, Subarray, Longest/Shortest, "at most k".
* [**#3** Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
* [**#76** Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)
* [**#424** Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/)
* [**#904** Fruit Into Baskets](https://leetcode.com/problems/fruit-into-baskets/)

### 2. Two Pointers
* **Keywords:** Sorted array, Pair sum, Triplets, Move inward, In-place modification.
* [**#11** Container With Most Water](https://leetcode.com/problems/container-with-most-water/)
* [**#15** 3Sum](https://leetcode.com/problems/3sum/)
* [**#167** Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
* [**#42** Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)

### 3. Binary Search
* **Keywords:** Sorted/Monotonic, First/Last occurrence, Search space, Minimize the maximum.
* [**#33** Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/)
* [**#153** Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/)
* [**#875** Koko Eating Bananas](https://leetcode.com/problems/koko-eating-bananas/)
* [**#1011** Capacity To Ship Packages Within D Days](https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/)

### 4. Hashing + Prefix Sum
* **Keywords:** Subarray sum equals K, Frequency, Fast lookup, Running total.
* [**#1** Two Sum](https://leetcode.com/problems/two-sum/)
* [**#49** Group Anagrams](https://leetcode.com/problems/group-anagrams/)
* [**#560** Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/)
* [**#128** Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/)

### 5. Monotonic Stack
* **Keywords:** Next Greater Element, Previous Smaller, Histogram, Maintain increasing/decreasing order.
* [**#739** Daily Temperatures](https://leetcode.com/problems/daily-temperatures/)
* [**#503** Next Greater Element II](https://leetcode.com/problems/next-greater-element-ii/)
* [**#84** Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/)
* [**#901** Online Stock Span](https://leetcode.com/problems/online-stock-span/)

### 6. Heap (Top K)
* **Keywords:** Kth smallest/largest, Priority, Stream of data, Median.
* [**#215** Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array/)
* [**#347** Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/)
* [**#703** Kth Largest Element in a Stream](https://leetcode.com/problems/kth-largest-element-in-a-stream/)
* [**#295** Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/)

### 7. Intervals
* **Keywords:** Overlap, Merge, Meeting rooms, Sort by start time.
* [**#56** Merge Intervals](https://leetcode.com/problems/merge-intervals/)
* [**#57** Insert Interval](https://leetcode.com/problems/insert-interval/)
* [**#435** Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/)
* [**#252** Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)

### 8. BFS / DFS / Backtracking
* **Keywords:** Shortest path, Level order, All combinations, Permutations, Grid traversal.
* [**#102** Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/)
* [**#200** Number of Islands](https://leetcode.com/problems/number-of-islands/)
* [**#994** Rotting Oranges](https://leetcode.com/problems/rotting-oranges/)
* [**#46** Permutations](https://leetcode.com/problems/permutations/)

### 9. Trees
* **Keywords:** Subtree, Recursive structure, Depth/Height, Lowest Common Ancestor.
* [**#104** Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)
* [**#236** Lowest Common Ancestor of a Binary Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/)
* [**#543** Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree/)
* [**#124** Binary Tree Maximum Path Sum](https://leetcode.com/problems/binary-tree-maximum-path-sum/)

### 10. Dynamic Programming (Basics)
* **Keywords:** Overlapping subproblems, "Way to...", Max/Min profit, Memoization vs. Tabulation.
* [**#70** Climbing Stairs](https://leetcode.com/problems/climbing-stairs/)
* [**#198** House Robber](https://leetcode.com/problems/house-robber/)
* [**#322** Coin Change](https://leetcode.com/problems/coin-change/)
* [**#300** Longest Increasing Subsequence](https://leetcode.com/problems/longest-increasing-subsequence/)

---

> **Pro Tip:** When you get stuck, don't look at the solution immediately. Search for the **pattern name + LeetCode number** on YouTube to see how the "template" is applied to that specific variant.This markdown file organizes the patterns, keywords, and LeetCode links for easy tracking.

### 💡 How to use this plan:
1.  **Phase 1 (The Blueprint):** For each category, search for a "standard template" (e.g., the standard BFS while-loop).
2.  **Phase 2 (The Deep Dive):** Solve the first two problems of each section to see how the template fits.
3.  **Phase 3 (The Speedrun):** For the remaining problems, don't code them fully. Instead, write the **pseudocode** and the **key transition logic** on a whiteboard or notepad. If you can identify the pattern and the "trick" in under 5 minutes, you’ve mastered that variant.

### 🧩 Visualizing the Logic
To help you recognize these patterns during an interview, keep these mental models in mind:


**Sliding Window:** Think of a camera lens zooming in and out on an array to find the perfect frame.


**Binary Search:** Think of "high-low" guessing games where every wrong guess eliminates half the possibilities.


**Monotonic Stack:** Think of a line of people where each person can only see the next person taller than them.


**Dynamic Programming:** Think of a decision tree where you "save" the result of branches you've already walked down so you never have to walk them again.
