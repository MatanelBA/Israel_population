# Israel_population
The goal of this project is to enable researchers in social studies to access the best, easy-to-use data about Israel's population and age composition for several sub-groups, including geographic units such as cities, local authorities, settlements, and even neighborhoods. In addition, it includes data about the total populations of other countries, in order to make international comparisons easy to perform. All the data is converted to a single, long format. 

Israel's population is unique among developed countries in its very high and consistent birth rate. This leads to unusually young age distribution. Because age is a main factor in many contexts, this particularity of Israel makes it hard to compare to other developed countries in economic and sociological factors, without considering differences in age distributions. The data included in this project makes clear the extent of this problem and enables a solution that is widely used in epidemiology and demography, but not enough in social studies: age-standardized ratios.

Although data about age compositions is easy to find from many sources, most of them contain seperate data for every year and for every geographical unit. Furthermore, the most common age composition data in use refers to the population at the end of the year, which is different and inferior to the demographic method of using yearly averages. In addition, mixing data for different years from different sources may lead to inconsistent time series and introduce biases to statistical models based on said data. 

#**Data sources**

The source for all the data about Israel is Israel's Central Bureau of Statistics (CBS), from various publications. All the data was downloaded from the CBS internet site: https://www.cbs.gov.il/he/pages/default.aspx.
The original files can be found in this repository (for the data about total population) and the repository MatanelBA/local_authorities_in_Israel  (for data about the age composition of geographic units).  

The source for the data about other countries apart from Israel is STAT.OECD:  https://stats.oecd.org/

All the transformations to the original data have been done by the R scripts included in this repository. There were no manual changes to the original files. 
