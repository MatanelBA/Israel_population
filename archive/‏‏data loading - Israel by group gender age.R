library(pacman)
p_load(dplyr, openxlsx, readxl,readr, tidyr, utf8)

#1 load files


var_names <- c("age", "arab_female", "arab_male", "arab_total",
                   "jews_and_others_female","jews_and_others_male", "jews_and_others_total", 
                    "all_female","all_male", "all_total", "drop") 
## 2020

year_2020_1 <- read_excel("originals/Israel population by group gender and age/2020.xls", 
                          sheet = "ST02-03a"
                          ,col_names  = var_names)

year_2020_2 <- read_excel("originals/Israel population by group gender and age/2020.xls", 
                          sheet = "ST02-03b"
                          ,col_names  = var_names)

year_2020 <- rbind( year_2020_1[9:63,1:10],year_2020_2[9:59,1:10])


year_2020_tidy <- pivot_longer(year_2020, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year =2020)

## 2019

year_2019_1 <- read_excel("originals/Israel population by group gender and age/2019.xls", 
                    sheet = "ST02-03a"
                    ,col_names  = var_names)

year_2019_2 <- read_excel("originals/Israel population by group gender and age/2019.xls", 
                          sheet = "ST02-03b"
                          ,col_names  = var_names)


year_2019 <- rbind( year_2019_1[9:63,1:10],year_2019_2[9:59,1:10])


year_2019_tidy <- pivot_longer(year_2019, cols = all_of(var_names[2:10])
                                    , names_to = "population_group"
                                    , values_to = "number") %>% 
                   mutate(number = as.double(number)*1000,
                          year =2019)


## 2018  "C:\R_projects\Israel popultion\originals\Israel population by group gender and age\2004.xls"

year_2018_1 <- read_excel("originals/Israel population by group gender and age/2018.xls", 
                          sheet = "ST02-03a"
                          ,col_names  = var_names)

year_2018_2 <- read_excel("originals/Israel population by group gender and age/2018.xls", 
                          sheet = "ST02-03b"
                          ,col_names  = var_names)


year_2018 <- rbind( year_2018_1[9:63,1:10],year_2018_2[9:59,1:10])

year_2018_tidy <- pivot_longer(year_2018, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2018)

## 2017

year_2017_1 <- read_excel("originals/Israel population by group gender and age/2017.xls", 
                          sheet = "ST02-03a"
                          ,col_names  = var_names)

year_2017_2 <- read_excel("originals/Israel population by group gender and age/2017.xls", 
                          sheet = "ST02-03b"
                          ,col_names  = var_names)


year_2017 <- rbind( year_2017_1[9:63,1:10],year_2017_2[9:59,1:10])

year_2017_tidy <- pivot_longer(year_2017, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2017)

## 2016

year_2016_1 <- read_excel("originals/Israel population by group gender and age/2016.xls", 
                          sheet = "ST02-03a"
                          ,col_names  = var_names)

year_2016_2 <- read_excel("originals/Israel population by group gender and age/2016.xls", 
                          sheet = "ST02-03b"
                          ,col_names  = var_names)


year_2016 <- rbind( year_2016_1[9:63,1:10],year_2016_2[9:59,1:10])


year_2016_tidy <- pivot_longer(year_2016, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2016)


## 2015

year_2015_1 <- read_excel("originals/Israel population by group gender and age/2015.xls", 
                          sheet = "ST02-03a"
                          ,col_names  = var_names)

year_2015_2 <- read_excel("originals/Israel population by group gender and age/2015.xls", 
                          sheet = "ST02-03b"
                          ,col_names  = var_names)


year_2015 <- rbind( year_2015_1[9:63,1:10],year_2015_2[9:59,1:10])

year_2015_tidy <- pivot_longer(year_2015, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2015)

## 2014

year_2014_1 <- read_excel("originals/Israel population by group gender and age/2014.xls", 
                          sheet = "ST02-03a"
                          ,col_names  = var_names)

year_2014_2 <- read_excel("originals/Israel population by group gender and age/2014.xls", 
                          sheet = "ST02-03b"
                          ,col_names  = var_names)


year_2014 <- rbind( year_2014_1[9:63,1:10],year_2014_2[9:59,1:10])


