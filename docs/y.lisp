(
  (lambda (length)
    (lambda (ls)
      (if
        ((null? ls) 0)
        (add1 ((length length) (cdr ls)))
      )
    )
  )
  (lambda (length)
    (lambda (ls)
      (if
        ((null? ls) 0)
        (add1 ((length length) (cdr ls)))
      )
    )
  )
)