(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve-guess guess x) x)))

;; old good-enough?
;; (define (goood-enough? guess x)
;;   (< (abs (- (square guess) x)) 0.001))

(Define (improve-guess guess x)
  (/ (+ guess (/ x guess)) 2))

; new good-enough?
(define (good-enough? guess x)
  (< (/ (abs (- guess (improve-guess guess x))) guess) 0.001))


(Sqrt 9)

; following use above sqrt for large number, it make interpreter
; never stop, because computer can't store dicimal for large number,
; which make defference between square of guess and radicand never
; be smaller than predetermined tolerance.
(square (sqrt 88888888888888888))

;old test result: evluation never stop
;new test result: 88889085934439860

; following use above sqrt for small number, sqrt evaluation stops
; too early cause result of evaluation is wrong even difference between
; square of guess and radicand  meats the predetermind tolerence.
(square (sqrt 0.00001))

; old test result: 9.832294718753643e-4
; new test result: 1.0000094789844653e-5
