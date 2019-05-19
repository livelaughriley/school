library(tidyverse)
meapsingle<-read.csv('meapsingle.csv')
str(meapsingle)

attach(meapsingle)
q_one_model<-
   lm(math4~pctsgle,
      meapsingle)
summary(q_one_model)
library(tidyverse)
ggplot(meapsingle,
       aes(x=pctsgle,
           y=math4)) +
   geom_smooth()

q_two_model<-
   lm(math4~pctsgle +
         lmedinc +
         free,
      meapsingle)
summary(q_two_model)

par(mfrow=c(2,2))
plot((lm(pctsgle~lmedinc)))
plot((lm(pctsgle~free)))
library(olsrr)
ols_coll_diag(q_two_model)

