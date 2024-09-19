futbol(alberto).
futbol(boris).
titular(boris).

equipo_futbol(X,Y) :- futbol(Y), equipo(X,Y).

equipo(X,Y) :- !, futbol(X), futbol(Y).
equipo(X,boris) :- futbol(X), titular(X).

