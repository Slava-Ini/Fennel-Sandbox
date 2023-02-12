; - Helper
(local fennel (require :fennel))
(fn _G.pp [x] (print (fennel.view x)))

; Looping over table elements is done with `each` and `pairs`  (general tables)
; or `ipairs` (sequential tables)
(each [key value (pairs {:key1 52 :key2 78})]
  (print key value))

(each [index value (ipairs [:a :b :c])]
  (print index value))

; An example of string matching and substitution
(var sum 0)
; `string.gmatch` is Lua string matcher (https://www.lua.org/manual/5.1/manual.html#pdf-string.gmatch)
(each [digits (string.gmatch "244 12 163" "%d+")]
  (set sum (+ sum (tonumber digits))))

(print sum)

; To get back the table `icollect`(seq table) and `collect` (table) can be used
; `result` collects a result of performed actions
; `_` is ignoring keys
; `s:upper` makes string upper case
(let [result (icollect [_ s (ipairs [:greetings :my :darling])]
               (if (not= :my s)
                   (s:upper)))]
  (pp result))

; Unlike `icollect` that only takes one value
; `collect` takes to values to form a table, so w eshould return two values
; (hers `s` (key) and `(length s)` (value)), we can swap places of key-value pair
; but then we will have to make `(length s)` to `(tostring (length s))`
(let [result (collect [_ s (ipairs [:greetings :my :darling])]
               s
               (length s))]
  (pp result))

; There is also a low level iterator available
; `1` is start value, `10` is end inclusive value
; (for [i 1 10]
;   (print i))
; We can also specify optional `step` value
; (for [i 1 10 2]
;   (print i))

; Looping can also be done with `while`
; Condition can be checked using `(and condition)` `(not/or condition)`
; Or just by writting it as is
; Boolean variables are usually written with `?` on the end
(var condition? true)
(while condition?
  (print :not-done)
  (set condition? false))
