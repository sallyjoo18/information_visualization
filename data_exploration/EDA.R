
# packages ----
library(tidyverse)
library(tidymodels)
library(readr)
library(corrplot)
library(ggcorrplot)
library(ggcorrheatmap)
library(here)
library(naniar)
library(kableExtra)
library(stringr)

# load dataset ----
vaccine <- read.csv("global-vaccination-coverage.csv", sep = ",")

View(vaccine)


# data exploration ----

## summary of data
summary_table <- summary(vaccine) |>
  kable() |>
  kable_styling(bootstrap_options = c("striped", "hover"))


## missing variables

vaccine_countries <- vaccine |>
  filter(!str_detect(Entity, "UNICEF|World|income|region"))

range_check <- vaccine_countries |>
  summarise(across(where(is.numeric), list(min = ~min(., na.rm = TRUE),
                                           max = ~max(., na.rm = TRUE))))

vaccine_pre2023 <- vaccine_countries |>
  filter(Year < 2023)

vaccine_countries |>
  group_by(Year) |>
  summarise(across(where(is.numeric), ~sum(!is.na(.)))) |>
  print()


na_over_time <- vaccine_countries |>
  group_by(Year) |>
  summarise(across(where(is.numeric), ~mean(is.na(.)))) |>
  pivot_longer(-Year, names_to = "vaccine", values_to = "prop_missing") |>
  ggplot(aes(Year, prop_missing, color = vaccine)) +
  geom_line() +
  labs(y = "Proportion Missing", x = "Year",
       title = "Missingness over time by vaccine",
       color = "Vaccine") +
  theme_minimal()


# View Correlations ----

vaccine_numeric <- vaccine |>
  select(where(is.numeric)) |>
  na.omit() |>
  scale()

corrplot(
  corr = cor_matrix,
  method = "circle",
  type = "upper",
  tl.pos = "tl",
  order = "original",
  tl.col = "black"
)




save(correlation_graph, file = here("data_exploration/correlation_graph.png"))
save(summary_table, file = here("data_exploration/summary_table.rda"))
save(na_over_time, file = here("data_exploration/na_over_time.png"))








