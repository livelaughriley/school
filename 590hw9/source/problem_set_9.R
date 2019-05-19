library(tidyverse)
library(tidytext)
library(wordcloud)
library(tm)
library(e1071)
library(gmodels)

sms_raw <- read_csv('~/RStudioProjects/school/590hw9/data/sms_spam.csv')

sms_raw %>%
  slice(1:10)

sms_spam <-
  sms_raw %>%
  filter(type == 'spam')

sms_ham <-
  sms_raw %>%
  filter(type == 'ham')


# Wordcloud

wordcloud(sms_spam$text,
          max.words = 40,
          scale = c(5, 1))
wordcloud(sms_ham$text,
          max.words = 40,
          scale = c(4, 1))


# Text Mine Prep

sms_corpus <- VCorpus(VectorSource(sms_raw$text))
print(sms_corpus)

sms_dtm <-
  DocumentTermMatrix(sms_corpus,
                     control = list(tolower = TRUE,
                                    stopwords = TRUE,
                                    removePunctuation = TRUE,
                                    removeNumbers = TRUE,
                                    stemming = TRUE))

print(sms_dtm)

set.seed(1)

train_set <-
  createDataPartition(y = sms_raw$type,
                      p = 0.8,
                      list = FALSE)

train_dtm <- sms_dtm[train_set, ]
test_dtm <- sms_dtm[-train_set, ]

class_train_sms <- sms_raw[train_set, ]$type
class_test_sms <- sms_raw[-train_set, ]$type

prop.table(table(class_train_sms))
prop.table(table(class_test_sms))

freq_words <- findFreqTerms(sms_dtm, 5)

sms_dtm_train_freq <- train_dtm[ , freq_words]
sms_dtm_test_freq <- test_dtm[ , freq_words]

dim(sms_dtm_train_freq)
dim(sms_dtm_test_freq)

convert_counts <- function(x) {
  x <- ifelse(x > 0, TRUE, FALSE)
}

train_sms <- apply(sms_dtm_train_freq, MARGIN = 2,
                   convert_counts)
test_sms <- apply(sms_dtm_test_freq, MARGIN = 2,
                  convert_counts)

# Model

model <- naiveBayes(train_sms,
                    as.factor(class_train_sms))

model_pred <- predict(model,
                      as.data.frame(test_sms),
                      type = 'class')

CrossTable(model_pred,
           class_test_sms,
           prop.chisq = FALSE,
           prop.t = FALSE,
           prop.r = FALSE,
           dnn = c('predicted',
                   'actual'))
