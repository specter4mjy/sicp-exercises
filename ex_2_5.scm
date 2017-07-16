(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (factor-times factor num)
  (define (iter n count)
    (if (= (remainder n factor) 0)
        (iter (/ n factor) (+ count 1))
        count))
  (iter num 0))


(define (car x)
  (factor-times 2 x))

(define (cdr x)
  (factor-times 3 x))

; test

(define p (cons 6 23))

(car p)                                 ; 6
(cdr p)                                 ; 23
