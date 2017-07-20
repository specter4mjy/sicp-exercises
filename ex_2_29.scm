(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; a

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

;; b

(define (total-weight mobile)
  (define (total-weight-branch branch)
    (let ((s (branch-structure branch)))
      (if (number? s)
          s
          (total-weight s))))
  (+ (total-weight-branch (left-branch mobile))
     (total-weight-branch (right-branch mobile))))

;; test of b

(define b1 (make-branch 2 1))
(define b2 (make-branch 3 2))
(define b3 (make-branch 4 3))
(define m1 (make-mobile b1 b2))
(define b4 (make-branch 5 m1))
(define m2 (make-mobile b3 b4))

(total-weight m2)                       ; 6 = 1 + 2 + 3

;;  c

(define (balance? mobile)
  (define (torque branch)
    (let ((l (branch-length branch))
          (s (branch-structure branch)))
      (* l
         (if (number? s)
             s
             (total-weight s)))))
  (define (submobile branch)
    (let ((s (branch-structure branch)))
      (if (number? s)
          '()
          s)))
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (if (null? (submobile left))
             #t
             (balance? (submobile left)))
         (if (null? (submobile right))
             #t
             (balance? (submobile right)))
         (= (torque left)
            (torque right)))))

(define b1 (make-branch 2 1))
(define b2 (make-branch 1 2))
(define b3 (make-branch 3 4))
(define m1 (make-mobile b1 b2))
(define b4 (make-branch 4 m1))
(define m2 (make-mobile b3 b4))

(define m3 (make-mobile b1 b3))

(balance? m2)                           ; #t

(balance? m3)                           ; #f

;; d
;; Thanks for data abstraction, only selectors are required modification.
