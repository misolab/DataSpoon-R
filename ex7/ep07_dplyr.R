# load library tidyverse
library(tidyverse)

# read.csv가 아닌 readr 패키지 중 read_csv로 활용. factor로 변환시키지 않음
sample_df <- read_csv("csv1.csv")
colnames(sample_df)[1] <- "no"
summary(sample_df)

head(sample_df)

###########################################
# dplyr에서 select
# 필요없는 첫번째 열을 제거
###########################################
sample_df <- sample_df %>%
  as.tibble() %>% 
  select(-no, -code)
head(sample_df)

ex1_df <- sample_df %>%
  select(school_name, public)
head(ex1_df)


###########################################
# dplyr에서 filter
# 강남권에서 공립 중학교만 추출
###########################################
public <- sample_df %>% 
  as.tibble() %>% 
  filter(category == "강남권" & public == "공립")
head(public)

public_gangnam <- public %>%
  as.tibble() %>% 
  filter(gu %in% c("서울특별시 송파구", "서울특별시 강남구", "서울특별시 서초구")) %>%
  select(school_name)
head(public_gangnam)

###########################################
# dplyr에서 arrange
###########################################
sample_df %>% 
  as.tibble() %>% 
  arrange(value)

sample_df %>%
  as.tibble() %>% 
  arrange(desc(value))

sample_df %>% 
  as.tibble() %>% 
  arrange(category, desc(value))

###########################################
# dplyr에서 mutate
###########################################
sample_df %>% 
  as.tibble() %>% 
  mutate(message = paste0(school_name, "의 순유입은 ", value, "명 입니다")) %>% View()

sample_df %>% 
  as.tibble() %>% 
  mutate(avg = round((value / sum(value))*100, 2))

sample_df %>% 
  as.tibble() %>% 
  mutate(avg = paste0(round((value / sum(value))*100, 2), "%"))

###########################################
# dplyr에서 group_by & summarise
###########################################
sample_df %>%
  as.tibble() %>% 
  group_by(category) %>% 
  summarise(total = sum(value))

sample_df %>% 
  as.tibble() %>% 
  group_by(category) %>% 
  summarise(count = n())

sample_df %>% 
  as.tibble() %>% 
  group_by(category, public) %>% 
  summarise(count = n())


sample_df %>%
  group_by(gu) %>% 
  summarise(total = sum(value)) %>% 
  arrange(desc(total))

sample_df %>%
  as.tibble %>% 
  group_by(category, public) %>% 
  summarise(total = sum(value))

#######################################################################
## 실습을 해봅시다!
# iris 데이터로 실습
head(iris)

# 1. Sepal(꽃받침)과 관련있는 column을 추출해서 df_Sepal 변수에 저장
df_Seapl <-iris
iris %>%
  select(Sepal.Length, Sepal.Width, Petal.Width, Species)
head(df_Seapl)

# 2. Sepal.Length와 Petal.Length 모두 1.5 이상만 추출
df_Seapl %>%
  filter(Sepal.Length > 1.5 & Petal.Length > 1.5)

# 3. Species(종)과 Petal.Width 순으로 내림차순 정렬
df_Seapl %>%
  arrange(Species, desc(Petal.Width))

# 4. 새롭게 text 칼럼을 생성하고 Sepal.Length값을 활용해서 
#    "꽃받침 너비는 00입니다"라고 새롭게 만들어주세요
df_Seapl %>%
  mutate(text = paste0("꽃받침 너비 ", Sepal.Length, "입니다"))

# 5. Species별 Sepal.Width의 평균값을 만들어보세요
df_Seapl %>%
  group_by(Species) %>%
  summarise(평균 = mean(Sepal.Width)) %>%
  arrange(평균)
  
#######################################################################
