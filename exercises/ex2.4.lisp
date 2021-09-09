(load "./exercises/libs/math.lisp")

;; Return a function that can do something to x,y
(defun consFn(x y)
  (lambda (m)
    (funcall m x y)
  )
)

;; Receive a function and pass a lambda to this function,
;; this lambda receives two params and only returns the first.
(defun carFn (z)
  (funcall z 
    (lambda (p q) p)
  )
)

;; Receive a function and pass a lambda to this function,
;; this lambda receives two params and only returns the second.
(defun cdrFn (z)
  (funcall z 
    (lambda (p q) q)
  )
)

(print 
  (carFn (consFn 1 2))
)
(print 
  (cdrFn (consFn 1 2))
)