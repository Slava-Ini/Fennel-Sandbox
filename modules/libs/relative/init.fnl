; We should use absolute import by default
; Which can be bad if we want to put this file elsewhere along with it's dependency module
; (local a (require :libs.relative))

; In lua we have to specify `LUA_PATH` for relative imports
; however fennel has a way of doing it natively as follows (actually it works for lua too)
; (local a (require (.. ... :.hello)))

; - The above should work but ONLY from the outside of lib
; e.g. from root if I do the following
; (local relative (require :libs.relative))
; (relative.hello-a)
; - It happens first because `:libs.relative` means that there is a `init.fnl` file in a lib that
; will be read automatically and second because in that case `...` will contain `libs.relative` string

; However if I just execute this file relative path above won't work cause `...` will contain filename
; For the files outside `init.fnl` we can use something like this

; `(:)` means metadata passed to concatenation
; `match` experssion is applied with regular expression
; in regexp:
;`(.+)` - any number of symbols
;`%.` - dot (escaped using %)
; `[^.]+` - one or more characters that are NOT `.`
(local a (require (.. (: ... :match "(.+)%.[^.]+") :.hello)))
; NOTE: again this will only work at compile time when the path will be with dots (in Lua)
; to make it work upon local file compilation we should substitute `%.` with `/`
(pp a)


; {:hello-a a.hello}

