(define (square-tree subtree)
  (cond ((null? subtree) '())
        ((not (pair? subtree)) (square subtree))
        (else (cons (square-tree (car subtree))
                    (square-tree (cdr subtree))))))

(define (square-list subtree)
  (map (lambda (subtree)
         (cond ((not (pair?)) (sqaure subtree))
               (else (square-list subtree))))
       subtree))

;; test

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))                     ; (1 (4 (9 16) 25) (36 49))
