; The original version expmod only calculate (expmod base (/ exp 2) m) once,
; and square the result of it. But Louis's expmod will consider two expmod call
; seperately which cause it become tree recursive process.
