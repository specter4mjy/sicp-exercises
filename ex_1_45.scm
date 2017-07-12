(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y)
                               (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y)
                               (/ x (square y))))
               1.0))

(define (nth-root-experiment n)
  (lambda (x)
    (fixed-point (average-damp
                  (average-damp (lambda (y)
                                  (/ x
                                     (expt y (- n 1))))))
                 1.0)))


(sqrt 4)

(cube-root 8)

((nth-root-experiment 4) 16)                       ; won't converge with only 1 average-damp

((nth-root-experiment 5) 32)

((nth-root-experiment 6) 64)

((nth-root-experiment 7) 128)

((nth-root-experiment 8) 256)                      ; won't converge with 2 average-damps

; From results of experiments above, nth root requires log based 2 of n times average damps, i.e.
; 2 average-damps for 4th-root, 3 average-damps for 8th-root

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f
               (repeated f
                         (- n 1)))))

(define (nth-root n)
  (lambda (x)
    (fixed-point ((repeated average-damp (floor
                                          (/ (log n) (log 2))))
                  (lambda (y)
                    (/ x (expt y (- n 1)))))
                 1.0)))


((nth-root 4) 16)

((nth-root 5) 32)

((nth-root 6) 64)

((nth-root 8) 256)

((nth-root 9) 512)
