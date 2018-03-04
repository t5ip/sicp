(define (iter-exp b n a)
  (display a) (newline)
  (cond  ((= n 1) a)
	 ((even? n) (iter-exp (square b) (/ n 2) (square b)))
	 (else (* b (iter-exp b (- n 1) a))))) 

(define (even? n)
  (= (remainder n 2) 0))

(iter-exp 5 24 1)


