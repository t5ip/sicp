(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n a)
  (cond ((> (square a) n) n)
        ((divides? n a) a)
	(else (find-divisor n (+ a 1)))))

(define (divides? a b)
  (= (remainder a b) 0))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
