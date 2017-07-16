; Given that all numbers are positive
; (mul-interval x y)
; = (make-interval (* x-low y-low) (* x-upper y-upper))
; = (make-interval (* (* x-center (- 1 x-percent))
;                     (* y-center (- 1 y-percent)))
;                  (* (* x-center (+ 1 x-percent))
;                     (* y-center (+ 1 y-percent)))
; = (make-interval (* x-center
;                     y-center
;                     (- 1 x-percent)
;                     (- 1 y-percent)))
;                  (* x-center
;                     y-center
;                     (+ 1 x-percent)
;                     (+ 1 y-percent)))
; so,
; (width (mul-interval x y))
; = (/ (* x-center
;         y-center
;         (- (* (+ 1 x-percent)
;               (+ 1 y-percent))
;            (* (- 1 x-percent)
;               (- 1 y-percent)))
;       2)
; = (/ (* x-center
;         y-center
;         (* (+ x-percent
;               y-percent)
;            2)
;       2))
; = (* x-center
;      y-center
;      (+ x-percent
;         y-percent))
; and,
; (center (mul-interval x y))
; = (/ (+ (* x-center
;            y-center
;            (- 1 x-percent)
;            (- 1 y-percent)))
;         (* x-center
;            y-center
;            (+ 1 x-percent)
;            (+ 1 y-percent))))
;       2)
; = (* x-center
;      y-center
;      (+ 1 (/ (* x-percent
;                 y-percent)
;               2))
; assume percentage tolerances are small, so
; (* x-percent y-percent) approximate 0, thus
; result above approximate
; = (* x-center
;      y-center)

; thus,
; (percent (mul-interval x y))
; = (/ (width (mul-interval x y))
;      (center (mul-interval x y)))
; = (+ x-percent y-percent))

; conclusion:
; Assume all numbers are positive,
; percentage tolerance of the product of two intervals is
; sum of percentage tolerances of the factors.
