; -- All numbers are doubles or optionally integers (after lua 5.3)
; - On 5.3 and up, integer division uses // and bitwise operations use lshift, rshift, bor, band, bnot and xor. Bitwise operators and integer division will not work if the host Lua environment is older than version 5.3.
; - Underscore can be used for separating numbers by sections
(let [x (+ 1 99)
      y (- x 12)
      z 100_000]
  (print x y z))

;-- Strings are immutable byte arrays (lua 5.3+ support UTF-8)
; `..` used for string concatenations
(print (.. "hello" " world"))

