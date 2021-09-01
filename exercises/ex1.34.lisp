;;;; Write a function called `accumulate`
;;;; (accumulate combiner null-value term next a b)
(load "./exercises/libs/math.lisp")

(defun f(g)
  (funcall g 2)
)

;; (print (f #'square))

;; (print 
;;   (f 
;;     (lambda 
;;       (z)
;;       (* z (+ z 1))
;;     )
;;   )
;; )

(f #'f) ;; `f` needs a function as a parameter. So (f 2) goes error.
