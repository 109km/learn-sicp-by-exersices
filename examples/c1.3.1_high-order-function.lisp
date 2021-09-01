(defun integer2(n) 
  n
)

(defun add1(n)
  (+ n 1)
)
(defun cube(n)
  (* n n n)
)

(defun accumulate(fn next a b)
  (if (> a b)
    0
    (+
      (funcall fn a) 
      (accumulate
        fn
        next
        (funcall next a)
        b
      )
    )
  )
)

(defun sum_interger(a b)
  (accumulate #'integer2 #'add1 a b)
)

(defun sum_cube(a b)
  (accumulate #'cube #'add1 a b)
)