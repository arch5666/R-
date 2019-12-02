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
which(score==69)
which(score>=85)
min(score)
which.max(score)
min(score)
which.min

idx <- which(score>=60)
score[idx] <- 61
score


idx <- which(iris[,1:4]>5.0, arr.ind=TRUE)
idx










