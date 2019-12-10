#
# 11일차
#

# mosaic plot
#   다중변수 범주형 데이터에 대한 각 변수의
#   그룹별 비율을 면적으로 표시

str(mtcars)
head(mtcars)
mosaicplot( ~gear + vs,     # 대상 변수(~: x축, +:y축)
            data = mtcars,  # 데이터셋
            color = TRUE,   # y축 변수의 그룹별 음영 다르게 표시
            main = "Gear and Vs" ) # 제목

mosaicplot( ~gear + vs,
            data = mtcars,
            color = c("green", "blue"),
            main = "Gear and Vs")

tbl <- table(mtcars$gear, mtcars$vs)
tbl
mosaicplot(tbl, color = T, main = "Gear and Vs")

#
# 차원 축소(dimension reduction)
#

install.packages("Rtsne")
library(Rtsne)
library(ggplot2)
ds <- iris[,-5]

ds
# 중복 데이터 제거 - 차원 축소를 하려면 중복데이터가 없어야한다.
dup = which(duplicated(ds))
dup
ds <- ds[-dup,]
ds
str(ds)
ds.y <- iris$Species[-dup]
ds.y

# 차원 축소 수행 - t-SNE 실행
tsne <- Rtsne(ds,                # 차원 축소 대상 데이터셋
              dim = 2,           # 축소할 차원 2 or 3차원
              perplexity = 10 )  # 차원 축소 과정에서 데이터 샘플링을 수행하는데
# 샘플의 횟수는 (대상데이터수)/3보다 작게 지정
#  ex) iris에서 중복제거한 149개 중 샘플링,
#      샘플링수는 149/3 보다 작게
tsne

# 차원축소 결과 시각화t-sne
df.tens <- data.frame(tsne$Y)
head(df.tens)

ggplot(df.tens, aes(x= X1, y= X2, color = ds.y))+
  geom_point(size=2)


install.packages( c("rgl", "car") )
library(car)
library(rgl)
library(mgcv)

tsne <- Rtsne(ds, dims = 3, perplexity = 10)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

scatter3d( x= df.tsne$X1, y= df.tsne$X2, z= df.tsne$X3)


points <- as.integer(ds.y)
color <- c('red', 'green', 'blue')
scatter3d( x = df.tsne$X1, y= df.tsne$X2, z=df.tsne$X3,
           point.col = color[points],
           surface = FALSE)





#
# 공간 시각화
#
# google map 사용
#
# 절차
# 1. R 최신버전 설치
# 2. ggplot2 최신버전 설치
# 3. ggmap 설치 ( install.package("ggmap"))
# 4. 구글맵을 사용하기 위한 API key 획득
# 5. 구글맵을 이용한 공간 시각화 수행

library(ggmap)
register_google( key = 'AIzaSyAkl_0mai7HdkePLL2H6ldWSbIXBeEGNkk')

gc <- geocode(enc2utf8("제주"))
#내가 원하는 지점의 위도 경도(data type = tibble)
gc

cen <- as.numeric(gc) #경도/위도 숫자로 변환
cen

# 지도 표시
map <- get_googlemap(center = cen) # 지도 중심점 좌표표
ggmap(map)


gc <- geocode(enc2utf8('한라산'))
gc

cen <- as.numeric(gc)
cen

map <- get_googlemap(center = cen,  #지도 중심점 좌표
                     zoom = 10,     #지도 확대 정도
                     size = c(640,640), #지도 크기
                     maptype = "roadmap") #지도 유형
ggmap(map)


cen <- c(126.561099, 33.253077)
map <- get_googlemap(center = cen,
                     zoom = 15,
                     maptype = "roadmap")
ggmap(map)

# 지도 위 마커 표시
gc <- geocode( enc2utf8("제주"))
cen <- as.numeric(gc)
map <- get_googlemap( center = cen,
                      maptype = "roadmap",
                      markers = gc,
                      zoom = 14)
ggmap(map)

names <- c("용두암","성산일출봉","정방폭포","중문관광단지",
           "한라산 1100고지","차귀도")
addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동흥동 299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동 산1-2",
          "제주시 한경면 고산리 125")
gc <- geocode(enc2utf8(addr))
gc


# 관광지 명칭과 좌표값으로 Data Frame 생성
df <- data.frame(name=names,
                 lon = gc$lon,
                 lat = gc$lat)
df

cen <- c( mean(df$lon), mean(df$lat))

map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 10,
                     size = c(640,640),
                     markers = gc )
ggmap(map)


# 지도에 관광지 이름 추가
gmap <- ggmap(map)
gmap +
  geom_text(data = df,        # 데이터 셋셋
            aes(x=lon, y=lat),# 텍스트 위치
            size=5,           # 텍스트 크기
            label = df$name ) # 텍스트 이름





# 지도에 관광지 이름 추가
gmap <- ggmap(map)             
gmap+
  geom_text(data=df,            # 데이터셋
            aes(x=lon, y=lat),  # 텍스트 위치
            size=5,             # 텍스트 크기
            label=df$name)      # 텍스트 이름


# 지도에 데이터 표시      #spd - 바람의 세기 -> 관측치 값의 바람의 세기를 지도 위에 표시
dim(wind)
str(wind)

sp <- sample(1:nrow(wind), 50)
df <- wind[sp,]
head(df)

cen <- c(mean(df$lon), mean(df$lat))
gc <- data.frame(lon=df$lon, lat=df$lat)
head(gc)

# 지도에 마커 표시
map <- get_googlemap(center=cen,
                     maptype = "roadmap",
                     zoom=6,
                     markers=gc)

ggmap(map)


# 지도에 풍속을 원의 크기로 표시

map <- get_googlemap(center=cen,
                     maptype = "roadmap",
                     zoom=6)

gmap <- ggmap(map)
gmap+
  geom_point(data=df,
             aes(x=lon, y=lat, size=spd),
             alpha=0.5, col="blue")+
  scale_size_continuous(range=c(1,14))  # 원 크기 조절 , alpha 크면 불투명




# 단계 구분도  - treemap과 쓰임새 유사
install.packages("ggiraphExtra")
library(ggiraphExtra)

dim(USArrests)
str(USArrests)
head(USArrests)

library(tibble)
crime <- rownames_to_column(USArrests, var="state")
crime$state <- tolower(crime$state)
str(crime)

library(ggplot2)
install.packages("mapproj")
library(mapproj)

state_map <- map_data("state")
str(state_map)

ggChoropleth(data=crime, aes(fill=Murder,
                             map_id=state),
             map= state_map)



install.packages("devtools")     # 국내 지도 데이터 가져오기
library(devtools)
devtools::install_github("cardiomoon/kormaps2014")
devtools::install_github("cardiomoon/moonBook2")

library(kormaps2014)
library(moonBook2)

str(kormap1)


theme_set(theme_gray(base_family="NanumGothic"))

ggplot(korpop1,aes(map_id=code,fill=총인구_명))+
  geom_map(map=kormap1,colour="black",size=0.1)+
  expand_limits(x=kormap1$long,y=kormap1$lat)+
  scale_fill_gradientn(colours=c('white','orange','red'))+
  ggtitle("2015년도 시도별 인구분포도")+
  coord_map()


areacode1=changeCode(areacode)
areacode1
kormap1=changeCode(kormap1)
kormap1

