worm.data <- read.csv('worms.csv', header = T, row.names = 1)
worm.data
head(worm.data)

attach(worm.data)
names(worm.data)

hist(Worm.density)

mean(Worm.density)
median(Worm.density)
range(Worm.density)
var(Worm.density)
sd(Worm.density)

#### skew ####
skew = function(x) {
  m3 = sum((x - mean(x))^3) / length(x)
  s3 = sqrt(var(x))^3
  m3 / s3
}

skew(Worm.density)

#### kurtosis ####
kurtosis = function(x) {
  m4 = sum((x - mean(x))^4) / length(x)
  s4 = var(x)^2
  m4 / s4 - 3
}

kurtosis(Worm.density)

#### qq ####
qqnorm(Worm.density)
qqline(Worm.density)

#### tapply ####
mean.worm.density <- tapply(Worm.density, Vegetation, mean)
median.worm.density <- tapply(Worm.density, Vegetation, median)
var.worm.density <- tapply(Worm.density, Vegetation, var)
sd.worm.density <- tapply(Worm.density, Vegetation, sd)
length.worm.density <- tapply(Worm.density, Vegetation, length)

summary.worm.density <- data.frame(mean.worm.density, median.worm.density, var.worm.density, sd.worm.density, length.worm.density)

write.csv(summary.worm.density, file = "summary of worm density.csv", row.names = T, quote = F)

#### plotzzzzzz ####
boxplot(Worm.density ~ Vegetation)

tufte.boxplot <- function(x, g) {
  k <- nlevels(g)
  crit.val <- tapply(x, g, median)
  plot(1:k, crit.val, ylim = c(min(x) * 1.1, max(x) * 1.1), pch = 19,
       xlab = deparse(substitute(g)), ylab = "worm density", axes = F)
  for (i in 1:k) {
    tmp <- boxplot.stats(x[as.numeric(g) == i])
    segments(i, tmp$stats[1], i, tmp$stats[2])
    segments(i, tmp$stats[4], i, tmp$stats[5])
    points(rep(i, length(tmp$out)), tmp$out, cex = .8)
  }
}

dd <- data.frame(x = rnorm(50*100), g = gl(50, 100))
with(dd, tufte.boxpot(x, g))

with(worm.data, tufte.boxplot(Worm.density, Vegetation))

axis(side = 1, at = c(1:length(levels(Vegetation))),
     labels = levels(Vegetation))
axis(side = 2)
worm.data
