; No, she is wrong. Procedure fast-expt could return huge number which
; will make following modulo operation expensively. Instead, the original
; version expmod keep operand less than m through whole process.
