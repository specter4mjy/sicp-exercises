(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a)
            (iter (next a) (combiner (term a) result))
            (iter (next a) result))))
  (iter a null-value))

; a

(define (sum-of-prime-squares a b)
  (filtered-accumulate prime? + 0 square a inc b))

(sum-of-prime-squares 2 5)              ; 38

; b
(define (product-of-relative-primes n)
  (define (relative-prime?-with-n i)
    (and (> i 0) (= (gcd i n) 1)))
  (filtered-accumulate relative-prime?-with-n * 1 identity 1 inc n))

(product-of-relative-primes 10)         ; 189
