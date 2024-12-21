#lang racket

;(define (ej1 L))

;Ej2

(define (ej2 L)
  (ej2Aux L 0))

(define (ej2Aux L Cont)
  (cond
    ((null? L) Cont)
    (else (ej2Aux (rest L) (+ Cont 1)))))

;Ej3 (encontrar el indice de un elemento en una lista sin usar list-index)

(define (ej3 L Num)
  (ej3Aux L Num 0))

(define (ej3Aux L Num Index)
  (cond
    ((null? L) (display "Not found"))
    ((= (first L) Num) Index)
    (else (ej3Aux (rest L) Num (+ Index 1)))))

;Ej4 (sortear lista usando sort y sin sort)

(define (ej4Sort L)
  (sort L <))

;Ej5 convertir un numero a cadena y concatenarlo con un texto
(define (ej5 Text Num)
  (string-append Text (number->string Num)))

;Ej6 Eliminar elemento de lista sin usar remove

(define (ej6 L num)
  (ej6Aux L num null))

(define (ej6Aux L num L2)
  (cond
    ((null? L) L2)
    ((= (first L) num) (ej6Aux (rest L) num L2))
    (else (ej6Aux (rest L) num (append L2 (first L))))))

;Ej 7 generar primeros numeros pares
(define (ej7 N)
  (ej7Aux N 1))

(define (ej7Aux Tope Number)
  (cond
    ((> Number Tope) (display ""))
    ((= 0 (modulo Number 2))
     (display Number)
     (display " ")
     (ej7Aux Tope (+ Number 1)))
    (else (ej7Aux Tope (+ Number 1)))))

;Ej 8 Obtener los primeros 5 elementos de una lista

(define (ej8 L)
  (ej8Aux L 0))

(define (ej8Aux L Counter)
  (cond
    ((= Counter 5) (display ""))
    (else
     (display (first L))
     (display " ")
     (ej8Aux (rest L) (+ Counter 1)))))

;ej21 calcular area

(define (ej21 r)
  (let
      (
       (cuad (* r r))
       
      )
    (display (* 3.14 cuad))
  ))

;ej22 calcular volumen
(define (ej22 r h)
  (let*
      (
       (mult (* 3.14 r r (/ 1 3)))
       (V (* mult h))
       )
      (display V)
    ))

;Ej47

(define (pedirDato msg)
  (display msg)
  (read))

(define (ej47)
  (sort (ej47Aux) string<?))

(define (ej47Aux)
  (ej47Aux2 (pedirDato "Ingrese su palabra") null)
)

(define (ej47Aux2 word L)
  (cond
    ((string=? (symbol->string word) "fin") L)
    (else
     (ej47Aux2 (pedirDato "Ingrese su palabra") (append L (list (symbol->string word)))))))

;Ej63

(define (ej63 L)
  (ej63Aux L 0)
  )

(define (ej63Aux L Cont)
  (cond
    ((null? L) Cont)
    ((< (first L) 0) (ej63Aux (rest L) (+ Cont 1)) )
    (else
     (ej63Aux (rest L) Cont)
     )))

;Ej92 Sumar a todos los elementos de la lista 1

(define (ej92 L)
  (map (lambda (x) (+ x 1)) L))

;Ej93 imprimir las cadenas mas grandes de 5 caracteres

(define (ej93 L)
  (filter (lambda (x) (> (string-length x) 5)) L))

;Ej121 Multiplicar todos los elementos de la lista
(define (ej121 L)
  (foldl * 1 L))

;Ej123 Conseguir el numero mas grande de la lista

(define (ej123 L)
  (foldl (lambda (x acum)
           (cond
             ((> x acum) x)
             (else acum))
           ) 0 L))

;Ej136 Calcular profundidad de un arbol binario
(define (profundidad T)
  (cond
    ((null? T) 0)
    (else
     (+ 1 (max (profundidad (second T)) (profundidad (third T))))))) 

;Ej137 sumar valores de nodos

(define (sumatoria T)
  (cond
    ((null? T) 0)
    (else
     (+ (first T) (sumatoria (second T)) (sumatoria (third T))))))

;Ej138 Encontrar el nodo mas grande

(define (mayor T)
  (cond
    ((null? T) 0)
    (else
     (max (first T) (mayor (second T)) (mayor (third T))))))

;Ej 139 Determinar si un valor existe en un arbol

(define (existe T val)
  (cond
    ((null? T) (display ""))
    ((= val (first T)) (display "Si existe el numero: ") (display val))
    (else
     (existe (second T) val) (existe (third T) val))))

;Ej140 Contar nodos hoja de un arbol
(define (hojas T)
  (cond
    ((null? (second T)) (cond ((null? (third T)) 1) (else 0)))
    (else
     ( + (hojas (second T)) (hojas (third T))))))

;Ej142 convertir arbol en una lista inorder
(define (convertir T)
  (cond
    ((null? (second T)) (cond ((null? (third T)) (list (first T)))))
    (else
     (append (convertir (second T)) (list (first T)) (convertir (third T)))
)))

;Ej143 verificar si dos arboles son iguales

(define (iguales T1 T2)
  (equal? T1 T2))

;Ej144 Eliminar nodos con un valor menor a un umbral dado

(define (borrar T val)
  (cond
    ((null? T) null)
    ((< (first T) val) null)
    (else
     (list (first T)
           (borrar (second T) val)
           (borrar (third T) val))
)))

;Ej145 Encontrar el nivel mas profundo de un arbol binario


;Ej146 Contar nodos en cada nivel del arbol

(define (contar T nivel)
  (contarAux T nivel 0))

(define (contarAux T nivel act)
  (cond
    ((null? T) 0)
    ((= nivel act) 1)
    (else
     (+ (contarAux (second T) nivel (+ act 1)) (contarAux (third T) nivel (+ act 1))))))

;;Ej100 map  generar una lista de pares x, y donde y=2x

(define (gen L)
  (andmap (lambda (x) (>= x 2)) L))