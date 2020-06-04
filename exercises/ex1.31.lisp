;;;; Write a function called `product` which calculate
;;;; the result of `f(a) * f(a2) * f(a3)... * f(b)`.
;;;; Finish the function in iterative and recursive ways.
(load "./exercises/libs/math.lisp")

;; This function looks like is a recursive way,
;; but it's tail recurtion.
(defun product_recursive(f next a b)
  (if 
    (> a b) 1 ; Multiply 1 won't change the result.
    (* 
      (funcall f a)
      (product_recursive
        f
        next
        (funcall next a)
        b
      )
    )
  )
)
(defun product_iterative(f next a b)
  (labels 
    (
      (iter 
        (a result)
        (if (> a b) result
          (iter 
            (funcall next a)
            (* 
              (funcall f a) 
              result
            )
          )
        )
      )
    )
    (iter a 1)
  )
)

(defun product_pi(x)
  (labels
    (
      (item_pi (n)
        (if 
          (even n) (/ n (+ n 1))
          (/ (+ n 1) n)
        )
      ) 
    )
    (* 
      2
      (product_iterative #'item_pi #'add1 1 x)
    )
  ) 
)

(print (product_iterative #'integral #'add1 1 5))
(print (product_recursive #'integral #'add1 1 5))
(print (product_pi 20))