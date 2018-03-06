(define (mul a b c)
  (display b) (newline)
  (cond ((= b 0) c) 
	((even? b) (mul (double a) (halve b) c))
	(else (mul a (- b 1) (+ a c)))))

(define (* a b)
  (mul a b 0))

(define (even? n)
  (= (remainder n 2) 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(* 13 13)
