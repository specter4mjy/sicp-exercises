(define x (list (list 1 2) (list 3 4))) ; ((1 2) (3 4))

(define (fringe items)
  (if (null? items)
      '()
      (let ((first (car items))
            (remainder (cdr items)))
        (if (pair? first)
            (append (fringe first)
                    (fringe remainder))
            (cons first (fringe remainder))))))

(fringe x)                              ; (1 2 3 4)

(fringe (list x x))                     ; (1 2 3 4 1 2 3 4)
