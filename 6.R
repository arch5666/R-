# 2019.12.4(수)
#  
# Data Preprocessing (결측치, 이상치)
# 
# 결측치 처리
# vector 결측치 처리


z <- c(1, 2, 3, NA, 5, NA, 8)       
sum(z)
is.na(z)               # 결측치 여부 확인하는 함수 (벡터형, 결과값은 논리값)
sum(is.na(z))          # Iterator 내장 - 자동 반복 기능 -> 결측치 수 판단 
sum(z, na.rm=TRUE)    # 결측치 제거 유무 결정 =>  na.rm =TRUE(결측치 제외하여 합계 구하라)



# 결측치 대체 및 제거
z1 <- z
z2 <- c(5,8,1,NA,3,NA, 7)
z1[is.na(z1)] <- 0      # 단순 대입법 (): 연산자 먼저 수행시, 함수의 인수 전달/ []벡터나 행렬의 데이터프레임의 요소 (원소) 지정할 때 
z1                      # (), []동순위이면 결합성 , 결측치만 포함된 인덱스만 0으로 대체 
# Listwise deletion - 삭제 
z3 <- as.vector(na.omit(z2))   # 결측치가 포함된 데이터 삭제 / 무조건 지워야 하는가 고민 후 결정 
z3



# Matrix/Data Frame 결측치 처리
x <- iris
x[ 1, 2] <- NA
x[ 1, 3] <- NA
x[ 2, 3] <- NA
x[ 3, 4] <- NA

head(x)

# Matrix/Data Frame 열(변수) 별 결측치 확인
# for문 이용 - 반복문 

for (i in 1:ncol(x)){                 # 반복회수 열의 수(변수 개수) - 5번 반복 
  this.na <- is.na(x[,i])             # 변수 지정 (각 변수는 벡터이다.)
cat(colnames(x)[i],                   # 어느 변수에 결측치가 있는지 출력 
    "\t",sum(this.na),
    "\n")
}


# apply() 이용 - 많이 이용  - 함수 : 반복 1회차에 실행 (반복 1번 할 때 하는 동작)
col_na <- function(y){
  return(sum(is.na(y)))            # 논리값의 벡터로  return
}

na_count <- apply(x,2,col_na)
na_count

na_count <- apply(x,2, 
  function(y) sum(is.na(y)))       # 익명 함수, 많이 사용  
na_count


barplot(na_count[ na_count>0 ]) 
install.packages("VIM")
require(VIM)         # library와 같은 역할 


# 결측치 자료 조합 확인용 시각화 도구      # 머신러닝 수행시 결측치 처리 매우 중요- 학습률과 직결 
aggr(x,prop=FALSE, numbers=TRUE)          # 147이 결측치가 없는 데이터 개수 


# 두 개의 변수간의 결측치 관계 확인 시각화 도구 - 빨간점이 결측치, 두 변수 관계 -> 어떤 방법으로 결측치를 처리?
marginplot(x[c("Sepal.Width","Sepal.Length")], pch=20, col= c("darkgray", "red", "blue"))


# Matrix/Data. Frame의 행(data)별 결측치 확인
rowSums(is.na(x))
sum(rowSums(is.na(x))>0)

sum(is.na(x))


# 결측치 제외한 새로운 데이터셋 생성
head(x)
x[ !complete.cases(x), ]  # NA가 포함된 행출력
y <- x[ complete.cases(x), ]
head(y)


# 이상치 (outlier)
# 1. 논리적으로 성립되지 않는 값 
# 2. 상식적으로 용인되지 않는값
# boxplot.stats 이걸 쓰든가 summary를 써야됨

# 특이값 , 이상치 (outlier)
st <- data.frame(state.x77)
summary(st$Income)
boxplot(st$Income)
boxplot.stats(st$Income)$out



# 특이값 처리 %in% 이건 포함되어있다면! 
# 데이터 정제!
out.val <- boxplot.stats(st$Income)$out
st$Income[st$Income %in% out.val] <- NA
head(st)
newdata <- st[ complete.cases(st), ]
head(newdata)

boxplot(newdata$Income)

#
#
# 데이터 가공
#
# 데이터 정렬
# Vector 정렬
# 
# sort 는 간단하게 순서 벡터할때
# order는 명확하게 순서 정할때
# split는 내부적으로 같은거끼리 분류할때

