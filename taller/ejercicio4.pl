% HECHOS


%RELACIONES
pelicula(rapunsel, animacion).
pelicula(frozen, animacion).
pelicula(avatar, ciencia_ficcion).
pelicula(terminator, ciencia_ficcion).
pelicula(titanic, romance).
pelicula(romeo_y_julieta, romance).
pelicula(rocky, deportes).
pelicula(creed, deportes).

gusto(rene, animacion).
gusto(rene, ciencia_ficcion).
gusto(melvin, romance).
gusto(melvin, deportes).

visto(rene, rapunsel).
visto(melvin, titanic).

%REGLAS

recomendar_pelicula(Usuario, Pelicula) :- %Usuario = rene
    gusto(Usuario, Genero),
    pelicula(Pelicula, Genero),
    not(visto(Usuario, Pelicula)).