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

# 단일변수 (일변량) 범주형 자료 탐색 
#
favorite <- c('WINTER', 'SUMMER', 'SPRING',
              'SUMMER', 'SUMMER','FALL',
              'FALL', 'SUMMER', 'SPRING', 'SPRING')

favorite
class(favorite)
table(favorite)
table(favorite)/length(favorite)  # 비율계산
ds <- table(favorite)
ds
barplot(ds, main = "favorite season")

ds.new <- ds[c(2,3,1,4)]
ds.new
barplot(ds.new, main = 'favorite season')


pie(ds, main='favorite season')
pie(ds.new, main='favorite season')

 
# 탐색적 데이터 분석 - 시각화(그래프, 지도)- 범주형이면서 일변량 
favorite.color <- c(2,3,1,1,2,2,1,3,2,1,3,2,1,2)   #1~3사이의 값만 들어가 있음, 범주형 - 도수분포표 활용  
ds <- table(favorite.color); ds
barplot(ds, main = "favorite season")
colors <- c('green', 'red', 'blue')
names(ds) <- colors; ds
barplot(ds,main= 'favorite season',col=colors)  # 연속형x (범주형 - 숫자로 되었다고 해서 연속형이라고 단정x)
pie(ds, main='favorite season', col= colors)    # 색상 부여 


#
# 단일변수 (일변량) 연속형 자료  - vector
# 
weight <- c(60,62,64,65,68,69)
weight.heavy <- c(weight, 120); weight.heavy  # weight.heavy - 하나의 큰 값이 포함, 산술연산 가능한 데이터 Type

#평균                               # 평균의 한계 
mean(weight); mean(weight.heavy)


# 중앙값                            # 중앙값은 둘 다 비슷 
median(weight);median(weight.heavy)


#절사평균                           # 가장낮은, 가장높은 것 제외, 상/하위 20% 제외하여 계산 - 원 데이터 왜곡 방지(평균)             
mean(weight, trim=0.2)
mean(weight.heavy, trim=0.2)


# 사분위수      - 2사분위수 = 중앙값 , 0% - 최솟값, 100%-최댓값 
quantile(weight)
quantile(weight.heavy, (0:10)/10)
summary(weight.heavy)    # 종합적(많이 사용) 

#
#산포(distribution) - 값이 퍼져있는 정도 파악 
#분산
var(weight)             # 분산/표준편차가 작다 -> 평균에 데이터들이 모여 있다(연관성이 있다) 
#표준편차 
sd(weight)
# 값의 범위
range(weight)
#최대값과 최소값의 차이 
diff(range(weight))


# histogram : 연속형 자료의 분포를 시각화
# 연속형 자료에서는 구간을 나누고 구간에 속한 값들의 개수를 세는 방법으로 사용

str(cars)
cars
dist <- cars[ , 2]
hist(dist, main='Histogram for 제동거리', xlab = '제동거리',
      ylab='빈도수', border= 'blue', col= 'green', las=1, breaks=5)  #las = x축 글자 방향 0~3 

summary(dist)

# 상자그림(boxplot, 상자수염그림)
# 사분위수를 시각화하여 그래프 형태로 표시 
# 상자그림은 하나의 그래프로 데이터의 분포 형태를 포함한 다양한 정보를 전달 
# 자료의 전반적인 분포를 이해하는데 도움
# 구체적인 최소/최대/중앙값을 알기는 어려움 

boxplot(dist, main = '자동차 제동거리 ') # 상자안에 대부분 데이터가 모여 있음. 상자가 좁으면 데이터가 특정 값에 모여 있음.
                                         # 최대값 위에 동그라미 - 이상치 1개 -> 추후 이상치 처리 
boxplot.stats(dist)
boxplot.stats(dist)$stats             # 정상범위 사분위수 
boxplot.stats(dist)$n                 # 관측치 개수 
boxplot.stats(dist)$conf              # 중앙값 신뢰구간 
boxplot.stats(dist)&out               # 이상치(특이값) 목록- > list형식



#일변량 중 그룹으로 구성된 자료의 상자그림 
boxplot(Petal.Length~Species, data= iris, main='품종별 꽃잎의 길이 ')



# 한 화면에 여러 그래프 작성
par(mfrow=c(1,3))   # 1x3 가상화면 분할


barplot(table(mtcars$carb), main="c",
        xlab="carburetors", ylab= " freq", col="blue")
barplot(table(mtcars$cyl), main="Cyl",
        xlab="Cyl", ylab= " freq", col="red")
barplot(table(mtcars$gear), main="g",
        xlab="gear", ylab= " freq", col="green")


par(mfrow=c(1,1))  # 가상화면 분할 해제









