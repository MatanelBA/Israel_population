# Israel_population
The goal of this project is to enable researchers in social studies to achieve the best easy-to-use data about Israel's population and age composition for several sub-groups, including geographic units such as cities, local authorities, settlements, and even neighborhoods. In addition, it includes data about the total populations of other countries, in order to make international comparisons easy to perform. All the data is converted to a singel, long format. 

Israel's population is unique among Developed countries in its very high and consistent birth rate. This leads to unusually young age distribution. Because age is amain factor in many contexts, this uniqueness of Israel makes it hard to compare to other developed countries in economic and sociologic factors.  

The data included in this project make clear the extent of this problem and enable a solution that is widely used in epidemiology and demography, but not enough in social studies: age-standardized ratios.

Although data about age compositions is easy to find from many sources, 
most of those contain data for every year separately, and only for age groups. Furthermore, the most common age composition data in use is about the population at the end of the year, which is different and inferior to the demographic method of using yearly averages. Also, mixing data for different years from different sources may lead to inconsistent time series and inject biases to statistical models based on it. 

#Data sources

The source for all the data about Israel is Israel's central bureau of statistics (CBS), in various publications. All the data was downloaded from the CBS internet site: https://www.cbs.gov.il/he/pages/default.aspx.
The original files can be found in this repository (for the data about total population) and the repository MatanelBA/local_authorities_in_Israel  (for data about the age composition of geographic units).  

The source for the data about other countries apart from Israel is STAT.OECD:  https://stats.oecd.org/

All the transformations to the original data have been done by the R code included in this repository; there was no manual change to the original files. 
