(load "./exercises/libs/math.lisp")


(defun zero(n)
  (lambda (x) x)
)

(print (zero 1))