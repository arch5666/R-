#함수 반환값(return값)이 여러 개일 때의 처리
myfunc <- function(x,y){
  val.sum <- x+y
  val.mul <- x*y

return(list(sum=val.sum, mul=val.mul)) # 원칙적으로 return하나 호출 
}

result <- myfunc(5,8)
s <- result$sum
m <- result$mul
cat('5+8=', s, '\n')
cat('5*8=', m,'\n')
# Matrix 생성 - 디폴트 열 우선방식 - 변수 중심 , 행렬이 비어서 생성x 
z <- matrix(1:20, nrow=4)    
z 

z <- matrix(1:20, ncol=4)     # 관측치 5개 
z

z <- matrix(1:20, nrow=4, ncol=5)
z


z <- matrix(1:20, nrow=4,ncol=5,byrow=T) # 행 우선 
z


x <- 1:4
x
y <- 5:8
y
z <- matrix(1:20, nrow=4, ncol=5)
z


#벡터-> matrix
m1 <- cbind(x,y) #열로 결합 -> 벡터를 변수로 
m1
m2 <- rbind(x,y) # 행으로 결합 -> 벡터를 관측치로 
m2
m3 <- rbind(m2,x)
m3
m4 <- cbind(z,x) # z에다 x를 변수로 추가 
m4


# Matrix에서 cell의 값 추출
z[2,3] #2행3열
z[1,4]
z[2,]
z[,4]

z[2, 1:3]   # 2행 1열~3열
z[1,c(1,2,4)] # 1행 1열, 2열,4열
z[1:2,]
z[,c(1,4)]    


# Matrix에서 행/열에 이름 지정 (nrow,ncol)=(관측치, 변수)
score <- matrix(c(90,85,69,78,
                  85,96,49,95,
                  90,80,70,70),
                nrow=4, ncol=3)
score
rownames(score) <- c("Hong", "Kim", "Lee", "Yoo")
colnames(score) <- c("English", "Math","Science")
score

score['Hong', 'Math']
score['Kim',c('Math','Science')]
score['Lee',]
score[,'English']
rownames(score)
colnames(score)
colnames(score)[2]

# Data Frame 생성- 많이 사용, 벡터를 하나를 변수로 본다. -> dim, str 먼저 확인
city <- c('Seoul','Tokyo','Washington')  #변수명을 주지 않았는데도 
rank <- c(1,3,2)
city.info <- data.frame(city, rank)
city.info

name <- c('Hong','Kim','Lee')
age <- c(22, 20,25)
gender =factor(c('M','F','M'))
blood.type <- factor(c('A','O','B'))
person.info <- data.frame(name, age, gender, blood.type)
person.info


person2.info <- data.frame(name=c('Hong', 'Kim','Lee'),
                            age=c(22,20,25),
                            gender=factor(c('M','F','M')),
                            blood.type=factor(c('A','O,','B'))) 
                            
person2.info                            

# data frame 요소 접근 
city.info[1,1]
city.info[1, ]
city.info[, 1]
city.info[city.info$city, ]
city.info[ ,"rank"]

person.info$name
person.info[person.info$name=="Hong"]
person.info[person.info$name=="Hong",c("name","age")]

data() # R이 제공하는 dataset

iris

iris[ , c(1:2)]
iris[ , c(1,3,5)]
iris[ , c("Sepal.Length", "Species")]
iris[1:5] ; iris[1:5, c(1,3)]



# Matrix와 Data Frame에서 사용하는 함수
dim(person.info)
dim(iris)      # 관측치 150개, 변수 5개
nrow(person.info)
nrow(m3)
ncol(person.info)
head(iris)     #
tail(iris)     #
str(iris)      #
str(city.info)
str(person.info)
iris[,5]
unique(iris[,5])
table(iris[,"Species"])#
table(person.info[,"blood.type"])
table(person.info[,"gender"])


# Matrix/Data Frame 사용함수     # apply에서 방향 col : 2, row : 1
# 행별 /열별 합계와 평균 계산

colSums(iris[,-5]);            apply(iris[ , 1:4],2,sum)  # 변수의 합계, (apply)데이터셋, 방향, 동작 
colMeans(iris[,-5]) ;          apply(iris[ , 1:4],2, mean)  
rowSums(iris[,-5]);            apply(iris[ , -5 ], 1, sum)# 150행의 합계
rowMeans(iris[,-5]);           apply(iris[ , -5 ], 1, mean)
apply(iris[, -5], 2, median )


# 행/열 방향 전환 -> 전치행렬
z <- matrix(1:20, nrow=4, ncol=5); z
t(z)


# 조건에 맞는 행과 열의 값 추출(Data Frame만 가능) -> 부분추출
IR.1 <- subset(iris, Species=="setosa") ;IR.1
IR.2 <- subset(iris, Sepal.Length > 5.0 & Sepal.Width>4.0); IR.2
IR.2[ , c(2,4)]


# Matrix/Data.Frame 산술연산 
a <- matrix(1:20, 4,5); a
b <- matrix(21:40,4,5); b

2*a
b-5
2*a+3*b

a+b
b-a
b/a
a*b


# Matrix/Data.Frame 자료구조 확인/변환
class(iris);     str(iris)
class(state.x77);  str(state.x77)
is.matrix(iris)   # iris 가 matrix인가?
is.data.frame(iris)
is.matrix(state.x77)
is.data.frame(state.x77)

st <- data.frame(state.x77)  # matrix-> data.Frame
str(st)
head(st)
class(st)
dim(st)

iris.m <- as.matrix(iris[ , 1:4])  # data.Frame(1열~4열) -> matrix
head(iris.m)
class(iris.m)
str(iris.m)

#참고
head(st)
attach(st)     # 벡터(1차원)의 모임 -> matrix, data.Frame(2차원), 변수이름을 일반변수처럼 자유롭게  쓰고자 할 때 
Population
detach(st)    
Population
