
(load "./libs/prime.lisp")

(defun timed_prime_test(n)
  (print n)
  (start_prime_test n (get-internal-real-time))
)

(defun start_prime_test(n start_time)
  (print "start")
  (if 
    (prime? n) (report_prime start_time)
    (print "It's not a prime.")
  )
)

(defun report_prime(start_time)
  (print "end")
  (print (- (get-internal-real-time) start_time))
)

(timed_prime_test 6)