v1 <- c(1,7,6,8,4,2,3)
order(v1)
v1 <- sort(v1)
v1
v2 <- sort(v1, decreasing = T)
v2

# Matrix/ Data frame 정렬
iris
head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length),] # Ascending
iris[order(iris$Sepal.Length,decreasing = T), ]
iris.new <- iris[order(iris$Sepal.Length), ]
head(iris.new)
iris[order(iris$Species, decreasing = T,
           iris$Sepal.Length), ] # 정렬기준을 2개설정




# 데이터 분리
sp <- split(iris, iris$Species)
sp
summary(sp)
summary(sp$setosa)
sp$setosa



# 데이터 선택
subset(iris, Species == 'setosa')
subset(iris, Sepal.Length > 7.5)
subset(iris, Sepal.Length > 5.1 & Sepal.Width>3.9)
subset(iris, Sepal.Length > 7.6,
       select = c(Petal.Length, Petal.Width))


# 데이터 Sampling
# 숫자를 임의로 추출 (vector)
# sample(x, size = 10, replace =  FALSE) // 10개씩 추출 replace 는 비복원은 False 뽑은건 안뽑는다.

x <- 1:100
y <- sample(x, size = 10, replace =  FALSE)
y

# 행을 임의로 추출
idx <- sample( 1:nrow(iris), size = 50, replace = F)
iris.50 <- iris[idx,]
dim(iris.50)
head(iris.50)


sample(1:20, size = 5)
sample(1:20, size = 5)
sample(1:20, size = 5)

set.seed(16)
sample(1:20, size = 5)

set.seed(100)
sample(1:20, size = 5)

set.seed(100)
sample(1:20, size = 5)




# 데이터조합
combn(1:5, 3)

x=c("red", "green", "blue", "black","white ")
com <- combn(x,2)
com

for (i in 1:ncol(com)){
  cat(com[,i], "\n")
}


# 데이터 집계
agg <- aggregate(iris[,-5],                 # (집계대상, 집계기준, 수행할 동작)
                 by=list(iris$Species),
                 FUN=mean)
agg




agg <- aggregate(iris[,-5],                 # (집계대상, 집계기준, 수행할 동작)
                 by=list(iris$Species),     
                 FUN=sd)
agg



head(mtcars)
agg <- aggregate(mtcars,                 # (집계대상, 집계기준, 수행할 동작)
                 by=list(cyl=mtcars$cyl, vs=mtcars$vs),      # 그룹핑->#cyl - 3종류 * vs -2종류 = 6종류
                 FUN=max)
agg



# 데이터 병합 -> 데이터를 여기저기 불러왔을 때 병합 
x <- data.frame(name=c("a","b","c"),
                mat=c(90,80,40))

y <- data.frame(name=c("a","b","d"),
                korean= c(75,60,90))    # name 변수 안에 공통된 부분만 병합 
z <- merge(x,y, by=c("name"))     
z

merge(x,y)
merge(x,y,all.x=T)    # 병합 기준 x
merge(x,y, all.y=T)
merge(x,y, all=T)     # 단순 통합, 변수도 데이터도 둘 다 추가 


x <- data.frame(name=c("a","b","c"),
                mat=c(90,80,40))

y <- data.frame(name=c("a","b","d"),
                korean= c(75,60,90))    

merge(x,y, by.x=c("name"),   # x, y 같은 이름의 변수가 없다.  
      by.y= c("sname"))       




#
# dplyr package -> 데이터 가공 -> 파이프 연산자 %>% (왼쪽 ctrl +shift+m %>% )
#

install.packages("dplyr")
library(dplyr)


df <- data.frame(var1=c(1,2,1), var2=c(2,3,2))
df



#rename() : 이름 변경   -> 쓰임새 많음!!!!!
df <- rename(df, v1=var1, v2=var2)

df


# 파생변수 추가 -> 데이터 가공 
df$sum <- df$v1+df$v2
df


df[2,1] <- 5
df

df <- data.frame(id=c(1,2,3,4,5,6),
                 class=c(1,1,1,1,2,2),
                 math=c(50,60,45,30,25,50),
                 english=c(98,97,86,98,80,89),
                 science=c(50,60,78,58,65,98))

df

# filter() : 행 추출/ 인수로 조건식(논리값) 
df %>% filter(class==1) 
df %>% filter(class==2)
df %>% filter(class!=1)
df %>% filter(class!=2)

df %>% filter(science>70)
df %>% filter(math<50)

