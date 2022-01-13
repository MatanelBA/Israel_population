

library(pacman)
p_load(tidyverse, openxlsx, readxl, utf8, ggplot2, scales, magrittr,matrixStats, reldist, DescTools )

rm(list = objects())

getwd()


#1. load Israel data 
#to update this in years to come: add the new file to the folder, check if it's structure is the same, and replace the max year number everywhere in the script.  


var_names <- c("age", "arab_female", "arab_male", "arab_total",
               "jews_and_others_female","jews_and_others_male", "jews_and_others_total", 
               "all_female","all_male", "all_total", "drop") 

files_list <- list.files("originals/Israel population by group gender and age", full.names = TRUE)
names(files_list) <- as.character(c(2000:2020))


population_2000_2020   <-   map_dfr(files_list, read_excel,sheet = 1, col_names  = var_names, .id = "year") %>%
                bind_rows(  map_dfr(files_list, read_excel,sheet = 2, col_names  = var_names, .id = "year"))%>% 
                select(-drop) %>%
                pivot_longer(  cols = all_of(var_names[2:10])
                             , names_to = "population_group"
                             , values_to = "number")           %>% 
                mutate(number = as.double(number)*1000) %>%
                filter(!is.na(number)) %>%
                select (year,population_group, age, number) %>%
                arrange(year,population_group, age)

#write.xlsx(population_2000_2020, "products/population_2000_2020.xlsx",asTable = T)





#2 load OECD data

files_list <- setNames(c("originals/OECD population/HIST_POP_18062021.csv",
                         "originals/OECD population/POP_PROJ_18062021.csv"),
                       c("history","projection"))

OECD_pop <- map_dfr(files_list, read_csv , .id = "data_type") %>%
           select(country = Country, age_group = AGE, gender = Sex, year = Time, number =  Value, data_type ) %>%
           filter(str_length(.$age_group)<6 | age_group =="85_OVER",
                  age_group != "20-64" ) %>%
           mutate(age_group = ordered(tolower(age_group)),
                  gender    =         tolower(gender)  ) %>%
           arrange(country, year, gender, age_group)

#write.xlsx(OECD_pop, "products/OECD_pop.xlsx",asTable = T)



