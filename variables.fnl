;-- Locals
;- Locals are inroduced with name and expression wrapped into `[]`
;- Here we indroduce two variables `x` and `f`
;- `x` is bound to a result of expression
;- while `f` is bound to a function
;- These bindings are only valid inside the body of the `let` call
(let [x (+ 89 5.2)
      f (fn [abc] (print (* 2 abc)))]
  (f x))

;- We can also define locals with `local` which is good when it's
; used across the whole file
(local tau-approx 6.28318)
(print tau-approx)

;- Locals act as constants they can not be set to new values
;- But can be shadowed
(let [x 19]
  ;; (set x 88) <- not allowed!
  (let [x 88]
    (print (+ x 2)))
  (print x))

;- If you want to change local variable you can use `var`
;- It works like `local` (seen outside body) but can be mutated
(var x 19)
(set x (+ x 8))
(print x)
