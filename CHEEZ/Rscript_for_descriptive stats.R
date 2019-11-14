### MEANS/SUMS ### ----
# not excluding missing values 
survey$MAAS_avg <- rowMeans(survey[2:16], na.rm = FALSE)
survey$NOMO_sum <- rowSums(survey[17:36], na.rm = FALSE)
survey$ADHD_sum <- rowSums(survey[121:138], na.rm = FALSE)
survey$SSS_sum <- rowSums(survey[42:81], na.rm = FALSE)
survey$reliance_sum <- rowSums(survey[82:94], na.rm = FALSE)

### T.TEST BETWEEN SEX ### ----
t.test(female$MAAS_avg, male$MAAS_avg, var.equal = FALSE)
t.test(female$ADHD_sum, male$ADHD_sum, var.equal = FALSE)
t.test(female$NOMO_sum, male$NOMO_sum, var.equal = FALSE)
t.test(female$reliance_sum, male$reliance_sum, var.equal = FALSE)
t.test(female$SSS_sum, male$SSS_sum, var.equal = FALSE)

### MEAN, MEDIAN, 25th AND 75th QUARTILES, MIN, MAX ### ----
summary(survey$sleep_hours)

### VARIANCE ### ----
var(survey$MAAS_avg)

### STANDARD DEVIATION ### ----
survey$MAAS_sd <- sd(survey$MAAS_avg)

### Z SCORE ### ----
SSS$z=data.frame(z=SSS$sum)
SSS$z <- scale(SSS$z)

#or

survey$ADHD_z=data.frame(z=survey$ADHD_sum)
survey$ADHD_z <- scale(survey$ADHD_z)

### SSS SUBSCALES ### ----
survey$SSS_TAS <- rowSums(survey[, c(44,52,57,58,61,62,64,69,79,81)])
survey$SSS_ES <- rowSums(survey[, c(45,47,50,51,55,59,60,63,67,68)])
survey$SSS_Dis <- rowSums(survey[, c(42,53,54,66,70,71,73,74,76,77)])
survey$SSS_BS <- rowSums(survey[, c(43,46,48,49,56,65,68,72,75,80)])

female <- subset(survey, survey$Sex == "2")
male <- subset(survey, survey$Sex == "1")
