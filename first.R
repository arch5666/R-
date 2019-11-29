#
# R 프로그래밍  1일차
#
#  first.R
#
# 작성자 : IMH
#
# 최초작성일 : 2019.11.26
#
#
print("Hello, World!!!")

number <-10
number2=100

number3 <- number

numberValue <- 1         #camel 표기법 -> 숫자 
str_value<-" R Language" #snake 표기법(언더바) -> 문자
booleanvalue<-TRUE  # 논리형

numberValue <- "R script"
numberValue<-1

print(numberValue)
print(str_value)
print(booleanvalue)

cat("Numberic number : ", numberValue,"\n")
cat("String : ",  str_value, "\n")
cat("Boolean value: ", booleanvalue, "\n")

numberValue <- scan()

cat("Numberic number : ", numberValue,"\n")  

number1 <- 10
number2 <- 20
resultAdd <- number1+number2
resultSub <- number1-number2
resultMul <- number1*number2
resultDiv <- number1/number2
resultRem <- number1%%number2
resultSec <- number2**5
resultSec


print(resultAdd)
print(resultSub)
print(resultMul)
print(resultDiv)
print(resultRem)
print(resultSec)


number1 <- 0
number1 <- number1+10
number1
number1 <- number1+10
number1
number1 <- number1+10
number1


number2 <- 100
number1 <- number2+10
number1
number2


print((number1+10)*number2/2)

number300 <- 10
number300 <-number300+10
number300

number301 <- number300*2
number301 


number1 <- 10.5
number2 <- 10
print(number1>number2)
print(number1>=number2)
print(number1<number2)
print(number1<=number2)
print(number1==number2)
print(number1!=number2)


print(number1>10 & number2>10)
print(number1>10 | number2>10) # OR
print(!(number1>10)) # NOT


number <- "100"
str <- "R Language"
result =number+str
print(result)


#
#제어구조 - 선택구조
#

job.type <- 'A'

if(job.type=='B'){
  bonus <- 200       # 참 일때
} else {             # 거짓 일때 (양자택일구조)
    bonus <- 100
}

cat("job type: ", job.type, "\t\tbonus : ", bonus) 


job.type <- 'B'

if(job.type=='A'){               
  bonus <- 200
}

cat("job type: ", job.type, "\t\tbonus : ", bonus) 


score <- 85                           # 다중선택구조 - > 조건문 순서 중요

if(score>=90){   
  grade <-  'A'
} else if (score>=80){
  grade <-  'B'
} else if(score>=70){
  grade <- 'c'
} else if(score>=60){
  grade <-'D'
} else {
  grade <-'F'
}
cat("score: ", score, "\t\tbonus : ", grade) 


number <- 10
remainder <- number%%2

if(remainder==0){
  oddeven<-'짝수'
}else {
  oddeven<-'홀수'
}

cat("Number: ", number, "는",oddeven, "이다") 


a <- 5
b <- 20

if(a > 5 & b > 5){
  cat(a, "> 5 and ",b, ">5")
} else {
  cat(a, "<=5 or", b,"<=5")
}


a <- 10
b <- 20

if(a>b){
  c <- a
}else{
  c <- b
}
cat("a=",a, "\tb=",b,"\tc=",c)

c <- ifelse(a>b, a,b)
cat("a=",a, "\tb=",b,"\tc=",c)

a <- 10
b <- 5
c <- 8

max <- a

if(b>max){
  max=b
}

if(c>max){
  max=c
}
  
cat("a=",a, "b=",b,"c=",c, "max=", max)



#
# 반복구조
# for문 
#
for (i in 1:10){
  print(i)
}


multiple =2
for (i in 2:9 ){
  cat(multiple, 'x', i, ' = ', multiple*i, '\n')  
}


#while문
i <- 1
while (i <=10){            # i가 반복제어 변수 (조건이 참이 것만 반복)
  print(i)
  i <- i+1
}


multiple <- 2
i <- 2
while(i<=9){
  cat(multiple, 'x', i, ' = ', multiple*i, '\n') 
  i <- i+1
}


#1. 
lineCount <- 1  #초기화
for (i in 1:100){
  cat(i,'')
lineCount <- lineCount+1
if(lineCount>10){
print('\n')
lineCount <- 1  #Reset
}
}


#2
for (i in 1:100){
  cat(i,'')
if(i%%10==0){
  print('\n')
}
}



#Q. 1~1000사이의 3의배수와 5의배수를 한 줄에 10개씩 출력하고, 마지막에 개수를 출력 하는 Script
# 11/27 실습 ->(변수초기화), 1000반복 제어변수, count변수(1줄에 10개씩 출력),  변수 개수 
# Algorithm : 1~1000반복, 3의배수인지 판별, 5의 배수인지 판별, 3의배수 이거나 5의배수이면 개수를 세면된다.-> 그 수를 출력 
# 반복이 끝나면 개수를 출력 ->pseudo code(글로작성)


i <- 1  # 반복 제어 변수 
count <- 0 # 개수 
lineCount <- 1 # 줄 개수 
multiple3 <- NULL # 임시변수 -> 문제해결하고는 직접적으로는 무관(처리변수) 
multiple5 <- NULL 
while (i<=1000) {    # 1~1000까지 반복 
  multiple3 <- i%%3
  multiple5 <- i%%5
  if(multiple3==0|multiple5==0){
    count <- count+1
    cat(i,"")
    lineCount <- lineCount+1
    if(lineCount>10){
      lineCount <- 1
      print('\n')
    }
  }
i <- i+1  # 이게 없으면 무한반복 
}   
print('\n')
cat('1~1000사이의 3의배수와 5의 배수의 개수 : ', count, '\n')






















