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


(load "./ex.factorial.lisp")

(defun pascal_triangle_recursive(row col)
  (cond 
    (
      (= row 0) 1
    )
    (
      (= col 0) 1
    )
    (
      (= row col) 1
    )
    (t 
      (+ 
        (pascal_triangle_recursive (- row 1) (- col 1))
        (pascal_triangle_recursive (- row 1) col)
      )
    )
  )
)




#|
  The Pascal triangle has another formula:
  f(row,col) = row! / (col! * (row-col)! )

  We can create a function that use iterative calculating process with it.
|#

(defun pascal_triangle_iterative (row col)
  (/
    (factorial row)
    (*
      (factorial col)
      (factorial (- row col))
    )
  )
)

(print (pascal_triangle_iterative 6 3))
(print (pascal_triangle_recursive 6 3))