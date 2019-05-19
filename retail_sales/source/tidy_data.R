# importing retail_sales
library(readxl)
retail_sales <- read_excel("data/retail_sales.xlsx")

retail_sales <-
  retail_sales[-15, ]

adj_retail_sales <-
  retail_sales[c(1,
                 9:13)]

retail_sales <-
  retail_sales[-c(9:13)]

cols <- names(retail_sales[-c(2:3)])

names(adj_retail_sales) <- cols

# observing data
library(tidyverse)
library(reshape2)
melt(retail_sales,
     id) 
