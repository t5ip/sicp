(define (iter-exp b n a)
  (display a) (newline)
  (cond  ((= n 0) a)
	 ((even? n) (iter-exp (square b) (/ n 2) a))
	 (else (iter-exp b (- n 1) (* a b)))))

(define (even? n)
  (= (remainder n 2) 0))

(iter-exp 2 13 1)


