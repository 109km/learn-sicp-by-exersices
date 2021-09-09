(load "./exercises/libs/math.lisp")


(defun zero()
  (lambda (f)
    (lambda (x) x)
  )
)

(defun add1(n)
  (lambda (f)
    (lambda (x) 
      (funcall f (funcall (funcall n f) x))
    )
  )
)

(defun one()
  (lambda (f)
    (lambda (x)
      (funcall f (funcall f x))
    )
  )
)

(print 
  (funcall 
    (funcall 
      (funcall #'zero) 
      100
    )
    0
  ) 
)
;; (print (add-one #'one))
