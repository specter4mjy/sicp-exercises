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
