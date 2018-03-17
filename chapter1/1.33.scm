;iterative version
(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(cond ((filter a) (iter (next a) (combiner result (term a))))
	      (else (iter (next a) (combiner result null-value))))))
  (iter a null-value))

(define (identity x)
  x)

(define (inc n)
  (+ n 1))

(define (prime? n)
  (cond ((= n 1) true)
	(else (fast-prime? n 100))))

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

(define (sum-of-squares-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(sum-of-squares-primes 1 50)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-of-relative-primes n)
  (define (relative-prime? i)
    (= 1 (gcd i n)))
  (filtered-accumulate relative-prime? * 1 identity 1 inc n))

(product-of-relative-primes 6)




