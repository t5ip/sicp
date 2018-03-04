(define (iter-exp b n a)
  (cond  ((= n 1) a)
	 ((even? n) (iter-exp b (/ n 2) (square a))) 
	 (else (iter-exp b (- n 1) b))))

(define (even? n)
  (= (remainder n 2) 0))

(iter-exp 15 5 1)

