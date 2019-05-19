library(tidyverse)
library(tidytext)
library(ggfortify)

data<-read.csv('~/School Projects/590hw3/countymurders.csv')
str(data)
attach(data)

# part I
data %>% View()

count(data,
      murders)

summary(murders==0)
table(murders==0)
length(murders[murders==FALSE])
zero_murders<-length(murders[murders==FALSE])

count(data,
      execs)
length(execs)-length(execs[execs==0])
atleast_one_exec<-length(execs)-length(execs[execs==0])
summary(execrate)
largest_execs<-max(execs)

# part II
mvex_fit<-lm(murders~execs)
mvex_summary<-summary(mvex_fit)
mvex_summary
summary(execs)

# part IV
mvex_fplot<-ggplot(data,
       aes(x=execs,
           y=murders)) +
   geom_point()
mvex_fplot
mvex_fit %>%
   autoplot()
residuals.lm(mvex_fit)
