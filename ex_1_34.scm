(define (f g)
  (g 2))

(f f)

; a error is raised as 'The object 2 is not applicable'

; Because:
; (f f)
; (f 2)
; (2 2) where first 2 is used as an operator which indeed is not,
; then cause the error
