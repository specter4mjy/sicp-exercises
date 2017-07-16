(define (make-interval a b)
  (cons a b))

(define (upper-bound x)
  (cdr x))

(define (lower-bound x)
  (car x))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
    (make-center-width c (* c p)))

(define (percent i)
  (/ (width i) (center i)))

(define (mul-interval x y)
  (define (positive n)
    (> n 0))
  (define (negative n)
    (< n 0))
  (let ((xl (lower-bound x))
        (xu (upper-bound x))
        (yl (lower-bound y))
        (yu (upper-bound y)))                                               ; xl xu yl yu
    (cond ((and (positive xl) (positive yl))                                ; +  +  +  +
           (make-interval (* xl yl) (* xu yu)))
          ((and (negative xl) (positive xu) (positive yl))                  ; -  +  +  +
           (make-interval (* xl yu) (* xu yu)))
          ((and (negative xu) (positive yl))                                ; -  -  +  +
           (make-interval (* xl yu) (* xu yl)))
          ((and (negative xu) (negative yl) (positive yu))                  ; -  -  -  +
           (make-interval (* xl yu) (* xl yl)))
          ((and (negative xu) (negative yu))                                ; -  -  -  -
           (make-interval (* xu yu) (* xl yl)))
          ((and (positive xl) (negative yl) (positive yu))                  ; +  +  -  +
           (make-interval (* xu yl) (* xu yu)))
          ((and (positive xl) (negative yu))                                ; +  +  -  -
           (make-interval (* xu yl) (* xl yu)))
          ((and (negative xl) (positive xu) (negative yu))                  ; -  +  -  -
           (make-interval (* xu yl) (* xl yl)))
          ((and (negative xl) (positive xu) (negative yl) (positive yu))    ; -  +  -  +
           (make-interval (min (* xu yl) (xl yu))
                          (max (* xl yl) (* xu xu)))))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define a (make-center-percent 5.0 0.1))

(define div-a-by-a (div-interval a a))
(center div-a-by-a)                     ; 1.02020202020202
(percent div-a-by-a)                    ; .19801980198019795

; Thus, Lem is right.
