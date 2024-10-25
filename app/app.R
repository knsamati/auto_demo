library(shiny)
library(dplyr)
library(htmltools)
library(glue)
library(rlang)
library(shinythemes)
library(tidyverse)
library(leaflet)


# Data

df = readr::read_rds("survey_data.rds") |> 
  labelled::remove_val_labels() |>
  rename(longitude = record_your_current_location_longitude,latitude=record_your_current_location_latitude)

# application

ui <- fluidPage(
  theme = shinytheme("superhero"),
  leafletOutput("mymap"),
  p(),
  selectInput("pays", "pays", choices = unique(df$pays))
)

server <- function(input, output, session) {
  
  points <- reactive(df |> dplyr::filter(pays == input$pays))
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$CartoDB.Positron,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data = points())
  })
}

shinyApp(ui, server)