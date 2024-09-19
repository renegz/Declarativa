
%HECHOS
enemigo(rusia, ucrania).
enemigo(ucrania, rusia).
enemigo(rusia, japon).
enemigo(japon, rusia).
enemigo(el_salvador, honduras).
enemigo(vietnam, china).
enemigo(china, ucrania).

%REGLA
aliado(Atacante, Enemigo, Aliado) :-
    enemigo(Atacante, Enemigo),
    enemigo(Enemigo, Atacante),
    enemigo(Aliado, Enemigo),
    \==(Atacante, Aliado),
    \==(Atacante, Enemigo),
    \==(Enemigo, Aliado).