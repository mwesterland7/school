install.packages('dplyr')
install.packages('outliers')
install.packages("ggpubr")
install.packages('tidyverse')
library('outliers')
library('dplyr')
library('ggpubr')
library('tidyverse')

fulldf <- read.csv('ASpaper_stats.csv')

opacitydf <- filter(fulldf, experiment == "dwo")

opacitydf %>% 
  group_by(time.interval || opacity) %>%
  summarize(averaged_time.interval = mean(opacitydf$distance.moved..mm.))
