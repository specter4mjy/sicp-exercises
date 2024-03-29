(define (tree-map proc tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))

(define (square-tree tree)
  (tree-map square tree))

;; test

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))                     ; (1 (4 (9 16) 25) (36 49))
