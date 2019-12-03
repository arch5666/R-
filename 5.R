# 2019.12.03(화)  시각화 141~169

#### 다중변수 자료 탐색
# 두 변수 사이의 산점도
# 산점도(scatter plot)
#     ㄴ  2변수로 구성된 자료의 분포를
#         알아보는 그래프 관측값들의 분포를 통해
#         2변수 사이의 관계를 파악 


wt <- mtcars$wt ;wt
mpg <- mtcars$mpg ;mpg
plot( wt, mpg, main = "중량-연비 그래프",
      xlab="중량", ylab="연비",
      col= "red", pch=19 )       # pch -> 점 모양 / 0~25까지 쓸 수 있음.

# 현재 그래프는(두 변수 관계는) 음의 상관관계 갖는다.

#graphics -> 그래프 그릴 때 쓰는 함수들, 이미 다운받아져 있음.
# 가끔 업데이트를 눌러서 최신화 시키는게 좋다.



#### 여러 변수들 간의 산점도
mtcars
vars <- c( "mpg", "disp", "drat", "wt" )     # 변수 4개
target <- mtcars[ , vars ]  
target                                             # 2차원 뽑아냄.
head( target )
pairs( target, main= "multi plots" )

# 그래프는 서로 대칭관계라서 이름을 기준으로   x,y 바뀜.
# 사선이 될수록 관계가 높다.
# 가운데로 뭉칠 경우 관계가 없는 경향이 높다.


### 같은 표현 4가지.

wt <- mtcars$wt
mpg <- mtcars$mpg
plot( wt, mpg,
      main = "중량-연비 그래프",
      xlab="중량", ylab="연비",
      col= "red", pch=19 ) 


plot( mtcars$wt, mtcars$mpg,
      main = "중량-연비 그래프",
      xlab="중량", ylab="연비",
      col= "red", pch=19 ) 


plot( mtcars[ , c( "wt", "mpg" ) ], 
      main = "중량-연비 그래프",
      xlab="중량", ylab="연비",
      col= "red", pch=19 ) 


plot( mpg~wt, data= mtcars, 
      main = "중량-연비 그래프",
      xlab="중량", ylab="연비",
      col= "red", pch=19 ) 



#### 그룹 정보가 있는 두 변수의 산점도

# 아이리스 품종이 3개뿐 / 범주형, 
# 꽃잎의 길이와 꽃잎의 폭


iris.2 <- iris[ , 3:4 ]                 # 꽃잎의 길이, 꽃잎의 폭 / 두개의 관계 , 품종은 문자열
point <- as.numeric( iris$Species )     # 품종을 문자열에서 숫자로 바꿈.
point                                   # 품종의 문자열이 숫자로 바뀐 것을 확인.
color <- c( "red", "green", "blue" )
plot( iris.2, main = "Tris plot",
      pch=c( point),                    # pch 점 모양: 각 해당 품종의 숫자에 따라 마킹 모양이 달라짐.
      col= color[ point ] )

# 빨간색점, : 길이 작고 폭 작다.
# 파란색점, : 길이가 길고 폭도 넓다.
# 범주형 데이터의 그룹핑.



# 상관분석
beers <- c(5,2,9,8,3,7,3,5,3,5) # 맥주 잔 수 
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,0.06,0.02,0.05)   # 혈중 알코올 농도 


tb1 <- data.frame(beers, bal);tb1
plot(bal~beers, data=tb1)        # 산점도 -> 상관관계 강하고 약한 정도 = 상관계수 (0.5이상이거나 -0.5이하, 상관관계 강하다)


res <- lm(bal~beers, data=tb1) # 회귀식 도출- 종속변수 = 독립변수*weight+bias (weight, bias 구하는 것 목표) -> 머신러닝의 지도학습
res
abline(res)      # 회귀선 

# 상관분석 - 산점도 -> 회귀식, 회귀선-> 상관분석 
cor(tb1[, 1:2])   # 이변량 상관계수 -> 0.5이상 양의 상관 관계 존재 
cor(iris[,1:4])  # 다변량 상관계수



