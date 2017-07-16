; 2 x width
; = (- (+ (upper-bound x) (upper-bound y))
;      (+ (lower-bound x) (lower-bound y)))
; = (+ (- (upper-bound x) (lower-bound x))
;      (- (upper-bound y) (lower-bound y)))
; = (+ (width x) (width y))


; examples of multiplication

(mul-interval (make-interval 2 3) (make-interval 1 5))   ; 1 , 4 -> 13 (2, 15)
(mul-interval (make-interval 2 3) (make-interval -3 1))  ; 1 , 4 -> 12 (-9, 3)
