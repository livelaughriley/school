load('discrim.RData')
attach(data)

# Part I
mean(prpblck,
     na.rm=TRUE)
summary(prpblck);summary(income)
summary(cbind(prpblck,income))
sd(prpblck,
   na.rm=TRUE);sd(income,
                  na.rm=TRUE)
sd(income,
   na.rm=TRUE)
sd(prpblck,
   na.rm=TRUE)

# Part II
model.ii<-lm(psoda~prpblck+income)
summary(model.ii)
$$psoda=\beta_0 + \beta_1 prblck+ \beta_2 income +u$$
```{r echo=FALSE}
model.ii<-lm(psoda~prpblck+income)
sumary(model.ii)
```

We can see that the coefficient 'prpblck' is `r round(coef(lm(psoda ~ prpblck + income))[2],3)

# Part III
model.iii<-lm(psoda~prpblck)
summary(model.iii)
