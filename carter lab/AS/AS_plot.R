#load data in csv form
abby_data <- read.csv('abby_data.csv')

#import used libraries
library('ggplot2')
library('ggpubr')

#state column names used for graph and axis titles
plot(type = "o", col = "black", x = abby_data$time, y = abby_data$distance, xlab = "time", ylab ="distance")

#draws rectangle (xmin, ymin, xmax, ymax)
rect(7,0,10,25, col = rgb(0.5,0.5,0.5,1/4))
