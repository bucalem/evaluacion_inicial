# Evaluación inicial

## Objetivo

Detectar las habilidades, conocimientos y destrezas de candidatos a colaborar en Morant Consultores.

## Instrucciones

Conteste las siguientes preguntas. Es de suma utilidad que comparta las soluciones que plantee sin importar si llegó a la conclusión o al resultado final. Eso nos dará mucha información acerca de qué áreas de oportunidad tiene. Cuando termine favor de enviar un archivo R markdown con sus resultados. Incluya todo el código que utilizó en dicho documento para llegar a sus conclusiones. 

## Pregunta 1

Descargue la base de datos electoral ubicada en `data/electoral.rda`. La base de datos contiene las variables casillas, partido_a, partido_b, partido_c, votos_total, lista_nominal y corresponden a datos de una elección ficticia. Suponga que tiene que reportar a un cliente los resultados de la elección. 

Elija la información que reportaría e inclúyala en el R markdown donde entregará sus respuestas. El reporte puede incluir, pero no necesariamente limitarse a comunicar: en qué lugar quedó cada partido, el número de casillas en las que resultó ganador cada partido, una descripción de la participación ciudadana. 

Para reportar puede utilizar texto, gráficas, mapas o tablas. Recuerde que un mejor reporte es aquel que tiene mayor contenido de relevancia con la menor cantidad de elementos. Si requiere de un mapa, puede utilizar el ubicado en `data/mapa.rda`. Para esto deberá tener instalado el paquete sf.

## Pregunta 2

Descargue la base de datos `data/encuesta_f.rda` que contiene información de una encuesta ficticia. Esta encuesta tiene un diseño muestral polietápico que incluye etapas de estratos y etapas de conglomerados. La base de datos tiene un identificador de la persona, el partido por el que votaría  y el peso correspondiente a cada entrevistado para la estimación. 

Presente una estimación puntual de la proporción de personas a favor de cada partido.

¿De qué tamaño es la población sujeta a análisis? 

Ahora suponga que la muestra fue extraída bajo un esquema de muestreo aleatorio simple, presente los intervalos de confianza para la estimación de la proporción de personas a favor de cada partido.

¿Qué podría concluir de estos intervalos?

## Pregunta 3

Utilice la base de datos `data/municipios_rezago.csv`. Contiene una lista de municipios también ficticia que tiene las siguientes variables: población, población de 15 años o más analfabeta, población de 6 a 14 años que no asiste a la escuela, población sin derechohabiencia a servicios de salud y viviendas con piso de tierra. Todas estas son variables que expresan un tipo de rezago. Imagine que su cliente es el Gobierno Federal y quiere hacer un programa social que atienda el rezago, en general. Le pide elaborar un ranking con el propósito de saber a qué municipios dar mayor prioridad. Agregue una variable a la base de datos que exprese el orden de prioridad en donde 1 es el municipio más rezagado y `nrow(bd)` es el municipio menos rezagado. Para ello debe utilizar un criterio de rezago, justifica qué criterio utilizarías. Puedes utilizar combinaciones lineales de las variables o técnicas de reducción de dimensionalidad como análisis de componentes principales.

## Pregunta 4

Encuentra el error y modifica el siguiente código para encontrar los números primos correctos que se encuentren entre dos números enteros.

```
## R
find_primes <- function(start, end) {
  primes <- c()
  
  for (i in start:end) {
    if (i < 2) {
      next 
    }
    if (i == 2) {
      primes <- c(primes, i)  
      next
    }
    is_prime <- FALSE
    for (j in 2:ceiling(sqrt(i))) {
      if (j == 2 || j %% 2 != 0) {
        if (i %% j == 0) {
          is_prime <- TRUE
          break
        }
      }
    }
    if (is_prime) {
      primes <- c(primes, i)
    }
  }
  
  return(primes)
}
```

```
#Python
import math

def find_primes(start, end):
    primes = []
    
    for i in range(start, end+1):
        if i < 2:
            continue
        if i == 2:
            primes.append(i)
            continue
        is_prime = False
        for j in range(2, int(math.sqrt(i)) + 1):
            if j == 2 or j % 2 != 0:
                if i % j == 0:
                    is_prime = True
                    break
        if is_prime:
            primes.append(i)
    
    return primes
```


## Pregunta 5 (Shiny)

En el script `R/eda.R` hay una serie de pasos para obtener tres tablas resumen y dos gráficas. Asegure que pueda correr el script completo sin ningún problema. Como verá, sólo está ejemplificado para accidentes en los baños. 

1.	Agregue donde sea pertinente este código al script `app.R` para que el usuario de la aplicación pueda visualizar las tablas y gráficas. 

2.	Modifique el código para que reaccione a cualquier tipo de producto que el usuario elija, no sólo a los accidentes en baños.

