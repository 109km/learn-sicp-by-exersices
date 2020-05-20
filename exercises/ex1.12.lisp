;; if n < 3 f(n) = n
;; if n >= 3 f(n) = f(n-1) + 2f(n-2) + 3f(n-3)
;; 写出递归计算过程和迭代计算过程

(defun f_recurse(n)
  (if 
    (< n 3) n
    (+ (f_recurse (- n 1)) (* 2 (f_recurse (- n 2))) (* 3 (f_recurse (- n 3))) )
  )
)


(defun _f_iteration_loop(n1 n2 n3 count)
  (if 
    (= count 2) n1 ;; 此时的已经进入 f(n+1)的计算，所以n1就是f(n)的值
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