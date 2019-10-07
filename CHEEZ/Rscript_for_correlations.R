### MAAS ### ----
cor.test(survey$MAAS_avg,survey$reliance_sum,method=c('pearson')) #r= -.352, p= <.001
cor.test(survey$MAAS_avg,survey$NOMO_sum,method=c('pearson')) #r= -.424, p= <.001
cor.test(survey$MAAS_avg,survey$SPhours_1,method=c('pearson')) #r= -.215, p= <.001

### SSS ### ----
cor.test(survey$SSS_sum,survey$reliance_sum,method=c('pearson'))
cor.test(survey$SSS_sum,survey$NOMO_sum,method=c('pearson'))
cor.test(survey$SSS_sum,survey$SPhours_1,method=c('pearson'))
#sss_tas
cor.test(survey$SSS_TAS,survey$reliance_sum,method=c('pearson')) #r= -.142, p= 0.027
cor.test(survey$SSS_TAS,survey$NOMO_sum,method=c('pearson'))
cor.test(survey$SSS_TAS,survey$SPhours_1,method=c('pearson'))
#sss_es
cor.test(survey$SSS_ES,survey$reliance_sum,method=c('pearson')) #r= -.156, p= 0.015
cor.test(survey$SSS_ES,survey$NOMO_sumccf,method=c('pearson'))
cor.test(survey$SSS_ES,survey$SPhours_1,method=c('pearson'))
#sss_dis
cor.test(survey$SSS_Dis,survey$reliance_sum,method=c('pearson'))
cor.test(survey$SSS_Dis,survey$NOMO_sum,method=c ('pearson')) #r= 0.162, p= 0.011
cor.test(survey$SSS_Dis,survey$SPhours_1,method=c('pearson'))
#sss_bs
cor.test(survey$SSS_BS,survey$reliance_sum,method=c('pearson'))
cor.test(survey$SSS_BS,survey$NOMO_sum,method=c('pearson'))
cor.test(survey$SSS_BS,survey$SPhours_1,method=c('pearson'))

### ADHD ----
#send graphs to Emily
cor.test(survey$ADHD_sum,survey$reliance_sum,method=c('pearson')) #r= .352, p= <.001
cor.test(survey$ADHD_sum,survey$NOMO_sum,method=c('pearson')) #r= .315, p= <.001
cor.test(survey$ADHD_sum,survey$SPhours_1,method=c('pearson')) #r= .224, p= <.001

### SLEEP ### ----
#sleep_phone do not use these for analysis
t.test(survey$sleep_phone,survey$reliance_sum,paired=FALSE)
t.test(survey$sleep_phone,survey$NOMO_sum,paired=FALSE)
t.test(survey$sleep_phone,survey$SPhours_1,paired=FALSE)

#sleep_effects
cor.test(survey$sleep_effects,survey$reliance_sum,method=c('pearson')) #r= -.233, p= <.001
cor.test(survey$sleep_effects,survey$NOMO_sum,method=c('pearson')) #r= -.272, p= <.001
cor.test(survey$sleep_effects,survey$SPhours_1,method=c('pearson')) #r= -.211, p= <.001

#sleep_onset
cor.test(survey$sleep_onset,survey$reliance_sum,method=c('pearson'))
cor.test(survey$sleep_onset,survey$NOMO_sum,method=c('pearson'))
cor.test(survey$sleep_onset,survey$SPhours_1,method=c('pearson')) #r= .220, p= <.001

#sleep_quality
cor.test(survey$sleep_quality,survey$reliance_sum,method=c('pearson'))
cor.test(survey$sleep_quality,survey$NOMO_sum,method=c('pearson'))
cor.test(survey$sleep_quality,survey$SPhours_1,method=c('pearson')) #r= -.183, p= .004

#sleep_hours
cor.test(survey$sleep_hours,survey$reliance_sum,method=c('pearson'))
cor.test(survey$sleep_hours,survey$NOMO_sum,method=c('pearson')) #r=-.137, p= 0.03
cor.test(survey$sleep_hours,survey$SPhours_1,method=c('pearson'))
