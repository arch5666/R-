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
 ggtitle("월별 강수량")+
 theme(plot.title=element_text(size=25, face="bold",
                              colour="steelblue"))+
labs(x="월", y="강수량")+coord_flip()


