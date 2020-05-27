When `x` is small enough: `sin x ≈ x`, and

`sin x = 3 * sin x/3 - 4 * (sin x/3)^3`

Here we have code below:

```lisp
(defun cube(x)
  (* x x x)
)

(defun p(x)
  (- (* 3 x) (* 4 (cube x)))
)

(defun sine(angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))
  )
)
```

1. How many times `p` will be used when calculating `(sine 12.15)` ?
2. What are the orders of space and time when calculating `(sine a)` ?


Answer1: the question can be converted to how many times 12.15 divide 3.0 will be smaller than 0.1 ?
It's 5.

```
times | num
1     | 12.15
2     | 4.05
3     | 1.35
4     | 0.45
5     | 0.15
6     | 0.05
```

Answer2:

In each `sine`, cause the `a` will be divided by 3.0, so the order of time and the order of space are `O(logN)`.

This is the outermost process. And in each `sine`,there will be one `p`, and in each `p` there will be one `cube`.

Fortunately, the space and time orders of `cube` are `O(1)`, so the  the space and time orders of `p` are `O(1)`.

So we can have the conclusion that the space and time orders of `sine` are `O(logN * 1) = O(logN)`.

Things will change if the `sine`'s some sub-process' order of time or space is not `O(1)`. Let's assume the time order of `cube` is `O(n)`, the time order of `sine` will be `O(n * logN)`
