
## Evolution overview
- Classic for (Java 1.0): index-based for(initialization; condition; update) — full control, manual indexing.
- Enhanced for / for-each (Java 5, 2004): for(Type item : collection) — simpler iteration over arrays/Iterables, no index access.
- Iterator + remove (Java 1.2 onward): explicit Iterator for safe removal during iteration.
- forEach with Consumer (Java 8, 2014): collection.forEach(item -> ...) — accepts a lambda, concise but still external iteration.
- Streams API (Java 8, 2014): collection.stream().filter(...).map(...).collect(...) — supports declarative, functional-style pipelines, parallel streams, lazy evaluation, and reduction operations.

## Paired examples (imperative → modern)

1) Sum integers in a list
- Classic for (index):
```java
List<Integer> nums = List.of(1,2,3,4,5);
int sum = 0;
for (int i = 0; i < nums.size(); i++) {
    sum += nums.get(i);
}
```
- Enhanced for:
```java
int sum = 0;
for (int n : nums) {
    sum += n;
}
```
- forEach with lambda:
```java
AtomicInteger sum = new AtomicInteger(0);
nums.forEach(n -> sum.addAndGet(n));
int result = sum.get();
```
- Streams (recommended):
```java
int sum = nums.stream().mapToInt(Integer::intValue).sum();
```

2) Filter and collect names starting with "A"
- Classic for:
```java
List<String> names = Arrays.asList("Alice","Bob","Anna","Mark");
List<String> aNames = new ArrayList<>();
for (int i = 0; i < names.size(); i++) {
    String s = names.get(i);
    if (s.startsWith("A")) aNames.add(s);
}
```
- Enhanced for:
```java
List<String> aNames = new ArrayList<>();
for (String s : names) {
    if (s.startsWith("A")) aNames.add(s);
}
```
- forEach:
```java
List<String> aNames = new ArrayList<>();
names.forEach(s -> { if (s.startsWith("A")) aNames.add(s); });
```
- Streams:
```java
List<String> aNames = names.stream()
    .filter(s -> s.startsWith("A"))
    .collect(Collectors.toList());
```

```java
Stream.iterate(0, n -> n + 1)
.filter(n -> n % 2 == 0)
.skip(5)              // skips the first 5 even numbers: 0,2,4,6,8
.limit(5)
.forEach(System.out::println); // prints the next 5 evens: 10,12,14,16,18
//So: skip(5) removes 0–8 (five elements), and limit(5) then prints 10–18 (five elements).
```

```java
import java.util.*;
import java.util.stream.*;

public class SkipEvensExample {
    public static List<Integer> skipFirstNEvens(List<Integer> list, long n) {
        if (list == null) return Collections.emptyList();
        return list.stream()
            .filter(i -> i % 2 == 0)
            .skip(n)
            .collect(Collectors.toList());
    }

    public static void main(String[] args) {
        List<Integer> small = Arrays.asList(0, 1, 3);            // fewer evens
        List<Integer> exact = Arrays.asList(0,2,4,6,8);         // exactly 5 evens
        List<Integer> larger = Arrays.asList(0,1,2,3,4,5,6,7,8,9,10,12,14);

        System.out.println(skipFirstNEvens(small, 5));   // []
        System.out.println(skipFirstNEvens(exact, 5));   // []
        System.out.println(skipFirstNEvens(larger, 5));  // [10,12,14]
    }
}
```

3) Remove elements while iterating (safe removal)
- Classic with index (buggy for Lists):
```java
for (int i = 0; i < list.size(); i++) {
    if (shouldRemove(list.get(i))) list.remove(i); // can skip elements or throw
}
```
- Iterator.remove (correct):
```java
Iterator<Item> it = list.iterator();
while (it.hasNext()) {
    if (shouldRemove(it.next())) it.remove();
}
```
- removeIf (Java 8 — preferred):
```java
list.removeIf(item -> shouldRemove(item));
```

4) Transform objects (map)
- Classic for:
```java
List<User> users = ...;
List<String> emails = new ArrayList<>();
for (int i = 0; i < users.size(); i++) {
    emails.add(users.get(i).getEmail());
}
```
- Enhanced for:
```java
for (User u : users) emails.add(u.getEmail());
```
- Streams:
```java
List<String> emails = users.stream()
    .map(User::getEmail)
    .collect(Collectors.toList());
```

5) Parallel processing
- Classic: manual threads/executors.
- Streams (easy parallelism):
```java
long count = largeList.parallelStream()
    .filter(pred)
    .count();
```

## Guidelines / when to use which
- Use classic for when you need index arithmetic or non-Sequential access.
- Use enhanced for for simple, readable iteration without indexing.
- Use Iterator when you must remove elements during iteration (pre-Java 8).
- Prefer streams for transformations, filtering, mapping, reductions — improves readability and enables parallelism.
- Use forEach with care: it's for side-effects; prefer Streams for pure transformations.
