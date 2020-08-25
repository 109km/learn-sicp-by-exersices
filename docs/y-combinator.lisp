;; Y = lambda y . (lambda x. y (x x)) (lambda x. y (x x))
;; (defun fib(n)
;;   (if (< n 3)
;;     n
;;     (+ 
;;       (fib (- n 1))
;;       (fib (- n 2))
;;     )
;;   )
;; )

;; (
;;   (lambda (fn)
;;     (lambda (n)
;;       (if 
;;         (< n 3)
;;         1
;;         (+
;;           (
;;             fn (- n 1)
;;           )
;;           (
;;             fn (- n 2)
;;           )
;;         )
;;       )
;;     )
;;   )
;;   (lambda (fn)
;;     (lambda (n)
;;       (if 
;;         (< n 3)
;;         1
;;         (+
;;           (
;;             fn (- n 1)
;;           )
;;           (
;;             fn (- n 2)
;;           )
;;         )
;;       )
;;     )
;;   )
;; )