install.packages('dplyr')
install.packages('outliers')
install.packages("ggpubr")
install.packages('tidyverse')
library('outliers')
library('dplyr')
library('ggpubr')
library('tidyverse')

fulldf <- read.csv('ASpaper_stats.csv')

#### opacity ####
opacitydf <- filter(fulldf, experiment == "dwo")

first_clutch <- opacitydf %>%
  filter(date == '11_18_19') %>%
  group_by(opacity)
second_clutch <- opacitydf %>%
  filter(date == '12_09_19') %>%
  group_by(opacity)
third_clutch <- opacitydf %>%
  filter(date == '01_20_20') %>%
  group_by(opacity)
fourth_clutch <- opacitydf %>%
  filter(date == '01_21_20') %>%
  group_by(opacity)

clutch1.aov2 <- aov(distance_moved ~ opacity + time.interval, data = first_clutch)
clutch2.aov2 <- aov(distance_moved ~ opacity + time.interval, data = second_clutch)
clutch3.aov2 <- aov(distance_moved ~ opacity + time.interval, data = third_clutch)
clutch4.aov2 <- aov(distance_moved ~ opacity + time.interval, data = fourth_clutch)
summary(clutch1.aov2)
summary(clutch2.aov2)
summary(clutch3.aov2)
summary(clutch4.aov2)

#### age ####
agedf <- filter(fulldf, experiment == "at")

first_clutch <- opacitydf %>%
  filter(date == '11_18_19') %>%
  group_by(opacity)
second_clutch <- opacitydf %>%
  filter(date == '12_09_19') %>%
  group_by(opacity)
third_clutch <- opacitydf %>%
  filter(date == '01_20_20') %>%
  group_by(opacity)


#### notes ####
first_clutch_clear <- filter(first_clutch, opacity == 'clear')
first_clutch_opaque <- filter(first_clutch, opacity == 'opaque')
opacity_first_clutch_results <- wilcox.test(first_clutch_clear$distance_moved, first_clutch_opaque$distance_moved, paired = TRUE)
wilcox.test(first_clutch_clear$distance_moved, first_clutch_opaque$distance_moved, paired = TRUE)

ggline(first_clutch, x = "time.interval", y = "distance_moved", color = "opacity",
       palette = c("#00AFBB", "#E7B800"))

shapiro.test(first_clutch$distance_moved)
ggqqplot(first_clutch$distance_moved)

clear_mean <- opacitydf %>%
  filter(opacity == 'clear') %>% 
  group_by(time.interval) %>%
  summarise(mean=mean(distance.moved..mm.))

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
