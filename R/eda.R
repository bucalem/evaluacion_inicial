library(vroom)
library(tidyverse)

load_data <- function() {
  injuries <- vroom::vroom("data/injuries.tsv")
  products <- vroom::vroom("data/products.tsv")
  population <- vroom::vroom("data/population.tsv")
  return(list(injuries = injuries, products = products, population = population))
}

explore_product <- function(injuries, products, population, product_code) {
  selected <- injuries %>% filter(prod_code == product_code)

  summary_location <- selected %>%
    count(location, wt = weight, sort = TRUE)

  summary_body_part <- selected %>%
    count(body_part, wt = weight, sort = TRUE)

  summary_diag <- selected %>%
    count(diag, wt = weight, sort = TRUE)

  summary_age_sex <- selected %>%
    count(age, sex, wt = weight) %>%
    left_join(population, by = c("age", "sex")) %>%
    mutate(rate = n / population * 1e4)

  return(list(
    summary_location = summary_location,
    summary_body_part = summary_body_part,
    summary_diag = summary_diag,
    summary_age_sex = summary_age_sex
  ))
}
