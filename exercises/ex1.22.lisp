
(defun timed_prime_test(n)
  (print "\n")
  (print n)
  (start_prime_test n (runtime))
)

(defun start_prime_test(n start_time)
  (if (prime? n)
    (report_prime (- (runtime) start_time))
  )
)

(defun report_prime(elapsed_time)
  (print " *** ")
  (print elapsed_time)
)

(print (timed_prime_test 1999))