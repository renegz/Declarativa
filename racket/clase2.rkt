#lang racket

(define (procesar_seleccion_2 A B oper)
    (cond
        ((= oper 1) (+ A B))
        ((= oper 2) (- A B))
        ((= oper 3) (* A B))
        ((= oper 4) (/ A B))
        (else (display "Mal input"))
    )
)

; Otra version

(define (procesar_seleccion_3 A B oper)
    (case oper
        ((1)(+ A B))
        ((2)(- A B))
        ((3)(* A B))
        ((4)(/ A B))
        (else (display "Mal input"))
    )
)

(define cinco 5) ; #define CINCO 5, manera parecida a usar variables globales

;HAcer un programa que reciba salario de una persona y aplique los descuentos

(define (sueldo_neto S)
  (local ;Crear indicadores(bindings) locales, como variables locales)
    (
     (define afp (* S 0.0725))
     (define isss (* S 0.03))
     (define renta (* S 0.1))
    )
    (  ;Bloque donde son validas las variables locales
      ; (- (- (- S afp) isss) renta)
      - S afp isss renta ;Ahora es posible hacerlo asi, y hace las restas en el orden de operacion de los argumentos
      ;Fuera de este bloque las variables local no existen
    ) 
   )
)

;Si se quiere modificar un binding se ve como una mutacion (Solo se debe a ver cuando realmente sea necesario)

(define (sueldo_neto_2 S)
  (local 
    (
     (define afp (* S 0.0725))
     (define isss (* S 0.03))
     (define renta (* S 0.1))
    )
    (set! renta (* S 0.12)) ;Se cambia el "valor" de renta
    ( 
      - S afp isss renta 
    ) 
   )
)

(define (sueldo_neto_3 S)
  (local 
    (
     (define afp (* S 0.0725))
     (define isss (* S 0.03))
     (define renta (* S 0.1))
    )
    (set!-values (afp isss renta) (values (* S 0.0925) (* S 0.05) (* S 0.12)) )
    ( - S afp isss renta ) 
   )
)

(define (sueldo_neto_5 S)
  (let-values ;Con let no se escribe define
    (
     ((afp isss renta) (values (* S 0.0725)  (* S 0.03) (* S 0.1)))
    )
    ( - S afp isss renta ) 
   )
)

#|
(define (f_x x)
  (let
      (
         (m 3)
         (b -7)
         (y ( + (* m x) b))
       )
     (display("El valor de f(x) es: "))
     (display y)
    )
  )
|#

(define (f_x x)
  (let* ;Let que permite interdependencia entre indicadores, es decir que al bindear la operacion de Y ya existe los indicadores
      (
         (m 3)
         (b -7)
         (y ( + (* m x) b))
       )
     (display"El valor de f(x) es: ")
     (display y)
  )
)

#|
(define (f2_x x)
  (let*-values ;Con let no se escribe define
    (
     [(m b y) (values 3 -7 ( + (* m x) b))] ;No sirve let* por que los 3 indicadores se "crean" al mismo tiempo
    )
    (display"El valor de f(x) es: ")
    (display y)
   )
) |#

(define (f2_x x)
  (let*-values ;Con let no se escribe define
    (
     [(m b) (values 3 -7)] ;Se hace el primer grupo
     [(y) ( + (* m x) b)] ;El segundo grupo que usa indicadores del primero
    )
    (display"El valor de f(x) es: ")
    (display y)
   )
)

;Programa en racket para calcular el cum, dadas las uv, y notas, (Dos ciclos, 8 materia)

(define (pedir_dato msg)
  (display msg)
  (read))

(define (pedir_materia n)
  (pedir_materia_aux 0 n 0 0))

(define (pedir_materia_aux cont n sum uvs)
  (cond
    ((= cont n) (/ sum uvs))
    (else
     (let
         (
          (nota (pedir_dato "Ingresa nota:\n"))
          (uv (pedir_dato "Ingresa UVs: \n"))
          )
       (pedir_materia_aux (+ cont 1) n (+ sum(* nota uv)) (+ uvs uv))))))

(define (calcular_cum)
  (display "Cuantas materias has cursado?\n")
  (pedir_materia (read))
)

