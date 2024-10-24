repetidos([H|T], R) :- 
    repetidos_aux([H|T], H, R1),
    =(R, [H|R1]).

repetidos_aux([], _, []):-!.

repetidos_aux([H|T], H, R):-
    repetidos_aux(T,H,R), !.

repetidos_aux([H|T], _, R) :-
    repetidos_aux(T,H,R1),
    =(R,[H|R1]).

%Añadir repetidos en una lista

added_repetidos([H|T], R) :-
    repAux(T, H, R).

repAux([], _, []) :- !.

repAux([H|T], H, R) :-
    =(R, [H | R1]),
    makeSub(T, H, R1), !.

repAux([H|T], _, R) :-
    repAux([H|T], H, R1).

makeSub([H | T], H, R) :-
    =(R, [H | R1]),
    makeSub(T, H, R1), !.

makeSub([H| T], _, R) :-
    repAux(T, H, R).

%ejercicio10

duplicados([], []) :- !.
duplicados([H|T], R) :-
    =(R, [H,H|R1]),
    duplicados(T, R1).

%Ejercicio11 una lista, un n y una lista repetida n veces

nduplicados([], _, []) :- !.
nduplicados([H|T], N, R) :-
    createNlist(H, N, 0, R1),
    append(R1, R2, R),
    nduplicados(T, N, R2).

createNlist(_, N, N, []):-!.
createNlist(Number, N, Acc, R):-
    is(Acc1, +(Acc,1)),
    =(R, [Number|R1]),
    createNlist(Number, N, Acc1, R1).

%ejercicio12