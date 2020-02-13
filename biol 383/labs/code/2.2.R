fish.data <- read.csv('16 fish.csv')

head(fish.data)
attach(fish.data)
names(fish.data)

hist(invert.biomass) #left skew

t.test(invert.biomass~water)

boxplot(invert.biomass~water)

var.test(invert.biomass~water)

