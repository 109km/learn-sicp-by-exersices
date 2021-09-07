(defvar x (cons 1 2))
(defvar y (cons 3 4))
(defvar z (cons x y))


(print (car x))
(print (cdr y))

(print (car (car z)))


;; Construct rational number with cons
(defun make-rat(n d)
  (let 
    ((g (gcd n d)))
    (cons (/ n g) (/ d g))
  )
)

(defun numer(rat)
  (car rat)
)

(defun denom(rat)
  (cdr rat)
)

(defun print-rat(rat)
  (terpri)
  (princ (numer rat))
  (princ "/")
  (princ (denom rat))
)

(print-rat
  (make-rat 1 2)
)