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
