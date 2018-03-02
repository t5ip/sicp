(define (pascal row col)
  (cond ((= row 1) 1)
        ((= row 2) 1)
	((= col row) 1)
	((= col 1) 1)
	((<= col row) (+ (pascal (- row 1) (- col 1)) 
	   (pascal (- row 1) col)))))

(pascal 14 7)
