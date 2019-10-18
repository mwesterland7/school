#load data in csv form
abby_data <- read.csv('abby_data.csv')

#import used libraries
library('ggplot2')
library('ggpubr')

# ggline(abby_data, x = "time", y = "distance", 
#        add = c("mean_se"), 
#        order = c(1,2,3,4,5,6,7,8,9,10,11),
#        #order = c("Start-0:02:00", "0:02:00-0:04:00",	"0:04:00-0:06:00",	"0:06:00-0:08:00",	"0:08:00-0:10:00",	"0:10:00-0:12:00",	"0:12:00-0:14:00",	"0:14:00-0:16:00",	"0:16:00-0:18:00",	"0:18:00-0:20:00",	"0:20:00-0:22:00",	"0:22:00-0:24:00"),
#        ylab = "Distance Traveled (mm)", xlab = "Time Intervals (min)"
# )

#state column names used for graph and axis titles
plot(type = "o", col = "black", x = abby_data$time, y = abby_data$distance, xlab = "time", ylab ="distance")

#draws rectangle (xmin, ymin, xmax, ymax)
rect(7,0,10,25, col = rgb(0.5,0.5,0.5,1/4))
