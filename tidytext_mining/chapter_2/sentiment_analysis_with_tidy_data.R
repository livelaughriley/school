library(tidytext)
library(janeaustenr)
library(dplyr)
library(stringr)
library(tidyverse)

sentiments

get_sentiments('afinn')
get_sentiments('bing')
get_sentiments('nrc')

tidy_books <- austen_books() %>%
  group_by(book) %>%
  mutate(linenumber = row_number(),
         chapter = cumsum(str_detect(
           text,
           regex('^chapter [\\divslc]',
                 ignore_case = TRUE)
         ))) %>%
  ungroup() %>%
  unnest_tokens(word,
                text)

nrcjoy <- get_sentiments('nrc') %>%
  filter(sentiment == 'joy')
tidy_books %>%
  filter(book == 'Emma') %>%
  inner_join(nrcjoy) %>%
  count(word,
        sort = TRUE)
janeaustinsentiment <- tidy_books %>%
  inner_join(get_sentiments('bing')) %>%
  count(book,
        index = linenumber %/% 80,
        sentiment) %>%
  spread(sentiment,
         n,
         fill = 0) %>%
  mutate(sentiment = positive - negative)

ggplot(janeaustinsentiment,
       aes(index,
           sentiment,
           fill = book)) +
  geom_col(show.legend = FALSE) +
  facet_wrap( ~ book,
              ncol = 2,
              scales = 'free_x')
tidy_books %>%
  count(linenumber,
        sort = TRUE)
