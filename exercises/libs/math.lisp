
(defun doubleFn(n)
  (multiply n 2)
)

(defun _half(current left)
  (cond 
    ((= current left) current)
    ((> current left) (_half (- current 1) (+ left 1) ))
    (t current)
  )
)
(defun halfFn(n)
  (_half n 0)
)

(defun remainder(n m)
  (if (< n m) n
    (remainder (- n m) m)
  )
)

(defun even(n)
  (= (remainder n 2) 0)
)