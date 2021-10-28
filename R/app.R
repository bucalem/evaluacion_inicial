# si no tienes instalados los siguientes paquetes recuerda instalarlos antes en tu computadora.
# puedes utilizar renv si así lo deseas
library(dplyr)
library(ggplot2)
library(vroom)
library(forcats)
library(purrr)
injuries <- vroom::vroom("neiss/injuries.tsv.gz")

products <- vroom::vroom("neiss/products.tsv")

population <- vroom::vroom("neiss/population.tsv")

prod_codes <- setNames(products$prod_code, products$title)


ui <- fluidPage(
  fluidRow(
    column(8,
           selectInput("code", "Product",
                       choices = setNames(products$prod_code, products$title),
                       width = "100%"
           )
    ),
    column(2, selectInput("y", "Y axis", c("rate", "count")))
  ),
  fluidRow(
    column(4, tableOutput("diag")),
    column(4, tableOutput("body_part")),
    column(4, tableOutput("location"))
  ),
  fluidRow(
    column(12, plotOutput("age_sex"))
  )
)


server <- function(input, output, session) {
  selected <- reactive(injuries %>% filter(prod_code == input$code) %>% head())

  output$diag <- renderTable({
    ####
  }, width = "100%")
  output$body_part <- renderTable({
    ###
  }, width = "100%")
  output$location <- renderTable({
    ###
  }, width = "100%")

  summary <- reactive({

  })

  output$age_sex <- renderPlot({
    if(input$y == "rate"){
      ####
    } else {
      ####
    }
  })

}

shinyApp(ui, server)
