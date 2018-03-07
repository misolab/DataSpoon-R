
install.packages("wordcloud")
# 한국어 자연어 추가
install.packages("KoNLP")
install.packages("rJava")

library(wordcloud)
library(KoNLP) 
library(tidyverse)

Sys.setenv(JAVA_HOME='/usr/bin/java')
useSejongDic()

park <- read_lines("park.utf8.txt")

park <- sapply(park, extractNoun, USE.NAMES = F)

park <- unlist(park)

park <- Filter(function(x) {nchar(x) >= 2}, park)
park <- Filter(function(x) {nchar(x) < 7}, park)

park

park <- gsub("으로부터", "", park)
park <- gsub("하다고", "", park)
park <- gsub("하면서", "", park)
park <- gsub("하였다", "", park)
park <- gsub("\\d+", "", park)
park <- gsub("\\(", "", park)
park <- gsub("\\)", "", park)
park <- gsub('"', "", park)
park <- gsub("[A-Za-z]", "", park)
park <- gsub("^", "", park)
park <- gsub("해서", "", park)
park <- gsub("하게", "", park)
park <- gsub("였다", "", park)
park <- gsub("다”", "", park)
park <- gsub(",", "", park)

park <- gsub("에는", "", park)
park <- gsub("쏘고", "", park)
park <- gsub("에만", "", park)
park <- gsub("이지", "", park)
park <- gsub("○", "", park)
park <- gsub("은", "", park)
park <- gsub("는", "", park)
park <- gsub("하였", "", park)
park <- gsub("에게", "", park)
park <- gsub("\\.", "", park)
park <- gsub("\\’", "", park)
park <- gsub("’", "", park)
park <- gsub("으로", "", park)
park <- gsub("하다", "", park)
park <- gsub("에서", "", park)
park <- gsub("를", "", park)
park <- gsub("을", "", park)
park <- gsub("로서", "", park)
park <- gsub("라고한다에", "", park)
park <- gsub("들이", "", park)
park <- gsub("“", "", park)
park <- gsub("‘", "", park)
park <- gsub(";", "", park)
park <- gsub('\\"', "", park)


park <- str_replace_all(park, "더블루케이가", "더블루케이")
park <- str_replace_all(park, "더블루케이와", "더블루케이")
park <- str_replace_all(park, "더블루케이에", "더블루케이")
park <- str_replace_all(park, "대통령의", "대통령")
park <- str_replace_all(park, "관련하", "관련")


park <- Filter(function(x) {nchar(x) >= 2}, park)
park <- Filter(function(x) {nchar(x) < 6}, park)
write(unlist(park), "park20.txt")

park20 <- read.table("park20.txt")
wordcount_society <- table(park20)
wordcount_society

# 
# wordcount_society2 <- as.data.frame(wordcount_society)
# wordcount_society2 <- wordcount_society %>% 
#   filter(Freq > 4)
# write.csv(wordcount_society2, "society_count.csv")
# 
# library(RColorBrewer)
# par(family = "NanumGothic")
# wordcount_society
# 
# palete <- brewer.pal(9, "Set1")
wordcloud(names(wordcount_society), freq = wordcount_society, scale = c(5,1), rot.per = 0, 
          min.freq = 1, random.order=F, random.color=T, colors="#323232", family="AppleGothic")


