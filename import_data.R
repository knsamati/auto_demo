library(tidyverse)
library(robotoolbox)
library(janitor)

kobo_setup(url = "https://kf.kobotoolbox.org/",
           token = Sys.getenv("MY_TOKEN"))


asset <- kobo_asset(Sys.getenv("MY_UID"))

asset |>
  kobo_asset() |>
  kobo_data() |>
  janitor::clean_names() |>
  write_rds("app/survey_data.rds")
