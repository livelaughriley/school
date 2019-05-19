library(tidyverse)
library(tidytext)
library(janeaustenr)
library(stringr)
library(gutenbergr)
data("stop_words")

hgwells<-gutenberg_download(c(35,
                              36,
                              5230,
                              159))
