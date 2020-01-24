install.packages('dplyr')
install.packages('outliers')
install.packages("ggpubr")
library('outliers')
library('dplyr')
library('ggpubr')

jan23 <- read.csv('2020_23_01_opaque_96_smw.csv')

jan23$time <- factor(jan23$time, levels=c("basal", "stimulus1", "recovery", "stimulus2"))

ggplot(jan23, aes(time, mean, shape = opacity, color = opacity)) + geom_point() 
            

jan23pt2 <- read.csv('Statistics-2020_23_01_opaque_96_smw (1).csv')

jan23pt2$time <- factor(jan23pt2$time, levels=c("basal", "stimulus1", "recovery", "stimulus2"))

ggplot(jan23pt2, aes(time, mean, shape = opacity, color = opacity)) + geom_point() 
