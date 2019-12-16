# within subjects or related measures design for part one
# unpaired measures or unrelated measures for part two

### SEX ### ----
female_GSR <- subset(GSR_data, GSR_data$Sex == "F")
male_GSR <- subset(GSR_data, GSR_data$Sex == "M")

female_GSR$difference <- female_GSR$Neutral - female_GSR$Emotional
male_GSR$difference <- male_GSR$Neutral - male_GSR$Emotional

### CORRELATIONS ### ----
t.test(GSR_data$Neutral, GSR_data$Emotional, paired=TRUE)
t.test(female_GSR$difference, male_GSR$difference, paired=FALSE)

female_GSR$sd_neutral <- sd(female_GSR$Neutral)
female_GSR$sd_emotional <- sd(female_GSR$Emotional)

length(GSR_data$Emotional)
length(GSR_data$Neutral)

GSR_data$se_neutral <- GSR_data$sd_neutral/sqrt(length(GSR_data$Neutral))
GSR_data$se_emotional <- GSR_data$sd_emotional/sqrt(length(GSR_data$Emotional))

### BARPLOT ### ----

install.packages("tidyverse")
install.packages("ggthemes")
library(ggthemes)
library(tidyverse)
library(ggplot2)
gather(df1_1) %>% 
  ggplot(., aes(x = key, y = value)) +
  theme_bw()+
  geom_bar(stat = 'identity')
gather(df1_1) %>% 
  ggplot(., aes(x = key, y = value)) +
  stat_summary(fun.y = mean, geom = "bar") + 
  stat_summary(fun.data = mean_se, geom = "errorbar", color = "red") +
  theme_bw() +
  ggtitle("Galvanic Skin Response in Emotional and Neutral Questions") +
  labs(y="Skin Conductance (uS)", x = "Question Type")

### EXTRAS ### ----
df1_1 %>% 
  gather(df1_1) %>% 
  group_by(df_1) %>% 
  summarise(Mean = mean(Val), 
            SD = sd(Val), 
            SE = SD/sqrt(n(28))) %>% 
  ggplot(aes(df1, Mean)) + 
  geom_col() + 
  geom_errorbar(aes(ymin = Mean - SE, 
                    ymax = Mean + SE),
                width = 0.5)

### VARIABLES FOR GRAPHS ### ----

df1_1 <- structure(list(Neutral_Female = c(0.051, 0.891, 0.43, 2.73, 0.058, 0.64, 0.49, 1.53, 0.81, 1.07, 0.349, 0.213, 0.354, 0.67, 0.443, 0.369, 0.069, 0.616, -0.009), Neutral_Male = c(0.79, 0.835, 1.379, 2.32, 0.645, 1.317, 1.451, 0.104, 0.203), Emotional_Female = c(0.088, 2.72, 1.18, 5.06, 0.264, 1.179, 0.48, 2.02, 0.73, 1.13, 0.913, 0.306, 0.793, 0.566, 0.6882, 0.821, 0.637, 0.67, -0.6), Emotional_Male = c(1.64, 0.29, 1.586, 3.42, 1.55, 1.974, 3.465, 0.092, 0.274)), class = "data.frame", row.names = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"))
mean(Neutral_Female)
df1_2 <- structure(list(Neutral = c(0.051, 0.891, 0.43, 2.73, 0.058, 0.64, 0.49, 1.53, 0.81, 1.07, 0.349, 0.213, 0.354, 0.67, 0.443, 0.369, 0.069, 0.616, -0.009, 0.79, 0.835, 1.379, 2.32, 0.645, 1.317, 1.451, 0.104, 0.203), Emotional = c(0.088, 2.72, 1.18, 5.06, 0.264, 1.179, 0.48, 2.02, 0.73, 1.13, 0.913, 0.306, 0.793, 0.566, 0.6882, 0.821, 0.637, 0.67, -0.6, 1.64, 0.29, 1.586, 3.42, 1.55, 1.974, 3.465, 0.092, 0.274)), class = "data.frame", row.names = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"))

Neutral_Female = c(0.051, 0.891, 0.43, 2.73, 0.058, 0.64, 0.49, 1.53, 0.81, 1.07, 0.349, 0.213, 0.354, 0.67, 0.443, 0.369, 0.069, 0.616, -0.009)
df1_3 <- structure(list(Difference_Female = c(-.037, -1.829, -.75, -2.33, -.206, -.539, .01, -.49, .08, -.06, -.564, -.093, -.439, .104, -.2452, -.452, -.568, -.054, .591), Difference_Male = c(-.85, .545, -.207, -1.1, -.905, -.657, -2.014, .012, -.071)), class = "data.frame", row.names = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"))
