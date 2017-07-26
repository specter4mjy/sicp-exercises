(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (pair? x)
                                       (count-leaves x)
                                       1))
                       t)))

(count-leaves (list 1 2 (list 3 (list 4) 5 (list 6 7)))) ; 7
