;;;; Rewrite the accumulate function in iterative way.

(load "./exercises/libs/math.lisp")

(defun accumulate-iterative(fn next a b)
  (labels
    (
      (iter (a result)
        (if 
          (> a b) result
          (iter (funcall next a) (+ (funcall fn a) result))
        )
      )
    )
    (iter a 0)
  )
)

(print (accumulate-iterative #'cube #'add1 1 10))