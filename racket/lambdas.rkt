#lang racket

;Lambda se coloca para decir que es una funcion anonima, es el nombre de la funcion anonima
(define (sueldo_neto_6 S)
  ((lambda (x) (- x ( * x 0.0725) (* x 0.03) (* x 0.1))) S))

(define (pedir_dato msg)
  (display msg)
  (read))

(define (crear_funcion oper)
  (case oper
    ((1)(lambda (x y) (+ x y)))
    ((2)(lambda (x y) (- x y)))
    ((3)(lambda (x y) (* x y)))
    ((4)(lambda (x y) (/ x y)))))

(define (escoger_operacion)
  (let
      (
       (A (pedir_dato "Ingrese un entero postivo"))
       (B (pedir_dato "Ingrese otro entero postivo"))
       (f (crear_funcion (pedir_dato "Seleccione la operacion para A y B:\n1. Suma\n2. Resta\n3. Multiplicacion\n4. Division\n")))
       ; Se bindea la funcion anonima en f
      )
    (f A B)))

;Hacer nueva version de calcular cum (lenght L) (first L) (rest L)

(define (mult_list GradesList UvsList)
  (cond (= (rest GradesList) null) ( * (first GradesList) (first UvsList))
        (else 

(define (calcular_cum GradesList UvsList)
  
    ))

