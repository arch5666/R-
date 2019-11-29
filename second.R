# 
# break/next
#
sum <- 0
for (i in  1:10){    # 원래는 10번 반복
  sum <- sum+i
  if(i>=5){
    break           # i=5에서 반복을 빠져나가라 
  }
}
sum


sum <- 0
for (i in 1:10) {
  if(i %% 2 == 0) {       # 짝수 배제-> 홀수 출력 
    next
  }
  sum <- sum+i
}
sum



#
# 산술 내장 함수
#
log(10)+5
log(10, base = 2)
sqrt(25)
max(5,3,2)
min(3,9,5)
abs(-10)
factorial(5)
sin(pi/2)


#
# 사용자 정의 함수 
# 예 : 인수 있고, return 있는 경우
mymax <- function(x,y){  # 함수 정의 먼저 
  num.max <- x
  if(y>num.max){
    num.max <- y
  }
  return (num.max)
}
mymax(10,15)  # 그리고 함수 호출
a <- 10
b <- 5
c <- 8
max <- mymax(a,b)
max <- mymax(max, c)
max

# 사용자 정의 함수 매개변수 초기값 설정
mydiv <- function(x,y=2) {        # 인수 값을 정함 - 디폴트 값 오른쪽->왼쪽(3개 이상이어도 마찬가지임) (y=2 기본값 ; y값이 주어지지 않으면 기본값 사용 )
  result <- x/y
  
  return(result)
}

mydiv(x=10, y=3)
mydiv(10,3)
mydiv(10)
mydiv(x=14)


#. 외부 파일에 있는 함수 호출
setwd("D:/workR")        # 경로지정  
source("mylib.R")        # Lib 파일 지정

#함수 호출
my_max(10,5)
my_div(10,2)



#
# vector 도입 - 동일한 자료형의 집합 처리, 스칼라형 기억장소 집합
#
#scalar형 변수 도입

a <- 10;b <- 5;c <- 8
max <- a
if(b>max) {max <- b}
if(c>max) {max <- c}
max


v <- c(10,5,8,21,15,7,31,9,100,10)
max <- v[1]
for (i in 2:length(v)){
  if(v[i]>max){
  max <- v[i]
  }
}
max


# vector 생성
x <- c(1,2,3)
y <- c("a", "b","c")
z <- c(TRUE, TRUE, FALSE,TRUE)
x;y;z

class(x)
class(y)
class(z)


v1 <- 50:90; v1
v2 <- c(1,2,3,50:90); v2
class(v1)
class(v2)


v3 <- seq(1,101,3);     v3
v4 <- seq(0.1,1.0,0.1); v4

v5 <- rep(1,times=5);   v5
v6 <- rep(1:5, times=3);  v6
v7 <- rep(c(1,5,9), times=3); v7


# 벡터 원소값에 이름 지정
score <- c(90,85,70);      score
names(score)
names(score) <- c("Hong", "Kim","Lee")
names(score)
score

# vector 원소 접근
score[1]
score[2]
score[3]
score["Hong"]
score["Kim"]
score["Lee"]

d <- c(1,4,3,7,8)
d[1];d[2];d[3];d[4];d[5];d[6]

for (i in 1:length(score)){
  print(score[i])
}


score_names <- c("Hong", "Kim", "Lee")
for (i in 1:length(score)){
  print(score[score_names[i]])
}

score[c("Hong","Kim", "Lee")]  # R에서 권장 - 벡터의 요소 접근 시 


# 벡터에서 여러 개의 값을 한번에 추출
d <- c(1, 4, 3, 7, 8)
d[c(1,3,5)]     # 1번, 3번, 5번 인덱스
d[1:3]
d[seq(1,5,2)]
d[-2]
d[-c(3:5)]  # -인덱스 : 해당 인덱스 제외 


GNP <- c(2090,2450,960);    GNP
names(GNP) <- c("korea", "japan","Nepal"); GNP
GNP[1]
GNP["korea"]
GNP[c("korea","Nepal")]


# 벡터 요소값 변경
v1 <- c(1,5,7,8,9);     v1
v1[2] <- 3;             v1
v1[c(1,5)] <- c(10,20);   v1


#벡터간 연산 -> 두 벡터의 요소의 개수가 동일해야, R 벡터는 자동순환 - 제어문 쓰지 않아도 
x <- c(1,2,3)
y <- c(4,5,6)
x+y
x*y
z <- x+y
z


#벡터에 적용 가능한 함수
d <- c(1,2,3,4,5,6,7,8,9,10)
sum(d)
sum(2*d)
length(d)
mean(d[1:5])
mean(d)
median(d[1:5])
median(d[1:5])
median(d)
max(d)
min(d)
sort(d)     # 정렬
sort(d, decreasing = FALSE)
sort(d, decreasing = TRUE)
range(d)     #값의 범위(최소값~최대값)
var(d)
sd(d)

v <- sum(d)/length(d) ;   v      # 평균


# 벡터에 논리연산 적용 -> 벡터에서 유용한 방법
d >=5
d[d>5]
sum(d>5)   # 이 조건을 만족하는 인덱스 개수 
sum(d[d>5]) 
d==5

cond <- d>5&d<8 ;   cond     # 특정 인덱스 추출 -> 유용
d[cond]

all(d>5) 
any(d>5)

head(d)   # 디폴트 값 = 6 
tail(d)
head(d,3)
tail(d,3)


x <- c(1,2,3)
y <- c(3,4,5)
z <- c(3,1,2)

w <- c(x,y); w
union(x,y)  #합집합
intersect(x,y)   #교집합
setdiff(x,y)         #차집합
setequal(x,y)        # x,y에 동일한 요소가 모두 포함되어 있는지 확인
setequal(x,z)



# List  - 1차원 - 데이터를 key(변수명) (name)-value(Hong) 형태로 저장, score의 value 형태 : vector 
ds <- c(90,85,70,84)
my.info <- list(name='Hong', age=30, status=TRUE, score=ds)  

my.info
my.info[1]     # 대괄호 vs 이중 대괄호 
my.info[[1]]   # List에서 인덱스에 접근 할 대 이중 대괄호 -> 보통은 key보다는 value 출력하는 경우가 많음 
my.info$name   
my.info[[4]]
my.info[[4]][1] #score는 벡터 -> 첫번째 인덱스 출력 



# Factor형(범주형) - 항상 levels 수반 / 범주형은 산술연산x -> as함수 활용하여 연산 
bt <- c('A','B','B','O','AB','A')
bt.new <- factor(bt)
bt
bt.new  # Factor형 벡터 
bt[5]
levels(bt.new) # 취할 수 있는 값의 범주 -> Only 4종류 데이터 입력 가능 
as.integer(bt.new) # Level 순서대로 1 2 3 4 
bt.new[7] <- 'B'
bt.new[8] <- 'C' # C는 Levels에 포함x
bt.new


























































