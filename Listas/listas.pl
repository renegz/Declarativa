% Recursion por posposicion
longitud([],0) :- !.
longitud([_|T], N):-
    longitud(T,N1),
    is(N, +(N1,1)).
% Recursion por posposicion
sumatoria([],0) :-!.
sumatoria([H|T],S) :-
    sumatoria(T,S1),
    is(S, +(S1,H)).

%Invertir es una recursion por cola
invertir(L,R) :-
    invertirAux(L,[],R).

invertirAux([],L2,L2) :- !.
invertirAux([H1|T1],L2,R) :-
    invertirAux(T1,[H1|L2],R).

unir([],L2,L2) :- !.
unir(L1,L2,R) :-
    unir(T1,[H1|L2],R).

concatenar(L1,L2,R) :-
    invertir(L1,L1I),
    unir(L1I,L2,R).

%zip y unzip, zipear dos listas genera una lista de dos elementos o de parejas.
zip(L1,L2,Z) :-
    longitud(L1,N1),
    longitud(L2,N2),
    =:=(N1,N2),
    zipAux(L1,L2,[],Z1),
    invertir(Z1,Z).

zipAux([],[],L3,L3) :- !.
zipAux([H1|T1],[H2|T2],L3,Z) :-
    =(H3,[H1,H2 | []]), %Hacemos un par, una lista de dos cabezas que la cola es nula
    zipAux(T1,T2,[H3|L3],Z). %Agregamos el par

%TAREA: HACER UNZIP

% unzip(Pairs, List1, List2) es cierto si List1 es la lista de los primeros elementos
% de cada par en Pairs, y List2 es la lista de los segundos elementos.

unzip([], [], []).
unzip([[X,Y]|T], [X|L1], [Y|L2]) :-
    unzip(T, L1, L2).
