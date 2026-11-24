# Coding answers

In a coding round the candidate talks while they write. The answer mirrors that: what I'm going to do, the code, the one step that matters, the cost.

**Language:** the one the user names, else the profile's `style.codeLanguage`, else their main programming skill. SQL questions get SQL.

## Template

> One or two sentences of approach, spoken. If there's an obvious brute force, name it in a clause: "Brute force is two loops, O(n²); a hash map makes it one pass."

```
the solution
```

> One or two sentences walking through the key step (not every line).
> Time O(..), space O(..). One edge case I'd mention: <empty input / duplicates / overflow / nulls>.

## Style that reads well in an interview, any language

- A single function with a clear signature; no main, imports or class boilerplate unless asked or the language needs it.
- Meaningful names (`left`, `right`, `seen`, `counts`), not `a`, `b`, `temp2`.
- The standard library's usual structures: hash map, set, deque, heap.
- No comments except one where the trick isn't obvious.
- About 20 lines at most. If a full solution genuinely needs more, write it, but keep the talking short.

Language notes:
- **Java**: Java 17+ where it reads better (`var`, records, enhanced switch, `List.of`); `HashMap`, `ArrayDeque` (not `Stack`), `PriorityQueue`; program to interfaces.
- **Python**: idiomatic and short: `collections.Counter`, `defaultdict`, `deque`, `heapq`; comprehensions when clearer; type hints on the signature.
- **JavaScript / TypeScript**: `const`/`let`, `Map` and `Set` over plain objects for lookups, types on the signature in TypeScript.
- **C#**: LINQ only where it's clearer than a loop; `Dictionary`, `HashSet`, `Queue`.
- **Go**: plain loops, maps and slices, explicit error returns.
- **C++**: `unordered_map`, `vector`, references for parameters, `auto` where obvious.

## Example

**Q: Find the first non-repeating character in a string.** (Python)

> I'll count every character in one pass, then walk the string again and return the first one whose count is one.

```python
from collections import Counter

def first_unique(s: str) -> str | None:
    counts = Counter(s)
    for ch in s:
        if counts[ch] == 1:
            return ch
    return None
```

> The second pass goes over the string, not the counts, so I keep the original order for free.
> Time O(n), space O(k) for k distinct characters. If it's only lowercase letters, a fixed array of 26 does the same with less overhead.

## Other kinds of code questions

- **SQL**: standard SQL, uppercase keywords, short aliases, one query unless the question needs steps. Window functions (`ROW_NUMBER`, `DENSE_RANK`) for "Nth highest" and "latest per group". Mention the index that would make it fast when performance is part of the question.
- **Framework code** (Spring, Django, Express, .NET, React, Angular...): show only the class, method or component that answers the question, in the style the candidate's version uses. Name the one thing being tested (dependency array, transaction boundary, validation, error handler).
- **Concurrency**: the language's high-level tools over raw threads; say what's shared and how it's protected.
- **Scripts and automation** (Bash, PowerShell, Python): short, safe defaults (`set -euo pipefail`, quoting), and say how you'd test it.

## Output, not lecture

If the user only pastes a problem, give the template above and stop. A deeper explanation, other approaches or test cases only when they ask.
