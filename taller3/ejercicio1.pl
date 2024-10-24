%Agregar elemento a la lista

% agregar_elemento(Elemento, Lista, NuevaLista) :-
%     =(NuevaLista, [ Elemento|Lista ]).

agregar_elemento(Elemento, Lista, [Elemento|Lista]) :- !.

%Ejercicio2: eliminar el primer elemento de la lista

eliminar_elemento([_|NuevaLista] , NuevaLista) :- !.

%Ejercicio 3: Mostrar elementos de una lista en el orden de aparicion

mostrar_elementos([]) :- !.
mostrar_elementos([Head|Tail]) :-
    write(Head),
    write("  "),
    mostrar_elementos(Tail).
    
%Ejercicio 4: Mostrar lista al reves.

mostrar_elementos_inverso([]) :- !.
mostrar_elementos_inverso([Head|Tail]) :-
    mostrar_elementos_inverso(Tail),
    write(Head),
    write("  ").

%Ejercicio 5: Buscar un elemento y devolver su posicion

%Caso base
buscar_elemento_aux(_, [], _, -1) :- !.

%Caso en el que encuentra el elemento
buscar_elemento_aux(Elemento, [Elemento|_], Contador, Contador) :-
    !.

buscar_elemento_aux(Elemento, [_|Tail], Contador, Posicion) :-
    %\==(Elemento,Head), %Siempre va ser diferente ya que cuando sea igual entra en el otro caso.
    is(Contador1, +(Contador, 1)),
    buscar_elemento_aux(Elemento, Tail, Contador1, Posicion).

buscar_elemento(Elemento, Lista, Posicion) :-
    buscar_elemento_aux(Elemento, Lista, 1, Posicion).
%EJEMPLO DE EJECUCION: buscar_elemento(2,[1,2,3,4,5],R).

%Ejercicio 6: Contar ocurrencias de un elemento en la lista

contar_ocurrencias_aux(_, [], Contador, Contador) :- !.

contar_ocurrencias_aux(Elemento, [Elemento|Tail], Contador, Ocurrencias) :- 
    is(Contador1, +(Contador,1)),
    contar_ocurrencias_aux(Elemento, Tail, Contador1, Ocurrencias).

contar_ocurrencias_aux(Elemento, [_|Tail], Contador, Ocurrencias) :- 
    contar_ocurrencias_aux(Elemento, Tail, Contador, Ocurrencias).

contar_ocurrencias(Elemento, Lista, R) :-
contar_ocurrencias_aux(Elemento, Lista, 0, R).

%Ejercicio 7: Eliminar lista
%Caso base
eliminar_ocurrencias(_, [], []) :- !.

%Casos recursivos
eliminar_ocurrencias(Elemento, [Elemento | Tail], ListaModificada) :-
    eliminar_ocurrencias(Elemento, Tail, ListaModificada), !.

eliminar_ocurrencias(Elemento, [Head | Tail], ListaModificada) :-
    eliminar_ocurrencias(Elemento, Tail, ListaModificadaParcial),
    =(ListaModificada, [Head | ListaModificadaParcial]).
