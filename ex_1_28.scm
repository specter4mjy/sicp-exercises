(define (square-and-nontrivial-test n m)
  (if (and (not (= n 1))
           (not (= n (- m 1)))
           (= (remainder (square n) m) 1))
      0
      (square n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square-and-nontrivial-test (expmod base (/ exp 2) m)
                                                m)
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-Rabin-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(miller-Rabin-test 3)                   ;#t
(miller-Rabin-test 4)                   ;#f
(miller-Rabin-test 11)                  ;#t
(miller-Rabin-test 461)                 ;#t
(miller-Rabin-test 561)                 ;#f
(miller-Rabin-test 1105)                ;#f
