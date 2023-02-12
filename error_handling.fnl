; Simple file reader with error handling
(match (io.open :file.txt)
  ;; when io.open succeeds, it will return a file
  ;; `f` here is a file (and a pattern) (and everything inside `()` is a match 
  ;; expression)
  f
  ;; do evaluates multiple forms in order returning the last value
  (do
    (print (f:read :*all))
    (f:close))
  ;; return nil and an err-msg string describing why
  (nil err-msg)
  (print "Couldn't open file: " err-msg))

; It's also possible to create a function which returns multiple values
; using `values`
; (fn use-file [filename]
;   (if (valid-file-name? filename)
;     (open-file filename)
;     ; Multiple values return has several usages outside just error handling
;     ; https://benaiah.me/posts/everything-you-didnt-want-to-know-about-lua-multivals/
;     (values nil (.. "Invalid filename: " filename))))

; The problem with this type of error as it doesn't compose well and must be propagated
; For that we can use `error` function and `pcall` which acts like `try` in JS
(fn potentially-disastreous-call [filename]
  (error "Oops, an error"))

; `pcall` makes it return `true` and function returned value if there were no error
; or `false` and error message if there was an error
(let [(ok? val-or-msg) (pcall potentially-disastreous-call :hello.txt)]
  (if ok?
      (print "Got value" val-or-msg)
      (print "Couldn't get a value: " val-or-msg)))

; Another way to handle errors is `assert` functions
; it takes a value and error message, it calls `error` if the value is `nil`
; and returns it otherwise, it's kind of inverse `pcall`
; (let [f (assert (io.open :hello.txt))
;       ; Here because `io.open` returns (nil error_message)
;       ; failure will trigger `error` and halt execution
;       contents (f.read f :*all)]
;   (f.close f)
;   contents)