# 상관분석 순서
#
#1. 상관분석 대상 변수선정
#2. 산점도 작성(관측값 분포 확인) : plot()
#3. 회귀식 도출 : lm()
#    (회귀식 : 두 변수의 선형관계를 가장 잘 나타낼 수 있는 선의 식)
#    (y= xw+b)
#4. 회귀선을 산점도에 표시 : abline()
#   (회귀선 : 관측값들의 추세를 가장 잘 나타낼 수 있는 선)
#5. 상관계수 : cor()
#6. 상관분석 결과 해석


# 시계열 Data - 선 그래프

late <- c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month, late,main = '지각생 통계', type="l", lty=1, lwd=1,     #lty- 선 모양, lwd - 선 두께 
     xlab = 'Month', ylab="late cnt")
plot(month, late, main = '지각생 통계', type="b", lty=1, lwd=1,
     xlab = 'Month', ylab="late cnt")
plot(month, late,  main = '지각생 통계', type="o", lty=1, lwd=1,
     xlab = 'Month', ylab="late cnt")
plot(month, late, main = '지각생 통계', type="s", lty=1, lwd=1,
     xlab = 'Month', ylab="late cnt")


# 복수의 선 그래프 
late1 <- c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month, late1, main = '지각생 통계', type="l", lty=2, lwd=2,col="red",
     xlab = 'Month', ylab="late cnt",ylim=c(1,15))
lines(month, late2, type="b", col="blue")


# 자료 탐색 실습 - 탐색적 데이터 분석
#
# 0단계 : 문제정의
# 1단계 : 분석 대상 데이터셋 준비
#         BostonHousing 데이터셋(mlbench pac.)
#

install.packages("mlbench")
library(mlbench)
data(BostonHousing) 
# crim : 1인당 범죄율
# rm : 주택 1가구당 방수
# dis : 보스턴 5개 지역센터까지의 거리
# tax : 재산세율
# medv : 주택가격 
myds <- BostonHousing [ , c("crim",
                          "rm",
                          "dis",
                          "tax",
                          "medv"
                          )] 
 
class(BostonHousing)
dim(BostonHousing)
str(BostonHousing)
head(BostonHousing)
tail(BostonHousing)

# 2단계 : 파생변수 추가 : grp 변수 추가 (주택가격 상중하)
grp <- c()
for (i in 1:nrow(myds)){
  if(myds$medv[i]>=25.0){
    grp[i]<-'H'
  } else if (myds$medv[i]<=17.0){
    grp[i]<-'L'
  } else {
    grp[i]<-'M'
  }
}
grp <- factor(grp)
grp <- factor(grp, levels=c("H","M","L"))
myds <- data.frame(myds, grp)
head(myds)


# 3단계 : 데이터셋의 형태와 기본적인 내용 파악
str(myds)
head(myds)
table(myds$grp)      # 도수분포표 


# 4단계 : 히스토그램에 의한 관측값의 분포 확인 
par(mfrow=c(2,3))                      # 그려야 할 변수 5개 1:5
for (i in 1:5){ 
  hist(myds[, i],
       main = colnames(myds)[i],
col= 'yellow')
}

par(mfrow=c(1,1))



# 5단계 : 상자그림에 의한 관측값의 분포 확인 - 데이터 분포, 이상치 

par(mfrow=c(2,3))                      # 그려야 할 변수 5개 1:5
for (i in 1:5){ 
  boxplot(myds[, i],
       main = colnames(myds)[i])
}

par(mfrow=c(1,1))



# 6단계 : 그룹별 관측값 분포 확인
boxplot(myds$crim~myds$grp, main='1인당 범죄율')   #~ 뒤에 그룹 성격 데이터, 집값이 싼 지역일수록 범죄율 높다
boxplot(myds$rm~myds$grp, main='방의개수')


#7단계 : 다중 산점도를 통한 변수 간 상관 관계 확인 
pairs(myds[,-6])                                  # rm~ medv 비교적 상관관계 높음



#8단계 : 그룹 정보를 포함한 변수 간 상관 관계 확인
point <- as.integer(myds$grp)
color <- c("red","green","blue")
pairs(myds[,-6], pch = point, col=color[point])


#9단계 : 변수 간 상관계수 확인
cor(myds[,-6])






















































