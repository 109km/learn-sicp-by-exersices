;;;; Expand the calculating process in normal-order.
;;;; How many times that the function remainder are excuted?

(load "./libs/math.lisp")

(defun gcdFn(a b)
  (if (= b 0)
    a
    (gcdFn b (remainder a b))
  )
)
