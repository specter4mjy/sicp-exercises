; recursive version

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))


; iterative version

(define (f n)
  (define (iter a b c count)
    (if (= count 0)
        a
        (iter (+ a
                 (* 2 b)
                 (* 3 c))
              a
              b
              (- count 1))))
  (if (< n 3)
      n
      (iter (f 2) (f 1) (f 0) (- n 2))))
