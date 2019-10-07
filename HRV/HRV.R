library('ggplot2')
library("ggpubr")

HRV <- read.csv("HRV.csv")

####CLEAN####
HRV$Sex <- ordered(HRV$Sex, levels = c("F", "M"))
library(dplyr)
group_by(HRV, Sex) %>%
  summarise(
    count = n(),
    mean = mean(HR, na.rm = TRUE),
    sd = sd(HR, na.rm = TRUE)
  )

####PLOTS####
plot(HRV$rMSSD, HRV$BMI, pch = 16, cex = 1.3, col = "black", xlab = "RMSSD", ylab = "BMI", frame.plot = TRUE)
  abline(lm(HRV$BMI ~ HRV$rMSSD))

ggboxplot(HRV, x = "Sex", y = "HR", 
          color = "Sex", palette = c("#00AFBB", "#E7B800"),
          order = c("F", "M"),
          ylab = "Heart Rate (bpm)", xlab = "Sex")

ggline(HRV, x = "Sex", y = "HR", 
       add = c("mean_se", "jitter"), 
       order = c("F", "M"),
       ylab = "HR", xlab = "Sex")

ggqqplot(HRV$BMI, ylab = "BMI")
ggqqplot(HRV$rMSSD, ylab = "BMI")

####TESTS####
oneway.test(HR ~ Sex, data = HRV)
shapiro.test(HRV$rMSSD)
shapiro.test(HRV$BMI)
cor.test(HRV$BMI, HRV$rMSSD, method = "pearson")
