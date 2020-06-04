
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
  (if 
    (< n m) n
    (remainder (- n m) m)
  )
)

(defun isDivided(n m)
  (= (remainder n m) 0)
)


(defun square(n)
  (* n n)
)
(defun even(n)
  (= (remainder n 2) 0)
)

(defun cube(n)
  (* n n n)
)