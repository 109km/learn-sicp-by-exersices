(defun A(x y)
  (cond 
    ((= y 0) 0)
    ((= x 0) (* 2 y))
    ((= y 1) 2)
    (t 
      (
        A (- x 1) (A x (- y 1))
      )
    )
  )
)
(print (A 2 2))
