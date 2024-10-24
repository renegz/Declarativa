%Ejercicio 1
%recorrer_lista_de_listas(Lista).
%Caso base - La lista principal ya no tiene elementos para mostrar.
recorrer_lista_de_listas([]) :- !.

%Caso recursivo
recorrer_lista_de_listas([Sublista | RestoElementos]) :-
    recorrer_lista(Sublista),
    recorrer_lista_de_listas(RestoElementos).

recorrer_lista([]) :- !.
recorrer_lista([Elemento | RestoElementos]) :-
    write(Elemento),
    write(" "),
    recorrer_lista(RestoElementos).

%Ejercicio 2
%reemplazar(ValorAntiguo, ValorNuevo, Lista, ListaModificada).

reemplazar(_,_,[],[]) :- !.

reemplazar(ValorAntiguo, ValorNuevo, [Sublista| OtrasSublistas],
     [SublistasReemplazadas | OtrasSublistasReemplazadas]) :-
    reemplazar_en_sublista(ValorAntiguo, ValorNuevo, Sublista, SublistasReemplazadas),
    reemplazar(ValorAntiguo, ValorNuevo, OtrasSublistas,  OtrasSublistasReemplazadas).

%Caso Base
reemplazar_en_sublista(_, _, [], []) :- !.

reemplazar_en_sublista(ValorAntiguo, ValorNuevo, [ValorAntiguo | RestoElementos],
     [ValorNuevo | RestoElementosReemplazados]) :-
    reemplazar_en_sublista(ValorAntiguo, ValorNuevo, RestoElementos, RestoElementosReemplazados),
    !.

reemplazar_en_sublista(ValorAntiguo, ValorNuevo, [Elemento | RestoElementos],
     [Elemento | RestoElementosReemplazados]) :-
    reemplazar_en_sublista(ValorAntiguo, ValorNuevo, RestoElementos, RestoElementosReemplazados).

%Ejercicio 3
%count_even_list(ListaDeListas, ConteoTotal).

count_even_list(ListaDeListas, ConteoTotal) :-
    count_even_list(ListaDeListas, 0, ConteoTotal).

count_even_list([], ContadorTemporal, ContadorTemporal) :- !.

%Caso recursivo 1: Todos los elementos de la lista actual son pares
count_even_list([Sublista | Resto], ContadorTemporal, ConteoTotal) :-
    todos_pares(Sublista),
    is(NuevoConteo, +(ContadorTemporal, 1)),
    count_even_list(Resto, NuevoConteo, ConteoTotal), !.

%Caso recursivo 2: Exista al menos un elemento de la lista que no es par.
count_even_list([_ | Resto], ContadorTemporal, ConteoTotal) :-
    count_even_list(Resto, ContadorTemporal, ConteoTotal).

todos_pares([]) :- !.
todos_pares([Elemento | Resto]) :-
    is(Residuo, mod(Elemento, 2)),
    =:=(Residuo, 0),
    todos_pares(Resto).

%Ejercicio 4
longest_list([], 0) :- !.

longest_list( [Sublista | Resto], R) :-
    longest_sublist(Sublista, R1),
    longest_list(Resto, R2),
    maximo_numero(R1, R2, R).

%Funciones auxiliares
longest_sublist([], 0) :- !.

longest_sublist([_ | Resto], Longitud) :-
    longest_sublist(Resto, SubLongitud),
    is(Longitud, +(SubLongitud, 1)).

maximo_numero(R1, R2, R1) :-
    >=(R1, R2), !.

maximo_numero(R1, R2, R2) :-
    R2 > R1.