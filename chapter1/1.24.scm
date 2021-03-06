(define (prime? n)
  (fast-prime? n 100))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))
      
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  #t)

(define (search-for-primes n count)
  (prime-search n 0 count))

(define (prime-search n found-count count)
  (cond ((= found-count count) 0)
	((even? n) (prime-search (+ n 1) found-count count))
	((timed-prime-test n) (prime-search (+ n 1) (+ found-count 1) count))
	(else (prime-search (+ n 1) found-count count))))

(search-for-primes 10000000000000 3)


























