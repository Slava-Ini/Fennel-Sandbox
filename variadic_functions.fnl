; To take a variable number of arguments to a function we can use `...` syntax
; To access individual elements we can use destructuring with `[]`
(fn print-each [...]
  (each [i v (ipairs [...])]
    (print (.. "Argument " i " is " v))))

(print-each :a :b :c)

; `print` can use vararg normally as `...`
(fn myprint [prefix ...]
  ; `io.write` appends a word
  (io.write prefix)
  ; `select` used with `#` length argument returns the length of arguments
  ; passed to `select`
  ; There is also another usage to this function https://www.tutorialspoint.com/select-function-in-lua-programming , that acts a bit like js `slice`
  (io.write (.. (select "#" ...) " arguments given: "))
  (print ...))

(myprint ":D " :d :e :f)

; Varargs (`...`) are scoped only to the function where they were created
; Error: following code won't compile because wararg passed to `badcode` function
; can only be used there
(fn badcode [...]
  (fn []
    (print ...)))
