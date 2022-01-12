library(pacman)
p_load(dplyr, openxlsx, readxl,readr, tidyr, utf8, stringr)

#1 IRTAD_POPULATION


IRTAD_POPULATION <- read_csv("originals/IRTAD population/IRTAD_POPULATION_07062021.csv")%>%
                   select(Country ,age_group = AGE_GROUP, gender = Gender, year = Year, Value, Flags ) %>%
                   mutate(number = Value*1000) %>% select(-Value)

IRTAD_POPULATION$AGE_GROUP<- str_remove(IRTAD_POPULATION$age_group, "Y")
                


#write.xlsx(IRTAD_population, "products/IRTAD_population.xlsx",asTable = T)

IRTAD_population_int <-IRTAD_POPULATION %>% filter(str_length(IRTAD_POPULATION$AGE_GROUP)<3) %>%
                                        mutate(age_group = as.integer(AGE_GROUP))
                                        
# אותו הדבר באמצעות חבילת הבסיס
# IRTAD_population_int<- IRTAD_POPULATION[str_length(IRTAD_POPULATION$AGE_GROUP)<3,]
# IRTAD_population_int$age_group <- as.integer(IRTAD_population_int$AGE_GROUP)


#2 OECD historical population

OECD_hist_pop <- read_csv("originals/OECD population/HIST_POP_18062021.csv")  %>%
  select(Country ,age_group = AGE, gender = Sex, year = Time, number =  Value ) %>%
  filter(str_length(.$age_group)<6 | age_group =="85_OVER", age_group != "20-64" ) %>%
  mutate(age_group = ordered(tolower(age_group)),
         gender = tolower(gender)
         )


#write.xlsx(OECD_hist_pop, "products/OECD_hist_pop.xlsx",asTable = T)


#3 OECD population projection


OECD_proj_pop <- read_csv("originals/OECD population/POP_PROJ_18062021.csv") %>%
  select(Country ,age_group = AGE, gender = Sex, year = Time, number =  Value ) %>%
  filter(str_length(.$age_group)<6 | age_group =="85_OVER", age_group != "20-64" )%>%
  mutate(age_group = ordered(tolower(age_group)),
         gender = tolower(gender)
  )

#write.xlsx(OECD_proj_pop, "products/OECD_proj_pop.xlsx",asTable = T, ordered = TRUE)


#4.OECD_pop

OECD_pop<- rbind(OECD_hist_pop,OECD_proj_pop) %>%
  select(country = Country, year = year, age_group, gender = gender, number) %>%
  arrange(country, year, gender, age_group)
