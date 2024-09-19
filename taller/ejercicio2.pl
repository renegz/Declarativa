%Hechos
juego_disponible(minecraft).
juego_disponible(among_us).
juego_disponible(overwatch).
juego_disponible(terraria).
juego_disponible(halo).
juego_disponible(fifa_24).
juego_disponible(spyro).
juego_disponible(fall_guys).
juego_disponible(the_last_of_us).
juego_disponible(warzone).

%Relaciones
tiene(briceno, halo).
tiene(david, spyro).
tiene(mario, minecraft).

%Reglas
comprar_juego(NombreJuego) :- 
    juego_disponible(NombreJuego),
    not(tiene(briceno, NombreJuego)),
    not(tiene(david, NombreJuego)),
    not(tiene(mario, NombreJuego)).