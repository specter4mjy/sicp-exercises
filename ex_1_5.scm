; Applicative-order interpreter will raise an error, and normal-order interpreter will return 0.

; Because applicative-order interpreter will evaluate operands before applying procedure.
; Insted, normal-order interpreter only replace the procedure literally, and since result of if
; predicate is true, therefore y won't be actually evaluated.
