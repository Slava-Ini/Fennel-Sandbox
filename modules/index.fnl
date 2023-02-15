; - Helper
(local fennel (require :fennel))
(fn _G.pp [x] (print (fennel.view x)))

; Modules can be used by `require` and module (file) name
(let [utils (require :utils)]
  (print (utils.sum 1 2))
  (print (utils.sub 5 3)))

; Nested modules use `.` instead of `/` in the path
(let [nested (require :libs.nested)]
  (print (nested.say-hi "Slava")))


; For searching fennel modules from lua we should use the following
; require("fennel").install()
; local mylib = require("mylib") -- will compile and load code in mylib.fnl

