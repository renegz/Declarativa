% Contar la longitud de cada sublista
longitud([], 0) :- !.
longitud([_ | Resto], Longitud) :-
    longitud(Resto, LongitudTemporal),
    is(Longitud, +(LongitudTemporal, 1)).

%Tarea filtrar sublistas impares, solo colocar las impares

filtrar_longitud_impar([], []) :- !.
filtrar_longitud_impar([Sublista | Resto], [Sublista | NuevoResto]) :-
    longitud(Sublista, Conteo),
    is(Modulo, mod(Conteo, 2)),
    =\=(Modulo, 0),
    filtrar_longitud_impar(Resto, NuevoResto), !.
filtrar_longitud_impar([_ | Resto], NuevoResto) :-
    filtrar_longitud_impar(Resto, NuevoResto).

% Ejemplo de ejecucion: filtrar_longitud_impar([[1,2,3],[1,2],[2,3,4,5,6]], R).
% R->R = [[1, 2, 3], [2, 3, 4, 5, 6]].