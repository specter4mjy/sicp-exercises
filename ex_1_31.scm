; a

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (factorial n)
  (product identity 1 inc n))

(factorial 6)                           ; 720

(define (pi)
  (define (nk k)
    (if (even? k)
        (+ k 2)
        (+ k 1)))
  (define (pi-term k)
    (if (even? k)
        (/ (nk k) (- (nk k) 1.0))
        (/ (nk k) (+ (nk k) 1.0))))
  (* 4.0 (product pi-term 1 inc 10000)))

(pi)

; b

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* (term a) result))))
  (iter a 1))

(factorial 6)                           ; 720
