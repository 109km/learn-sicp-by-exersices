
(defun doubleFn(n)
  (multiply n 2)
)

(defun _half(current left)
  (cond 
    ((= current left) current)
    ((> current left) (_half (- current 1) (+ left 1) ))
    (t current)
  )
)
(defun halfFn(n)
  (_half n 0)
)

(defun remainder(n m)
  (if 
    (< n m) n
    (remainder (- n m) m)
  )
)

(defun isDivided(n m)
  (= (remainder n m) 0)
)

(defun integral(n)
  n
)
(defun square(n)
  (* n n)
)
(defun even(n)
  (= (remainder n 2) 0)
)
(defun cube(n)
  (* n n n)
)

(defun add(a b)
  (+ a b)
)

(defun add1(n)
  (+ n 1)
)

;; Get a rational number's numer
(defun numer(rat)
  (car rat)
)

;; Get a rational number's denominator
(defun denom(rat)
  (cdr rat)
)

;; create a rational number
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