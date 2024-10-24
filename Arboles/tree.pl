show_pre_order([]).
show_pre_order([P,L,R]) :-
    write(P),
    write(", "),
    show_pre_order(L),
    show_pre_order(R).

show_in_order([]).
show_in_order([P,L,R]) :-
    show_in_order(L),
    write(P),
    write(", "),
    show_in_order(R).

show_post_order([]).
show_post_order([P,L,R]) :-
    show_post_order(L),
    show_post_order(R),
    write(P),
    write(", ").

search_value_bst(_,[]) :- !, fail.
search_value_bst(V, [V|_]) :- !.
search_value_bst(V, [P,L,_]) :-
    =<(V,P),
    search_value_bst(V,L),
    !.
search_value_bst(V, [P,_,R]) :-
    >(V,P),
    search_value_bst(V,R).

%Insertar en un bst
insert_value_bst(V,[],[V,[],[]]) :- !.
insert_value_bst(V,[P,L,R], T) :-
    =<(V,P), %En los libros generalmente los repetidos se van a la izquierda, realmente depende.
    insert_value_bst(V,L,L1),
    =(T, [P,L1,R]), %Se pone el nuevo subarbol izquierdo
    !.
insert_value_bst(V,[P,L,R], T) :-
    >(V,P),
    insert_value_bst(V,R,R1),
    =(T, [P,L,R1]), %Se pone el nuevo subarbol izquierdo
    !.

%Borrar en un bst, caso 1: 0 hijos, solo se borra
%Caso 2: 1 hijo: solo se sube el hijo
%Caso 3: El sucesor (Menor de los mayores) reemplaza el nodo

%Caso 1
delete_value_bst(V, [V, [], []], []) :- !. %Se devuelve lista vacia

%Caso 2
delete_value_bst(V, [V, L, []], L) :- !.
delete_value_bst(V, [V, [], R], R) :- !.

%Caso 3
delete_value_bst(V, [V,L,R], T) :-
    find_ios(R,N), %Find in order succesor
    =(T, [N, L, R1]).
    delete_value_bst(N, R, R1), %Mando una nueva recursion para eliminar al succesor.
    !.

%Casos generales, en los que se recorre el arbol segun el valor sea > o < al nodo actual.
delete_value_bst(V, [P, L, R], T) :-
    <(V,P),
    delete_value_bst(V,L,L1),
    =(T,[P,L1,R]),!.

delete_value_bst(V, [P, L, R], T) :-
    >(V,P),
    delete_value_bst(V,L,R1),
    =(T,[P,L,R1]),!.

%Find in order succesor
find_ios([N,[],_], N) :- !.
find_ios([_, L, _], N) :-
    find_ios(L,N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Contar cuantos nodos tiene un arbol.
count_nodes([], 0) :- !.
count_nodes([_, L, R], N) :-
    count_nodes(L, N1),
    count_nodes(R, N2),
    is(N, +(1, +(N1,N2))).

%Predicado que dado un bst encontrar el dato mas grande

mas_grande([N, _, []], N) :- !.
mas_grande([_, _, R], N) :-
    mas_grande(R, N).

%Predicado que dado un bst encontrar el dato mas pequeño

mas_grande([N, [], _], N) :- !.
mas_grande([_, L, _], N) :-
    mas_grande(L, N).

%Dados dos arboles ver si son exactamente iguales o no.
iguales(T,T). %Dos arboles son iguales cuando son iguales, version facil

%Version larga
iguales2([], []) :- !.
iguales2([P, L1, R1], [P, L2, R2]) :-
    iguales2(L1, L2),
    iguales2(R1, R2), !.
iguales2(_, _) :- fail.