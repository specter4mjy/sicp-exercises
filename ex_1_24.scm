(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n 10000))

(define (search-for-primes n)
  (define (iter n count)
    (if (> count 0)
        (if (prime? n)
            (timed-prime-test n)))
    (if (> count 0)
        (if (prime? n)
            (iter (+ n 2) (- count 1))
            (iter (+ n 2) count))
        ))
  (iter (+ 1 n) 3))

;; (search-for-primes 100000000000)        ;100000000003 *** .35999999999999943
;;                                         ;100000000019 *** .34999999999999787
;;                                         ;100000000057 *** .35999999999999943

;; (search-for-primes 1000000000000)       ;1000000000039 *** 1.1399999999999935
;;                                         ;1000000000061 *** 1.1499999999999986
;;                                         ;1000000000063 *** 1.1600000000000037

;; (search-for-primes 10000000000000)      ;10000000000037 *** 3.6200000000000045
;;                                         ;10000000000051 *** 3.5900000000000034
;;                                         ;10000000000099 *** 3.640000000000015

;; (search-for-primes 100000000000000)     ;100000000000031 *** 11.469999999999999
;;                                         ;100000000000067 *** 11.430000000000007
;;                                         ;100000000000097 *** 11.51000000000002

(search-for-primes 100000000000)        ;100000000003 *** .7599999999999909
                                        ;100000000019 *** .7699999999999818
                                        ;100000000057 *** .7899999999999636

(search-for-primes 1000000000000)       ;1000000000039 *** .8099999999999454
                                        ;1000000000061 *** .8300000000000409
                                        ;1000000000063 *** .8400000000000318


(search-for-primes 10000000000000)      ;10000000000037 *** .8400000000000318
                                        ;10000000000051 *** .8600000000000136
                                        ;10000000000099 *** .8600000000000136


(search-for-primes 100000000000000)     ;100000000000031 *** .9599999999999227
                                        ;100000000000067 *** .9400000000000546
                                        ;100000000000097 *** .9199999999999591

; I expect ratio of computation time of 100000000000000 and 100000000000 is 1.27.
; The data above bear it out.

; notice: when compute large number, the primitive operation will take longer time.
