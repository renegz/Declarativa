#lang racket

; EJERCICIO 1 - AJUSTE DE TARIFA
(define (calcular-tarifa base ajuste)
  (ajuste base)
)
 
(define (menu-tarifa)
  (display "Seleccione el tipo de tarifa:\n")
  (display "1. Tarifa por bajo uso\n")
  (display "2. Tarifa por alta demanda\n")
  (display "3. Tarifa sin modificaciones\n")
  (display "Opcion: ")
  (let [(seleccion (read)) (base 1.25)]
    (cond
      [(= seleccion 1) 
        (let [(resultado (calcular-tarifa base (lambda (tarifa) (* tarifa 0.75))))]
          (display "Tarifa con descuento por bajo uso: ")
          (display resultado)
        )
      ]
      [(= seleccion 2) 
        (let [(resultado (calcular-tarifa base (lambda (tarifa) (* tarifa 1.25))))]
          (display "Tarifa con aumento por alto uso: ")
          (display resultado)
        )
      ]
       [(= seleccion 3) 
        (let [(resultado (calcular-tarifa base (lambda (tarifa) tarifa)))]
          (display "Tarifa sin modificaciones: ")
          (display resultado)
        )
      ]
      [else (display "Selección es inválida.")]
    )
  )
)

;Ejercicio 2 - Suma de elementos en la lista

(define (sumaElementosLista lista)
  (if (andmap number? lista)
      (if(empty? lista)
         0
         (+ (first lista) (sumaElementosLista (rest lista)))
         )
      (display "Todos los elementos de la lista deben ser numeros")
      )
  )

;Ejercicio 3 - Elaborar funcion que, dada una cadena de caracteres retorne una lista cuyos elementos sean los caracteres de
;la cadena colocados en el mismo orden, (se puede hacer de una con string to list)

(define (convertirAux cadena indice resultado)
  (if (= indice (string-length cadena))
      resultado
      (convertirAux cadena (+ 1 indice) (append resultado (list (string-ref cadena indice))))
    )
  )

(define (cadenaToListaCaracteres cadena)
  (convertirAux cadena 0 '())
  )

;Ejercicio 4 - recibir 3 listas de igual longitud y crear una sola lista con sublistas segun el indice,
;como hacer un zip de 3 listas

(define (zip3Elements L1 L2 L3)
   (if (and (equal? (length L1) (length L2)) (equal? (length L1) (length L3)))
       (if (null? L1)
           '()
            (append (list (list (first L1) (first L2) (first L3)))
                    (zip3Elements (rest L1) (rest L2) (rest L3))
                    )
            )
       (display "Los tamaños de las listas no son iguales")
       )
  )

;Ejercicio 5 - Clasificacion de listas

(define (clasificarRecursiva lista numeros cadenas simbolos caracteres)
  (if (null? lista)
      (list numeros cadenas simbolos caracteres)
      (let [(elemento (first lista))]
        (cond
          [(number? elemento) (clasificarRecursiva (rest lista)
                                                   (append numeros (list elemento)) cadenas simbolos caracteres)]
          [(string? elemento) (clasificarRecursiva (rest lista)
                                                    numeros (append cadenas (list elemento)) simbolos caracteres)]
          [(symbol? elemento) (clasificarRecursiva (rest lista)
                                                    numeros cadenas (append simbolos (list elemento)) caracteres)]
          [(char? elemento) (clasificarRecursiva (rest lista)
                                                    numeros cadenas simbolos (append caracteres (list elemento)))]
       )
   )
  )
  )

(define (clasificarTipoElementos lista)
  (clasificarRecursiva lista '() '() '() '())
  )
