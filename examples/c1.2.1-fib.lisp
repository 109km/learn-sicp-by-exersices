(defun fib_recurse(n)
  (cond 
    ((= n 0) 0)
    ((= n 1) 1)
    (t 
      (+
        (fib_recurse (- n 1))
        (fib_recurse (- n 2))
      )
    )
  )
  
)
;; (print (fib_recurse 10))


(defun _fib_iteration_inner(n1 n2 count)
  (if 
    (= count 0) (+ n1 n2)
    (_fib_iteration_inner (+ n1 n2) n1 (- count 1))
  )
)

(defun fib_iteration(n)
  (_fib_iteration_inner 1 0 (- n 2))
)

(print (fib_iteration 11))