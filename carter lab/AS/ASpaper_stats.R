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

opacitydf$time.interval <- factor(opacitydf$time.interval, levels=c("Start-0:04:00", "0:04:00-0:08:00", "0:08:00-0:12:00", "0:12:00-0:16:00"))

opaque_mean <- opacitydf %>%
  filter(opacity == 'opaque') %>% 
  group_by(time.interval) %>%
  summarise(mean=mean(distance.moved..mm.))
clear_mean <- opacitydf %>%
  filter(opacity == 'clear') %>% 
  group_by(time.interval) %>%
  summarise(mean=mean(distance.moved..mm.))

opaque_mean$opacity <- c('opaque', 'opaque', 'opaque', 'opaque')
clear_mean$opacity <- c('clear', 'clear', 'clear', 'clear')

opacity_means <- rbind(opaque_mean, clear_mean)

ggplot(opacity_means, aes(time.interval, mean, shape = opacity, color = opacity, group = opacity)) + geom_point() + geom_path()
