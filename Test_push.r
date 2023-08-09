library(dplyr)
mtcars %>%
  select(1:5) %>%
  filter(mpg > 30)