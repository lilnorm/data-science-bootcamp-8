# my first R program

print("hello world!")
print("oppenhimer is very good movie")

library(dplyr)
mtcars %>%
  select(1:5) %>%
  filter(mpg > 30)
