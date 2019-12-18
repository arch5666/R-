# 2019.12.18(수)
#
# 16일차
#
# 군집화(clustering) / 분류(classification)
#
# 군집화(clustering) : 주어진 대상 데이터들을
# 유사성이 높은 것끼리 묶어주는 기술
#  (군집, 범주, 그룹)
# k-means 군집화 알고리즘

mydata <- iris[,1:4]   
fit <- kmeans(x=mydata, center=3)
fit

# ---------------------------------------------------------------------------------

# K-means clustering with 3 clusters of sizes 50, 38, 62

#Cluster means: 군집의 중심 좌표
#  Sepal.Length Sepal.Width Petal.Length Petal.Width
#1     5.006000    3.428000     1.462000    0.246000
#2     6.850000    3.073684     5.742105    2.071053
#3     5.901613    2.748387     4.393548    1.433871

#Clustering vector: 각 데이터에 대한 군집번호 
#  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#[42] 1 1 1 1 1 1 1 1 1 3 3 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 3 3 3 3
#[83] 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 2 3 2 2 2 2 3 2 2 2 2 2 2 3 3 2 2 2 2 3 2 3 2
#[124] 3 2 2 3 3 2 2 2 2 2 3 2 2 2 2 3 2 2 2 3 2 2 2 3 2 2 3

#Within cluster sum of squares by cluster:
#  [1] 15.15100 23.87947 39.82097
#(between_SS / total_SS =  88.4 %)

#Available components:

  
#  [1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss"
#[6] "betweenss"    "size"         "iter"         "ifault"      

#----------------------------------------------------------------------------------

fit$cluster
fit$centers

library(cluster)   # 차원 축소 후 군집 시각화 패캐지 
clusplot(mydata,       # 군집대상
         fit$cluster, # 군집번호
         color=TRUE,  # 원의 색
         shade=TRUE,  # 원의 빗금 표시 유무
         labels = 1, # 관측값 출력 유무
         lines=1)   # 중심점 연결 표시

subset(mydata, fit$cluster==2)

# -------------------------------------------------------------------------------

# 대상 데이터 표준화 후 군집화
#
# 데이터와 데이터의 거리를 계산할 때 발생하는 문제
#  모든 변수가 거리 계산에 동등한 영향을 갖도록
# 하기 위해서 모든 변수의 자료 범위를 0~1 사이로
# 표준화한 후 거리 계산을 한다.
#
# (x-min(A))/(max( A)-min(A))
# x : 변수 A의 임의의 관측값
# max(A), min(A)는 변수 A의 관측값 중 최대 /최소값
# ex> 키와 시력(서로 단위가 다름)
# -----------------------------------------------------------------------------------
std <- function(x) {
  return((x-min(x))/(max(x)-min(x)))
}
mydata <- apply(iris[,1:4],2,std)
fit <- kmeans(x=mydata, center=3)
fit

# 군집화 : 그룹정보가 없는 data의 그룹을 알아내는 모델
# 분류 : 특정 data가 어떤 그룹에 속하는지 알아내는 모델
# KNN(K-Nearest Neighbor) : 분류 알고리즘


















