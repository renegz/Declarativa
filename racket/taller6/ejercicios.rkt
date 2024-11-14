#lang racket

;Celcius to Fahrenheit (ejercicio 1)
(define (celciusToFahrenheit)
  (display "Ingrese la temperatura en celcius: ")
  (let* ((celcius (read)) (fahrenheit ( + (* celcius (/ 9 5)) 32)))
    (display "\nCelcius: ")
    (display celcius)
    (display "\nFahrenheit: ")
    (display fahrenheit)
 )
)
;( + (* C (/ 9 5)) 32))

;Ejercicio 2: Funcion que solicite al usuario un numero del 1-7 y mostrar el dia de la semana correspondiente
(define (weekDay)
  (display "Ingresa un numero del 1 al 7: ")
  (let* ((day (read)))
    (cond
      ((= day 1) (display "Lunes"))
      ((= day 2) (display "Martes"))
      ((= day 3) (display "Miercoles"))
      ((= day 4) (display "Jueves"))
      ((= day 5) (display "Viernes"))
      ((= day 6) (display "Sabado"))
      ((= day 7) (display "Domingo"))
      (else
       (display "Numero invalido"))
    )))

;Ejercicio 3: Pedir edad del usuario y clasificar su grupo etario usando case
(define (grupoEtario)
  (display "Ingrese su edad: ")
  (let* ((age (read)))
         ( case
              (cond
                ((< age 13) `niño)
                ((< age 20) `adolescente)
                ((< age 65) `adulto)
                (else `viejo)
                )
            ((niño) (display "Grupo etario: Niño"))
            ((adolescente) (display "Grupo etario: Adolescente"))
            ((adulto) (display "Grupo etario: Adulto"))
            ((viejo) (display "Grupo etario: Viejo"))
          )))

;Ejercicio 4: escribe una funcion que solicite al usuario su peso en kilogramos y altura en metros y calcular IMC

(define (IMC)
  (display "Ingrese su peso en kg")
  (let ((peso (read)))
    (display "Ingrese su altura en metros")
    (let ((altura (read)))
      
       (let ((imc (/ peso (* altura altura))))
         (display "Su IMC es: ")
         (display imc)
         (cond
           ((< imc 18.5) (display "\nBajo de peso"))
           ((< imc 25) (display "\nPeso normal"))
           ((< imc 30) (display "\nSobrepeso"))
           ((> imc 29) (display "\nObesidad")))
       )
  )
))