year_2014_tidy <- pivot_longer(year_2014, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2014)


## 2013

year_2013_1 <- read_excel("originals/Israel population by group gender and age/2013.xls", 
                          sheet = "ST02-03a"
                          ,col_names  = var_names)

year_2013_2 <- read_excel("originals/Israel population by group gender and age/2013.xls", 
                          sheet = "ST02-03b"
                          ,col_names  = var_names)


year_2013 <- rbind( year_2013_1[11:65,1:10],year_2013_2[9:59,1:10])


year_2013_tidy <- pivot_longer(year_2013, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2013)


## 2012

year_2012_1 <- read_excel("originals/Israel population by group gender and age/2012.xls", 
                          sheet = "ST02-03a"
                          ,col_names  = var_names)

year_2012_2 <- read_excel("originals/Israel population by group gender and age/2012.xls", 
                          sheet = "ST02-03b"
                          ,col_names  = var_names)


year_2012 <- rbind( year_2012_1[11:65,1:10],year_2012_2[9:59,1:10])



year_2012_tidy <- pivot_longer(year_2012, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2012)


## 2011




year_2011_1 <- read_excel("originals/Israel population by group gender and age/2011.xls", 
                          sheet = "ST02-19a"
                          ,col_names  = var_names)

year_2011_2 <- read_excel("originals/Israel population by group gender and age/2011.xls", 
                          sheet = "ST02-19b"
                          ,col_names  = var_names)


year_2011 <- rbind( year_2011_1[11:65,1:10],year_2011_2[9:59,1:10])



year_2011_tidy <- pivot_longer(year_2011, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2011)


## 2010

year_2010_1 <- read_excel("originals/Israel population by group gender and age/2010.xls", 
                          sheet = "ST02-19a"
                          ,col_names  = var_names)

year_2010_2 <- read_excel("originals/Israel population by group gender and age/2010.xls", 
                          sheet = "ST02-19b"
                          ,col_names  = var_names)


year_2010 <- rbind( year_2010_1[11:65,1:10],year_2010_2[9:59,1:10])


year_2010_tidy <- pivot_longer(year_2010, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2010)
## 2009

year_2009_1 <- read_excel("originals/Israel population by group gender and age/2009.xls", 
                          sheet = "ST02-19a"
                          ,col_names  = var_names)

year_2009_2 <- read_excel("originals/Israel population by group gender and age/2009.xls", 
                          sheet = "ST02-19b"
                          ,col_names  = var_names)


year_2009 <- rbind( year_2009_1[11:65,1:10],year_2009_2[9:59,1:10])


year_2009_tidy <- pivot_longer(year_2009, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2009)
## 2008

year_2008_1 <- read_excel("originals/Israel population by group gender and age/2008.xls", 
                          sheet = "ST02-19a"
                          ,col_names  = var_names)

year_2008_2 <- read_excel("originals/Israel population by group gender and age/2008.xls", 
                          sheet = "ST02-19b"
                          ,col_names  = var_names)


year_2008 <- rbind( year_2008_1[11:65,1:10],year_2008_2[9:59,1:10])


year_2008_tidy <- pivot_longer(year_2008, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2008)
## 2007

year_2007_1 <- read_excel("originals/Israel population by group gender and age/2007.xls", 
                          sheet = "ST02-19a"
                          ,col_names  = var_names)

year_2007_2 <- read_excel("originals/Israel population by group gender and age/2007.xls", 
                          sheet = "ST02-19b"
                          ,col_names  = var_names)


year_2007 <- rbind( year_2007_1[11:65,1:10],year_2007_2[9:59,1:10])


year_2007_tidy <- pivot_longer(year_2007, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2007)
## 2006

year_2006_1 <- read_excel("originals/Israel population by group gender and age/2006.xls", 
                          sheet = "ST02-19a"
                          ,col_names  = var_names)

year_2006_2 <- read_excel("originals/Israel population by group gender and age/2006.xls", 
                          sheet = "ST02-19b"
                          ,col_names  = var_names)


year_2006 <- rbind( year_2006_1[11:65,1:10],year_2006_2[9:59,1:10])


year_2006_tidy <- pivot_longer(year_2006, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2006)
## 2005

