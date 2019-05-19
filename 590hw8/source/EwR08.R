library(tidyverse)
library(caret)
library(gmodels)
library(ggplot2)
library(e1071)

setwd("C:/Users/Joshua Bogle/Documents/509Data")

data_raw <- read_csv("wisc_bc_data.csv")
head(data_raw)

data_use <- data_raw %>%
  select(-id)
head(data_use)

data_use <- data_use %>%
  mutate(diag = factor(diagnosis, levels = c("B", "M"), labels = c("Benign", "Malignant"))) %>%
  select(-diagnosis) %>%
  rename(diagnosis = diag)
glimpse(data_use)

data_use %>%
  group_by(diagnosis) %>%
  summarise(n = n()) %>%
  mutate(prop = n/sum(n), pct = prop*100)

# Thus 62.7% of observations are Benign and 37.3% are Malignant.

set.seed(123456)

train_sample <- data_use$diagnosis %>%
  createDataPartition(p = 0.80, list = FALSE)

data_train <- data_use %>%
  slice(train_sample)
data_test <- data_use %>%
  slice(-train_sample)

data_train %>%
  group_by(diagnosis) %>%
  summarize(n=n()) %>%
  mutate(prop = n/sum(n), pct = prop*100)

model <- train(
  diagnosis ~ ., data = data_train, method = "knn",
  trControl = trainControl("cv", number = 10), 
  preProcess = c("center", "scale"),
  tuneLength = 21
)

ggplot(model)

model$bestTune

data_test_pred <- model %>%
  predict(data_test)
head(data_test_pred)

CrossTable(x = data_test$diagnosis, y = data_test_pred)
