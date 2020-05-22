(defun largest_denomination(kinds_of_coins)
  (cond
    ((= kinds_of_coins 1) 1)
    ((= kinds_of_coins 2) 5)
    ((= kinds_of_coins 3) 10)
    ((= kinds_of_coins 4) 25)
    ((= kinds_of_coins 5) 50)
  )
)

(defun _change_coins_by_amount_and_coins(amount kinds_of_coins)
  (cond 
    ((= amount 0) 1)
    (
      (or (< amount 0) (= kinds_of_coins 0))
      0
    )
    (t
      (+
        (_change_coins_by_amount_and_coins amount (- kinds_of_coins 1)) ; the ways of amout in kinds_of_coins - 1
        (_change_coins_by_amount_and_coins ; the ways of (amount - one_denomination_of_coin) in kinds_of_coins
          (- amount (largest_denomination kinds_of_coins))
          kinds_of_coins
        )
      )
    )
  )
)

(defun count_change(amount)
  (_change_coins_by_amount_and_coins amount 5)
)

(print (count_change 100))