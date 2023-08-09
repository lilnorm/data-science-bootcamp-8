# my first R program

print("hello world!")
print("oppenhimer is very good movie")

print("lil Norm")

library(dplyr)
mtcars %>%
  select(1:5) %>%
  filter(mpg > 30)

mtcars %>%
  select(mpg) %>%
  filter(mpg < 30)
