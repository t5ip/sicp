(define (* a b)
  (display b) (newline)
  (cond ((= b 0) 0) 
	((even? b) (* (double a) (halve b)))
	(else (+ a (* a (- b 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(* 1023 31)