library(ggplot2)
library(dplyr)
library(tidyverse)
library(usmap)
county_level <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")
state_black <- county_level  %>% filter(year == max(year,na.rm = T)) %>% group_by(state) %>% 
  summarise(newest_year = max(black_jail_pop,na.rm = T))

chart_3 <- plot_usmap(data = state_black, values = "newest_year", labels = T, color = "black") +  
  scale_fill_continuous(
    low = "white", high = "red", name = "Legend", label = scales::comma
  ) + 
  theme_linedraw() + 
  labs(title = "Total Black Jail Population From 1970 to 2018") + 
  theme(plot.title = element_text(face = "bold", size = 15, hjust = 0.5))+
  theme(legend.background = element_rect(fill = "white", size = 0.5, linetype = "solid", colour = "black"))
  theme(legend.position = "right") +

chart_3
