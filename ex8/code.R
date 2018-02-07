library(tidyverse)

#################################################
# left_join
# right_join
# inner-join
# anti-join
#################################################

cancer <- read_csv("cancer_data.csv") %>% 
  select(-X1)
shp <- read_csv("shp_country.csv") %>% 
  select(-X1)

colnames(shp)[1] <- "name"

# 왼쪽 데이터를 기준으로
left <- left_join(cancer, shp, by = "name")
left %>%
  filter(is.na(value)) %>%
  nrow()

# 오른쪽 데이터를 기준으로
right <- right_join(cancer, shp, by = "name")

# 오직 조건에 서로 맞는 row만 추출
inner <- inner_join(cancer, shp, by = "name")

# 일치하지 않는 row 추출
anti <- anti_join(cancer, shp, by = "name")
anti2 <- anti_join(shp, cancer, by = "name")

# 모두 합쳐버림
full <- full_join(cancer, shp, by = "name")


