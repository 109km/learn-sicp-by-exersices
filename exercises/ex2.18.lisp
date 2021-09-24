(defvar list1 (list 1 2 3 4 5))

(defun reverse-lst(lst)
  (let 
    (
      (result nil)
    )
    (labels 
      (
        (next (nlst)
          (if (null nlst)
            result
            (
              (setq result (cons (car nlst) result))
              (next (cdr nlst))
            )
          )
        )
      )
      (next lst) 
    )
  )
)

(print (reverse-lst list1))