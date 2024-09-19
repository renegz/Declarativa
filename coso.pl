%Hechos, son factos, los ! cortan para que deje de verificar ramas cuando se llega a el.
factorial(0,1) :- !.
factorial(1,1) :- !.

%Calcular el factorial de un numero de manera general ( N! = N * (N-1)!), (notacion prefija)
%Factorial no es una funcion, es un predicado, no es algo que pueda devolver valores
%factorial(N,X) :- * (N, factorial(-(N,1),Y)). %-(N,1) no es una proposicion entonces no es algo que prolog pueda hacer

%Se debe establecer la proposicion N1 es N-1, X es N*Y entonces asi se saca el factorial
factorial(N,X) :- is(N1,-(N,1)), factorial(N1,Y), is(X,*(N,Y)).

%Se envia R vacio para que despues cuando haga la definicion se llene con la respuesta
suma(X,Y,R) :- is(R,+(X,Y)).

%comparar(X,Y) :- =<(X,Y). el nl es para un salto de linea
comparar(X,Y) :- is(S, +(X,Y)), write(S),nl,write('Hola Mundo').

%La respuesta R aparece porque enseña lo que desconocemos cuando se verifica que todas las condiciones son true
%Entonces al verificar el write(R) verifica que sea true imprimiendolo en pantalla y luego muestra R.
dividir(X,Y,R) :- is(R, /(X,Y)), write(R).

dividirE(X,Y,R) :- is(R, //(X,Y)), write(R). %Division entera

modulo(X,Y,R) :- is(R, mod(X,Y)), write(R). %Residuo de division (modulo)

%maximo(X,Y) :- max(X, Y).

%Hacer clausula para una ec. lineal(Despejamos la ecuacion general y se opera, validamos que A != 0)

%ecuacionLineal(A,B,R) :- is(R, /(-B,A)), =\=(A,0). %Es una mala practica para prolog, no se deberia verificar ahi que A != 0.

ecuacionLineal(0,_,_) :- !, fail. %Si el usuario mete 0 se corta directamente. el _ significa que no nos importa lo que sea.
% ! es para cortar y que no siga con las demas versiones, y fail es para que siempre la respuesta sea false.
ecuacionLineal(A,B,R) :- is(R, /(-B,A)).

ecuacionCuadratica(0,_,_,_,_) :- !, fail. %para no dividir entre 0
ecuacionCuadratica(A,B,C,_,_) :- is(D, -(*(B,B), *(4,*(A,C)))), <(D,0),!,fail.
ecuacionCuadratica(A,B,C,R1,R2) :- is(R1, /(+(-B, sqrt(-(*(B,B),*(*(-4,A),C)))),*(2,A))), 
is(R2, /(-(-B, sqrt(-(*(B,B),*(*(-4,A),C)))),*(2,A))).