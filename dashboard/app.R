suppressPackageStartupMessages({
  library(shiny)
  library(leaflet)
  library(sf)
  library(dplyr)
  library(tidyr)
  library(ggplot2)
  library(plotly)
  library(rnaturalearth)
  library(DT)
  library(bslib)
  library(htmltools)
})

# ---------------------------------------------------------------------------
# Data
# ---------------------------------------------------------------------------

resolve_csv <- function(name) {
  candidates <- c(
    name,
    file.path("..", name),
    file.path("..", "..", name)
  )
  hit <- candidates[file.exists(candidates)]
  if (length(hit) == 0) {
    stop("Could not locate ", name,
         ". Launch the app from the dashboard/ folder or the project folder.")
  }
  hit[1]
}

vaccine_raw <- read.csv(
  resolve_csv("global-vaccination-coverage.csv"),
  check.names = FALSE,
  na.strings  = c("", "NA")
)

gdp_raw <- read.csv(
  resolve_csv("gdp-per-capita-worldbank.csv"),
  check.names = FALSE,
  na.strings  = c("", "NA")
) |>
  rename(gdp = `GDP per capita`,
         region = `World region according to OWID`) |>
  filter(!is.na(Code), Code != "", !is.na(gdp))

is_country_code <- function(code) {
  !is.na(code) & nchar(code) == 3 & !grepl("_", code, fixed = TRUE)
}

WORLD_CODE  <- "OWID_WRL"
WORLD_LABEL <- "World"

vaccine_cols <- c(
  "Diptheria/tetanus/pertussis (DTP3)",
  "Polio (Pol3)",
  "Measles, first dose (MCV1)",
  "Hepatitis B (HepB3)",
  "H. influenza type b (Hib3)",
  "Rubella (RCV1)",
  "Pneumococcal vaccine (PCV3)",
  "Rotavirus (RotaC)",
  "Inactivated polio vaccine (IPV1)"
)

entities <- vaccine_raw |>
  filter(!is.na(Code), Code != "")

countries <- entities |> filter(is_country_code(Code))

year_range <- range(entities$Year)

world <- ne_countries(scale = "medium", returnclass = "sf") |>
  transmute(
    iso       = iso_a3_eh,
    name_long = name_long
  ) |>
  filter(!is.na(iso), iso != "", name_long != "Antarctica")

