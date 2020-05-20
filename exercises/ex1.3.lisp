(defun summax (a b c)
  (cond 
    (
      (and (> a b)(> b c)) (print (+ a b))
    )
    (
      (and (> a b)(> c b)) (print (+ a c))
    )
    (
      (and (> b a)(> c a)) (print (+ b c))
    )
  )
)

(summax 6 2 3)