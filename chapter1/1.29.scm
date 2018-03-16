(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (cube x)
  (* x x x))

(define (simpsons-rule term a b n)
  (define (h)
    (/ (- b a) n))
  (define (simpsons-next x)
    (+ x (h)))
  (define (simpsons-common-term x)
    (* (/ (h) 3) (term x)))
  (define (simpsons-term x)
    (cond ((= x a) (simpsons-common-term x))
	  ((= x b) (simpsons-common-term x))
	  ((even? (round (/ (- x a) (h)))) (* 2 (simpsons-common-term x)))
	  (else (* 4 (simpsons-common-term x)))))
  (sum simpsons-term a simpsons-next b))
  
(simpsons-rule cube 0.0 1.0 1000) 






