(define (next n)
  (if (= n 2)
      (+ n 1)
      (+ n 2)))

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

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

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

(search-for-primes 100000000000)        ;100000000003 *** .21999999999997044
                                        ;100000000019 *** .22000000000002728
                                        ;100000000057 *** .22000000000002728

(search-for-primes 1000000000000)       ;1000000000039 *** .7099999999999795
                                        ;1000000000061 *** .7099999999999795
                                        ;1000000000063 *** .7099999999999795


(search-for-primes 10000000000000)      ;10000000000037 *** 2.2200000000000273
                                        ;10000000000051 *** 2.2099999999999795
                                        ;10000000000099 *** 2.2000000000000455


(search-for-primes 100000000000000)     ;100000000000031 *** 6.969999999999914
                                        ;100000000000067 *** 7.009999999999991
                                        ;100000000000097 *** 6.899999999999977


; Result doesn't confirm expectation. Speed ratio is approximate 1.6.
; Even we test half of number, procedure next require more if tests.
