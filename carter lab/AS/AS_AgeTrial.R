install.packages('dplyr')
install.packages('outliers')
install.packages("ggpubr")
library('outliers')
library('dplyr')
library('ggpubr')

AgeTrialsCompiled <- read.csv('AgeTrialsCompiled.csv')

#### TIDY ####

five_dpf <- filter(AgeTrialsCompiled, age == "5dpf")
six_dpf <- filter(AgeTrialsCompiled, age == "6dpf")
seven_dpf <- filter(AgeTrialsCompiled, age == "7dpf")
age <- c(rep("7dpf", 12), rep("6dpf", 12), rep("5dpf", 12))
mm <- c(seven_dpf$mm, six_dpf$mm, five_dpf$mm)
df <- data.frame(age, mm)

#### NORMALITY ####

ggdensity(AgeTrialsCompiled$mm,
          xlab = "movement in millimeters") #very skewed positive

ggqqplot(AgeTrialsCompiled$mm)

plot(five_dpf$min, five_dpf$mm)
plot(six_dpf$min, six_dpf$mm)
plot(seven_dpf$min, seven_dpf$mm)

plot(mm ~ age, data = df)

hist(AgeTrialsCompiled$mm) #data is skewed positive
hist(log(AgeTrialsCompiled$mm)) #log
hist(log(log(AgeTrialsCompiled$mm))) #double log WORKS
hist((AgeTrialsCompiled$mm * AgeTrialsCompiled$mm)) #square
hist(sqrt(AgeTrialsCompiled$mm)) #sqrt
hist(log10(AgeTrialsCompiled$mm)) #log10
hist(cuberoot(AgeTrialsCompiled$mm))

outlier(AgeTrialsCompiled$mm)

pdf <- lm(mm ~ age, data = df)  #Create a linear model
summary(pdf)
resid(pdf) #List of residuals
plot(density(resid(pdf))) #A density plot
qqnorm(resid(pdf)) # A quantile normal plot - good for checking normality. we want line to fit across
qqline(resid(pdf))

shapiro.test(AgeTrialsCompiled$mm)

#### STATS ####

mean(AgeTrialsCompiled$mm) #35
median(AgeTrialsCompiled$mm) #31

AgeTrialsCompiled_aov <- aov(mm ~ age, data = df)
summary(AgeTrialsCompiled_aov)