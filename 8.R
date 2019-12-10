#
# 11일차
#
# mosaic plot
#     다중변수 범주형 데이터에 대한 각 변수의
#     그룹별 비율을 면적으로 표시
# 2개이상의 범주형 데이터의 비율을 범위로 확인할때

str( mtcars )
head( mtcars )
mosaicplot( ~gear + vs,  # 대상 변수
            data = mtcars, # 데이터셋
            color= TRUE, # y축 변수의 그룹별 음영다르게표시
            main = "Gear and Vs" ) # 제목

mosaicplot( ~gear + vs, data = mtcars, 
            color = c( "green", "blue" ),
            main = "Gear and Vs")

 
tbl <- table ( mtcars$gear, mtcars$vs ) # 테이블에 인수 2개써서 표를 만들었다
tbl
mosaicplot( tbl, color = T, main = "Gear and Vs",
            xlab="gear",ylab="vs")


#
# 차원 축소 ( dimension reduction )
#
install.packages( "Rtsne" )

library ( Rtsne )
library ( tidyverse )

ds <- iris[ , -5 ]

# 차원 축소
# 중복 데이터 제거
dup = which( duplicated( ds ) ) # 중복데이터 위치 찾기
dup                             # 143에 중복데이터
ds <- ds[-dup,]
ds.y <- iris$Species[ -dup ]

# 차원 축소 수행 - t-SNE 실행
tsne <- Rtsne( ds,  #차원 축소 대상 데이터셋 
               dim = 2, # 축소할 차원 2 / 3 차원
               perplexity = 10 ) # 차원 축소 과정에서
                                 # 데이터 샘플링을 수행하는데 샘플의 개수
                                 # (대상 데이터수) / 3 보다 작게지정
tsne


# 차원축소 결과 시각화
df.tens <- data.frame(tsne$Y)
head ( df.tens )

ggplot ( df.tens, aes ( x = X1, y = X2, color = ds.y ) ) +
  geom_point( size = 2)


install.packages( c ( "rgl", "car" ) )
library( car )
library( rgl )
library( mgcv )

tsne <- Rtsne( ds, dims = 3, perplexity = 10 )
df.tsne <- data.frame( tsne$Y )
head( df.tsne )

scatter3d( x = df.tsne$X1, y = df.tsne$X2, z = df.tsne$X3)

point <- as.integer( ds.y )
color <- c( "red", "green", "blue" )
scatter3d( x = df.tsne$X1, y = df.tsne$X2,
           z = df.tsne$X3,
           point.col = color[ points ],
           surface = FALSE)



