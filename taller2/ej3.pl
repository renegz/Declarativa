% palindromo(X) :-
%     invertir_numero(X, Invertido), %Se invierte el numero.
%     X =:= Invertido. %Si son iguales devuelve true.

% invertir_numero(Numero, Invertido) :-
%     invertir_numero_aux(Numero, 0, Invertido).

% %Caso base
% invertir_numero_aux(0, Acumulador, Acumulador) :-
%     !.

% invertir_numero_aux(Numero, Acumulador, Invertido) :-
%     Numero>0,
%     is(lastValue, mod(Numero,10)),
%     is(numAcc, +(lastValue, *(Acumulador, 10))),
%     is(newNumber, div(Numero, 10)),
%     invertir_numero_aux(newNumber, numAcc, Invertido).

% REGLA - es palindromo/1
es_palindromo(Numero) :-
    invertir_numero(Numero, Invertido),
    Numero =:= Invertido.
    % invertir el numero
    %comparar si el numero invertido es igual al numero original
    
    
invertir_numero(Numero, Invertido):-
    invertir_numero_aux(Numero, 0, Invertido).
    
invertir_numero_aux(0, Acumulador, Acumulador) :- !.
    
%caso recursivo
invertir_numero_aux(Numero, Acumulador, Invertido) :-
    Numero>0,
    is(Digito, mod(Numero, 10)),
    is(NuevaCantidad, +(Digito, *(Acumulador, 10))),
    is(RestoNumero, div(Numero, 10)),
    invertir_numero_aux(RestoNumero, NuevaCantidad, Invertido).