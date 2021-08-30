;;;; Write a function called `accumulate`
;;;; (accumulate combiner null-value term next a b)
(load "./exercises/libs/math.lisp")

(defun accumulate_recursive(combiner null-value term next a b)
  (if 
    (> a b) null-value
    (funcall 
      combiner
      (funcall term a)
      (accumulate_recursive 
        combiner 
        null-value 
        term 
        next 
        (funcall next a) 
        b
      )
    )
  )
)

(defun accumulate_iterative(combiner null-value term next a b)
  (labels 
    (
      (iter 
        (a result)
        (if 
          (> a b) result
          (iter
            (funcall next a)
            (funcall 
              combiner
              (funcall term a)
              result
            )
          )
        )
      )
    )
    (iter a null-value)
  )
)

(print (accumulate_iterative #'add 0 #'cube #'add1 1 10))
(print (accumulate_recursive #'add 0 #'cube #'add1 1 10))
