(defvar list1 (list 1 2 3 4 5))

(defun last-pair(lst)
  (if (null (cdr lst)) 
    (car lst)
    (last-pair (cdr lst))
  )
)

(print (last-pair list1))