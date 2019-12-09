install.packages('dplyr')
install.packages('outliers')
install.packages("ggpubr")
library('outliers')
library('dplyr')
library('ggpubr')

#### read csv ####
df <- read.csv('df')

#### tidying ####
newdf <- filter(df, columnName == "names")

#### normality ####
plot(df$x, df$y)
hist(df$x)
outlier(df$x)
pdf <- lm(y ~ x, data = df)
summary(pdf)
resid(pdf)
plot(density(resid(pdf))) 
qqnorm(resid(pdf)) 
qqline(resid(pdf))

#### stats ####
mean(df$x)
median(df$x)



