#########################################
## 직접해보기
# 1. 데이터 가져오기
df <- read.csv("budongsan.csv", stringsAsFactors = F, fileEncoding = "utf-8")
str(df)
head(df)
lapply(df, is.numeric) #이건 지금 알 필요는 없음


# 2. 컬럼이름 영문으로 변경하기
colnames(df) <- c("gu", "Aug", "Sept", "Oct", "Nov", "Dec")
head(df)

# 3. 숫자로 변환해보기
for (i in 2:6) {
  df[,i] <- str_replace_all(df[,i], "pt", "")
  df[,i] <- as.numeric(df[,i])
}

head(df)

# 4. tidy 데이터로 변환해보기
df.tidy <- gather(df, key = "month", value = "value", Aug:Dec)
head(df.tidy)

# 5. 다시 wide로 변환해보기 (다른 변수에 저장)
spread(df.tidy, month, value)


# 6. tidy 데이터 중 month를 강남구의 11월, 12월만 추출
df.tidy %>% 
  filter(gu == "강남구" & (month == "Nov" | month == "Dec"))


# 7. write.csv로 csv 파일로 저장하기

#########################################
