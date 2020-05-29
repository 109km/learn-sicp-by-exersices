
(defun sum_interger(n)
  n
)
(defun sum_interger_next(n)
  (+ n 1)
)

(defun accumulate(fn next a b)
  (if (> a b)
    0
    (+ (fn a) (fn (next a) b))
  )
)

(print (accumulate (function sum_interger) (function sum_interger_next) 1 10))