
installed.packages("ggplot2")
installed.packages("ggthemes")

library(tidyverse)
library(ggthemes)

line_df <- read_csv("import.csv")
glimpse(line_df)
#head(line_df)

# 라인차트는 group이 필수임 (선을 이어서 긋기 위해)
ggplot(line_df, aes(x=year, y=kg, color=category, group=category)) +
  geom_line(stat = "identity") +
  theme_fivethirtyeight() +
  scale_y_continuous(labels = scales::comma)
# scales::comma - 포맷팅 함수, 커스텀을 원한다면 정의해서 포함

# dollar와 kg을 같이 그리고 싶다면?
line_df2 <- line_df %>%
  gather(category2, value, 3:4)
#str(line_df2)
#tail(line_df2)

ggplot(line_df2, aes(x=year, y=value, color=category2, group=category2)) +
  geom_line(stat = "identity")

# area chart
ggplot(line_df2, aes(x=year, y=value, group=category2, fill=category2)) +
  geom_area(stat = "identity", alpha = .7) +
  scale_y_continuous(labels = scales::comma) +
  theme_woons()

ggplot(line_df2, aes(x=year, y=value, color=category2, group=category2)) +
  geom_bar(stat = "identity", position = "dodge")