df %>% filter(class==1&math >=50)
df %>% filter(math >= 50|english>=90)
df %>% filter(class %in% c(1,3,5))    # class에 1,3,5반이 포함된 행 추출  

class1 <- df %>% filter(class==1)     # 1, 2반 분리 -> 별도의 데이터 프레임 
class2 <- df %>% filter(class==2)
class1
class2


# select() : 변수 추출
df %>% select(math)
df %>% select(science)

df %>% select(class,math,science)

df %>% select(-math)


# dplyr 함수 조합 - %>%  장착 개수 제한x 
df %>% 
  filter(class==1) %>% 
  select(science)

df %>% 
  select(id, science) %>% 
  head



df %>% 
  select(id, science) %>% 
 sum

df %>% 
  select(id, science) %>% 
 max



# arrange(): 정렬
df %>%  arrange(science)   
df %>%  arrange(desc(science))


# mutate() : 파생변수 추가 
df %>% 
  mutate(total=math+english+science) %>% 
  head


df %>% 
  mutate(total=math+english+science, average=(math+english+science)/3) %>% 
  head


df %>% 
  mutate(grade=ifelse(science>=60, 'pass', 'fail')) %>% 
  head


df %>% 
  mutate(total=math+english+science, average=(math+english+science)/3) %>% 
  mutate(grade= ifelse(average>=90, 'pass', ifelse(average<60, 'fail', 'normal'
                                                   ))) %>% 
  head



df.sort <- df %>% 
  mutate(total=math+english+science, average=(math+english+science)/3) %>% 
 arrange(desc(average)) %>% 
  head


df.sort

# summarise() : 집단별 요약     - > 유용한 함수 
# group_by : 집단별 나누기

df %>%  summarise (mean_math=mean(math))

df%>% 
 group_by(class) %>% 
  summarise(mean_math=mean(math),
            mean_english=mean(english),mean_science=mean(science), n=n())  # n은 빈도수 계산 ~ table 함수와 비슷 ,  tibble : 2*5
                                                                           # dbl 숫자



install.packages("ggplot2")

str(ggplot2::mpg)     #  :: 누가 가지고 있는 (library 쓰지 않고 실행 , 패키지명 :: 데이터 샛 명)
mpg <- data.frame(ggplot2::mpg)
dim(mpg)
str(mpg)
head(mpg)
View(mpg)


mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  head(10)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=='suv') %>%   # 행 추출
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot=mean(tot))
  arrange(desc(mean_tot)) %>% 
  head(5)

  
# 데이터 합치기
#left_join(): 가로로 합치기 (변수추가)
#inner_join() : 가로로 합치기 (변수추가)
#full_join() : 가로로 합치기(변수추가)
# bind_rows() : 세로로 합치기 (data 추가) 

df1 <- data.frame(id=c(1,2,3,4,5),midterm=c(60,80,70,90,85)) ; df1
df2 <- data.frame(id=c(1,2,3,4,5), final=c(60,80,70,90,85)) ;df2
total <- left_join(df1, df2, by="id")
total

df1 <- data.frame(id=c(1,2,3),
                  adress=c("서울", "부산", "제주"),
                  stringFactors=F)  # stringFactors=F -> 문자열이 Factor로 만들어질 가능성을 막아줌

df1

df2 <- data.frame(id=c(1,2,4),
                  gender=c("남","여","남"))
                  

df2

# 변수추가 
df_left <- left_join(df1,df2, by='id')   #df1 기준 -> df2 변수 추가 , id가 같은 것 뽑아옴 
df_left
df_inner <- inner_join(df1, df2, by='id') # df1, df2 동일하게 있는 것만 변수 추가 
df_inner
df_full <- full_join(df1,df2,by='id')
df_full


df1 <- data.frame(id=c(1,2,3,4,5),test=c(60,80,70,90,85)) ; df1
df2 <- data.frame(id=c(1,2,3,4,5), test=c(60,80,70,90,85)) ;df2

# 행 추가 - data 추가 
df_all <- bind_rows(df1,df2)
df_all  # 세로 추가 


install.packages("psych")
library(psych)

summary(mtcars)
describe(mtcars)  # 더 많은 내용 표시 #vars 변수 개수 , n 관측치 개수 

install.packages("descr")
library(descr)





df <- data.frame(id=c(1,2,4),
                  gender=c("남","여","남"))


table(df$gender)
freq(df$gender)
freq(df$gender, plot=F)


































