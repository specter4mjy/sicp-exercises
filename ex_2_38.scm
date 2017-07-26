(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define fold-right accumulate)

(fold-right / 1 (list 1 2 3))           ; 3/2
(fold-left / 1 (list 1 2 3))            ; 1/6

(fold-right list '() (list 1 2 3))      ; (1 (2 (3 ())))
(fold-left list '() (list 1 2 3))       ; (((() 1) 2) 3)

;; If op satisfys associative, fold-right and fold-left will produce
;; same value.
