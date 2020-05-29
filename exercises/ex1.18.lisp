;;;; Define a process to calculate two integer's multiplication
;;;; based on doubleFn/half/plus, and its time complexity is O(logN).


(load "./ex1.17.lisp")


(defun _multiplyFn(a1 b a sum)
  (cond 
    (
      (= a1 a) sum
    )
    (
      (> a1 a) (- sum b)
    )
    (
      (< a1 a) (_multiplyFn (doubleFn a1) b a (doubleFn sum))
    )
  )
)

(defun multiplyFn(a b)
  (cond 
    (
      (or (= a 0) (= b 0))
      0
    )
    (t
      (_multiplyFn 1 b a b)
    )
  )
)

(print (multiplyFn 7 5))