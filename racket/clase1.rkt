#lang racket

; Funcion que se llama media y recibe 3 params, a, b, c
(define (media a b c) ( / (+ a (+ b c)) 3))

; Para todas las funciones que su respuesta es booleano tiene que llegar ? al final
; Se hace como que fuera una pregunta
(define (par? n) (= (modulo n 2) 0) )

(define (probarIf n) (if (par? n) (display "es par") (display "es impar")))