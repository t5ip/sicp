(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess previous_guess)
  (< (/ (abs (- guess previous_guess)) previous_guess) 0.0001))

(define (cuberoot-iter guess previous_guess x)
  (if (good-enough? guess previous_guess)
      guess
      (cuberoot-iter (improve guess x) guess x)))

(cuberoot-iter 1.0 2.0 27.0)




