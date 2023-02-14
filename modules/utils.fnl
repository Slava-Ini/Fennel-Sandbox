(fn sum [a b] (+ a b))
(fn sub [a b] (- a b))

; Modules can be exported as anything (last file value is modules value)
; however tables are preffered (here table key-values names match, so we
; don't have to write `:sum sum` etc.)
{: sum : sub}
