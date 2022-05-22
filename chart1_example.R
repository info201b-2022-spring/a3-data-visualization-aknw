library(ggplot2)
library(dplyr)
library(tidyverse)
county_level <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")
race_ca <- county_level %>% filter(state == "CA") %>% group_by(year) %>% group_by(county_name) 

race_ca_black <- aggregate(race_ca$black_jail_pop, by=list(year = race_ca$year), FUN=sum,na.rm = T)

jail_pop <- aggregate(race_ca$total_jail_pop, by=list(year = race_ca$year), FUN=sum,na.rm = T)

ca_all <- left_join(jail_pop,race_ca_black, by='year')


colors <- c("all" = "green", "black" = "yellow")
chart_2<- ggplot(ca_all,aes(year, colour = Legend)) + 
  geom_line(aes(y = x.x, colour = "all"))  +  
  geom_line(aes(y = x.y, colour = "black"))  + 
  labs(title = "DIFFERENT RACES INCARCERATION RATE IN CA", x = "Year", y = "# OF INCARCERATION", name = "Legend") + scale_color_manual(values = colors)
chart_2

