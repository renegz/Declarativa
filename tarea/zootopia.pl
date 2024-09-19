% Base de conocimiento

% Personajes
personaje(judy_hops).
personaje(timmy_hops).
personaje(nick_wilde).
personaje(jefe_bogo).
personaje(ovina).
personaje(benjamin_garraza).
personaje(gazelle).
personaje(leodoro_leonzalez).
personaje(mr_big).
personaje(sra_nutriales).
personaje(flash).
personaje(bonnie_hops).
personaje(stu_hops).
personaje(jax).
personaje(finnick).
personaje(doug).
personaje(duke_weaselton).

% Relaciones: Profesión
profesion(judy_hops, oficial_de_policia).
profesion(nick_wilde, estafador).
profesion(jefe_bogo, jefe_de_policia).
profesion(ovina, asistente_alcalde).
profesion(benjamin_garraza, oficial_de_policia).
profesion(gazelle, cantante).
profesion(leodoro_leonzalez, alcalde).
profesion(mr_big, jefe_mafia).
profesion(sra_nutriales, ama_de_casa).
profesion(flash, empleado_dmv).
profesion(bonnie_hops, granjera).
profesion(stu_hops, granjero).
profesion(finnick, estafador).
profesion(doug, quimico).
profesion(duke_weaselton, ladron).
profesion(jax, guardaespaldas).

% Relaciones: Relaciones sociales y familiares
madre(bonnie_hops, judy_hops).
madre(bonnie_hops, timmy_hops).
padre(stu_hops, judy_hops).
padre(stu_hops, timmy_hops).
amigos(judy_hops, nick_wilde).
amigos(mr_big, judy_hops).
amigos(nick_wilde, finnick).
enemigos(judy_hops, duke_weaselton).
jefe(jefe_bogo, judy_hops).
jefe(jefe_bogo, benjamin_garraza).
jefe(leodoro_leonzalez, ovina).
jefe(mr_big, jax).
traiciona(ovina, leodoro_leonzalez).

% Relaciones: Comida favorita
comida_favorita(judy_hops, zanahorias).
comida_favorita(nick_wilde, helado_de_elefante).
comida_favorita(mr_big, pescado).
comida_favorita(benjamin_garraza, donas).
comida_favorita(flash, ensalada).

%Tipos de comida
comida_origen_animal(pescado).
comida_origen_animal(carne).
comida_origen_animal(huevos).
comida_origen_vegetal(ensalada).
comida_origen_vegetal(zanahorias).
comida_origen_vegetal(frutas).

% Relaciones: Raza
raza(judy_hops, conejo).
raza(nick_wilde, zorro).
raza(jefe_bogo, bufalo).
raza(ovina, oveja).
raza(benjamin_garraza, guepardo).
raza(gazelle, gacela).
raza(leodoro_leonzalez, leon).
raza(mr_big, musarania).
raza(sra_nutriales, nutria).
raza(flash, perezoso).
raza(bonnie_hops, conejo).
raza(stu_hops, conejo).
raza(jax, oso_polar).
raza(finnick, zorro_fennec).
raza(doug, carnero).
raza(duke_weaselton, comadreja).

% Relaciones: Tipo de animal
tipo_animal(judy_hops, mamifero).
tipo_animal(nick_wilde, mamifero).
tipo_animal(jefe_bogo, mamifero).
tipo_animal(ovina, mamifero).
tipo_animal(benjamin_garraza, mamifero).
tipo_animal(gazelle, mamifero).
tipo_animal(leodoro_leonzalez, mamifero).
tipo_animal(mr_big, mamifero).
tipo_animal(sra_nutriales, mamifero).
tipo_animal(flash, mamifero).
tipo_animal(bonnie_hops, mamifero).
tipo_animal(stu_hops, mamifero).
tipo_animal(jax, mamifero).
tipo_animal(finnick, mamifero).
tipo_animal(doug, mamifero).
tipo_animal(duke_weaselton, mamifero).

% Clausulas de Horn (Reglas generales)

% 1
partners(X, Y) :- profesion(X, P), profesion(Y, P), X \== Y.

% 2
posibles_amigos(X, Y) :- profesion(X, P), profesion(Y, P), X \== Y.

% 3
trabajador(X, Y) :- jefe(Y, X).

% 4 En este contexto solo existen asistentes de alcalde por lo que con esto nos basta.
tiene_asistente(X) :- trabajador(Y, X), profesion(Y, asistente_alcalde).

% 5
tiene_oficiales(X) :- profesion(X, jefe_de_policia), trabajador(Y, X), profesion(Y, oficial_de_policia).

% 6
carnivoro(X) :- comida_favorita(X, Comida), comida_origen_animal(Comida).

% 7
vegetariano(X) :- comida_favorita(X, Comida), comida_origen_vegetal(Comida).

% 8
predador(X) :- raza(X, zorro).
predador(X) :- raza(X, leon).
predador(X) :- raza(X, comadreja).
predador(X) :- raza(X, oso_polar).
predador(X) :- raza(X, guepardo).

% 9
buscado(X) :- profesion(X, estafador).
buscado(X) :- profesion(X, ladron).
buscado(X) :- profesion(X, jefe_mafia).

% 10
oficial_policia(X) :- profesion(X, oficial_de_policia).

% 11
pareja(X, Y) :- padre(X, Z), madre(Y, Z).

% 12
tiene_guardaespaldas(X) :- trabajador(Y, X), profesion(Y, guardaespaldas).

% 13
tiene_enemigos(X) :- enemigos(X, _).

% 14
hijo(X, Y, Z) :- madre(Z, X), padre(Y,X).

% 15
hermanos(X, Y) :- madre(Z, X), madre(Z, Y), padre(W, X), padre(W, Y), X \= Y.

% 16
traidor(X) :- traiciona(X, _).

% 17
comparten_profesion(X, Y) :- profesion(X, P), profesion(Y, P), X \= Y.

% 18
empleado_publico(X) :- profesion(X, oficial_de_policia).
empleado_publico(X) :- profesion(X, jefe_de_policia).
empleado_publico(X) :- profesion(X, asistente_alcalde).
empleado_publico(X) :- profesion(X, alcalde).

% 19
comparten_jefe(X, Y) :- jefe(Z, X), jefe(Z, Y), X \= Y.

%20
mamifero(X) :- tipo_animal(X, mamifero).