(define (cube x) (* x x x))

(define (simpson-integral f a b n)
  (define (h a b n)
    (/ (- b a) n))
  (define (yk f a b n k)
    (f (+ a (* k (h a b n)))))
  (define (sum f a b n)
    (define (coefficience n k)
      (cond ((or (= k 0) (= k n))
             1)
            (else
             (if (even? k)
                 2
                 4))))
    (define (iter f a b n k)
      (cond ((= k n)
             (yk f a b n k))
            (else
             (+ (* (coefficience n k) (yk f a b n k)) (iter f a b n (+ k 1.0))))))
    (iter f a b n 0))
  (* (/ (h a b n) 3.0) (sum f a b n)))

(simpson-integral cube 0 1 100)         ;.24999999999999992
(simpson-integral cube 0 1 1000)        ;.2500000000000003
