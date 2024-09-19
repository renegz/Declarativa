%Hechos
    %Mamiferos

tiene_pelo(leon).
tiene_pelo(elefante).
tiene_pelo(perro).
da_leche(leon).
da_leche(elefante).
da_leche(perro).

    %Aves
pone_huevos(aguila).
pone_huevos(perico).
vuela(perico).
vuela(perico).

    %Peces
tiene_escamas(tiburon).
tiene_escamas(salmon).
vive_en_agua(tiburon).
vive_en_agua(salmon).

    %Anfibios
vive_en_agua(rana).
vive_en_tierra(rana).
pone_huevos(rana).

    %Reptiles
tiene_escamas(cocodrilo).
tiene_escamas(serpiente).
pone_huevos(serpiente).
pone_huevos(cocodrilo).

%Reglas
es_mamifero(X) :- tiene_pelo(X), da_leche(X).

es_ave(X) :- pone_huevos(X), vuela(X).

es_pez(X) :- tiene_escamas(X), vive_en_agua(X).

es_anfibio(X) :- vive_en_agua(X), vive_en_tierra(X), pone_huevos(X).

es_reptil(X) :- tiene_escamas(X), pone_huevos(X).