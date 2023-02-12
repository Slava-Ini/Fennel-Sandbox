; For the conditionals extra `cond` is compiled to `elseif`
; And the final experssion is compiled to `else`
(let [x (math.random 64)
      f (fn [a]
          (if (= 0 (% x 2)) :even
              (= 0 (% x 9)) "multiple of nine"
              "I dunno, something else"))]
  (print (f x)))

; Second option
; There is no statements in fennel, so returned conditional expression
; is returend
(let [x (math.random 64)]
  (print (if (= 0 (% x 2)) :even
             (= 0 (% x 9)) "multiple of nine"
             "I dunno, something else")))

; Another condition is `when`, which is used for side-effect and has no `else` bloc
(when true
  (print :hello)
  (print :world))
