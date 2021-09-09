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
  (add1 #'zero)
)

(defun two()
  (add1 #'one)
)

(defun my-add(m n)
  (lambda (f)
    (lambda (x)
      (print x)
      (funcall 
        (funcall m f)
        (funcall (funcall n f) x)
      )
    )
  )
)


(print 
  (funcall
    (funcall 
      (my-add #'one #'two)
      #'add1
    )
    1
  )
  
)
