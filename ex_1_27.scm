(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (carmichael-iter n a)
  (define (congruent? n a)
    (= (expmod a n n) a))
  (if (< a n)
      (if (congruent? n a)
          (carmichael-iter n (+ a 1))
          #f)
      #t))

(define (carmichael-test n)
  (carmichael-iter n 1))

(carmichael-test 561)                   ;#t
(carmichael-test 1105)                  ;#t
(carmichael-test 1729)                  ;#t
(carmichael-test 2465)                  ;#t
(carmichael-test 2821)                  ;#t
(carmichael-test 6601)                  ;#t
