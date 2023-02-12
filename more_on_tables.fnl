; - Helper
(local fennel (require :fennel))
(fn _G.pp [x] (print (fennel.view x)))

; Keys with no spaces or reserved symbols can use `:shorthand` syntax
; If the keys in table are strings we can pull values with dot notation
(let [tbl {:x 52 :y 91}]
  (print (+ tbl.x tbl.y)))

; `set` can also be used with table key-values pairs
(let [tbl {}]
  (set tbl.one 1)
  (set tbl.two 2)
  (_G.pp tbl))

; For the table with the same name for key and value, key name can be ommited
(let [one 1
      two 2
      tbl {: one : two}]
  (_G.pp tbl))

; Let can bi used to destructure table by position or via key
(let [data [1 2 3]
      [fst snd thrd] data] ; -> 1 2 3
  (print fst snd thrd))

(let [pos {:x 23 :y 42}
      {:x x-pos :y y-pos} pos]
  (print x-pos y-pos))

; Similar to key-values if the variable name matches, we can omit key name
(let [pos {:x 23 :y 42}
      {: x : y} pos]
  (print x y))

; Everything above can be mixed
; If the size of table doesn't match the number of binding locals, 
; missing values are filled with `nil`
(let [f (fn [] [:abc :def {:x :xyz :y :abc}])
      [a d {: x : y}] (f)]
  (print a d)
  (print x y))
