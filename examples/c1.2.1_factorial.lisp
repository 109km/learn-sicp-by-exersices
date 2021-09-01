#|
Recursive process can be split into two phases:
  1. Expansion phase. In this phase compiler just expand the expression and don't excute it.
  2. Excution phase. In this phase compiler will replace all the arguments with the real data 
     and do the computation.

The core concept here is ** how a complex process can be divided to many repeatable process' 
until the process can't be divided. **

So before the excution phase, the computer is just repeating the same process and maintain 
all the processes' order in stack.

This philosophy is a TOP-DOWN way: decompose complex things into simple things.
|#

(defun factorial_recursive(n)
  (if 
    (= n 1) 1
    (* n (factorial_recursive (- n 1)))
  )
)
(print (factorial_recursive 5))


#|
Iterative process is a plat linear process, it has only one phase.
In this way, the program runs from the beginning to the end step by step.

The core concept here is ** how a simple process can progress to a complex one that reaches the goal. **

This philosophy is a DOWN-TOP way: reach the goal by simple steps.
|#

(defun factorial_iterative(result counter max)
  (if 
    (<= counter max) (factorial_iterative (* result counter) (+ 1 counter) max)
    result
  )
)

(print (factorial_iterative 1 1 5))