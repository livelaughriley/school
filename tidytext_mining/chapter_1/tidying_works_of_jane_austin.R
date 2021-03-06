library(tidyverse)
library(tidytext)
text<-c("hey",
        "hey hi hello",
        "hey what's UP?",
        "hello there")
text_df<-data_frame(observations=1:4,
                    text=text)
View(text_df)
text_df %>%
   unnest_tokens(word,text)
library(janeaustenr)
library(stringr)
original_books<-austen_books() %>%
   group_by(book) %>%
   mutate(linenumber=row_number(),
          chapter=cumsum(str_detect(text,
                                    regex("^chapter [\\divxlc]",
                                          ignore_case=TRUE))))%>%
   ungroup()
original_books
library(tidytext)
tidy_books<-original_books %>%
   unnest_tokens(word,
                 text)
tidy_books
data("stop_words")
tidy_books<-tidy_books %>%
   anti_join(stop_words)
tidy_books %>%
   count(word,
         sort=TRUE)
freq_words_ggplot<-tidy_books %>%
   count(word,
         sort=TRUE) %>%
   filter(n>600) %>%
   mutate(word=reorder(word,
                       n)) %>%
   ggplot(aes(word,
              n)) +
   geom_col(aes(fill=word)) +
   xlab(NULL) +
   guides(fill="none") +
   coord_flip()
freq_words_ggplot
