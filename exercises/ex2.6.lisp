(defun zero()
  (lambda (f)
    (lambda (x)
      x
    )
  )
)

;; `f` can be any action
;; `n` is the function of number
;; (n f) means do action `f` for `n` times
;; so `add1` means one more `f`
(defun add1(n)
  (lambda (f)
    (lambda (x) 
      (print x)
      (funcall 
        f 
        (funcall 
          (funcall (funcall n) f)
          x
        )
      )
    )
  )
)

(defun one()
  (lambda (f)
    (lambda (x)
      (funcall f x)
    )
  )
)

(defun two()
  (add1 #'one)
)

(defun my-add(m n)
  (lambda (f)
    (lambda (x)
      (print x)
      (funcall 
        (funcall (funcall m) f)
        (funcall (funcall (funcall n) f) x)
      )
    )
  )
)


(print 
  (funcall 
    (funcall
      (add1 #'zero) 
      #'add1
    )
    0
  )
)
