cockroach <- read.csv('BIOL 319 Cockroach Leg Data.csv')

library(dplyr)

####CLEANUP####
group <- group_by(cockroach, Condition) %>%
  summarise(
    count = n(),
    mean = mean(Spikes.Sec, na.rm = TRUE),
    sd = sd(Spikes.Sec, na.rm = TRUE)
)

fast <- filter(cockroach, Condition == "Fast")
slow <- filter(cockroach, Condition == "Slow")
down <- filter(cockroach, Condition == "Down")
up <- filter(cockroach, Condition == "Up")
full <- filter(cockroach, Condition == "Full")
half <- filter(cockroach, Condition == "Half")
two <- filter(cockroach, Condition == "Two")

fast_slow <- filter(cockroach, Condition == "Fast" | Condition == "Slow")
full_half <- filter(cockroach, Condition == "Full" | Condition == "Half")
up_down <- filter(cockroach, Condition == "Up" | Condition == "Down")
full_two <- filter(cockroach, Condition == "Full" | Condition == "Two")
full_fast_long <- filter(cockroach, Condition == "Full" | Condition == "Fast" | Condition == "Long")



####STATS####
t.test(fast$Spikes.Sec, slow$Spikes.Sec)
t.test(full$Spikes.Sec, half$Spikes.Sec)
t.test(down$Spikes.Sec, up$Spikes.Sec)
t.test(full$Spikes.Sec, two$Spikes.Sec)

####PLOTS####
ggplot(data=full_half, aes(x=full_half$Condition, y=full_half$Spikes.Sec)) + stat_summary(fun.y = mean, geom = "bar") + stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.3) + labs(x = "condition", y = "spikes per sec")

ggplot(data=up_down, aes(x=up_down$Condition, y=up_down$Spikes.Sec)) + stat_summary(fun.y = mean, geom = "bar") + stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.3) + labs(x = "condition", y = "spikes per sec")

ggplot(data=fast_slow, aes(x=fast_slow$Condition, y=fast_slow$Spikes.Sec)) + stat_summary(fun.y = mean, geom = "bar") + stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.3) + labs(x = "condition", y = "spikes per sec")

ggplot(data=two, aes(x=two$Experiement, y=two$Spikes.Sec)) + stat_summary(fun.y = mean, geom = "bar") + stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.3) + labs(x = "condition", y = "spikes per sec")

ggplot(data=cockroach, aes(x=cockroach$Condition, y=cockroach$Spikes.Sec)) + stat_summary(fun.y = mean, geom = "bar") + stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.3) + labs(x = "cockroach$Condition", y = "cockroach$Spikes.Sec")

ggplot(data=full_two, aes(x=full_two$Condition, y=full_two$Spikes.Sec)) + stat_summary(fun.y = mean, geom = "bar") + stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.3) + labs(x = "cockroach$Condition", y = "cockroach$Spikes.Sec")

ggplot(data=full_fast_long, aes(x=full_fast_long$Condition, y=full_fast_long$Spikes.Sec)) + stat_summary(fun.y = mean, geom = "bar") + stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.3) + labs(x = "cockroach$Condition", y = "cockroach$Spikes.Sec")
