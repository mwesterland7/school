# get means for total
# not excluding missing values 
survey$MAAS_avg <- rowMeans(survey[2:16], na.rm = FALSE)
survey$NOMO_sum <- rowSums(survey[17:36], na.rm = FALSE)
survey$ADHD_sum <- rowSums(survey[121:138], na.rm = FALSE)
survey$SSS_sum <- rowSums(survey[42:81], na.rm = FALSE)
survey$reliance_sum <- rowSums(survey[82:94], na.rm = FALSE)

# get sum
survey$MAAS_avg <- rowMeans(survey[2:16], na.rm = FALSE)
survey$NOMO_sum <- rowSums(survey[17:36], na.rm = FALSE)
survey$ADHD_sum <- rowSums(survey[121:138], na.rm = FALSE)
survey$SSS_sum <- rowSums(survey[42:81], na.rm = FALSE)
survey$reliance_sum <- rowSums(survey[82:94], na.rm = FALSE)


# mean, median, 25th and 75th quartiles, min, max
summary(survey$MAAS_avg)

# variance
var(survey$MAAS_avg)

# standard deviation
survey$MAAS_sd <- sd(survey$MAAS_avg)

# get z score
SSS$z=data.frame(z=SSS$sum)
SSS$z <- scale(SSS$z)

#or

survey$MAAS_z=data.frame(z=survey$MAAS_avg)
survey$MAAS_z <- scale(survey$MAAS_z)

