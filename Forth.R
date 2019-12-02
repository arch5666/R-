# 2019.12.2

setwd("D:/workR")
df <- read.table(file="airquality.txt", header = T)
df
class(df)
dim(df)
str(df)
head(df,3)
tail(df,3)


install.packages("xlsx")
install.packages("rJava")

library(xlsx)
library(rJava)


df.xlsx <- read.xlsx(file="airquality.xlsx", sheetIndex = 1,
                     encoding="UTF-8")                 # csv factor로 잡히지x, xlsx factor로 잡힘(factor type 아니면 as 함수 자료형 변환)
df.xlsx
class(df.xlsx)
str(df.xlsx)
head(df.xlsx)
tail(df.xlsx)

score <- c(76,84,69,50,95,6,82,71,88,84)
which(score==69)        # 데이터의 위치값
which(score>=85)
min(score)
which.max(score)         # 최대값의 위치 
min(score)
which.min(score)

idx <- which(score>=60)
score[idx] <- 61
score


idx <- which(iris[,1:4]>5.0, arr.ind=TRUE)    # 조건에 만족하는 행/열의 인덱스 값 - 2차원 구조일 때 
idx

idx


# 단일변수 (일변량) 범주형 자료 탐색 
#
favorite <- c("WINTER", " SUMMER", "SPRING",
              "SUMMER", "SUMMER","FALL",
              "FALL",  "SUMMER", "SPRING", " SPRING")

favorite
class(favorite)
table(favorite)
table(favorite)/length(favorite)
ds <- table(favorite)
ds
barplot(ds, main = "favorite season")

































































