;;;; 
;;;; make-segment start-segment end-segment

(load "./exercises/libs/math.lisp")

;; `start` and `end` must be `point`
(defun make-segment (start end)
  (cons start end)
)

(defun make-start (segment)
  (car segment)
)

(defun make-end (segment)
  (cdr segment)
)

(defun make-point(x y)
  (cons x y)
)

(defun x-point (point)
  (car point)
)

(defun y-point (point)
  (cdr point)
)

(defun midpoint-segment(segment)
  (let
    (
      (mid-x 0)
      (mid-y 0)
    )
    (setq mid-x
      (halfFn 
        (+ 
          (x-point (make-start segment))
          (x-point (make-end segment)) 
        )
      )
    )
    (setq 
      mid-y
      (halfFn 
        (+ 
          (y-point (make-start segment))
          (y-point (make-end segment)) 
        )
      )
    )
    (cons mid-x mid-y)
  )
)

(print (midpoint-segment (make-segment (make-point 0 0) (make-point 2 3))))
