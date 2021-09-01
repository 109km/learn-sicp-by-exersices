(defun square(x)
  (* x x)
)

(defun sum-of-square(x y)
  (+ (square x) (square y))
)

(print (square 5))
(print (sum-of-square 5 6))

