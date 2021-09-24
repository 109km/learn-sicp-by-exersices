(defvar list1 (list 1 2 3 4))

(print list1)

;; Get the nth element of the list
(defun list-ref(lst n)
  (if (= n 0)
    (car lst)
    (list-ref (cdr lst) (- n 1))
  )
)

;; Calculate a list's length
(defun lst-length(lst)
  (if (null lst)
    0
    (+ 1 (lst-length (cdr lst)))
  )
)

(print (list-ref list1 1))
(print (lst-length list1))