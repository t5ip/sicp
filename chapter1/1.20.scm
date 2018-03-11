(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder2 a b))))

(gcd 1024 24)

(define (remainder2 a b)
  (display a) (newline)
  