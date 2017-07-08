(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (euler-number-e k)
  (+ 2
     (cont-frac (lambda (i) 1.0)
                (lambda (i)
                  (if (= (remainder (+ i 1) 3) 0)
                      (* 2 (/ (+ i 1) 3))
                      1))
                k)))

(euler-number-e 10)                     ; 2.7182817182817183
