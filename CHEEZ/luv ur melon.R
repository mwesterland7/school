### Maggie Script Luv ur GOD DAMN MELON ###

male=male
female=female

male$Sex="Male"
female$Sex="Female"

HeSheData=rbind(male,female)

install.packages("car")
library(car)

### Test Saved as Object ###

SSS_Sum=leveneTest(SSS_sum~Sex, data=HeSheData)
ADHD_Sum=leveneTest(ADHD_sum~Sex, data=HeSheData)
NOMO_Sum=leveneTest(NOMO_sum~Sex, data=HeSheData)
Reliance_Sum=leveneTest(reliance_sum~Sex, data=HeSheData)
MAAS_Avg=leveneTest(MAAS_avg~Sex, data=HeSheData)

### View Object to see Results ###

SSS_Sum
ADHD_Sum
NOMO_Sum
Reliance_Sum
MAAS_Avg

