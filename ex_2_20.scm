(define (same-parity x . z)
  (define (iter remainder result)
    (if (null? remainder)
        result
        (let ((first-item (car remainder)))
          (iter (cdr remainder)
                (append result
                        (if (even? (- first-item x))
                            (list first-item)
                            '()))))))
  (iter z (list x)))

(same-parity 1 2 3 4 5 6 7)             ; (1 3 5 7)
(same-parity 2 3 4 5 6 7)               ; (2 4 6)
