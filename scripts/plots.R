library(pacman)
p_load(ggplot2, ggridges, ggpubr, scales, cowplot,viridisLite, viridis)


#int_0_74 <- 0:74

population_2000_2019_int <- population_2000_2019 %>%
  filter(age %in% 0:74) %>%
mutate(age = as.double(age))


population_2000_2019_int %>%
filter( population_group %in% (c("arab_total", "jews_and_others_total") ) ) %>%
ggplot(aes(age,number, color = year, group = year)) +
         geom_path()+
  facet_wrap(~population_group)+
  theme_pubr()
       
jews_1<- population_2000_2019_int %>%
          filter( population_group =="jews_and_others_total" ) %>%
          ggplot(aes(age,number, color = year, group = year)) +
          geom_path()+
        facet_wrap(~year)+
          theme_pubr()+
            coord_flip()

jews_2<- population_2000_2019_int %>%
  filter( population_group =="jews_and_others_total" ) %>%
  ggplot(aes(age,number, color = year, group = year)) +
  geom_path()+
  facet_wrap(~year, ncol = 1)+
  theme_pubr()


population_2000_2019_int %>%
  filter( population_group %in% (c( "jews_and_others_total") ),
          year %in% c(2010,2019)) %>%
  ggplot(aes(x = age, y = year,height =number, group = year, fill = factor(year)) ) +
  geom_ridgeline (alpha = 0.5) +
  scale_fill_brewer(palette = "Set1")
  theme_ridges()

jews_gender<- population_2000_2019_int %>%
  filter( population_group %in% c("jews_and_others_male","jews_and_others_female"),
          year == 2019) %>%
  ggplot(aes(age,number, color = population_group)) +
  geom_path()+
  scale_color_brewer(palette = "Set1")+
  theme_pubr()

ggsave("C:/R_projects/Israel popultion/plots/jews_by_gender.png")

