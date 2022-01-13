#p_load(revengc, )

#1. השארת רק הגילים הבדידים

population_2000_2020_int <- population_2000_2020 %>%
  filter(age %in% 0:84) %>%
  mutate(age = as.double(age)) %>%
  arrange(year, population_group,age)

#1.1 חישוב אחוזים בתוך כל קבוצה בהתפלגות הגילים הבדידים

population_2000_2020_int <- population_2000_2020_int %>%
  group_by(year, population_group) %>%
  summarize(age = age, 
            number = number,
            prc_of_group = number/ sum(number)
            ) %>%
  ungroup() 

#בדיקת שפיות
#population_2000_2020_int_prc %>%filter(year ==2000, population_group == "all_total")%>%select(prc_of_group) %>%sum()


#2. השארת רק קבוצות הגיל

population_2000_2020_age_groups <- population_2000_2020 %>%
  filter(!(age %in% 0:84)) %>%
  mutate( age = ordered(.$age,
                         c('0-4', '5-9', '10-14', '15-19', '20-24', '25-29', '30-34', '35-39', '40-44', '45-49',
                           '50-54', '55-59', '60-64', '65-69', '70-74', '75-79', '80-84', '85-89', '90+', 'TOTAL', '90-94', '95+')
                         ) 
          ) %>%
  arrange( year, population_group ,age )

 paste(unique(population_2000_2020_age_groups$age), collapse = "', '") #עוזר לגלות את הקבוצות ולסדר אותן ,  ", "

#2.1 חישוב אחוזים בתוך כל קבוצה בהתפלגות קבוצות הגיל  

population_2000_2020_age_groups <- population_2000_2020_age_groups %>%
  group_by(year, population_group) %>%
  summarize(age = age, 
            number = number,
            prc_of_group = number/ sum(number) )%>%
  ungroup() 


#3 חישוב סטטיסטיקות עבור האוכלוסייה כולה 
# הבנתי שבשביל לחשב סטטיסטיקות עבור כל האוכלוסייה, נכון יותר להשתמש בשילוב של הגילים הבדידים  עם קבוצות הגיל הסגורות


population_2000_2020_sum <- population_2000_2020 %>%
  filter(age %in% 0:84 | age %in% c('90+', '95+', '85-89','90-94') ) %>%
  mutate(age = case_when(age %in% 1:84  ~ as.double(age) ,
                         age == '85-89' ~ 87.5  ,   
                         age == '90-94' ~ 92.5  ,  
                         age == '90+'   ~ 95    ,
                         age == '95+'   ~ 98    ,
                         age == '0'     ~ 0.5    
                        )  ) %>%
  arrange(year, population_group,age) %>%
  group_by(year, population_group) %>%
  summarize(total = sum(number),
            life_years = sum(number*age),
            mean_age = sum(number*age)/sum(number),
#           mean_age2 = weighted.mean(age, number) ,
            median =  weightedMedian(age, number),
            first_qurtile = wtd.quantile(age, q = 0.25, weight = number),
#           median2  = wtd.quantile     (age, q = 0.5, weight = number),
            third_qurtile = wtd.quantile(age, q = 0.75, weight = number),
#           median3 = Quantile(age, weight = number, probs = 0.5)
            
  ) 
#%>%  ungroup() 
