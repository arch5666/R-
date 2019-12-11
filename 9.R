# 2019.12.11(수)
#
# 12일차
#
# 워드클라우드(Word Cloud)
# 한글 워드클라우드 절차
#1. Java 실행환경 구축
#2. 자료 수집(Text자료) 
#      2.1 text file 형태로 수집  
#      2.2 web scraping을 이용하여 수집
# 3. 명사 추출
Sys.setenv(JAVA_HOME='C:/Program Files/Java/jre1.8.0_231') 

install.packages("wordcloud")  
library(wordcloud)
install.packages("wordcloud2")
library(wordcloud2)
install.packages("KoNLP")    # 한국어 처리
library(KoNLP)
install.packages("RColorBrewer")  #색상처리
library(RColorBrewer)

library(dplyr)
library(ggplot2)

setwd("D:/workR")
text <- readLines("mis_document.txt", encoding='UTF-8') # Text File 마지막에 공백줄!
text

#'우리 말씀' 한글사전 로딩
buildDictionary(ext_dic = 'woorimalsam')  
pal2 <- brewer.pal(8,'Dark2')      # 색상 팔레트 생성
noun <- sapply(text, extractNoun,USE.NAMES = F) # 명사 추출, 행 이름은 안 쓰겠다(USE.NAMES = F)
noun

#4. 추출된 단어(주로 명사)에 대한 빈도수 계산 및 시각화
noun2 <- unlist(noun)  # list -> vector
wordcount <- table(noun2)
sort.noun <- sort(wordcount, decreasing = T)[1:10]
sort.noun
sort.noun <- sort.noun[-1]
barplot(sort.noun, names.arg=names(sort.noun),
            col='steelblue', main= '빈도수 높은 단어',
            ylab='단어 빈도수')

df <- as.data.frame(sort.noun)
df
ggplot(df,aes(x=df$noun2, y=df$Freq))+
  geom_bar(stat='identity',
           width = 0.7,
           fill="steelblue")+
  ggtitle('빈도수 높은 단어')+
  theme(plot.title = element_text(size=25,
                                  face='bold',
                                  colour='steelblue',
                                  hjust=0,
                                  vjust=1))+
  labs(x='명사', y='단어빈도수')+
  geom_text(aes(label=df$Freq),hjust=0.3)+
coord_flip()
  








































