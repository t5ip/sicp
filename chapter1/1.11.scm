;recursive function
(define (recur-f n)
  (if (< n 3)
   n
   (+ (recur-f (- n 1)) (+ (* 2 (recur-f (- n 2))) (* 3 (recur-f (- n 3)))))))

(recur-f 26)

;iterative function

(define (iter-f-2 n sum sum1 sum2 counter)
  (cond ((= counter n) sum)
  ((= counter 0) (iter-f-2 n 1 0 0 (+ counter 1)))
  ((= counter 1) (iter-f-2 n 2 1 0 (+ counter 1)))
  (else (iter-f-2 n (+ sum (* 2 sum1) (* 3 sum2)) sum sum1 (+ counter 1)))))

(define (iter-f n)
  (iter-f-2 n 1 0 0 0))

(iter-f 26)
  

