setwd("~/School Projects/590hw1")
load("~/School Projects/590hw1/alcohol.RData")

#### part (i)
q_one_abuserate<-prop.table(table(data$abuse))
q_one_employrate<-prop.table(table(data$employ))
q_one_employrate
 # The amount of men abusing alcohol is ~10%. The employment rate 
 # for all men is ~89.8%.

#### part (ii)
q_two_employ_abuse_rate<-prop.table(table(data$employ[data$abuse==1]))
q_two_employ_abuse_rate
 # The employment rate for men abusing alcoholis 8~7.2%.

#### part (iii)
q_three_nonabuseemprate<-prop.table(table(data$employ[data$abuse==0]))
q_three_nonabuseemprate

 # The employment rate for men who do not abuse alcohol is ~91%.
 # Differences between men abusing alcohol and those not abusing alcohol
 # seem to make a difference based on the employment rates of men abusing alcohol,  # 87.3%, to men who are not abusing, 91%. 
 # However, further analysis on the significance of the alcohol
 # abuse compared to the other variables is necessary prior to making
 # conclusions. The overall employment rate of 89.8% suggests that alcohol abuse    # may result in difficulties when searching for employment.
source('~/.active-rstudio-document',
       echo=TRUE,
       max.deparse.length=1e3)
