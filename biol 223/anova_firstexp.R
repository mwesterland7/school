experiment1 <- read.csv('/Users/maggiewesterland/coding/anovaforR.csv')
concentrations <- c(rep('pond.h20', 6), rep('X10..7', 6), rep('X10..6', 6), rep('X10..5', 6), rep('X10..4',6), rep('X10..3',6))
heartbeat <- c(experiment1$pond.h20, experiment1$X10..7, experiment1$X10..6, experiment1$X10..5, experiment1$X10..4, experiment1$X10..3)
df <- data.frame(concentrations, heartbeat)
plot(heartbeat ~ concentrations, data = df)

experiment1.aov <- aov(heartbeat ~ concentrations, data = df)

summary(experiment1.aov)

boxplot(heartbeat ~ concentrations, data = df,
        main = "daphnia and GABA",
        xlab = "concentrations of GABA",
        ylab = "heart rate in BPM")