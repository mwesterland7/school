install.packages('dplyr')
install.packages('outliers')
install.packages("ggpubr")
library('outliers')
library('dplyr')
library('ggpubr')

fish <- read.csv("as_data_2019.csv")

#### tidying ####
treatment_a <- filter(fish, fish$Treatment == "A")
treatment_b <- filter(fish, fish$Treatment == "B")
treatment_c <- filter(fish, fish$Treatment == "C")

#### manova ####
fish_matrix <- cbind(treatment_a,treatment_b,treatment_c)
