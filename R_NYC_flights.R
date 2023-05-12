library(nycflights13)
library(tidyverse)
library(dplyr)
library(ggplot2)

View(flights)
glimpse(flights)

flights %>%
  filter(carrier == "UA") %>%
  count(dest) %>%
  arrange(desc(n)) %>%
  left_join(airports, by = c("dest" = "faa")) %>%
  select(dest, n, name) %>%
  head(5)

flights %>%
  count(month) %>%
  arrange(desc(n))

flights %>%
  count(day) %>%
  arrange(desc(n)) %>%
  print(n = 31)

flights %>%
  group_by(carrier) %>%
  summarise(n = mean(dep_delay, na.rm = T)) %>%
  arrange(desc(n))
  
flights %>%
  left_join(weather, by = c("year", "month", "day", "origin", "hour")) %>%
  select(month, day, temp, dep_delay) %>%
  group_by(month) %>%
  summarise(mean_temp = mean(temp, na.rm = T),
            mean_dep_delay = mean(dep_delay, na.rm = T)) %>%
  arrange(desc(mean_temp))
