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

(defun add2(x)
  (+ x 2)
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
      (add-one #'two) ;; return a function of three times
      #'add2 ;; excute `add2` for 3 times
    )
    0 ;; initial value is 0
  )
)
