rm(list=ls())

#Se intentó compilar enviroment, GCC no lo permitió
#options(renv.config.mran.enabled = FALSE)
#options(renv.config.ignored.packages = 'sass')
#renv::restore()

if(!require('pacman')) install.packages('pacman')
pacman::p_load(tidyverse,sf)

electoral <- readRDS(file = "data/electoral.rda")
tabla_electoral <- electoral %>%
  group_by(casilla) %>%
  reframe(Votos_partido_A = sum(`partido_a`),
          Votos_partido_B = sum(`partido_b`),
          Votos_partido_C =sum(`partido_c`),
          Votos_Totales =sum(`votos_total`),
          Lista_Nominal=sum(`lista_nominal`),
          Porc_partido_A = (Votos_partido_A/Votos_Totales), Porc_partido_B = (Votos_partido_B/Votos_Totales),
          Porc_partido_C = (Votos_partido_C/Votos_Totales),
          Participacion = (Votos_Totales/Lista_Nominal)) %>%
  distinct() %>%
  mutate(Ganador = case_when(
    (`Porc_partido_B` > `Porc_partido_A` & `Porc_partido_B` > `Porc_partido_C`) ~ "partido_B",
    (`Porc_partido_A` > `Porc_partido_B` & `Porc_partido_A` > `Porc_partido_C`) ~ "partido_A",
    (`Porc_partido_B` == `Porc_partido_A` & `Porc_partido_B` > `Porc_partido_C`) ~ "Empate",
    TRUE ~ "partido_C"
  ),
  segundo_lugar = case_when(
    Ganador == "partido_B" ~ case_when(
      `Porc_partido_A` > `Porc_partido_C` ~ "partido_A", TRUE ~ "partido_C"),
    Ganador == "partido_A" ~ case_when(
      `Porc_partido_B` > `Porc_partido_C` ~ "partido_B", TRUE ~ "partido_C"),
    TRUE ~ case_when(
      `Porc_partido_B` >= `Porc_partido_A` ~ "partido_B", TRUE ~ "partido_A"))) %>%
  mutate(ventaja = case_when(
    Ganador == "partido_B" ~ `Porc_partido_B` - case_when(
      segundo_lugar == "partido_A" ~ `Porc_partido_A`,
      segundo_lugar == "partido_C" ~ `Porc_partido_C`),
    Ganador == "partido_A" ~ `Porc_partido_A` - case_when(
      segundo_lugar == "partido_B" ~ `Porc_partido_B`,
      segundo_lugar == "partido_C" ~ `Porc_partido_C`),
    Ganador == "partido_C" ~ `Porc_partido_C` - case_when(
      segundo_lugar == "partido_A" ~ `Porc_partido_A`,
      segundo_lugar == "partido_B" ~ `Porc_partido_B`),
    TRUE ~ 0
  )) %>%  mutate(across(c(7:10,13), ~ round(., digits = 6)))

#mapa

mapa <- readRDS("data/mapa.rda")
mapa <- left_join(mapa, tabla_electoral, by = "casilla", na_matches = "na")

summaries <- mapa %>%
    summarize(
        max = max(`Participacion`),
        min = min(`Participacion`),
        median = median(`Participacion`))

max <- summaries$max
min <- summaries$min
median <- summaries$median

max_diff_from_median <- pmax(max - median, median - min)
custom_limits <- c(median - max_diff_from_median, median + max_diff_from_median)

red_color <- "#b66b68"
white <- "#f4f4f4"
blue_color <- "#6875b6"

red_blue_palette <- colorRampPalette(c(blue_color, white, red_color))
colors_map <- red_blue_palette(10)

### PREGUNTA 2

encuesta <- readRDS("data/encuesta_f.rda")


## PREGUNTA 3

municipios <- read_csv("data/municipios_rezago.csv")
