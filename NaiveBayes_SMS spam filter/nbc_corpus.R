library(tm)
library(gmodels)
library(wordcloud)

nbc_data<-DATA
nbc_raw<-nbc_data %>%
   combine()
