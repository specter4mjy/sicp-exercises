(define (cubic a b c)
  (lambda (x)
    (+ (expt x 3)
       (* a (square x))
       (* b x)
       c)))
