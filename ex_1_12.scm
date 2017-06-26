(define (pascal-element row index)      ; row and index starts from 1
  (cond ((= index 1) 1)
        ((= row index) 1)
        (else (+ (pascal-element (- row 1) (- index 1))
                 (pascal-element (- row 1) index)))))
