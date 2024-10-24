%Tarea: devolver lista con todos los nodos del bst que sean impares
%Arbol
% [33, [19, [10, [9, [], []], [15, [], []]], [22, [], []]], [36, [34, [], []], [38, [], []]]]

nodos_impares([], []) :- !.

nodos_impares([Dato, Izquierda, Derecha], Res) :-
    is(ResMod, mod(Dato, 2)),
    >(ResMod, 0),
    nodos_impares(Izquierda, R1),
    nodos_impares(Derecha, R2),
    append(R1, [Dato | R2], Res),
    !.

nodos_impares([_, Izquierda, Derecha], Res) :-
    nodos_impares(Izquierda, R1),
    nodos_impares(Derecha, R2),
    append(R1, R2, Res).

%Ejemplo de uso: 
% nodos_impares([33, [19, [10, [9, [], []], [15, [], []]], [22, [], []]], [36, [34, [], []], [38, [], []]]], R).
% R = [9, 15, 19, 33].