#lang racket

(define (longitud-cadenas L)
  (if (andmap string? L)
      (map (lambda (x) (string-length x)) L)
      (display "La lista debe contener solo cadenas de caracteres")
   )
)

;Ejemplos de ejecucion

; Ejemplo 1
;(longitud-cadenas (list "hello" "world" "racket"))
;'(5 5 6)

; Ejemplo 2
;(longitud-cadenas (list "hello" 123 "racket"))
;La lista debe contener solo cadenas de caracteres

