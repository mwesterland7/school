#lecture 1
#Math 441: Linear Regression with Time Series Analysis

#### Introduction ####
a <- 2 + 10
a

x <- c(3, 5, 10)
x

b <- 2 * x + 4
b

#### opening a dataset ####
library('MASS')

summary(Cars93)
summary(Cars93$Weight)
summary(Cars93$Price)

hist(Cars93$Weight)
hist(Cars93$Price) #right skew


summary(Boston)
summary(Boston$crim)
hist(Boston$crim) #right skew median < mode
