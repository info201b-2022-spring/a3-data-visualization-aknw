library(dplyr)
library(tidyverse)
county_level <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")
max_aapi_state <- county_level %>%filter(aapi_jail_pop == max(aapi_jail_pop, na.rm = TRUE)) %>%
  pull(state)
max_black_state <- county_level %>%filter(black_jail_pop == max(black_jail_pop, na.rm = TRUE)) %>%
  pull(state)
max_white_state <- county_level%>%filter(white_jail_pop == max(white_jail_pop, na.rm = TRUE)) %>%
  pull(state)
max_native_state <- county_level%>%filter(native_jail_pop == max(native_jail_pop, na.rm = TRUE)) %>%
  pull(state)
max_latinx_state <- county_level%>%filter(latinx_jail_pop == max(latinx_jail_pop, na.rm = TRUE)) %>%
  pull(state)

all_states <- data.frame(max_aapi_state, max_black_state, max_latinx_state, max_native_state, max_white_state) 
