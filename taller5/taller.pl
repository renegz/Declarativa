%Arboles

%[Valor, SubarbolIzq, SubarbolDerecho]
% [ 8, [3, [1, [], []], [6, [4, [], []], [7, [], []]]], [ 10, [], [14, [ 13, [], []], []]]]

%Ejercicio 1: Calcular altura de un arbol binario
calculo_altura([], 0) :- !.

calculo_altura([_, Izquierda, Derecha], Altura) :-
    calculo_altura(Izquierda, R1),
    calculo_altura(Derecha, R2),
    is(AlturaMax, max(R1, R2)),
    is(Altura, +(AlturaMax, 1)).

%Verificar si un arbol binario es balanceado.

% [ 8, [3, [1, [], []], [6, [4, [], []], [7, [], []]]], [ 10, [9, [], []], [14, [ 13, [], []], []]]]

es_balanceado([]) :- !.

es_balanceado([_, Izquierda, Derecha]) :-
    calculo_altura(Izquierda, R1),
    calculo_altura(Derecha, R2),
    =<(abs(R1 - R2), 1),
    es_balanceado(Izquierda),
    es_balanceado(Derecha).

% Ejercicio 3: Contar hojas y contar nodos internos
% [ 8, [3, [1, [], []], [6, [4, [], []], [7, [], []]]], [ 10, [], [14, [ 13, [], []], []]]]

% primer caso: arbol vacio, hojas 0 nodos int 0
contar([], 0, 0) :- !.

%segundo caso: Nodo con listas vacias, hojas 1, nodos int 0
contar([_, [], []], 1, 0) :- !.

%tercer caso: Nodo con algun hijo
contar([_, Izquierda, Derecha], H, N) :-
    contar(Izquierda, H1, N1),
    contar(Derecha, H2, N2),
    is(N, +(+(N1,N2), 1)),
    is(H, +(H1,H2)),
    !.

%Ejercicio 4: lista con los nodos que existan dentro de un arbol

buscar_rango([],_, _ , []) :- !.

buscar_rango([Dato, Izquierda, Derecha], Inferior, Superior, Res) :-
    =<(Inferior, Dato),
    =<(Dato, Superior),
    buscar_rango(Izquierda, Inferior, Superior, R1),
    buscar_rango(Derecha, Inferior, Superior, R2),
    append(R1, [Dato | R2], Res),
    !.

buscar_rango([Dato, _, Derecha], Inferior, Superior, Res) :-
    <(Dato, Inferior),
    buscar_rango(Derecha, Inferior, Superior, Res).

buscar_rango([Dato, Izquierda, _], Inferior, Superior, Res) :-
    >(Dato, Superior),
    buscar_rango(Izquierda, Inferior, Superior, Res).

%Ejercicio 5 Verificar si un arbol binario es un bst
    %El que yo hice
% es_bst([]) :- !.

% es_bst([Dato, [_, _, _], [H2 , _, _]]) :- 
%     >(Dato, H2),
%     fail, !.

% es_bst([Dato, [H1, _, _], [_ , _, _]]) :- 
%     <(Dato, H1),
%     fail, !.

% es_bst([_, Izq, Der]) :- 
%     es_bst(Izq),
%     es_bst(Der).

% EJERCICIO 5
% es_arbol_busqueda(Arbol)
% caso base
es_arbol_busqueda([]) :- !.
 
% caso recursivo
es_arbol_busqueda([Valor, SubArbolIzquierdo, SubArbolDerecho]) :-
  todos_menores(SubArbolIzquierdo, Valor),
  todos_mayores(SubArbolDerecho, Valor),
  es_arbol_busqueda(SubArbolIzquierdo),
  es_arbol_busqueda(SubArbolDerecho).
 
% todos_menores(Arbol, Limite)
% caso base
todos_menores([], _) :- !.
 
% caso recursivo
todos_menores([Valor, SubArbolIzquierdo, SubArbolDerecho], Limite) :-
  <(Valor, Limite),
  todos_menores(SubArbolIzquierdo, Limite),
  todos_menores(SubArbolDerecho, Limite).
 
% todos_mayores(Arbol, Limite)
% caso base
todos_mayores([], _) :- !.
 
% caso recursivo
todos_mayores([Valor, SubArbolIzquierdo, SubArbolDerecho], Limite) :-
  >(Valor, Limite),
  todos_mayores(SubArbolIzquierdo, Limite),
  todos_mayores(SubArbolDerecho, Limite).