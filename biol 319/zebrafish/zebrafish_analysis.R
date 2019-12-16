install.packages('dplyr')
install.packages('outliers')
install.packages("ggpubr")
install.packages('tidyverse')
library('outliers')
library('dplyr')
library('ggpubr')
library('tidyverse')

fish <- read.csv("as_data_2019.csv")

#### tidying ####
treatment_a <- filter(fish, fish$Treatment == "A")
treatment_b <- filter(fish, fish$Treatment == "B")
treatment_c <- filter(fish, fish$Treatment == "C")
clean_fish <- na.omit(fish)

#### graphing ####

geom_boxplot(treatment_a$DiffBU, treatment_b$DiffBU, treatment_c$DiffBU, aes(x=fish$Treatment, y=fish$di))

geom_boxplot(mapping = aes(x=fish$Treatment, y=fish$DiffBU), treatment_a$DiffBU, treatment_b$DiffBU, treatment_c$DiffBU)
