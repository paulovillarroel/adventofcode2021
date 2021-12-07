## Day 01 Sonar Sweep

library(tidyverse)
data <- read.csv("data/day01.csv")

# Part 1
sum(data$depth > lag(data$depth), na.rm = TRUE)

# Part 2
sum(data$depth > lag(data$depth, n = 3), na.rm = TRUE)
