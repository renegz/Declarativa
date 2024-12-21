#lang racket

;(define L (list 3 4 2 6 7 8))
;(list-ref L 3) ;Devuelve la copia del elemento en la posicion indicada
;(string-ref "Soy una cadena" 5)

;list-tail
;(list-tail L 1)
;(rest L) ;es casi lo mismo que lo de arriba
;(rest(rest(rest L)))
;(list-tail L 3)

;Member
;(member 9 L) ;dice si 9 es miembro de L devuelve un booleano

;#\newline

;make-string no tiene muchos usos generales, principalmente se puede usar para placeholders
;(make-string 10)

;(define LP (list "mario" "melvin" "guidos" "cosito" "david"))
;(map (lambda (s) (string-length s)) LP)

;(string-append "hola" " " "mundo")

;(substring "paralelepipedo" 4 8)
;(substring "paralelepipedo" 4)

;(string-upcase "hola")
;(char-downcase #\A)

;(string->list "hola")
;(list->string (list #\A #\B #\C))

;(string-set! "hola" 2 #\e)

;EJERCICIO CLASE

;Ejer1
(define (incrementar L Monto)
  (map (lambda (x) (+ x Monto)) L))

;Ejer2
(define (mayus L)
  (map (lambda (x) (string-upcase x)) L))

;Ejer7
(define (invertir L)
  (map (lambda (x) (list->string (reverse (string->list x)))) L))

;Pidiendo mensaje
(define (pedir_dato msg)
  (display msg)
  (read))

(define (incrementV2)
  (let*-values(
      ((L monto) (values (pedir_dato "Ingrese una lista: \n") (pedir_dato "Ingrese el incremento: \n")))
      )
    (map (lambda (x) (+ x monto)) L)))

;Ejercicio8

(define (capital L)
  (map (lambda (x) (list->string (append (list (char-upcase( first(string->list x)))) (rest (string->list x))))) L))

;Ejer8 v2
(define (capitalV2 L)
  (map (lambda (s) (string-append (string-upcase (substring s 0 1)) (substring s 1))) L))

;Ejer9 - TODO
(define (filterVowels L)
  (filter (lambda (c) (or (char=? c #\a) (char=? c #\e) (char=? c #\i) (char=? c #\o) (char=? c #\u)))
          (string)))