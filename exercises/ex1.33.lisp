;;;; Write a function called `accumulate`
;;;; (accumulate combiner null-value term next a b)
(load "./exercises/libs/math.lisp")

(defun filter(termA)
  (if 
    (> termA 500 ) 1
    0
  )
)

(defun filtered_accumulate_recursive(combiner null-value term next a b filter)
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

(defun filtered_accumulate_iterative(combiner null-value term next a b filter)
  (labels 
    (
      (iter 
        (a result)
        (if 
          (> a b) result
          (iter
            (funcall next a)
            (if 
              (> (funcall filter (funcall term a)) 0) 
              (funcall combiner
                (funcall term a)
                result
              )
              result
            )
          )
        )
      )
    )
    (iter a null-value)
  )
)

(print (filtered_accumulate_iterative #'add 0 #'cube #'add1 1 10 #'filter))
