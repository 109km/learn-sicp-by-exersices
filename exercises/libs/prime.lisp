
(load "./libs/math.lisp")

(defun find_divisor(n test_divisor)
  (cond 
    ;; n is the divisor of itself
    (
      (> (square test_divisor) n)
      n
    )
    ;; n can be divided by test_divisor
    (
      (isDivided test_divisor n)
      test_divisor
    )
    ;; keep finding
    (t
      (find_divisor n (+ test_divisor 1))
    )
  
  )
)

(defun smallest_divisor(n)
  (find_divisor n 2)
)

(defun prime(n)
  (= n (smallest_divisor n))
)
