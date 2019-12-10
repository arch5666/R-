# 2019.12.10(화)
#
# map, 차원 축소

# http://www.rdocumentation.org/packages/vcd/versions/1.4-4/topics/mosaic
#
# 모자익 함수 설명
# 시각화 도구 사용 방법
#
# 범주형이면서 다중 변수에 대해 빈도를 확인 할 때 쓰임



#### mosic plot
##
##    다중변수 범주형 데이터에 대한 각 변수의
##    그룹별 비율을 면적으로 표시


str( mtcars )
head( mtcars )
mosaicplot( ~gear + vs,             # 대상 변수    ~다음 : x축, +다음 : y축
            data = mtcars,          # 데이터셋
            color= TRUE,            # y축 변수의 그룹별 "음영" 다르게 표시
            main = "Gear and Vs" )  # 제목

# x축, y축 다 범주형
# 그룹별 비율을 면적으로 표현



mosaicplot( ~gear + vs, data = mtcars,
            color= c( "green", "blue" ),  # 벡터를 줘서 색상 입히기.
            main = "Grear and Vs" )

tbl <- table( mtcars$gear, mtcars$vs )
tbl
mosaicplot( tbl, color= T, main = "Gear and Vs" )  

# 테이블 함수는 비도체크, 범주형에 많이 씀 (범주 1개)
# 여기선 변수 2개 쓰임.
# 테이블 행이 x축, 열이 y축
# 전체적인 비율을 눈으로 비교 가능.

# 변수 3~4개 이상 사용 -> 3, 4차원 이상 [차원 올라갈수록 인지 어렵]
# 가장 인지하기 좋은 차원은 2,3 차원( 특히 2차원 의주로 본다 )

## 필요한 것은 차원 축소 (분석 가능한 차원으로 축소)
## 단 축소하면 데이터 손실이 생기는 단점이 있다.
## 그러나 데이터 손실이 있음에도 분석할 수 있는게 더 낫다.



# 차원 축소 기법 => t-sne 기법


#
# 차원 축소( dimension reduction )
#

install.packages( "Rtsne" )

library( Rtsne )
library( ggplot2 )

ds <- iris[ , -5 ]  
ds                  # 지금 변수4개, 4차원 상태

# 
# 차원 축소 할려면 "중복 데이터 제거"
#

dup= which( duplicated( ds ) )
dup  # 중복 데이터 확인 

ds <- ds[ -dup, ]  # 중복 데이터 자체 제거.
ds.y <- iris$Species[ -dup ]  #중복된 위치(데이터)의 품종까지 제거.


#
# 차원 축소 수행 " t-SNE "
#

tsne <- Rtsne( ds, # 차원 축소 대상 데이터셋
               dim= 2, # 축소할 차원 / 2 or 3 차원
               perplexity= 10 ) 
# 차원 축소 과정에서 데이터 샘플링을 수행하는데
# 샘플의 갯수
# '대상 데이터수' / 3 보다 작게 지정
# 즉 여기선 149 / 3 값 보다 작은 범위로 설정 (149는 중복 제거된 수)

# 3차원에서 그림 못그리고 파악 못한다면 데이터 손실이 되더라도
# 2차원으로 축소하여  분석이 된다면 수행하자. 


# 조금씩 나눠서 차원 축소해야 덜 손해 (그래서 내부적으로 샘플링 함)

tsne <- Rtsne( ds, dim= 2, perplexity= 10 )


# 차원축소 결과 시각화

df.tens <- data.frame( tsne$Y )
head( df.tens )

ggplot( df.tens, aes( x= X1, y= X2, color= ds.y ) ) +
  geom_point( size= 2 )





































































