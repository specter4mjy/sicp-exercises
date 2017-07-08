; a
; recursive version
(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define tolerance 0.0001)

(define (close-enough? a b)
  (< (abs (- a b)) tolerance))

(define (try-it k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))

(define (calculate-required-k k)
  (let ((result (try-it k))
        (next (try-it (+ k 1))))
    (if (close-enough? result next)
        (+ k 1)
        (calculate-required-k (+ k 1)))))

(calculate-required-k 1)                ; 11

(try-it 11)                             ; .6180555555555556

; b
; iterative version
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i) (+ (d i) result)))))
  (iter k 0))
