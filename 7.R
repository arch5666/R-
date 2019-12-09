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
 theme(plot.title=element_text(size=25, face="bold",    
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



#ggplot2 Scatter chart
ggplot(data= iris, mapping=aes(x=Petal.Length, y=Petal.Width))+
geom_point()       



ggplot(data= iris)+
  geom_point(mapping=aes(x=Petal.Length, y=Petal.Width))  # data, mapping은 필수!    



ggplot(data= iris, mapping=aes(x=Petal.Length, y=Petal.Width,
                               color=Species, shape= Species))+
  geom_point(size=3)+
ggtitle("꽃잎의 길이와 폭")+theme(plot.title = element_text(size=25,
                                                     face="bold", colour = "red"))

# ggplot, Boxplot
ggplot(data=iris, mapping= aes(y=Petal.Length))+
  geom_boxplot(fill="yellow") # 상자수염 그래프 

ggplot(data=iris, mapping= aes(y=Petal.Length,fill=Species))+
  geom_boxplot()            # 품종별로 Boxplot



# ggplot Line chart - timeseries data
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt)
head(df)

ggplot(df, aes(x=year, y=cnt))+
  geom_line(col="red")


#ggplot 작성 graph 꾸미기 (공통)
str(economics)

# 사선 
ggplot(economics, aes(x=date, y=psavert))+
  geom_line()+
  geom_abline(intercept=12.18671, slope= -0.0005444)

#intercept : y절편값, slope : 기울기( 회귀식 계산해서 사용) , 주가지수

# 평행선
ggplot(economics, aes(x=date, y=psavert))+
  geom_line()+
  geom_hline(yintercept = mean(economics$psavert))


#수직선
x_inter <- filter(economics, 
                  psavert==min(economics$psavert))$date
x_inter
ggplot(economics, aes(x=date, y=psavert))+
       geom_line(col="blue")+
       geom_vline(xintercept = x_inter)  # 가장 낮은 값을 갖고 있는 날에 수직선 



# 텍스트 추가 
ggplot(airquality, aes(x=Day, y=Temp))+       #날짜와 온도(온도 출력) 
geom_point()+
geom_text(aes(label=Temp, vjust=0, hjust=0)) # 산점도에서 실제값 함께 표시할 때 
                                             #  hjust, vjust 좌표 


# 영역 지정 및 화살표 표시  
ggplot(mtcars, aes(x=wt, y=mpg))+
  geom_point()+
  annotate("rect", xmin=3, xmax=4,
           ymin=12, ymax=21, alpha=0.5, fill="skyblue") + # 특정 영역에 
                                                         # 모양-사각형(rect), alpha~1 불투명

annotate("segment", x=2.5, xend=3.7, 
         y=10, yend=17, color="red", arrow=arrow()) +     # segment 화살표, xend, yend - 화살표 사이즈 

annotate("text", x=2.5, y=10, label="point")



# treemap- 상자 하나 크기 : 데이터 크기 -> 데이터를 기준에 따라 전체적으로 보여주고자 할 때
install.packages("treemap")
library(treemap)

data(GNI2014)
dim(GNI2014)
str(GNI2014)
head(GNI2014)
View(GNI2014)

treemap(GNI2014, index=c("continent","iso3"),   # 계층구조 (대륙, 국가 )
       vSize="population",                      # 타일크기            
       vColor = "GNI",                          # 타일컬러                
       type="value",                            # 타일 컬러링 방법 
       bg.labels = "yellow",                    # 레이블 배경색
       title = "World's GNI")                   # 제목      
  


st <- data.frame(state.x77)
st <- data.frame(st, stname=rownames(st))
treemap(st,
        index=c("stname"), vSize = "Area", 
        vColor="Income", type= "value",
        title="미국 주별 수입")


# 산점도에 Bubble 추가(Bubble chart)
symbols(st$Illiteracy, st$Murder,              # 원의 x,y좌표
       circles=st$Population, inches=0.3,     # 원의 반지름 
       fg="white", bg="lightgray", lwd=1.5,   # 원 크기 조절값
       xlab="rate of Illiteracy",              # 원의 테두리 색(fg)
       ylab="crime(murder) rate",              # 원의 바탕색(bg)
       main= "Illiteracy and Cri me")         # 원의 테두리선 두께 (lwd)
text(st$Illiteracy, st$Murder, rownames(st),    # 텍스트 출력 x,y좌표
     cex=0.6, col="brown")                       # 출력할 text
                                                # 폰트크기, 폰트 컬러

# https://www.r-graph-gallery.com












































































