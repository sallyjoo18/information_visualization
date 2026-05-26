
library(shiny)
library(shinyWidgets)
library(bslib)
library(tidyverse)
library(plotly)
library(leaflet)
library(countrycode)

# Load data
load("data/vaccine_data.rda")
vax_map <- vax_long


# UI
ui <- fluidPage(
  theme = bs_theme(version = 5),

  titlePanel("Global Vaccination Coverage Dashboard"),

  sidebarLayout(
    sidebarPanel(
      selectInput("vax", "Vaccine:", choices = unique(vax_map$vaccine)),
      sliderInput("year", "Year:",
                  min = min(vax_map$Year),
                  max = max(vax_map$Year),
                  value = 2005,
                  step = 1),
      sliderInput("traj_year", "Trajectory year:",
                  min = min(vax_map$Year),
                  max = max(vax_map$Year),
                  value = 2005,
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




server <- function(input, output, session) {

  # Track selected country
  selected_country <- reactiveVal(NULL)

  observeEvent(input$map_marker_click, {
    selected_country(input$map_marker_click$id)
  })

  # Filter for selected vaccine + year
  filtered_year <- reactive({
    vax_map |>
      filter(vaccine == input$vax,
             Year == input$year)
  })

  # Initialize map once
  output$map <- renderLeaflet({
    leaflet() |>
      addProviderTiles("CartoDB.Positron")
  })

  # Update map markers + legend
  observe({
    df <- filtered_year() |>
      filter(!is.na(coverage))

    pal <- colorNumeric("Blues", df$coverage)

    leafletProxy("map", data = df) |>
      clearMarkers() |>
      clearControls() |>
      addCircleMarkers(
        lng = ~longitude,
        lat = ~latitude,
        layerId = ~Entity,
        radius = 6,
        color = ~pal(coverage),
        label = ~paste0(Entity, ": ", coverage, "%")
      ) |>
      addLegend(
        position = "bottomright",
        pal = pal,
        values = df$coverage,
        title = "Coverage (%)",
        opacity = 1
      )
  })

  # Country header
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

    # Full trajectory for the selected country
    df <- vax_map |>
      filter(Entity == selected_country(),
             vaccine == input$vax)

    # World average for the selected single year
    world_avg <- vax_map |>
      filter(vaccine == input$vax,
             Year == input$traj_year) |>
      summarize(world_avg = mean(coverage, na.rm = TRUE))

    p <- plot_ly(df, x = ~Year, y = ~coverage,
                 type = "scatter", mode = "lines+markers",
                 name = selected_country())

    if (input$show_world_avg) {
      p <- p |>
        add_lines(
          x = df$Year,
          y = rep(world_avg$world_avg, nrow(df)),
          name = paste("World avg", input$traj_year),
          line = list(dash = "dash")
        )
    }

    p |>
      layout(yaxis = list(title = "Coverage (%)"))
  })

  # GDP scatter
  output$gdp_scatter <- renderPlotly({
    df <- filtered_year()

    gdp_col <- intersect(c("GDP", "gdp", "gdp_per_capita"), names(df))
    if (length(gdp_col) == 0) return(NULL)

    plot_ly(df,
            x = df[[gdp_col]],
            y = df$coverage,
            type = "scatter",
            mode = "markers",
            text = df$Entity) |>
      layout(
        xaxis = list(title = "GDP per capita"),
        yaxis = list(title = paste(input$vax, "coverage (%)"))
      )
  })
}

shinyApp(ui = ui, server = server)
