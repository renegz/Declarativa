number_to_guess(X) :-
    random(N),
is(X, floor(*(N, 200)) + 1).

play :-
    %calcular numero
    number_to_guess(NumberToGuess),
    %empezar a adivinar
    guess_number(NumberToGuess, 0).

guess_number(NumberToGuess, Attempts) :-
    write("Adivina el numero entre el 1 y el 100"),
    read(Guess),
    NewAttempts is Attempts + 1,
    %validar el resultado
    validate_number(NumberToGuess, Guess, NewAttempts).

validate_number(NumberToGuess, Guess, Attempts) :-
    =:=(NumberToGuess, Guess),
    write("Adivinaste el numero en "),
    write(Attempts),
    writeln(" intentos!"), nl,
    !.

validate_number(NumberToGuess, Guess, Attempts) :-
    >(NumberToGuess, Guess),
    write("El numero a adivinar es mayor que"),
    write(Guess), nl,
    guess_number(NumberToGuess, Attempts).

validate_number(NumberToGuess, Guess, Attempts) :-
    <(NumberToGuess, Guess),
    write("El numero a adivinar es menor que"),
    write(Guess), nl,
    guess_number(NumberToGuess, Attempts).

% % Generar un número aleatorio entre 1 y 100
% number_to_guess(Number) :-
%     random_between(1, 100, Number).

% % Iniciar el juego
% play :-
%     number_to_guess(Number_to_guess),
%     guess_number(Number_to_guess, 0).

% % Regla principal para adivinar el número
% guess_number(Number_to_guess, Attempts) :-
%     write('Adivina el número entre 1 y 100: '),
%     read(Guess),
%     NewAttempts is Attempts + 1,
%     validate_number(Number_to_guess, Guess, NewAttempts).

% % Validar si el número adivinado es correcto
% validate_number(Number_to_guess, Guess, Attempts) :-
%     Guess =:= Number_to_guess,
%     write('¡Correcto! Has adivinado en '),
%     write(Attempts),
%     write(' intentos.'), nl, !.

% % Si el número adivinado es menor
% validate_number(Number_to_guess, Guess, Attempts) :-
%     Guess < Number_to_guess,
%     write('El número a adivinar es mayor que '),
%     write(Guess), nl,
%     guess_number(Number_to_guess, Attempts).

% % Si el número adivinado es mayor
% validate_number(Number_to_guess, Guess, Attempts) :-
%     Guess > Number_to_guess,
%     write('El número a adivinar es menor que '),
%     write(Guess), nl,
%     guess_number(Number_to_guess, Attempts).