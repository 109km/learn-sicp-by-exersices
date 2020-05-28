;;;; Define a process which only use plus to calculate multiply

(defun multiply(a b)
  (if (or (= a 0) (= b 0))
    0
    (+ a (multiply a (- b 1)))
  )
)

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
(defun fast_expt(b n)
  (cond 
    ((= n 0)
      1
    )
    ((= n 1)
      b
    )
    (
      (and (> n 1) (even n))
      (fast_expt 
        (multiply b b)
        (halfFn n)
      )
    )
    (t
      (* 
        (fast_expt 
          (multiply b b)
          (halfFn n)
        )
        b
      )
    )
  )
)


;; (print (multiply 2 3))
;; (print (halfFn 7))
(print (fast_expt 2 4))