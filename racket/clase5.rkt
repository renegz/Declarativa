#lang racket

; (member 5 (list 4 5 3 2 8))

;(map proc L) ;map construye una nueva lista que contiene los resultados luego de aplicar el procedimiento (osea un lambda) (es adhoc)
;(map (lambda (x) (even? x)) (list 3 4 5 6 7 8))
;(map (lambda (x) (* x x)) (list 3 4 5 6 7 8))
;(define L (map (lambda (x) (even? x)) (list 3 4 5 6 7 8)))
;(or (first L) (second L) (third L) (fourth L) (fifth L) (sixth L))

;Uso de andmap y ormap, espera un valor booleano es decir evalua toda la lista mapeada ya sea con or o and
;(andmap (lambda (x) (even? x)) (list 3 4 5 6 7 8))

;Uso de filter, tiene algo extra, una vez teniendo el resultado filtra los que no cumplen
;(filter (lambda (x) (even? x)) (list 3 4 5 6 7 8))

;Strings
;(string? 4)
;(string? "hola")
;(string #\h #\o #\l #\a)
;(make-string 10 #\a)

;Una lista creada no puede ser modificada, lo que se hace es crear una nueva
;las cadenas si van con "" significa que es inmutable, es decir "hola" es inmutable
;Si se usa con la funcion string, make-string y append de esa manera si son mutables

;(string-set!) cambia el caracter de una posicion en una cadena, solo se puede con una cadena mutable
;Las funciones de mutacion no muestran resultado
; (define cosito (string #\h #\o #\l #\a))
;(string-set! cosito 2 #\r)

;Append
;(string-append "hola" " " "mundo")

;Pregunta si dos cadenas son iguales
;(string=? "hola" "hola")
;(string<? "pedro" "pajaro")
;(string<? "pedro" "Pedro")

;Version case insensitive
;(string-ci=? "pedro" "Pedro")

;String to list
;(string->list "hola")
;(list->string(string->list "hola"))

;Todo los que existe para sstring existe para char
;(char=? #\a #\e)

;(map (lambda(s) (string-length s)) (read))
;(filter (lambda (x) (> x 5)) (map (lambda(s) (string-length s)) (list "palabra" "hola")))

;Substrings
;(substring "hola mundo" 3 7) En realidad es desde el 3 al 6

;(string-downcase "HOLA")
;(char-downcase #\R)

(define (factorial n)
  (if
   (or (= n 0) (= n 1))
   1
   (* n (factorial (- n 1)))))

;(map (lambda (x) (factorial x)) (list 1 2 3 4 5 6 7))

;(map (lambda (x) (if (< x 0) 0 x)) (list 3 4 0 -3 1 -1 8 -2)) ;Si el elemento es menor que 0 se imprime 0
;(filter (lambda (x) (>= x 0)) (list 3 4 0 -3 1 -1 8 -2))