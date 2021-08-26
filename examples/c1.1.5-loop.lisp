(defun repeat (start end f)
  (funcall f start)
  (if 
    (< start end) (repeat (+ 1 start) end f)
  )
)

(defun fp (n)
  (print n)
)

(repeat 1 10 #'fp)