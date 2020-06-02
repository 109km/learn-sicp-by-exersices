(load "./examples/c1.3.1-high-order-function.lisp")

(defun cube(n)
  (* n n n)
)

(defun integral(f a b dx)
  (labels 
    (
      (add_dx (x)
        (+ x dx)
      )
    )
    (* 
      (accumulate 
        f 
        (+ a (/ dx 2.0))
        add_dx
        b
      )
      dx
    )
  )
)

(print (integral #'cube 0 1 0.01))
