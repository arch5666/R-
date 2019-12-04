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




















































































