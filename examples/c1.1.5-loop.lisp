(defun repeat (n max f)
  (funcall f n)
  (if 
    (< n max) (repeat (+ 1 n) max f)
    (print "loop end")
  )
)

(defun fp (n)
  (print n)
)

(repeat 0 10 #'fp)