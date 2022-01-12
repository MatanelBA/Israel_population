

population_2000_2020_int <- population_2000_2020 %>%
  filter(age %in% 0:74) %>%
  mutate(age = as.double(age)) %>%
  arrange(population_group, year,age)
