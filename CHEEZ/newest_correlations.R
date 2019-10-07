#maas
#send graphs to Emily
cor.test(MAAS$avg,reliance$sum,method=c('pearson')) #r= -.352, p= <.001
cor.test(MAAS$avg,NOMO$sum,method=c('pearson')) #r= -.424, p= <.001
cor.test(MAAS$avg,survey$SPhours_1,method=c('pearson')) #r= -.215, p= <.001

#sss
cor.test(SSS$sum,reliance$sum,method=c('pearson'))
cor.test(SSS$sum,NOMO$sum,method=c('pearson'))
cor.test(SSS$sum,survey$SPhours_1,method=c('pearson'))

#adhd
#send graphs to Emily
cor.test(ADHD$sum,reliance$sum,method=c('pearson')) #r= .352, p= <.001
cor.test(ADHD$sum,NOMO$sum,method=c('pearson')) #r= .315, p= <.001
cor.test(ADHD$sum,survey$SPhours_1,method=c('pearson')) #r= .224, p= <.001

#sleep
#sleep_phone do not use these for analysis
t.test(survey$sleep_phone,reliance$sum,paired=FALSE)
t.test(survey$sleep_phone,NOMO$sum,paired=FALSE)
t.test(survey$sleep_phone,survey$SPhours_1,paired=FALSE)

#sleep_effects
cor.test(survey$sleep_effects,reliance$sum,method=c('pearson')) #r= -.233, p= <.001
cor.test(survey$sleep_effects,NOMO$sum,method=c('pearson')) #r= -.272, p= <.001
cor.test(survey$sleep_effects,survey$SPhours_1,method=c('pearson')) #r= -.211, p= <.001

#sleep_onset
cor.test(survey$sleep_onset,reliance$sum,method=c('pearson'))
cor.test(survey$sleep_onset,NOMO$sum,method=c('pearson'))
cor.test(survey$sleep_onset,survey$SPhours_1,method=c('pearson')) #r= .220, p= <.001

#sleep_quality
cor.test(survey$sleep_quality,reliance$sum,method=c('pearson'))
cor.test(survey$sleep_quality,NOMO$sum,method=c('pearson'))
cor.test(survey$sleep_quality,survey$SPhours_1,method=c('pearson')) #r= -.183, p= .004

#sleep_hours
cor.test(survey$sleep_hours,reliance$sum,method=c('pearson'))
cor.test(survey$sleep_hours,NOMO$sum,method=c('pearson')) #r=-.137, p= 0.03
cor.test(survey$sleep_hours,survey$SPhours_1,method=c('pearson'))
