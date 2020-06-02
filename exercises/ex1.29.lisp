(load "./examples/c1.3.1-high-order-function.lisp")
(load "./exercises/libs/math.lisp")

(defun integral(f a b dx)
  (labels 
    ;; Define the local function
    (
      (add_dx (x) ; Function's name and parameters.
        (+ x dx) ; Function's body.
      )
    )
    ;; Use the local function here
    (* 
      (accumulate 
        f
        #'add_dx
        (+ a (/ dx 2.0))
        b
      )
      dx
    )
  )
)

(defun simpon_integral(f a b n)
  (let 
    (
      (h (/ (- b a) n))
    )
    (labels
      (
        (y (k)
          (funcall f (+ a (* k h)))
        )
        (current (k)
          (cond 
            (
              (= k 0) (y k)
            )
            (
              (= k n) (y k)
            )
            (
              (isDivided k 2)
              (* 2 (y k))
            )
            ( 
              (isDivided (+ k 1) 2)
              (* 4 (y k))
            )
          )
        )
        ;; (next (k)
        ;;   (current (+ k 1))
        ;; )
      )
      (*
        (/ h 3)
        (accumulate 
          #'current
          #'add1
          a
          b
        )
      )
    )
  )
)


(print (integral #'cube 0 1 0.001))
(print (simpon_integral #'cube 0 1 1000))
