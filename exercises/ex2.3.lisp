;;;; Fulfill an expression of rectangle

(load "./exercises/libs/math.lisp")
(load "./exercises/ex2.2.lisp")

;; Construct a rectangle by two adjacent sides.
;; `side` is different from `segment`
(defun make-rectangle(side-left side-bottom)
  (cons side-left side-bottom)
)
;; Construct a rectangle by two opposite sides. 
(defun make-rectangle-v2(side-top side-bottom)
  (cons 
    (make-segment 
      (make-point (x-point (make-start side-top)) (y-point (make-start side-top)))
      (make-point (x-point (make-start side-bottom)) (y-point (make-start side-bottom)))
    ) 
    side-bottom
  )
)

;; 
(defun rectangle-left(rectangle)
  (car rectangle)
)

(defun rectangle-bottom(rectangle)
  (cdr rectangle)
)

(defun segment-length (segment)
  (let 
    (
      (x1 0)
      (x2 0)
      (y1 0)
      (y2 0)
    )
    (setq x1 (x-point (make-start segment)))
    (setq x2 (x-point (make-end segment)))
    (setq y1 (y-point (make-start segment)))
    (setq y2 (y-point (make-end segment)))
    (sqrt 
      (+ 
        (square (- x1 x2))
        (square (- y1 y2))
      )
    )
  )
)

(defun area-rectangle(rectangle)
  (* 
    (segment-length (rectangle-left rectangle))
    (segment-length (rectangle-bottom rectangle))
  )
)
(defun circumference-rectangle(rectangle)
  (* 
    2
    (+ 
      (segment-length (rectangle-left rectangle))
      (segment-length (rectangle-bottom rectangle))
    )
  )
)

(print 
  (area-rectangle 
    (make-rectangle 
      (make-segment (make-point 0 0) (make-point 0 1))
      (make-segment (make-point 0 0) (make-point 5 0))
    )
  )
)

(print 
  (area-rectangle 
    (make-rectangle-v2 
      (make-segment (make-point 0 2) (make-point 2 2))
      (make-segment (make-point 0 0) (make-point 2 0))
    )
  )
)