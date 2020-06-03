;;;; Rewrite the accumulate function in iterative way.
(defun accumulate-iterative(fn next a b)
  (labels
    (
      (iter (a result)
        (if 
          (> a b) 0
          (iter (funcall fn a) (+ a result))
        )
      )
    )
    (iter a 0)
  )
)