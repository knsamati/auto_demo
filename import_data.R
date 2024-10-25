library(tidyverse)
library(robotoolbox)
library(janitor)

kobo_setup(url = "https://kf.kobotoolbox.org/",
           token = "5485e5f96971a197bcca4430ecb620637a3cb465")


asset <- kobo_asset("aNbL5vku3BxbRbcy9AxJwt")

asset |>
  kobo_asset() |>
  kobo_data() |>
  janitor::clean_names() |>
  write_rds("app/survey_data.rds")
