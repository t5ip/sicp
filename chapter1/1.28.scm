(define (prime? n)
  (fast-prime? n 100))

(define (square-and-test c n)
  (cond ((= c (- n 1)) (square c))
	 ((= c 1) 1)
	 (else 
	  (cond ((= 1 (remainder (square c) n)) 0)
		(else (square c))))))

(define (expmod base exp m n)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square-and-test (expmod base (/ exp 2) m n) n)
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m n))
		    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((miller-rabin-test n) (fast-prime? n (- times 1)))
	(else false)))

(prime? 6601)
(prime? 1319)
(prime? 7919)







