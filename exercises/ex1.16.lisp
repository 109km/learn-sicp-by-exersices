;;;; Define a process which calculate power using iterative way

(defun square(n)
  (* n n)
)
(defun _power_iteration(b m n sum)
  (cond 
    (
      (= n 0) 1 ; power = 0
    )
    (
      (= m n) sum ; got the final result
    )
    (
      (or
        (< (* m 2) n)
        (= (* m 2) n)
      ) (_power_iteration b (* m 2) n (square sum))
    )
    (
      (> (* m 2) n) (_power_iteration b (+ m 1) n (* sum b))
    )
  )
)
(defun power_iteration(b n)
  (_power_iteration b 1 n b)
)

(print (power_iteration 2 1))
