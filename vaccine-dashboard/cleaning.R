
library(tidyverse)
library(countrycode)
library(tsibbledata)
library(maps)
library(here)

# load vaccine data
vaccine <- read.csv("global-vaccination-coverage.csv")

# load gdp data
gdp_clean <- global_economy |>
  select(Country, Code, Year, GDP) |>
  mutate(
    Entity = countrycode(Country, "country.name", "country.name")
  )

# pivot vaccine data to long format
vax_long <- vaccine |>
  pivot_longer(
    cols = matches("HepB3|Hib3|IPV1|MCV1|PCV3|Pol3|RCV1|RotaC|DTP3"),
    names_to = "vaccine",
    values_to = "coverage"
  )

# join vaccine and gdp
vax_long <- vax_long |>
  left_join(
    gdp_clean |> select(Entity, Year, GDP),
    by = c("Entity", "Year")
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

# save data
save(vax_long, file = "data/vaccine_data.rda")

