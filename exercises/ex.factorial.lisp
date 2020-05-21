(defun _factorial(sum next target)
  (if 
    (> next target) sum
    (_factorial 
      (* sum next)
      (+ next 1)
      target
    )
  )
)

(defun factorial(n)
  (_factorial 1 2 n)
)