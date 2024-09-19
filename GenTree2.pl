% Base de conocimiento

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

hombre(daniel).
hombre(sebastian).
hombre(rafael).
hombre(miguel).
hombre(alfredo).
hombre(aaron).

mujer(lorna).
mujer(elena).
mujer(korina).
mujer(sofia).

% Clausulas de Horn

% Declaracion de los hermanos con genero
hermano(X,Y) :- hombre(X), papa(F,X), papa(F,Y), mama(M,X), mama(M,Y), \==(X,Y).
hermana(X,Y) :- mujer(X), papa(F,X), papa(F,Y), mama(M,X), mama(M,Y), \==(X,Y).

% Declaracion de los abuelos sin genero
abuelo(X,Y) :- papa(X,Z),papa(Z,Y).
abuelo(X,Y) :- papa(X,Z),mama(Z,Y).

abuela(X,Y) :- mama(X,Z), mama(Z,Y).
abuela(X,Y) :- mama(X,Z), papa(Z,Y).

% Declaracion de los hermanos sin genero
sibling(X,Y) :- papa(Z,X),papa(Z,Y), mama(L,X),mama(L,Y), \==(X,Y).

% Declaracion de los tios
tio(X,Y) :- papa(F,Y), hermano(X,F).
tio(X,Y) :- mama(M,Y), hermano(X,M).

tia(X,Y) :- papa(F,Y), hermana(X,F).
tia(X,Y) :- mama(M,Y), hermana(X,M).

% Declaracion de los padres o progenitores
padres(X,Y) :- papa(X,C), mama(Y,C).
padres(X,Y) :- mama(X,C), papa(Y,C).

% Declaracion de los cuñados
cunyado(X,Y) :- hombre(X), padres(X,Z), sibling(Z,Y).
cunyada(X,Y) :- mujer(X), padres(X,Z), sibling(Z,Y).

% Declaracion de los sobrinos, se puede user tio y tia para no escribir papa, sibling
sobrino(X,Y) :- hombre(X), papa(Z,X), sibling(Z,Y).
sobrino(X,Y) :- hombre(X), mama(Z,X), sibling(Z,Y).

sobrina(X,Y) :- mujer(X), papa(Z,X), sibling(Z,Y).
sobrina(X,Y) :- mujer(X), mama(Z,X), sibling(Z,Y).


% Declaracion de los suegros
suegro(X,Y) :- padres(Z,Y), papa(X,Z).
suegra(X,Y) :- padres(Z,Y), mama(X,Z).

% Declaracion de los bisabuelos
bisabuelo(X,Y) :- papa(X,Z), abuelo(Z,Y).
bisabuelo(X,Y) :- papa(X,Z), abuela(Z,Y).

bisabuelo(X,Y) :- papa(X,Z), abuelo(Z,Y).
bisabuelo(X,Y) :- papa(X,Z), abuela(Z,Y).

bisabuelo(X,Y) :- mama(X,Z), abuelo(Z,Y).
bisabuelo(X,Y) :- mama(X,Z), abuela(Z,Y).

halfSibling(X,Y) :- papa(Z,X),papa(Z,Y), X\== Y.
halfSibling(X,Y) :- mama(Z,X),mama(Z,Y), X\== Y.
