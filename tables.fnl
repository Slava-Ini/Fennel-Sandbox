; -- Table is the only structure in fennel
; - It uses curly braces and key - value pairs inside
(let [x {"key" "word"
         "number" 531
         "f" (fn [x] (+ x 2))}]
  (print x.key))


; - Another possible syntax
; (let [x {:key :word :number 531 :f (fn [x] (+ x 2))}]
;   (print x.key))

; ; - `.` to get values from the table
; (let [tbl (function-which-returns-a-table)
;       key "a certain key"]
;   (. tbl key))
; - `tset` to put value in the key
(let [tbl {}
      key1 "a long string"
      key2 12]
  (tset tbl key1 "the first value")
  (tset tbl key2 "the second one")
; outputs -> {"a long string" "the first value" 12 "the second one"}
  (pp tbl))

; Debug function to pretty print table instead of it's memory location
(local fennel (require :fennel)) 
(fn _G.pp [x] (print (fennel.view x)))

; Nil-safe table lookup
; Returns nil without looking further in the code
(let [t {:a [2 3 4]}] (?. t :a 4 :b)) ; => nil
(let [t {:a [2 3 4 {:b 42}]}] (?. t :a 4 :b)) ; => 42
