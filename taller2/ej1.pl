%HECHOS

calorias(paella, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(filete, 400).
calorias(pollo, 280).
calorias(trucha, 160).
calorias(bacalao, 300).
calorias(flan, 200).
calorias(nueces, 500).
calorias(naranja, 50).

%Reglas

valor_calorico(X, Y, Z, V) :-
    calorias(X, A),
    calorias(Y, B),
    calorias(Z, C),
    is(V, +(A, +(B, C))).

comida_equilibrada(X, Y, Z) :-
    valor_calorico(X, Y, Z, V),
    =<(V, 800),
    write("Comida equilibrada con "),
    write(V),
    writeln(" calorias"), !. % ! evita que se siga evaluando otro caso, son mutuamente excluyentes.

comida_equilibrada(X, Y, Z) :-
    valor_calorico(X, Y, Z, V),
    >(V, 800),
    write("Comida no equilibrada con "),
    write(V),
    writeln(" calorias"),
    fail. %Termina la ejecucion con un false