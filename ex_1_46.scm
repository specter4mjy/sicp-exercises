(define (iterative-improve good-enough? improve-guess)
  (lambda (guess)
    (let ((improved-guess (improve-guess guess)))
      (if (good-enough? guess improved-guess)
          improved-guess
          ((iterative-improve good-enough?
                              improve-guess)
           improved-guess)))))

(define (sqrt x)
  ((iterative-improve (lambda (guess improved-guess)
                        (< (abs (- (square improved-guess) x)) 0.001))
                      (lambda (guess)
                        (/ (+ guess (/ x guess)) 2)))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (guess improved-guess)
                        (< (abs (- improved-guess guess)) 0.00001))
                      f)
   first-guess))

(sqrt 9)

(fixed-point cos 1.0)
