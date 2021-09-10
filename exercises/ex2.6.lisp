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
(defun add-one(n)
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
  (add-one #'one)
)

(defun add1(x)
  (+ x 1)
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
      (add-one #'zero) 
      #'add1
    )
    0
  )
)
