
library(shiny)
library(shinyWidgets)
library(bslib)
library(tidyverse)
library(plotly)
library(leaflet)
library(countrycode)
library(maps)

# Load data
vaccine <- read.csv("global-vaccination-coverage.csv")

# Pivot to long format
vax_long <- vaccine |>
  pivot_longer(
    cols = matches("HepB3|Hib3|IPV1|MCV1|PCV3|Pol3|RCV1|RotaC|DTP3"),
    names_to = "vaccine",
    values_to = "coverage"
  )


# Add coordinates
coords <- map_data("world") |>
  group_by(region) |>
  summarize(
    latitude = mean(lat, na.rm = TRUE),
    longitude = mean(long, na.rm = TRUE)
  )

coords$Entity <- countrycode(coords$region, "country.name", "country.name")

vax_long <- vax_long |>
  left_join(coords, by = "Entity")

# UI
ui <- fluidPage(
  theme = bs_theme(version = 5),

  titlePanel("Global Vaccination Coverage Dashboard"),

  sidebarLayout(
    sidebarPanel(
      selectInput("vax", "Vaccine:", choices = unique(vax_long$vaccine)),
      sliderInput("year", "Year:",
                  min = min(vax_long$Year),
                  max = max(vax_long$Year),
                  value = 2005,
                  step = 1),
      sliderInput("traj_range", "Trajectory year range:",
                  min = min(vax_long$Year),
                  max = max(vax_long$Year),
                  value = c(1980, 2024),
                  step = 1),
      materialSwitch("show_world_avg", "Show world averages", value = FALSE)
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("World Map", leafletOutput("map", height = 500)),
        tabPanel("Country Profile",
                 uiOutput("country_header"),
                 plotlyOutput("country_traj")),
        tabPanel("GDP Comparison",
                 plotlyOutput("gdp_scatter"))
      )
    )
  )
)

# SERVER
server <- function(input, output, session) {

  # Filter for selected vaccine + year
  filtered_year <- reactive({
    vax_long |>
      filter(vaccine == input$vax,
             Year == input$year)
  })

  # Map
  output$map <- renderLeaflet({
    df <- filtered_year()

    leaflet(df) |>
      addProviderTiles("CartoDB.Positron") |>
      addCircleMarkers(
        lng = df$longitude,
        lat = df$latitude,
        layerId = df$Entity,
        radius = 6,
        color = ~colorNumeric("Blues", coverage)(coverage),
        label = ~paste0(Entity, ": ", coverage, "%")
      )
  })

  # Track selected country
  selected_country <- reactiveVal(NULL)

  observeEvent(input$map_marker_click, {
    selected_country(input$map_marker_click$id)
  })

  # Blank state
  output$country_header <- renderUI({
    req(selected_country())
    tagList(
      h3(selected_country()),
      h4(paste("Coverage in", input$year))
    )
  })

  # Time series
  output$country_traj <- renderPlotly({
    req(selected_country())

    df <- vax_long |>
      filter(Entity == selected_country(),
             vaccine == input$vax,
             Year >= input$traj_range[1],
             Year <= input$traj_range[2])

    world_avg <- vax_long |>
      filter(vaccine == input$vax,
             Year >= input$traj_range[1],
             Year <= input$traj_range[2]) |>
      group_by(Year) |>
      summarize(world_avg = mean(coverage, na.rm = TRUE))

    p <- plot_ly(df, x = ~Year, y = ~coverage, type = "scatter", mode = "lines+markers",
                 name = selected_country())

    if (input$show_world_avg) {
      p <- p |>
        add_lines(data = world_avg, x = ~Year, y = ~world_avg,
                  name = "World average", line = list(dash = "dash"))
    }

    p |>
      layout(yaxis = list(title = "Coverage (%)"))
  })

  # GDP scatter (if GDP exists)
  output$gdp_scatter <- renderPlotly({
    df <- filtered_year()

    if (!"gdp_per_capita" %in% names(df)) {
      return(NULL)
    }

    plot_ly(df, x = ~gdp_per_capita, y = ~coverage,
            type = "scatter", mode = "markers",
            text = ~Entity) |>
      layout(
        xaxis = list(title = "GDP per capita"),
        yaxis = list(title = paste(input$vax, "coverage (%)"))
      )
  })
}

shinyApp(ui = ui, server = server)
