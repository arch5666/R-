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