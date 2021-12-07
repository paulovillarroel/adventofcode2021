## Day 02 Dive!

library(tidyverse)
data <- read.csv("data/day02.csv")

# Part 1

directions <- tribble(
  ~ direction, ~ x, ~ y,
  "forward", 1, 0,
  "up", 0, -1,
  "down", 0, 1
  )
  
data_joined <- data |> 
  separate(moves, c("direction", "distance"), sep = " ", convert = TRUE) |> 
  inner_join(directions, by = "direction")

data_joined |> 
  summarise(horizontal = sum(distance * x),
            depth = sum(distance * y),
            position = horizontal * depth)

# Part 2

data_joined |> 
  mutate(aim = cumsum(y * distance)) |> 
  summarise(horizontal = sum(distance * x),
            depth = sum(distance * x * aim),
            position = horizontal * depth)
