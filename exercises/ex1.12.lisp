#|
      1
    1   1
   1  2  1
  1  3  3  1
 1  4  6  4  1
1  5 10 10  5  1
Write down a function that use recursive calculating process to 
calculate the Pascal's triangle's element by column and row.
|#


(defun pascal_triangle(row col)
  (cond 
    (
      (= row 1) 1
    )
    (
      (= col 1) 1
    )
    (
      (= row col) 1
    )
    (t 
      (+ 
        (pascal_triangle (- row 1) (- col 1))
        (pascal_triangle (- row 1) col)
      )
    )
  )
)

(print (pascal_triangle 5 3))