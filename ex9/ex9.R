install.packages( "ggtheme") 
library(ggthemes)


install.packages( c("ggplot2", "gcookbook")) 
library(ggplot2) 
library(gcookbook)

plot(mtcars$wt, mtcars$mpg) #기본 내장 함수를 활용


qplot(mtcars$wt, mtcars$mpg) #ggplot2의 qplot() 활용
# 다른형태로 사용하면...
qplot(wt, mpg, data = mtcars) 

# aes : mapping X, Y
head(mtcars)

ggplot(mtcars, aes(x=wt, y=mpg, color= as.character(cyl))) + geom_point() + ggtitle("오늘 실습 : 시각화") + xlim(0, 10)


ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point(size = 2)


ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + geom_bar(stat = "identity", position = 'dodge')

ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat = "identity", fill = "lightblue", colour="black")

head(iris)
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point(size = 3) + xlim(0, 10) + ylim(0,10) + ggthemes::

