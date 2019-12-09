#
# 2019.12.09(월)
#

install.packages("tidyverse")
library(tidyverse)
require(tidyverse)
library(ggplot2)

dim(mpg)
str(mpg)
head(mpg)
View(mpg)
ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ, y=hwy)) # '+'연산자로 함수 연결, 중량 대 고속도로 연비, 산점도 그리는 함수 


month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain) # data.frame
df

ggplot(df,aes(x=month, y=rain))+        # mapping 생략, mapping 위치 ggplot/geom_bar  
  geom_bar(stat="identity", width=0.7, fill="steelblue") # bar 막대그래프



ggplot(df,aes(x=month, y=rain))+
   geom_bar(stat="identity", width=0.7, fill="steelblue")+
 ggtitle("월별 강수량")+           # title 출력
 theme(plot.title=element_text(size=25, face="bold",    #
                              colour="steelblue"))+
labs(x="월", y="강수량") +coord_flip() #x,y label, 그래프를 가로로(coord_flip)


ggplot(iris, aes(x=Petal.Length))+
  geom_histogram(binwidth = 0.5)       # 연속형 데이터의 빈도 확인(히스토그램), 꽃잎의 길이를  0.5단위로 계산
      
                                

# Layer 구조(계층방식, Graphic 처리 ) -> ggplot-> geom_histogram+theme 
ggplot(iris, aes(x=Sepal.Width, fill=Species,
                 color=Species))+
  geom_histogram(binwidth=0.5, position ="dodge")+
                   theme(legend.position = "top") # Species 범주형, color= 경계선의 색깔 , dodge = 품종별로 각각 그려랴 
                                                  # 범례 위치 






