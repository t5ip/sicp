;iterative version
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))

;recursive version
(define (product-recur term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product-recur term (next a) next b))))

(define (product term a next b)
  (product-recur term a next b))

(define (inc n)
  (+ n 1))

(define (identity n)
  n)

(define (factorial n)
  (product identity 1 inc n)) 

(factorial 10)

(define (wallis-pi n)
  (define (wallis-nom-term k)
    (cond ((= k 0) 2)
	  ((even? k) (+ k 2))
	  (else (+ k 2 1))))
 (define (wallis-denom-term k)
    (cond ((= k 0) 3)
	  ((even? k) (+ k 2 1))
	  (else (+ k 2))))
 (* 4.0 (/ (product wallis-nom-term 0 inc n)
	   (product wallis-denom-term 0 inc n))))

(wallis-pi 10000)




