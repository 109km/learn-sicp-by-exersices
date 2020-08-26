# Y Combinator

## Background

The lambda calculus has only 3 rules:

```js
x    // Defination of an argument
t t  // Application of a function
λx.t // Defination of a function
```

Now here's the problem: how do we express recursion only using these 3 rules ?

In lambda calculus, we can't use keywords like `define` `defun` and so on.

We must think out a way that a function without name can call itself.

## Plan

Let's see an exmpale first:

```lisp
(define length
  (lambda (ls)
    (if
      ((null? ls) 0)
      (add1 (length (cdr ls)))
    )
  )
)
```

We find that in this example there's a function's name `length` is used.

So how do we replace this name with something else?

**Answer is using the function by an argument.**

### Step1: Replace

Replace the `define` to `lambda`. And replace the function's name `length` to the argument of this lambda.

```lisp
(lambda (length)
  (lambda (ls)
    (if
      ((null? ls) 0)
      (add1 (length (cdr ls)))
    )
  )
)
```

### Step2: Copy

Copy the whole lambda function. Make this copy as the argument.

Pass itself to itself.

```lisp
(
  (lambda (length)
    (lambda (ls)
      (if
        ((null? ls) 0)
        (add1 (length (cdr ls)))
      )
    )
  )
  (lambda (length)
    (lambda (ls)
      (if
        ((null? ls) 0)
        (add1 (length (cdr ls)))
      )
    )
  )
)
```

### Step3: Fix

The argument `length`'s argument should be itself.

This is the so called "poor man's Y", because this could only be used to this situation.

And our target is to find a pattern which can be used for every situation.

```lisp
(
  (lambda (length)
    (lambda (ls)
      (if
        ((null? ls) 0)
        (add1 ((length length) (cdr ls)))
      )
    )
  )
  (lambda (length)
    (lambda (ls)
      (if
        ((null? ls) 0)
        (add1 ((length length) (cdr ls)))
      )
    )
  )
)
```

### Step4: Extract Patterns

Notice this part of code has three self-applications, one outer and two inner.

```lisp
(lambda (length)
  (lambda (ls)
    (if
      ((null? ls) 0)
      (add1 ((length length) (cdr ls)))
    )
  )
)
```

First, let's extract the pattern which does the outer self-application. Now the inner self-application has one left: `(length length)`.

```lisp
(
  (lambda (u)
    (u u)
  )
  (lambda (length)
    (lambda (ls)
      (if
        ((null? ls) 0)
        (add1 ((length length) (cdr ls)))
      )
    )
  )
)
```

Second, let's abstract the inner self-application.

```lisp
(
  (lambda (u)
    (u u)
  )
  (lambda (length)
    (lambda (g)
      (lambda (ls)
        (if
          ((null? ls) 0)
          (add1 (g (cdr ls)))
        )
      )
    )
    (length length)
  )
)
```

The abstractions are very similar: add another abstraction level and pass the argument.

### Step5: CBV and CBN

If a language is call-by-value, the code `(length length)` will cause non-termination. Because call-by-value will calculate the argument's value before passing to the function's body. So `(length length)` will apply itself forever.

On the other hand, if a language is call-by-name, the code will work. Because it will just pass the argument to function's body without any calculation.

So the code can be changed with Eta-expansion if the language is CBV:

```lisp
(
  (lambda (u)
    (u u)
  )
  (lambda (length)
    (lambda (g)
      (lambda (ls)
        (if
          ((null? ls) 0)
          (add1 (g (cdr ls)))
        )
      )
    )
    (lambda (v)
      ((length length) v)
    )
  )
)
```

### Step 6: Extract the last uncurrent part

We can find that the last uncurrent part is:

```lisp
(lambda (g)
  (lambda (ls)
    (if
      ((null? ls) 0)
      (add1 (g (cdr ls)))
    )
  )
)
```
Again, let's add another level of abstraction: make it become an argument.

```lisp
(
  (lambda (f)
    (lambda (u)
      (u u)
    )
    (lambda (length)
      (f
        (lambda (v)
          ((length length) v)
        )
      )
    )
  )
  (lambda (g)
    (lambda (ls)
      (if
        ((null? ls) 0)
        (add1 (g (cdr ls)))
      )
    )
  )
)
```

Now we can see the commond part and rename the argument:

```lisp
(lambda (f)
  (
    (lambda (u)
      (u u)
    )
    (lambda (x)
      (f
        (lambda (v)
          ((x x) v)
        )
      )
    )
  )
)
```

Let's expand it to a familiar version:

```lisp
;; call-by-value version
(lambda (f)
  ((lambda (x) (f (lambda (v) ((x x) v))))
   (lambda (x) (f (lambda (v) ((x x) v)))))
)
```

```lisp
;; call-by-name version
(lambda (f)
  ((lambda (x) (f (x x)))
   (lambda (x) (f (x x))))
)
```
