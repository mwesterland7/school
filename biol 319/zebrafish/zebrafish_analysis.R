install.packages('dplyr')
install.packages('outliers')
install.packages("ggpubr")
install.packages('tidyverse')
install.packages('plotrix')
library('outliers')
library('dplyr')
library('ggpubr')
library('tidyverse')
library('plotrix')

fish <- read.csv("as_data_2019.csv")

#### tidying ####
treatment_a <- filter(fish, fish$treatment == "A")
treatment_b <- filter(fish, fish$treatment == "B")
treatment_c <- filter(fish, fish$teatment == "C")

diff_bu <- filter(fish, fish$conditions == "DiffBU")
diff_move <- filter(fish, fish$conditions == "DiffMove")
diff_feed <- filter(fish, fish$conditions == "DiffFeed")

control_bu <- filter(fish, fish$conditions == "ControlBU")
control_move <- filter(fish, fish$conditions == "ControlM")
control_feed <- filter(fish, fish$conditions == "ControlF")

diff_bu$relative_bu <- diff_bu$movement
diff_move$relative_move <- diff_move$movement
diff_feed$relative_feed <- diff_feed$movement

control_bu$relative_bu <- control_bu$movement
control_move$relative_move <- control_move$movement
control_feed$relative_feed <- control_feed$movement

control_bu$control <- control_bu$treatment
control_move$control <- control_move$treatment
control_feed$control <- control_feed$treatment

#### stats ####
control_bu$se <- std.error(control_bu$relative_bu)
control_move$se <- std.error(control_move$relative_move)
control_feed$se <- std.error(control_feed$relative_feed)

diff_bu$se <- std.error(diff_bu$relative_bu)
diff_move$se <- std.error(diff_move$relative_move)
diff_feed$se <- std.error(diff_feed$relative_feed)

manRes1 <- manova(cbind(Y.1, Y.2) ~ IV, data=fish)
summary(manRes1, test="Wilks")

#### graphing ####
ggplot(control_bu, aes(control, relative_bu)) +
  stat_summary(geom = "bar", fun.y = mean, position = "dodge") +
  stat_summary(geom = "errorbar", fun.data = mean_se, position = "dodge")

ggplot(control_move, aes(control, relative_move)) +
  stat_summary(geom = "bar", fun.y = mean, position = "dodge") +
  stat_summary(geom = "errorbar", fun.data = mean_se, position = "dodge")

ggplot(control_feed, aes(control, relative_feed)) +
  stat_summary(geom = "bar", fun.y = mean, position = "dodge") +
  stat_summary(geom = "errorbar", fun.data = mean_se, position = "dodge")

ggplot(diff_bu, aes(treatment, relative_bu)) +
  stat_summary(geom = "bar", fun.y = mean, position = "dodge") +
  stat_summary(geom = "errorbar", fun.data = mean_se, position = "dodge")

ggplot(diff_move, aes(treatment, relative_move)) +
  stat_summary(geom = "bar", fun.y = mean, position = "dodge") +
  stat_summary(geom = "errorbar", fun.data = mean_se, position = "dodge")

ggplot(diff_feed, aes(treatment, relative_feed)) +
  stat_summary(geom = "bar", fun.y = mean, position = "dodge") +
  stat_summary(geom = "errorbar", fun.data = mean_se, position = "dodge")

