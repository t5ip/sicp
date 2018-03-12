(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n a)
  (cond ((> (square a) n) n)
        ((divides? n a) a)
	(else (find-divisor n (+ a 1)))))

(define (divides? a b)
  (= (remainder a b) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

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

      
