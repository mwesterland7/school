#for a 3 by 2 matrix
par(mfcol=c(3,2))
#for one graph
par(mfcol=c(1,1))
#normal scatter
#maas
plot(survey$reliance_sum,survey$MAAS_avg, main = "Reliance v MAAS",
     xlab = "Reliance", ylab = "MAAS", xlim=c(15, 70), ylim=c(1, 6),
     pch = 19, frame = FALSE)
abline(lm(survey$MAAS_avg ~ survey$reliance_sum, data = survey), col = "blue")

plot(survey$NOMO_sum,survey$MAAS_avg, main = "NMP-Q v MAAS",
     xlab = "NMP-Q", ylab = "MAAS", xlim=c(20, 145), ylim=c(1, 6),
     pch = 19, frame = FALSE)
abline(lm(survey$MAAS_avg ~ survey$NOMO_sum, data = survey), col = "blue")

plot(survey$SPhours_1,survey$MAAS_avg, main = "Daily Phone Use v MAAS",
     xlab = "Daily Phone Use", ylab = "MAAS", xlim=c(1, 14), ylim=c(1, 6),
     pch = 19, frame = FALSE)
abline(lm(survey$MAAS_avg ~ survey$SPhours_1, data = survey), col = "blue")

#adhd
plot(survey$reliance_sum,survey$ADHD_sum, main = "Reliance v ASRS",
     xlab = "Reliance", ylab = "ASRS", xlim=c(15, 70), ylim=c(0, 16),
     pch = 19, frame = FALSE)
abline(lm(survey$ADHD_sum ~ survey$reliance_sum, data = survey), col = "blue")

plot(survey$NOMO_sum,survey$ADHD_sum, main = "NMP-Q v ASRS",
     xlab = "NMP-Q", ylab = "ASRS", xlim=c(20, 145), ylim=c(0, 16),
     pch = 19, frame = FALSE)
abline(lm(survey$ADHD_sum ~ survey$NOMO_sum, data = survey), col = "blue")

plot(survey$SPhours_1,survey$ADHD_sum, main = "Daily Phone Use v ASRS",
     xlab = "Daily Phone Use", ylab = "ASRS", xlim=c(1, 14), ylim=c(0, 16),
     pch = 19, frame = FALSE)
abline(lm(survey$ADHD_sum ~ survey$SPhours_1, data = survey), col = "blue")

#sleep
#sleep_effects
plot(survey$reliance_sum,survey$sleep_effects, main = "Reliance v Poor Sleep Effects",
     xlab = "Reliance", ylab = "Poor Sleep Effects", xlim=c(15, 70), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_effects ~ survey$reliance_sum, data = survey), col = "blue")

plot(survey$NOMO_sum,survey$sleep_effects, main = "NMP-Q v Poor Sleep Effects",
     xlab = "NMP-Q", ylab = "Poor Sleep Effects", xlim=c(20, 145), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_effects ~ survey$NOMO_sum, data = survey), col = "blue")

plot(survey$SPhours_1,survey$sleep_effects, main = "Daily Phone Use v Poor Sleep Effects",
     xlab = "Daily Phone Use", ylab = "Poor Sleep Effects", xlim=c(1, 15), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_effects ~ survey$SPhours_1, data = survey), col = "blue")

#sleep_onset
#not significant
plot(survey$reliance_sum,survey$sleep_onset, main = "Reliance v Sleep Onset",
     xlab = "Reliance", ylab = "Sleep Onset", xlim=c(15, 70), ylim=c(1, 12),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_onset ~ survey$reliance_sum, data = survey), col = "blue")

#not significant
plot(survey$NOMO_sum,survey$sleep_onset, main = "NMP-Q v Sleep Onset",
     xlab = "NMP-Q", ylab = "Sleep Onset", xlim=c(20, 145), ylim=c(1, 12),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_onset ~ survey$NOMO_sum, data = survey), col = "blue")

plot(survey$SPhours_1,survey$sleep_onset, main = "Daily Phone Use v Sleep Onset",
     xlab = "Daily Phone Use", ylab = "Sleep Onset", xlim=c(1, 15), ylim=c(1, 12),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_onset ~ survey$SPhours_1, data = survey), col = "blue")

#sleep_quality
#not significant
plot(survey$reliance_sum,survey$sleep_quality, main = "Reliance v Sleep Quality",
     xlab = "Reliance", ylab = "Sleep Quality", xlim=c(15, 70), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_quality ~ survey$reliance_sum, data = survey), col = "blue")

#not significant
plot(survey$NOMO_sum,survey$sleep_quality, main = "NMP-Q v Sleep Quality",
     xlab = "NMP-Q", ylab = "Sleep Quality", xlim=c(20, 145), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_quality ~ survey$NOMO_sum, data = survey), col = "blue")

plot(survey$SPhours_1,survey$sleep_quality, main = "Daily Phone Use v Sleep Quality",
     xlab = "Daily Phone Use", ylab = "Sleep Quality", xlim=c(1, 15), ylim=c(1, 5),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_quality ~ survey$SPhours_1, data = survey), col = "blue")

#sleep_hours
#not significant
plot(survey$reliance_sum,survey$sleep_hours, main = "Reliance v Hours of Sleep",
     xlab = "Reliance", ylab = "Hours of Sleep", xlim=c(15, 70), ylim=c(5, 10),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_hours ~ survey$reliance_sum, data = survey), col = "blue")

plot(survey$NOMO_sum,survey$sleep_hours, main = "NMP-Q v Hours of Sleep",
     xlab = "NMP-Q", ylab = "Hours of Sleep", xlim=c(20, 145), ylim=c(5, 10),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_hours ~ survey$NOMO_sum, data = survey), col = "blue")

#not significant
plot(survey$SPhours_1,survey$sleep_hours, main = "Daily Phone Use v Hours of Sleep",
     xlab = "Daily Phone Use", ylab = "Hours of Sleep", xlim=c(1, 15), ylim=c(5, 10),
     pch = 19, frame = FALSE)
abline(lm(survey$sleep_hours ~ survey$SPhours_1, data = survey), col = "blue")

#boxplot
par(mfcol=c(2,1))
boxplot(survey$SPhours_1,data=survey, main="Daily Phone Use", 
        xlab="", ylab="Hours per Day")
boxplot(survey$sleep_hours,data=survey, main="Hours of Sleep", 
        xlab="", ylab="Hours per Night")