%Eliminar elemento en una posicion especifica

eliminar_elemento_aux(_, [], _, []) :- !.

eliminar_elemento_aux(Posicion, [_ | Tail], Posicion, NuevaLista) :-
    is(Contador1, +(Posicion,1)),
    eliminar_elemento_aux(Posicion, Tail, Contador1, NuevaLista), !.

eliminar_elemento_aux(Posicion, [Head|Tail], Contador, NuevaLista) :-
    is(Contador1, +(Contador,1)),
    eliminar_elemento_aux(Posicion, Tail, Contador1, NuevaListaParcial),
    =(NuevaLista,[Head | NuevaListaParcial]).

eliminar_elemento(Posicion, Lista, R) :-
    eliminar_elemento_aux(Posicion, Lista, 1, R).

% EJEMPLO DE EJECUCION : eliminar_elemento(4,[1,2,3,4],R).
% R = [1, 2, 3]