#lang racket

;Funcion que solicite precio original del producto y solicite el porcentaje de descuento que se le quiere aplicar

(define (descuento)
  (display "Ingrese el precio del producto: ")
  (let ((precioProducto (read)))
    (display "Ingrese el descuento que desea aplicar al producto (sin el signo %): ")
    (let* ((descuento (read)) (descuentoReal (- 1 (/ descuento 100))))
      (display "Precio del producto con descuento: $")
      (display (* precioProducto descuentoReal))
   )
))

;Ejemplo de ejecucion -> (descuento)
;Ingrese el precio del producto: 100
;Ingrese el descuento que desea aplicar al producto (sin el signo %): 20
;Precio del producto con descuento: $80