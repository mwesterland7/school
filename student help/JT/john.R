df <- read.csv('john.csv')

plot(df$nErrors, df$nHours, abline(lm(df$nHours ~ df$nErrors, data = df), col = "blue"))

cor(df$nErrors, df$nHours)
var(df)


cor.test(df$nErrors, df$nHours)


t.test(df$nErrors, df$nHours)


lm(df$nHours ~ df$nErrors, data = df)
