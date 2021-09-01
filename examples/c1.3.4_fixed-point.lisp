(defconstant tolerance 0.00001)

(defun fixed-point(f first-guess)
  (let 
    ((next 0))
    (labels
      (
        (close-enough? (v1 v2)
          (< (abs (- v1 v2)) tolerance)
        )
        (try (guess)
          (setq next (funcall f guess))
          (labels 
            (
              (next (funcall f guess))
            )
            (if (close-enough? guess next)
              next
              (try next)
            )
          )
        )
      )
      (try first-guess)
    )
  ) 
)
(print (fixed-point #'cos 1.0))
