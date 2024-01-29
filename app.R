# si no tienes instalados los siguientes paquetes recuerda instalarlos antes en tu computadora.
# puedes utilizar renv si así lo deseas
library(dplyr)
library(ggplot2)
library(vroom)
library(forcats)
library(purrr)
library(shiny)
# Source the functions file
source("R/eda.R")

# Load data
data <- load_data()
injuries <- data$injuries
products <- data$products
population <- data$population
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
  selected_data <- reactive({
    explore_product(injuries, products, population, input$code)
  })

  output$diag <- renderTable({
    selected_data()$summary_diag
  }, width = "100%")

  output$body_part <- renderTable({
    selected_data()$summary_body_part
  }, width = "100%")

  output$location <- renderTable({
    selected_data()$summary_location
  }, width = "100%")

  output$age_sex <- renderPlot({
    if (input$y == "rate") {
      ggplot(selected_data()$summary_age_sex, aes(age, rate, colour = sex)) +
        geom_line(na.rm = TRUE) +
        labs(y = "Lesiones por cada 10.000 personas")
    } else {
      ggplot(selected_data()$summary_age_sex, aes(age, n, colour = sex)) +
        geom_line() +
        labs(y = "Número estimado de lesiones")
    }
  })
}

shinyApp(ui, server)
