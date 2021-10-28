# Evaluación inicial

## Objetivo

Detectar las habilidades, conocimientos y destrezas de candidatos a colaborar en Morant Consultores.

## Instrucciones

Conteste las siguientes preguntas. Es de suma utilidad que comparta las soluciones que plantee sin importar si llegó a la conclusión o al resultado final. Eso nos dará mucha información acerca de qué áreas de oportunidad tiene. Cuando termine favor de enviar un archivo R markdown con sus resultados. 

## Pregunta 1

Descarga la base de datos electoral ubicada en data/electoral.rda. La base de datos contiene las variables,
casillas, partido_a, partido_b, partido_c, votos_total, lista_nominal y corresponden a datos de una elección ficticia. Suponga que tiene que reportar a un cliente los resultados de la elección. 

Elige la información que reportarías e inclúyela en el R markdown donde entregarás tus respuestas. El reporte puede incluir, pero no necesariamente limitarse a comunicar: en qué lugar quedó cada partido, el número de casillas en las que resultó ganador cada partido, una descripción de la participación ciudadana. 

Para reportar puedes utilizar texto, gráficas, mapas o tablas. Recuerda que un mejor reporte es aquel que tiene mayor contenido de relevancia con la menor cantidad de elementos. Si requieres de un mapa, puedes utilizar el ubicado en data/mapa.rda. Para esto deberás tener instalado el paquete sf.

## Pregunta 2

Descarga la base de datos data/encuesta_f.rda que contiene información de una encuesta ficticia. Esta encuesta tiene un diseño muestral polietápico que incluye etapas de estratos y etapas de conglomerados. La base de datos tiene un identificador de la persona, el partido por el que votaría  y el peso correspondiente a cada entrevistado para la estimación. 

Presenta una estimación puntual de la proporción de personas a favor de cada partido.

¿De qué tamaño es la población sujeta a análisis? 

Ahora supón que la muestra fue extraída bajo un esquema de muestreo aleatorio simple, presenta los intervalos de confianza para la estimación de la proporción de personas a favor de cada partido.

¿Qué podrías concluir de estos intervalos?

## Pregunta 3

Descarga la base de datos X. Contiene una lista de municipios también ficticia que tiene las siguientes variables: población, población de 15 años o más analfabeta, población de 6 a 14 años que no asiste a la escuela, población sin derechohabiencia a servicios de salud, Viviendas con piso de tierra. Todas estas son variables que expresan un tipo de rezago. Tu cliente es el Gobierno Federal y quiere hacer un programa social que atienda el rezago, en general. Te pide elaborar un ranking con el propósito de saber a que municipios da prioridad. Agrega una variable a la base de datos que exprese el orden de prioridad en donde 1 es el municipio más rezagado y nrow(bd) es el municipio menos rezagado. Para ello debes utilizar un criterio de rezago, justifica que criterio utilizarías. Puedes utilizar combinaciones lineales de las variables o técnicas de reducción de dimensionalidad como análisis de componentes principales.


## Pregunta 4 (Shiny)

En el script eda.R hay una serie de pasos para obtener tres tablas resumen y dos gráficas. Asegúrate de que puedas correr el script completo sin ningún problema. Como verás, sólo está ejemplificado para accidentes en los baños. 

1.	Agrega donde sea pertinente este código al script app.R para que el usuario de la aplicación pueda visualizar las tablas y gráficas. 
2.	Modifica el código para que reaccione a cualquier tipo de producto que el usuario elija, no sólo a los accidentes en baños.