year_2005_1 <- read_excel("originals/Israel population by group gender and age/2005.xls", 
                          sheet = "ST02-18a"
                          ,col_names  = var_names)

year_2005_2 <- read_excel("originals/Israel population by group gender and age/2005.xls", 
                          sheet = "ST02-18b"
                          ,col_names  = var_names)


year_2005 <- rbind( year_2005_1[11:65,1:10],year_2005_2[9:59,1:10])


year_2005_tidy <- pivot_longer(year_2005, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2005)
## 2004

year_2004_1 <- read_excel("originals/Israel population by group gender and age/2004.xls", 
                          sheet = "ST02-18a"
                          ,col_names  = var_names)

year_2004_2 <- read_excel("originals/Israel population by group gender and age/2004.xls", 
                          sheet = "ST02-18b"
                          ,col_names  = var_names)


year_2004 <- rbind( year_2004_1[11:65,1:10],year_2004_2[9:59,1:10])


year_2004_tidy <- pivot_longer(year_2004, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2004)
## 2003

year_2003_1 <- read_excel("originals/Israel population by group gender and age/2003.xls", 
                          sheet = "ST02-18a"
                          ,col_names  = var_names)

year_2003_2 <- read_excel("originals/Israel population by group gender and age/2003.xls", 
                          sheet = "ST02-18b"
                          ,col_names  = var_names)


year_2003 <- rbind( year_2003_1[11:65,1:10],year_2003_2[9:59,1:10])


year_2003_tidy <- pivot_longer(year_2003, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2003)
## 2002

year_2002_1 <- read_excel("originals/Israel population by group gender and age/2002.xls", 
                          sheet = "ST02-18A"
                          ,col_names  = var_names)

year_2002_2 <- read_excel("originals/Israel population by group gender and age/2002.xls", 
                          sheet = "ST02-18B"
                          ,col_names  = var_names)


year_2002 <- rbind( year_2002_1[11:65,1:10],year_2002_2[9:59,1:10])


year_2002_tidy <- pivot_longer(year_2002, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2002)
## 2001

year_2001_1 <- read_excel("originals/Israel population by group gender and age/2001.xls", 
                          sheet = "ST02-18A"
                          ,col_names  = var_names)

year_2001_2 <- read_excel("originals/Israel population by group gender and age/2001.xls", 
                          sheet = "ST02-18B"
                          ,col_names  = var_names)


year_2001 <- rbind( year_2001_1[11:65,1:10],year_2001_2[9:59,1:10])


year_2001_tidy <- pivot_longer(year_2001, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2001)
## 2000

year_2000_1 <- read_excel("originals/Israel population by group gender and age/2000.xls", 
                          sheet = "ST02-18A"
                          ,col_names  = var_names)

year_2000_2 <- read_excel("originals/Israel population by group gender and age/2000.xls", 
                          sheet = "ST02-18B"
                          ,col_names  = var_names)


year_2000 <- rbind( year_2000_1[11:65,1:10],year_2000_2[9:58,1:10])


year_2000_tidy <- pivot_longer(year_2000, cols = all_of(var_names[2:10])
                               , names_to = "population_group"
                               , values_to = "number") %>% 
  mutate(number = as.double(number)*1000,
         year = 2000)


#bind all


population_2000_2020 <- bind_rows(list(
                                       year_2000_tidy,
                                       year_2001_tidy,
                                       year_2002_tidy,
                                       year_2003_tidy,
                                       year_2004_tidy,
                                       year_2005_tidy,
                                       year_2006_tidy,
                                       year_2007_tidy,
                                       year_2008_tidy,
                                       year_2009_tidy,
                                       year_2010_tidy,
                                       year_2011_tidy,
                                       year_2012_tidy,
                                       year_2013_tidy,
                                       year_2014_tidy,
                                       year_2015_tidy,
                                       year_2016_tidy,
                                       year_2017_tidy,
                                       year_2018_tidy,
                                       year_2019_tidy,
                                       year_2020_tidy
                                                      ) )

population_2000_2020 <- population_2000_2020[!is.na(population_2000_2020$number),]

#write.xlsx(population_2000_2020, "products/population_2000_2020.xlsx",asTable = T)

#rm(list = c(objects()[2:86]))
