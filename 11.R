# 2019.12.17(화)
#
# 15일차
#
# 다중선형 회귀모델 : 여러 개의 독립변수를 다루는 회귀모델 -> 연속형 Data에 대한 예측
#
# 회귀식
# y=B0+B1X1+B2X2+B3X3+...BnXn
#
# 독립변수가 n개인 다중선형 회귀에서 주어진 자료를 이용해
# B0,B1,B2,B3,..., Bn의 값을 알아내는 회귀모델

library(tidyverse)
install.packages("tidyverse")
library(car)

str(Prestige)
head(Prestige)

newdata <- Prestige[,c(1:4)]
head(newdata)
plot(newdata, pch=16, col='blue',
     main='Matrix Scatterplot')

model <- lm(income~education+prestige+women,
            data=Prestige)
model
coef(model)

# 회귀식
income=-253.8497+177.1990*(newdata$education)+ 141.4354*(newdata$prestige)+
  -50.8957*(newdata$women)  
fitted(model)
residuals(model)
deviance(model)
deviance(model)/length(newdata$education)   
summary(model)



# 선형 회귀분석 
# 1. Model 결정 -> 2.계수 결정(훈련 data : x,y)(p-value : 가설 검정) -> 
# 3. 예측(Test Data : x)(예측 정확도 확인) -> 4. 실제값으로 예측
# 
# 

newdata2 <- Prestige[,c(1:5)]
newdata2
model2 <- lm(income~., data=newdata2)
summary(model2)

library(MASS)
model3 <- stepAIC(model2)
summary(model3)

# Logistic Regression : 범주형 Data 대한 예측 ex) iris$species - ex) 스팸메일 
# 결과값을 범주형태로 변환하는 과정 필요 
# 변환 방식 : One-hot encoding (0,1형태로 변환)-> sigmoid 함수

# 로지스틱 회귀분석
# 회귀모델에서 종속변수의 값의 형태가 범주형인 경우 예측모델
#  
# 주어진 data로부터 어떤 범주를 예측하는 분야를 회귀와 구분하여 
# 분류(classification)라고 한다.
#
# 로지스틱 회귀도 기본적으로 회귀 기법이기 때문에 종속변수는 숫자로
# 표현되어야 한다. 
# 예) YES와 NO는 0,1로 , setosa, versicolor, virginica는 1,2,3과 같이
# 숫자로 바꾼 후에 로지스틱 회귀 적용
# 지도학습(특성과 레이블 모두 주어짐) - 회귀분석, 로지스틱 분석 

iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species)
head(iris.new)

iris_model <- glm(Species~.,data=iris.new)
iris_model
coef(iris_model)
summary(iris_model)

# 적용시 y값의 형태가 범주형이어야 !!! - 예측 성공률 판별 중요!!!!
unknown <- data.frame(rbind(c(5.1,3.5,1.4,0.2)))
names(unknown) <- names(iris)[1:4]
unknown

pred <- predict(iris_model, unknown)
pred
pred <- round(pred,0)
levels(iris$Species)[pred]


test <- iris[,1:4]

pred <- predict(iris_model)
pred <- round(pred,0)


answer <- as.integer(iris$Species)
pred==answer
acc <- mean(pred==answer)
acc















