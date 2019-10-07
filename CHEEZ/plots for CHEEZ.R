par(mfcol=c(3,2))
#normal scatter
### MAAS ### ----
plot(survey$reliance_sum,survey$MAAS_avg, main = "reliance v MAAS",
     xlab = "reliance", ylab = "MAAS", xlim=c(15, 70), ylim=c(1, 6),
     pch = 19, frame = FALSE)
abline(lm(survey$MAAS_avg ~ survey$reliance_sum, data = survey), col = "blue")

plot(survey$NOMO_sum,survey$MAAS_avg, main = "NOMO v MAAS",
     xlab = "NOMO", ylab = "MAAS", xlim=c(20, 145), ylim=c(1, 6),
     pch = 19, frame = FALSE)
abline(lm(survey$MAAS_avg ~ survey$NOMO_sum, data = survey), col = "blue")

plot(survey$SPhours_1,survey$MAAS_avg, main = "daily use v MAAS",
     xlab = "daily use", ylab = "MAAS", xlim=c(1, 14), ylim=c(1, 6),
     pch = 19, frame = FALSE)
abline(lm(survey$MAAS_avg ~ survey$SPhours_1, data = survey), col = "blue")

### ADHD ### ----
plot(survey$reliance_sum,survey$ADHD_sum, main = "reliance v ADHD",
     xlab = "reliance", ylab = "ADHD", xlim=c(15, 70), ylim=c(0, 16),
     pch = 19, frame = FALSE)
abline(lm(survey$ADHD_sum ~ survey$reliance_sum, data = survey), col = "blue")

plot(survey$NOMO_sum,survey$ADHD_sum, main = "NOMO v ADHD",
     xlab = "NOMO", ylab = "ADHD", xlim=c(20, 145), ylim=c(0, 16),
     pch = 19, frame = FALSE)
abline(lm(survey$ADHD_sum ~ survey$NOMO_sum, data = survey), col = "blue")

plot(survey$SPhours_1,survey$ADHD_sum, main = "daily use v ADHD",
     xlab = "daily use", ylab = "ADHD", xlim=c(1, 14), ylim=c(0, 16),
     pch = 19, frame = FALSE)
abline(lm(survey$ADHD_sum ~ survey$SPhours_1, data = survey), col = "blue")

### SLEEP ### ----
#sleep_effects
plot(survey$reliance_sum,survey$sleep_effects, main = "reliance v sleep_effects",
     xlab = "reliance", ylab = "sleep_effects", xlim=c(15, 70), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_effects ~ survey$reliance_sum, data = survey), col = "blue")

plot(survey$NOMO_sum,survey$sleep_effects, main = "NOMO v sleep_effects",
     xlab = "NOMO", ylab = "sleep_effects", xlim=c(20, 145), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_effects ~ survey$NOMO_sum, data = survey), col = "blue")

plot(survey$SPhours_1,survey$sleep_effects, main = "daily use v sleep_effects",
     xlab = "daily use", ylab = "sleep_effects", xlim=c(1, 15), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_effects ~ survey$SPhours_1, data = survey), col = "blue")

#sleep_onset
#not significant
plot(survey$reliance_sum,survey$sleep_onset, main = "reliance v sleep_onset",
     xlab = "reliance", ylab = "sleep_onset", xlim=c(15, 70), ylim=c(1, 12),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_onset ~ survey$reliance_sum, data = survey), col = "blue")

#not significant
plot(survey$NOMO_sum,survey$sleep_onset, main = "NOMO v sleep_onset",
     xlab = "NOMO", ylab = "sleep_onset", xlim=c(20, 145), ylim=c(1, 12),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_onset ~ survey$NOMO_sum, data = survey), col = "blue")

plot(survey$SPhours_1,survey$sleep_onset, main = "daily use v sleep_onset",
     xlab = "daily use", ylab = "sleep_onset", xlim=c(1, 15), ylim=c(1, 12),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_onset ~ survey$SPhours_1, data = survey), col = "blue")

#sleep_quality
#not significant
plot(survey$reliance_sum,survey$sleep_quality, main = "reliance v sleep_quality",
     xlab = "reliance", ylab = "sleep_quality", xlim=c(15, 70), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_quality ~ survey$reliance_sum, data = survey), col = "blue")

#not significant
plot(survey$NOMO_sum,survey$sleep_quality, main = "NOMO v sleep_quality",
     xlab = "NOMO", ylab = "sleep_quality", xlim=c(20, 145), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_quality ~ survey$NOMO_sum, data = survey), col = "blue")

plot(survey$SPhours_1,survey$sleep_quality, main = "daily use v sleep_quality",
     xlab = "daily use", ylab = "sleep_quality", xlim=c(1, 15), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_quality ~ survey$SPhours_1, data = survey), col = "blue")

#sleep_hours
#not significant
plot(survey$reliance_sum,survey$sleep_hours, main = "reliance v sleep_hours",
     xlab = "reliance", ylab = "sleep_hours", xlim=c(15, 70), ylim=c(5, 10),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_hours ~ survey$reliance_sum, data = survey), col = "blue")

plot(survey$NOMO_sum,survey$sleep_hours, main = "NOMO v sleep_hours",
     xlab = "NOMO", ylab = "sleep_hours", xlim=c(20, 145), ylim=c(5, 10),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_hours ~ survey$NOMO_sum, data = survey), col = "blue")

#not significant
plot(survey$SPhours_1,survey$sleep_hours, main = "daily use v sleep_hours",
     xlab = "daily use", ylab = "sleep_hours", xlim=c(1, 15), ylim=c(5, 10),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_hours ~ survey$SPhours_1, data = survey), col = "blue")

### MISC PLOT TINGS ### ----
#line o' best fit
abline(lm(survey$MAAS_avg ~ survey$reliance_sum, data = survey), col = "blue")

#johns plot
ggplot2(survey, aes(x=survey$sleep_effects, y=survey$reliance_sum) + geom_point() +stat_smooth(method="lm", se=FALSE))

#correlation matrix
chart.Correlation(survey$ZZZEffects, histogram = TRUE, method = c("pearson"))

chart.Correlation(survey[139:143], histogram=TRUE, pch=19)

pairs(survey[139:143], pch = 19)

library(psych)
pairs.panels(survey[139:143], 
             method = "pearson", # correlation method
             hist.col = "#00AFBB",
             density = TRUE,  # show density plots
             ellipses = FALSE # show correlation ellipses
)

### BOXPLOT ### ----
par(mfcol=c(2,1))
boxplot(survey$SPhours_1,data=survey, main="Daily Phone Use", 
         xlab="", ylab="Hours per Day")
boxplot(survey$sleep_hours,data=survey, main="Hours of Sleep", 
        xlab="", ylab="Hours per Night")


