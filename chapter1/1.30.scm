(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube x)
  (* x x x))

(define (simpsons-rule f a b n)
  (define (h)
    (/ (- b a) n))
  (define (simpsons-next k)
    (+ k 1))
  (define (simpsons-common-term k)
    (* (/ (h) 3) (f (+ a (* k (h))))))
  (define (simpsons-term k)
    (cond ((= k 0) (simpsons-common-term k))
	  ((= k n) (simpsons-common-term k))
	  ((even? k) (* 2 (simpsons-common-term k)))
	  (else (* 4 (simpsons-common-term k)))))
  (sum simpsons-term 0 simpsons-next n))
  
(simpsons-rule cube 0.0 1.0 100000) 


