; -- Arguments and function call
; (fn print-and-add [a b c]
;   (print a)
;   (+ b c))

; (print-and-add 1 2 3)

; -- Concat and separation
; - Functions defined with `fn` have no runtime overhead however
; they don't check the number of arguments and are not very safe
; (fn print-sep [sep ...]
;   "Prints args as a string, delimited by sep"
;   (print (table.concat [...] sep)))
; (print-sep "," "hello" "world")

; -- Lambdas
; - `lambda` only allows as many args as you have defined
; `?arg` means that arg can be `nil`
(lambda print-calculation [x ?y z]
  (print (- x (* (or ?y 1) z))))

; Error: Missing argument z
; (print-calculation 5)
(print-calculation 5 nil 3)
