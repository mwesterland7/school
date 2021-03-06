install.packages('dplyr')
install.packages('outliers')
install.packages("ggpubr")
library('outliers')
library('dplyr')
library('ggpubr')

AgeTrialsCompiled <- read.csv('AgeTrialsCompiled.csv')
differing_timeintervals <- read.csv('differing_timeintervals.csv')

delta <- dark$mm_mean - light$mm_mean

differingTI = differing_timeintervals %>% 
  select(age, min, plate, light, time, n, mm_mean, mm_sem)

differingTI = differingTI %>% 
  mutate(delta = delta)

#### age trials compiled tidying ####
five_dpf <- filter(AgeTrialsCompiled, age == "5dpf")
six_dpf <- filter(AgeTrialsCompiled, age == "6dpf")
seven_dpf <- filter(AgeTrialsCompiled, age == "7dpf")

light <- filter(AgeTrialsCompiled, min <= 4)
dark <- filter(AgeTrialsCompiled, min >= 5)

#### differing time intervals tidying ####
light <- filter(differing_timeintervals, light == 'on')
dark <- filter(differing_timeintervals, light == 'off')
five_dpf <- filter(differing_timeintervals, age == "5dpf")
six_dpf <- filter(differing_timeintervals, age == "6dpf")
seven_dpf <- filter(differing_timeintervals, age == "7dpf")
five_dpfLight <- filter(five_dpf, light == "on")
five_dpfDark <- filter(five_dpf, light == "off")
six_dpfLight <- filter(six_dpf, light == "on")
six_dpfDark <- filter(six_dpf, light == "off")
seven_dpfLight <- filter(seven_dpf, light == "on")
seven_dpfDark <- filter(seven_dpf, light == "off")

t.test(light$mm_mean, dark$mm_mean)

mm_mean <- c(seven_dpf$mm_mean, six_dpf$mm_mean, five_dpf$mm_mean)
df <- data.frame(age, mm_mean)

#### age trials compiled normality testing ####
ggdensity(AgeTrialsCompiled$mm,
          xlab = "movement in millimeters") #very skewed positive

ggqqplot(AgeTrialsCompiled$mm)

plot(five_dpf$min, five_dpf$mm)
plot(six_dpf$min, six_dpf$mm)
plot(seven_dpf$min, seven_dpf$mm)
plot(light$mm, dark$mm)

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

#### differing time intervals normality testing ####

ggdensity(differing_timeintervals$mm_mean,
          xlab = "movement in millimeters") #very skewed positive

ggqqplot(differing_timeintervals$mm_mean)
ggqqplot(log(differing_timeintervals$mm_mean)) #logged makes more normally distributed

plot(five_dpf$time, five_dpf$mm_mean)
plot(six_dpf$time, six_dpf$mm_mean)
plot(seven_dpf$time, seven_dpf$mm_mean)
plot(light$time, dark$mm_mean)

plot(mm_mean ~ age, data = differing_timeintervals)

hist(differing_timeintervals$mm_mean) #data is skewed positive
hist(log(differing_timeintervals$mm_mean)) #log

outlier(differing_timeintervals$mm_mean)

pdf <- lm(mm_mean ~ age, data = differing_timeintervals)  #Create a linear model
summary(pdf)
resid(pdf) #List of residuals
plot(density(resid(pdf))) #A density plot
qqnorm(resid(pdf)) # A quantile normal plot - good for checking normality. we want line to fit across
qqline(resid(pdf))

shapiro.test(differing_timeintervals$mm_mean)

#### age trials compiled stats ####
mean(AgeTrialsCompiled$mm) #35
median(AgeTrialsCompiled$mm) #31

AgeTrialsCompiled_aov <- aov(mm_mean ~ age, data = differing_timeintervals)
summary(AgeTrialsCompiled_aov)

#### differing time intervals stats ####
mean(differing_timeintervals$mm_mean) #681.8195
median(differing_timeintervals$mm_mean) #436.6685

mean(five_dpf$mm_mean)
mean(six_dpf$mm_mean)
mean(seven_dpf$mm_mean)
mean(dark$mm_mean)
mean(light$mm_mean)
mean(five_dpfDark$mm_mean)
mean(five_dpfLight$mm_mean)

wilcox.test(five_dpfDark$mm_mean, five_dpfLight$mm_mean)
wilcox.test(light$mm_mean, dark$mm_mean)

ks.test(light$mm_mean, dark$mm_mean)
kruskal.test(light$mm_mean, dark$mm_mean)

cor.test(five_dpfDark$mm_mean, five_dpfLight$mm_mean, method = "spearman") #spearman bc not normally distributed

cor.test(log(five_dpfDark$mm_mean), log(five_dpfLight$mm_mean), method = "pearson") #pearson bc logged for normal distribution
