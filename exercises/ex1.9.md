
用代换模型展示这两个过程在求值 (+ 4 5)时，所产生的计算过程。这些计算过程是迭代还是递归？

```lisp
(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))
  )
)

// 第一步带入参数
(define (+ 4 5)
  (if (= 4 0)
    5
    (inc (+ (dec 4) 5))
  )
)
// 迭代2
(define (+ 3 5)
  (if (= 3 0)
    5
    (inc (+ (dec 3) 5))
  )
)
// 迭代3
(define (+ 2 5)
  (if (= 2 0)
    5
    (inc (+ (dec 2) 5))
  )
)
// 迭代4
(define (+ 1 5)
  (if (= 1 0)
    5
    (inc (+ (dec 1) 5))
  )
)

// 这一步结果是5
(define (+ 0 5)
  (if (= 0 0)
    5
    (inc (+ (dec 0) 5))
  )
)

// 向上返回4次
// inc 执行4次
(inc 5)
(inc 6)
(inc 7)
(inc 8)
// 最终结果是9


// 过程2
(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))
  )
)

(define (+ 4 5)
  (if (= a 0)
    5
    (+ (dec 4) (inc 5))
  )
)

(define (+ 3 6)
  (if (= a 0)
    6
    (+ (dec 3) (inc 6))
  )
)

(define (+ 2 7)
  (if (= a 0)
    7
    (+ (dec 2) (inc 7))
  )
)

(define (+ 1 8)
  (if (= a 0)
    8
    (+ (dec 1) (inc 8))
  )
)

(define (+ 0 9)
  (if (= a 0)
    9
  )
)
```

两个过程分别展开后可以看到第一个计算过程是递归，第二个计算过程是迭代。