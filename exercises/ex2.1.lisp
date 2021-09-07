;;;; Write a more common function `make-rat` that can handle
;;;; positive numbers and negative numbers.

(defun make-rat(n d)
  (let
    (
      (sign 1)
      (pn n)
      (pd d)
    )
    (cond 
      (
        (= d 0)
        (error "Denominator can't be zero")
      )
      (
        (and (< n 0) (> d 0))
        (setq pn (* n -1))
        (setq sign -1)
      )
      (
        (and (> n 0) (< d 0))
        (setq pd (* d -1))
        (setq sign -1)
      )
      (
        (and (< n 0) (< d 0))
        (setq pd (* d -1))
        (setq pn (* n -1))
      )
    )
    (let 
      (
        (g (gcd pn pd))
      )
      (cons (* sign (/ pn g)) (/ pd g))
    )
  )
)
(print (make-rat 2 -3))
