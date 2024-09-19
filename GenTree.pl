% Base de conocimiento
% Debe ir en minusculas todo lo que son datos en concreto.

papa(daniel, sebastian).
papa(daniel, korina).
papa(daniel, miguel).
papa(sebastian, sofia).
papa(sebastian, alfredo).
papa(rafael, aaron).

mama(lorna, sebastian).
mama(lorna, korina).
mama(lorna, miguel).
mama(elena, sofia).
mama(elena, alfredo).
mama(korina, aaron).

%Clausulas de Horn

% X es padre de Y cuando X es papa de Z y Z es papa de Y
% Ser abuelo es un efecto con dos posibles causas, un abuelo paterno o materno
abuelo(X, Y) :- papa(X, Z), papa(Z, Y).
abuelo(X, Y) :- papa(X, Z), mama(Z, Y).

% Hay un problema ya que se repiten los datos, se puede hacer uso de la clausula de comparacion.
sibling(X, Y) :- papa(Z, X), papa(Z, Y), mama(L, X), mama(L, Y), X \== Y.

half_sibling(X, Y) :- papa(Z, X), papa(Z, Y), X \== Y.
half_sibling(X, Y) :- mama(Z, X), mama(Z, Y), X \== Y.