# ---------------------------------------------------------------------------
# UI
# ---------------------------------------------------------------------------

ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "flatly"),

  tags$style(HTML("
    .sidebar-panel h4 { margin-top: 0; }
    .dataTables_wrapper { font-size: 12px; }
    .leaflet-container { background: #fafafa; }
  ")),

  titlePanel("Global Vaccination Coverage Dashboard"),
  p(style = "color:#555; margin-bottom:18px;",
    "Pick a vaccine and year on the left. Click a country on the map ",
    "to drill in."),

  sidebarLayout(
    sidebarPanel(
      width = 3,
      class = "sidebar-panel",
      selectInput(
        "vaccine", "Vaccine",
        choices  = vaccine_cols,
        selected = vaccine_cols[1]
      ),
      sliderInput(
        "year", "Year",
        min   = year_range[1],
        max   = year_range[2],
        value = year_range[2],
        step  = 1,
        sep   = "",
        animate = animationOptions(interval = 700, loop = FALSE)
      ),
      helpText(tags$small(style = "color:#888",
                          "Click the play button to animate.")),
      hr(),
      uiOutput("selected_country_header"),
      uiOutput("country_table"),
      br(),
      actionButton("reset_world", "Show World averages",
                   class = "btn-sm btn-outline-secondary",
                   style = "width:100%;")
    ),
    mainPanel(
      width = 9,
      leafletOutput("map", height = 520),
      br(),
      tabsetPanel(
        id   = "lower_tabs",
        type = "tabs",
        tabPanel(
          title = "GDP vs. coverage",
          br(),
          plotlyOutput("gdp_scatter", height = 500),
          br(),
          tags$small(
            style = "color:#888",
            "Drag to zoom \u00B7 double-click to reset \u00B7 click a country ",
            "on the map to highlight it."
          )
        ),
        tabPanel(
          title = "Country trajectory",
          br(),
          h4(textOutput("ts_title")),
          plotlyOutput("country_timeseries", height = 380),
          br(),
          tags$small(
            style = "color:#888",
            "Drag the timeline strip at the bottom of the chart to zoom ",
            "into a year range. The dashed line marks the year selected ",
            "on the left."
          )
        )
      )
    )
  )
)

# ---------------------------------------------------------------------------
# Server
# ---------------------------------------------------------------------------

pal <- colorNumeric(
  palette  = "viridis",
  domain   = c(0, 100),
  na.color = "#dddddd"
)

server <- function(input, output, session) {

  output$map <- renderLeaflet({
    leaflet(options = leafletOptions(minZoom = 1, worldCopyJump = TRUE)) |>
      addProviderTiles("CartoDB.PositronNoLabels") |>
      setView(lng = 10, lat = 20, zoom = 2) |>
      addLegend(
        position  = "bottomright",
        pal       = pal,
        values    = c(0, 100),
        title     = "Coverage (%)",
        opacity   = 0.9,
        labFormat = labelFormat(suffix = "%")
      )
  })

  current_year_values <- reactive({
    countries |>
      filter(Year == input$year, is_country_code(Code)) |>
      transmute(iso = Code, value = .data[[input$vaccine]])
  })

  joined <- reactive({
    world |> left_join(current_year_values(), by = "iso")
  })

  observe({
    df <- joined()
    labels <- sprintf(
      "<strong>%s</strong><br/>%s: %s",
      df$name_long,
      input$vaccine,
      ifelse(is.na(df$value), "no data", paste0(round(df$value, 1), "%"))
    ) |> lapply(htmltools::HTML)

    leafletProxy("map", data = df) |>
      clearGroup("polys") |>
      addPolygons(
        group       = "polys",
        layerId     = ~iso,
        fillColor   = ~pal(value),
        weight      = 0.6,
        color       = "white",
        fillOpacity = 0.88,
        highlightOptions = highlightOptions(
          weight       = 2,
          color        = "#222",
          fillOpacity  = 1,
          bringToFront = TRUE
        ),
        label        = labels,
        labelOptions = labelOptions(textsize = "12px", direction = "auto")
      )
  })

  selected <- reactiveVal(WORLD_CODE)

  observeEvent(input$map_shape_click, {
    selected(input$map_shape_click$id)
  })

  observeEvent(input$reset_world, {
    selected(WORLD_CODE)
  })

  selected_country_row <- reactive({
    req(selected())
    entities |> filter(Code == selected(), Year == input$year)
  })

  selected_country_name <- reactive({
    req(selected())
    nm <- entities |> filter(Code == selected()) |> slice(1) |> pull(Entity)
    if (length(nm) == 0) selected() else nm
  })

  is_world_selected <- reactive({
    isTRUE(selected() == WORLD_CODE)
  })

  output$selected_country_header <- renderUI({
    nm <- selected_country_name()
    sublabel <- if (is_world_selected()) {
      sprintf("Global average for %s", input$year)
    } else {
      sprintf("Coverage in %s", input$year)
    }
    HTML(sprintf(
      "<h4 style='margin:0 0 4px 0'>%s</h4><small style='color:#666'>%s</small>",
      htmlEscape(nm), sublabel
    ))
  })

  output$country_table <- renderUI({
    req(selected())
    row <- selected_country_row()

    fmt <- function(v) {
      if (length(v) == 0 || is.na(v)) {
        '<span style="color:#aaa">&mdash;</span>'
      } else {
        paste0(round(v, 1), "%")
      }
    }

    rows_html <- lapply(vaccine_cols, function(v) {
      val <- if (nrow(row) == 0) {
        '<span style="color:#aaa">&mdash;</span>'
      } else {
        fmt(row[[v]])
      }
      sprintf(
        '<tr><td style="padding:4px 8px 4px 0; color:#333;">%s</td>
              <td style="padding:4px 0; text-align:right; font-variant-numeric: tabular-nums;">%s</td></tr>',
        htmlEscape(v), val
      )
    })

    HTML(sprintf(
      '<table style="width:100%%; font-size:12.5px; border-collapse:collapse;">%s</table>',
      paste(rows_html, collapse = "")
    ))
  })

  output$ts_title <- renderText({
    paste("Coverage over time:", selected_country_name())
  })

  output$country_timeseries <- renderPlotly({
    req(selected())
    df <- entities |>
      filter(Code == selected()) |>
      pivot_longer(
        cols      = all_of(vaccine_cols),
        names_to  = "vaccine",
        values_to = "coverage"
      ) |>
      mutate(vaccine = factor(vaccine, levels = vaccine_cols))

    p <- ggplot(df, aes(
          x = Year, y = coverage, color = vaccine,
          text = paste0(
            "<b>", vaccine, "</b><br>",
            "Year: ", Year, "<br>",
            "Coverage: ", ifelse(is.na(coverage), "no data",
                                 paste0(round(coverage, 1), "%"))
          ),
          group = vaccine
        )) +
      geom_line(linewidth = 0.8, na.rm = TRUE) +
      geom_vline(xintercept = input$year, linetype = "dashed",
                 color = "grey55") +
      scale_y_continuous(limits = c(0, 100),
                         labels = function(x) paste0(x, "%")) +
      scale_x_continuous(limits = year_range) +
      scale_color_brewer(palette = "Set1") +
      labs(x = NULL, y = NULL, color = NULL) +
      theme_minimal(base_size = 11) +
      theme(
        legend.position  = "bottom",
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(color = "grey92")
      )

    ggplotly(p, tooltip = "text") |>
      layout(
        legend = list(
          orientation = "h",
          y           = -0.32,
          font        = list(size = 9)
        ),
        xaxis = list(
          rangeslider = list(visible = TRUE, thickness = 0.06)
        )
      ) |>
      config(
        displayModeBar         = "hover",
        modeBarButtonsToRemove = c("lasso2d", "select2d",
                                    "toggleSpikelines",
                                    "hoverClosestCartesian",
                                    "hoverCompareCartesian"),
        doubleClick            = "reset"
      )
  })

  # ----- GDP vs. coverage scatter ------------------------------------------

  region_palette <- c(
    "Africa"        = "#D1495B",
    "Asia"          = "#3E78B2",
    "Europe"        = "#5C9E6E",
    "North America" = "#E08A3C",
    "Oceania"       = "#8E6CA1",
    "South America" = "#4FA8A1"
  )

  scatter_data <- reactive({
    vac_year <- countries |>
      filter(Year == input$year, is_country_code(Code)) |>
      transmute(Code, Entity, coverage = .data[[input$vaccine]])

    gdp_year <- gdp_raw |>
      filter(Year == input$year, is_country_code(Code)) |>
      select(Code, gdp, region)

    inner_join(vac_year, gdp_year, by = "Code") |>
      filter(!is.na(coverage), !is.na(gdp), !is.na(region))
  })

  output$gdp_scatter <- renderPlotly({
    df <- scatter_data()
    validate(need(
      nrow(df) >= 3,
      paste("Not enough overlap between GDP and", input$vaccine,
            "data for year", input$year, ".",
            "Try a more recent year (GDP starts 1990;",
            "newer vaccines start later).")
    ))

    sel <- selected()
    df$is_selected <- !is.null(sel) & df$Code == ifelse(is.null(sel), NA, sel)

    r_val   <- suppressWarnings(cor(log10(df$gdp), df$coverage,
                                    use = "pairwise.complete.obs"))
    r_label <- sprintf("r = %.2f  \u00B7  n = %d countries",
                       r_val, nrow(df))

    p <- ggplot(df, aes(
          x = gdp, y = coverage,
          fill = region,
          text = paste0(
            "<b>", Entity, "</b><br>",
            "GDP per capita: $", formatC(gdp, format = "d",
                                         big.mark = ","), "<br>",
            input$vaccine, ": ", round(coverage, 1), "%<br>",
            "Region: ", region
          )
        )) +
      geom_smooth(
        data        = df,
        mapping     = aes(x = gdp, y = coverage),
        inherit.aes = FALSE,
        method      = "loess",
        se          = TRUE,
        color       = "#2C3E50",
        fill        = "#2C3E50",
        alpha       = 0.10,
        linewidth   = 0.9,
        na.rm       = TRUE
      ) +
      geom_point(shape = 21, color = "white", stroke = 0.45,
                 alpha = 0.92, size = 3.2) +
      scale_x_log10(
        labels = scales::label_dollar(scale_cut = scales::cut_short_scale()),
        breaks = c(500, 1000, 2000, 5000, 10000, 20000, 50000, 100000),
        expand = expansion(mult = c(0.04, 0.06))
      ) +
      scale_y_continuous(
        limits = c(0, 100),
        breaks = seq(0, 100, 25),
        labels = function(x) paste0(x, "%"),
        expand = expansion(mult = c(0.02, 0.05))
      ) +
      scale_fill_manual(values = region_palette, name = NULL,
                        na.translate = FALSE) +
      labs(
        x = "GDP per capita (log scale, US$)",
        y = "Coverage",
        title    = sprintf("%s vs. GDP per capita, %d", input$vaccine,
                           input$year),
        subtitle = r_label
      ) +
      theme_minimal(base_size = 12) +
      theme(
        plot.title       = element_text(face = "bold", size = 14,
                                        margin = margin(b = 2)),
        plot.subtitle    = element_text(color = "grey35", size = 10,
                                        margin = margin(b = 10)),
        axis.title       = element_text(color = "grey25"),
        axis.text        = element_text(color = "grey35"),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(color = "grey92"),
        legend.position  = "bottom",
        plot.margin      = margin(10, 14, 10, 10)
      )

    if (any(df$is_selected)) {
      sel_df <- df[df$is_selected, , drop = FALSE]
      p <- p +
        geom_point(data = sel_df, inherit.aes = FALSE,
                   mapping = aes(x = gdp, y = coverage),
                   shape = 21, fill = NA, color = "black",
                   size = 6, stroke = 1.5) +
        geom_text(data = sel_df, inherit.aes = FALSE,
                  mapping = aes(x = gdp, y = coverage, label = Entity),
                  nudge_y = 5, color = "black", size = 3.6,
                  fontface = "bold")
    }

    ggplotly(p, tooltip = "text") |>
      layout(
        legend = list(orientation = "h", y = -0.18,
                      font = list(size = 11)),
        margin = list(l = 60, r = 30, t = 60, b = 80),
        dragmode = "zoom"
      ) |>
      config(
        displayModeBar         = "hover",
        modeBarButtonsToRemove = c("lasso2d", "select2d",
                                    "toggleSpikelines",
                                    "hoverClosestCartesian",
                                    "hoverCompareCartesian"),
        doubleClick            = "reset"
      )
  })
}

shinyApp(ui, server)
