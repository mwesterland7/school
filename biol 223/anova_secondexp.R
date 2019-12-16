experiment2 <- read.csv('/Users/maggiewesterland/coding/anova_for_second_experiment.csv')
pH <- c(rep('pH..2.9.no.GABA', 6), rep('pH..2.9.GABA.10..4', 6), rep('pH..10.3.no.GABA', 6), rep('pH..10.3.GABA.10..4', 6), rep('pond.h20',6), rep('X10..4',6))
heartrate <- c(experiment2$pH..2.9.no.GABA, experiment2$pH..2.9.GABA.10..4, experiment2$pH..10.3.no.GABA, experiment2$pH..10.3.GABA.10..4, experiment2$pond.h20, experiment2$X10..4)
df <- data.frame(pH, heartrate)

experiment2.aov <- aov(heartrate ~ pH, data = df)

summary(experiment2.aov)

boxplot(heartrate ~ pH, data = df,
        main = "daphnia and pH",
        xlab = "pH",
        ylab = "heart rate in BPM")