(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder2 a b))))

(define (remainder2 a b)
  (display a) (newline)
  (remainder a b))

(gcd 206 40)

