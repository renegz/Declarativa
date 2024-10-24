%en pantalla, uno por linea

%colocar(A,B).

colocar(A, B) :- =:=(A,B), write(A), !.

colocar(A, B) :- write(A), is(X, +(A,1)), colocar(X,B).

%Dado el intervalo [A,B], hacer la sumatoria de todos los datos del intervalo

sumatoria(A,A,A) :- !. %Si los dos numeros son iguales R es A o B
sumatoria(A,B,R) :- is(B1, -(B,1)) ,sumatoria(A, B1, R1), is(R, +(R1, B)). %No se debe enviar R en la recursion ya que se estaria reasignando

%Se requiere una clausula que provea el n-esimo termino de la sucesion de Fibonacci

fibonacci(0, 1) :- !.
fibonacci(1, 1) :- !.
fibonacci(N, V) :- 
    is(N1, -(N,1)),
    is(N2, -(N,2)),
    fibonacci(N1,V1),
    fibonacci(N2,V2),
    is(V,+(V1,V2)).

%Dado un intervalo de enteros [A,B], contar cuantos datos hay en el intervalo

% contar(3,8,C).
contar(A,A,1) :- !.
contar(A,B,C) :-
    is(A1, +(A,1)),
    contar(A1,B,C1),
    is(C, +(1,C1)).

ejemplo(X,Y) :- write(+(X,Y)) ; write(-(X,Y)). %Con write se pueden poner directamente operaciones, es un truco