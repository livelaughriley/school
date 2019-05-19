setwd("~/School Projects/590hw2")
attach(data)
library(outliers)
View(data)
summary(gift)

  ## part (i)
one_avegift<-mean(gift)
q_one_gaveno_gift<-length(gift[gift==0])/length(gift)
q_one_gaveno_gift*100
q_one_gaveno_gift
table(respond)
prop.table(table(respond))
prop.table(table(data$gift[gift>=1]))

  # part (ii)
q_two_mailsyear<-summary(mailsyear)
q_two_mailsyear
  ## part (iii)
library(tidyverse)
lm(gift~mailsyear,data)
q_three_lm_model<-lm(gift~mailsyear,data)
summary(q_three_lm_model)
summary(gift)
summary(giftlast)

  ## part (iv)
sum(data$mailsyear)
sum(data$gift)
earnings_from_gifts<-sum(data$gift)-sum(data$mailsyear)
earnings_from_gifts
mean(data$gift)
mean(data$mailsyear)
avg_earnings_from_gifts<-mean(data$gift)-mean(data$mailsyear)
avg_earnings_from_gifts
# From the difference between the total gifts and the total mails per year we observe that the charity makes a net gain of $23025.5 per year. Also, on average, the charity makes $5.39 per mailing sent. However, this includes the outliers in the data, so the regression coefficient in part (iii) of 2.65 more accurately represents the earnings per mail sent. The following equation highlights the accuracy of the coefficient as opposed to the mean difference...                                                                                                                             regression coeff: 2.6495*sum(mailsyear)=2.6495*8747.5=23176.50            mean diff: mean(data$gift)-mean(data$mailsyear)=5.39                                                                                             To better understand the coefficient from the regresssion, increasing the mailing by 0.25 unit increases the gift by ~2.65 gift units, which can be read as "By sending one quarter unit of mail, we will make a return of    $2.65.

  ## part (v)
# From the mailsyear column, we observe that mailing units increase by    0.25 mailsyear units. From this analysis, we can assume that by going from 0 to 0.25 mailsyear units, the charities smallest predictable contribution is 0.662375, or $0.66. This comes from the equation...                                                                                                  min_cont=0.25*2.6495=0.662375                                                                                                                   Since the intercept is above zero without any interference, predicting zero would not be a possible occurence through by analyzing the regression coefficient.

min_cont<-0.25*2.6495
min_cont



