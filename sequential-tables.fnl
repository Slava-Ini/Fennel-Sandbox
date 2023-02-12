; - Helper
(local fennel (require :fennel))
(fn _G.pp [x] (print (fennel.view x)))

; -- Sequential tables are kind of array, keys are numbers (starting with 1)
; equivalent to {1 "abc" 2 "def" 3 "xyz"}
(let [seq_tbl [:abc :def :xyz]]
  (pp seq_tbl))


; - `remove` and `insert` operate on the end of table if not provided with index
; - other wiser operate on index and shift everything to the right
(local ltrs ["a" "b" "c" "d"])

(table.remove ltrs)       ; Removes "d"
(table.remove ltrs 1)     ; Removes "a"
(table.insert ltrs "d")   ; Appends "d"
(table.insert ltrs 1 "a") ; Prepends "a"

; - Access by index
(print (. ltrs 2))        ; -> "b"
;; ltrs is back to its original value ["a" "b" "c" "d"]

; - `length` returns the length of a table or a string
; - table with gaps will have length of `undefined`
(let [tbl ["abc" "def" "xyz"]]
  (print (+ (length tbl)
     (length (. tbl 1))))) ; -> 6
