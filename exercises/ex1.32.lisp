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

