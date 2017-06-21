(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve-guess guess x) x)))

(define (good-enough? guess x)
  (< (/ (abs (- guess (improve-guess guess x))) (abs guess)) 0.001)) ; I forgot adding abs for guess, which could be negative

(define (improve-guess guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(cube-root 8)

(cube-root -27)
