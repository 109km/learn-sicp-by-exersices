;; if n < 3 f(n) = n
;; if n >= 3 f(n) = f(n-1) + 2f(n-2) + 3f(n-3)
;; Write the recursive calculating solution and iterative solution way.


;; Just translate the rules to code.
(defun f_recurse(n)
  (if 
    (< n 3) n
    (+ (f_recurse (- n 1)) (* 2 (f_recurse (- n 2))) (* 3 (f_recurse (- n 3))) )
  )
)

;; This process is defined by 4 parameters.
(defun _f_iteration_loop(n1 n2 n3 count)
  (if 
    (= count 2) n1 ;; This round is actually calculating f(n+1), so n1 = f(n)
    (_f_iteration_loop
      (+ n1 (* 2 n2) (* 3 n3))
      n1
      n2
      (- count 1)
    )
  )
)

(defun f_iteration(n)
  (if
    (< n 3) n
    (_f_iteration_loop 2 1 0 n) 
  )
)

(print (f_iteration 4))