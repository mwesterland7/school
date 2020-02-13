worm.data = read.csv("worms.csv", header=T, row.names=1)
head(worm.data)
attach(worm.data)
names(worm.data)

#### plots ####
hist(Worm.density)
boxplot(Worm.density ~ Damp)


#### standard error ####
std.error = function(x) {
  (var(x)/length(x))^0.5
}

std.error(Worm.density)

tapply(Worm.density, Damp, std.error)

#### ci ####
ci95 = function(x) {
  se = (var(x)/length(x))^0.5
  tcrit = qt(0.975, length(x)-1)
  tcrit*se
}
mean(Worm.density)
ci95(Worm.density)
tapply(Worm.density, Damp, mean) 
tapply(Worm.density, Damp, ci95)


#### monte carlo ####
MC.t.test = function (Y, X, reps) {
  
  mwd = tapply(Y, X, mean)
  diff = abs(mwd[1]-mwd[2])
  # reps = 999
  rrdiff = rep(0, reps)
  for (i in 1:reps) {
    r.Y = sample(Y, length(Y))
    rmwd = tapply(r.Y, X, mean)
    rdiff = abs(rmwd[1]-rmwd[2])
    rrdiff[i] = rdiff
  }
  cases = reps - length(which(rrdiff < diff))
  p = (cases + 1)/(reps + 1)
  dat.out = data.frame(p, diff)
  row.names(dat.out) = c("output")
  return(dat.out)
}
MC.t.test(Worm.density, Damp, 1000)

t.test(Soil.pH, Damp)
MC.t.test(Soil.pH, Damp, 1000)
MC.t.test(Soil.pH, Damp, 1000)
MC.t.test(Soil.pH, Damp, 1000)
MC.t.test(Soil.pH, Damp, 1000)
MC.t.test(Soil.pH, Damp, 1000)
boxplot(Soil.pH ~ Damp)

#### cohens d ####
cohens_d <- function(aaa, ggg) {
  groups = levels(as.factor(ggg))
  x = aaa[which(ggg== groups[1])]
  y = aaa[which(ggg== groups[2])]
  
  lx <- length(x)- 1
  ly <- length(y)- 1
  md  <- abs(mean(x) - mean(y))        ## mean difference (numerator)
  csd <- lx * var(x) + ly * var(y)
  csd <- csd/(lx + ly)
  csd <- sqrt(csd)                     ## common sd computation
  
  cd  <- md/csd                        ## cohen's d
  return(cd)
}
cohens_d(Worm.density, Damp)
cohens_d(Soil.pH, Damp)
