library(ggplot2)
library(dplyr)
library(tidyverse)
library(hrbrthemes)

county_level <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

Div_scatt <- ggplot(county_level, aes(x= female_pop_15to64, y = male_pop_15to64, color= division)) +
  geom_point(size = .5) +
  ylab("Male Inmate Population") +
  xlab("Female Inmate Population") +
  ggtitle("Jail Population in Different Divisoins") +
  theme(plot.title = element_text(face = "bold", size = 15, hjust = 0.5)) +
  theme(axis.title.x.bottom = element_text(face = "bold")) +
  theme(axis.title.y.left = element_text(face = "bold"))
  theme_ipsum()
Div_scatt