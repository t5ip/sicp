(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (carmichael-number-or-prime? n)
  (define (carmichael-test n test)
    (cond ((= test n) true)
	  ((= (expmod test n n) test) (carmichael-test n (+ test 1)))
	  (else false)))
  (carmichael-test n 0))

(carmichael-number-or-prime? 561)
(carmichael-number-or-prime? 1105)
(carmichael-number-or-prime? 1729)
(carmichael-number-or-prime? 2465)
(carmichael-number-or-prime? 2821)
(carmichael-number-or-prime? 6601)
  
