(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve-guess guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve-guess guess x)
  (/ (+ guess (/ x guess)) 2))

(sqrt (+ 100 37))

; It wan't work because else-clause part will evaluate forever.
; Instead, when using if, <consequent> and <alternative> clause
; evaluate only if necessarily.
