%Hacer el codigo de combinatoria

factorial(0,1) :- !.
factorial(1,1) :- !.

%Se debe establecer la proposicion N1 es N-1, X es N*Y entonces asi se saca el factorial
factorial(N,X) :- is(N1,-(N,1)), factorial(N1,Y), is(X,*(N,Y)).

%Por alguna razon en prefijo no me funciona
% combinatoria(N, R, C) :-
%     factorial(N, Num),
%     is(Resta, -(N,R)),
%     factorial(Resta, Resta1),
%     factorial(R, R1)
%     is(Mult, *(Resta1, R1)),
%     is(C, div(Num, Mult)).

combinatoria(N, R, C) :-
    factorial(N, Num),
    Resta is N - R,
    factorial(Resta, Resta1),
    factorial(R, R1),
    Mult is Resta1 * R1,
    C is Num / Mult.