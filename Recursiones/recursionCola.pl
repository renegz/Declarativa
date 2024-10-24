factorialCola(0,1) :- !.
factorialCola(1,1) :- !.

%Se utiliza una "funcion" auxiliar donde se inicializan los datos donde iniciara la recursion
%Para el factorial usando recursion por cola se envia el acum=1 y cont=1
factorialCola(N,F) :- 
    factorialAux(N,1,1,F).

%Caso base cuando llegue al final de la recursion por cola se asocia F a la respuesta
factorialAux(N, Acumulador, N, F) :-
    is(F, *(Acumulador, N)),
    !.

%Casos iniciales donde inician las recursiones.
factorialAux(N, Acumulador, Contador, F) :-
    is(Acum1, *(Acumulador, Contador)),
    is(Cont1, +(Contador, 1)),
    factorialAux(N, Acum1, Cont1, F).

%Ejercicio 2: Fibonacci

fibonacciCola(0,1) :- !.
fibonacciCola(1,1) :- !.
fibonacciCola(N,F) :-
    fibonacciAux(N,2,1,1,F).

%Caso base mutuamente excluyente con el caso general.
fibonacciAux(N,N,N1,N2,F) :-
    is(F,+(N1,N2)),
    !.

%N1 = N-2, N2 = N-1
fibonacciAux(N,Cont,N1,N2,F) :-
    is(N3,+(N1,N2)),
    is(Cont1,+(Cont,1)),
    fibonacciAux(N,Cont1,N2,N3,F). %Se pone primero N2 antes que N3 por como trabaja prolog si se pone N3,N2 no sirve.

%Listas

%Caso base, llegará aca cuando la tail sea una lista vacia, y N será 0.
contar([],0) :- !.

%Prolog maneja las listas agarrando el primer dato como cabeza y lo demas de la lista es la cola.
contar([_|TAIL],N) :- %Se sustituye el HEAD por _ porque en este caso no se usará
    %writeln(HEAD), %La cabeza va como un dato suelto
    %writeln(TAIL). %Es una lista
    contar(TAIL,N1),
    is(N, +(N1,1)).