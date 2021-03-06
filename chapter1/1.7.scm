(define (average x y)
  (/ (+ x y) 2.0))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess previous_guess)
  (< (/ (abs (- guess previous_guess)) previous_guess) 0.0001))

(define (sqrt-iter guess previous_guess x)
  (if (good-enough? guess previous_guess)
      guess
      (sqrt-iter (improve guess x) guess x)))

(sqrt-iter 1 2 (* 2.123E-29 2.123E-29))




