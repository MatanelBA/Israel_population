#glimpse(OECD_pop)


#הוספת אחוזים

OECD_pop <- OECD_pop %>%
  group_by(data_type, year, country, gender) %>%
  summarize(age_group = age_group, 
            number = number,
            prc_of_group = number/ sum(number) )%>%
  ungroup() 


# חישוב סטטיסטיקות עבור האוכלוסייה כולה 


OECD_pop_sum <- OECD_pop %>%
  filter(age_group != "total" ) %>%
  mutate(age_avg = case_when(age_group == "0_4"      ~  2.5   ,
                             age_group == "05_9"     ~  5.5   ,
                             age_group == "10_14"    ~  12.5  ,
                             age_group == "15_19"    ~  17.5  ,
                             age_group == "20_24"    ~  22.5  ,
                             age_group == "25_29"    ~  27.5  ,
                             age_group == "30_34"    ~  32.5  ,
                             age_group == "35_39"    ~  37.5  ,
                             age_group == "40_44"    ~  42.5  ,
                             age_group == "45_49"    ~  47.5  ,
                             age_group == "50_54"    ~  52.5  ,
                             age_group == "55_59"    ~  57.5  ,
                             age_group == "60_64"    ~  62.5  ,
                             age_group == "65_69"    ~  67.5  ,
                             age_group == "70_74"    ~  72.5  ,
                             age_group == "75_79"    ~  77.5  ,  
                             age_group == "80_84"    ~  82.5  ,  
                             age_group == "85_over"  ~  89     
                             )  ) %>%
  arrange(year, country, gender , age_avg) %>%
  group_by(year, country, gender) %>%
  summarize(
            total = sum(number),
            life_years = sum(number*age_avg),
            mean_age = sum(number*age_avg)/sum(number),
            median =  weightedMedian(age_avg, number),
            first_qurtile = wtd.quantile(age_avg, q = 0.25, weight = number),
            third_qurtile = wtd.quantile(age_avg, q = 0.75, weight = number)
            ) %>% 
  ungroup() 
