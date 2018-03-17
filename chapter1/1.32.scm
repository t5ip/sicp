;iterative version
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))

;recursive version
(define (accumulate-recur combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
	 (accumulate-recur combiner null-value term (next a) next b))))

; change iter <=> recur below
(define (accumulate combiner null-value term a next b)
  (accumulate-iter combiner null-value term a next b))

(define (identity x)
  x)

(define (inc n)
  (+ n 1))

(define (factorial n)
  (accumulate * 1 identity 1 inc n))

(factorial 5)

(define (sum-integers a b)
  (accumulate + 0 identity a inc b))

(sum-integers 1 10)



