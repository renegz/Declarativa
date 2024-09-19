%Caso base
suma_digitos(X, X) :- 
    <(X,10), %Si X es menor que 10 el resultado va ser la misma X.
    !.

suma_digitos(X, Suma) :-
    is(UltimoDigito, mod(X,10)), %Agarra el ultimo digito
    is(RestoNumero, div(X, 10)), %Numero sin el ultimo digito
    suma_digitos(RestoNumero, Suma1), %Recursion que guarda la otra suma en Suma1
    is(Suma, +(UltimoDigito, Suma1)). %Suma es igual a ultimo digito + Suma1 que es la suma de lo demas