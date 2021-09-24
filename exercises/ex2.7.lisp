(defun make-interval(a b)
  (cons a b)
)

(defun lower-bound(x)
  (min (car x) (cdr x))
)

(defun upper-bound(x)
  (max (car x) (cdr x))
)

(defun add-interval(x y)
  (make-interval
    (+ (lower-bound x) (lower-bound y))
    (+ (upper-bound x) (upper-bound y))
  )
)

(defun mul-interval(x y)
  (let 
    (
      (p1 (* (lower-bound x) (lower-bound y)))
      (p2 (* (lower-bound x) (upper-bound y)))
      (p3 (* (upper-bound x) (lower-bound y)))
      (p4 (* (upper-bound x) (upper-bound y)))
    )
    (make-interval
      (min p1 p2 p3 p4)
      (max p1 p2 p3 p4)
    )
  )
)
(defun divide-interval(x y)
  (mul-interval 
    x
    (make-interval
      (/ 1.0 (upper-bound y))
      (/ 1.0 (lower-bound y))
    )
  )
)
(defun sub-interval(x y)
  (let 
    (
      (p1 (- (lower-bound x) (lower-bound y)))
      (p2 (- (lower-bound x) (upper-bound y)))
      (p3 (- (upper-bound x) (lower-bound y)))
      (p4 (- (upper-bound x) (upper-bound y)))
    )
    (make-interval
      (min p1 p2 p3 p4)
      (max p1 p2 p3 p4)
    )
  )
)

(defun width(x)
  (/ 2.0 (- (upper-bound x) (lower-bound x)))
)