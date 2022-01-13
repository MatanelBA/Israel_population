

#השארת רק הגילים הבדידים

population_2000_2020_int <- population_2000_2020 %>%
  filter(age %in% 0:84) %>%
  mutate(age = as.double(age)) %>%
  arrange(year, population_group,age)

#חישוב סכומים ואחוזים

population_2000_2020_int <- population_2000_2020_int %>%
  group_by(year, population_group) %>%
  summarize(age = age, 
            number = number,
            prc_of_group = number/ sum(number) )%>%
  ungroup() 

#בדיקת שפיות
#population_2000_2020_int_prc %>%filter(year ==2000, population_group == "all_total")%>%select(prc_of_group) %>%sum()

#השארת רק קבוצות הגיל

population_2000_2020_age_groups <- population_2000_2020 %>%
  filter(!(age %in% 0:84)) %>%
  mutate( age = ordered(.$age,
                         c('0-4', '5-9', '10-14', '15-19', '20-24', '25-29', '30-34', '35-39', '40-44', '45-49',
                           '50-54', '55-59', '60-64', '65-69', '70-74', '75-79', '80-84', '85-89', '90+', 'TOTAL', '90-94', '95+')
                         ) 
          ) %>%
  arrange( year, population_group ,age )

# paste(unique(population_2000_2020_age_groups$age), collapse = "', '") #עוזר לגלות את הקבוצות ולסדר אותן ,  ", "

population_2000_2020_age_groups <- population_2000_2020_age_groups %>%
  group_by(year, population_group) %>%
  summarize(age = age, 
            number = number,
            prc_of_group = number/ sum(number) )%>%
  ungroup() 


