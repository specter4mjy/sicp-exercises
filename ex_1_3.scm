(define (square x)
  (* x x))

(define (sumOfSquaresOfTwoLargerNums a b c)
  (cond ((and (<= a b) (<= a c)) (+ (square b) (square c)))
        ((and (<= b a) (<= b c)) (+ (square a) (square c)))
        ((and (<= c a) (<= c b)) (+ (square a) (square b)))))
