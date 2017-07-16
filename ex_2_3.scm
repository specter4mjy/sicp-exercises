; ---| programs that use perimeter and area |---

;     perimeter and area in problem domain

; ---|         perimeter area ...           |---

;  perimeter and area calculated from rectangle

; ---|      make-rect height width ...       |---

;          representation of rectangle

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

; first rectangle representation - using left-top 3  points

(define (make-rect bottom-left-point top-right-point)
  (cons bottom-left-point
        top-right-point))

(define (height rectangle)
  (let ((bottom-left-point (car rectangle))
        (top-right-point (cdr rectangle)))
    (abs (- (y-point bottom-left-point)
            (y-point top-right-point)))))

(define (width rectangle)
  (let ((bottom-left-point (car rectangle))
        (top-right-point (cdr rectangle)))
    (abs (- (x-point bottom-left-point)
            (x-point top-right-point)))))


; second rectangle representation - usingn top and left segments

(define (make-rect left-segment top-segment)
  (cons left-segment top-segment))

(define (segment-length segment)
  (let ((p1 (start-segment segment))
        (p2 (end-segment segment)))
    (let ((x1 (x-point p1))
          (y1 (y-point p1))
          (x2 (x-point p2))
          (y2 (y-point p2)))
      (sqrt (+ (square (- x1 x2))
               (square (- y1 y2)))))))

(define (height rectangle)
  (segment-length (car rectangle)))

(define (width rectangle)
  (segment-length (cdr rectangle)))

; perimeter area

(define (perimeter rectangle)
  (* (+ (width rectangle)
        (height rectangle))
     2))

(define (area rectangle)
  (* (width rectangle)
     (height rectangle)))

; test

(define p1 (make-point 2 6))

(define p2 (make-point 2 12))

(define p3 (make-point 10 6))

(define s1 (make-segment p1 p2))

(define s2 (make-segment p1 p3))

; first representation
(define rect (make-rect p2 p3))

; sencond representation
(define rect (make-rect s1 s2))

(perimeter rect)                        ; 28

(area rect)                             ; 48
