%Hechos

actividad(bailar).
actividad(karaoke).
actividad(pinata).
actividad(videojuegos).
actividad(barbacoa).
actividad(peliculas).
actividad(juegos_mesa).
actividad(pintar).
actividad(juegos_bebida).
actividad(trivia).
actividad(competencia_talentos).
actividad(icebreaking).
actividad(fumar).

%Relaciones

tipo_evento(bailar, recreativo).
tipo_evento(karaoke, recreativo).
tipo_evento(pinata, recreativo).
tipo_evento(videojuegos, recreativo).
tipo_evento(barbacoa, casual).
tipo_evento(peliculas, casual).
tipo_evento(juegos_mesa, casual).
tipo_evento(pintar, casual).
tipo_evento(juegos_bebida, adultos).
tipo_evento(trivia, recreativo).
tipo_evento(competencia_talentos, recreativo).
tipo_evento(icebreaking, recreativo).
tipo_evento(fumar, adultos).

preferencia_evento(carlos, recreativo).
preferencia_evento(carlos, casual).
preferencia_evento(ana, recreativo).
preferencia_evento(juan, recreativo).
preferencia_evento(maria, casual).
preferencia_evento(alejandro, adultos).
preferencia_evento(fernanda, adultos).

actividad_asistida(carlos, bailar).
actividad_asistida(carlos, barbacoa).
actividad_asistida(ana, bailar).
actividad_asistida(ana, videojuegos).
actividad_asistida(juan, pinata).
actividad_asistida(juan, videojuegos).
actividad_asistida(maria, barbacoa).
actividad_asistida(maria, peliculas).
actividad_asistida(alejandro, juegos_bebida).
actividad_asistida(fernanda, fumar).

%Reglas

evento_recomendado(Persona, Actividad) :- 
    preferencia_evento(Persona, Tipo), 
    tipo_evento(Actividad, Tipo),
    not(actividad_asistida(Persona, Actividad)). 