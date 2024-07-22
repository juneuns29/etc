# 라이브러리 로딩
library(dplyr)
library(openxlsx)
# require(dplyr)
# 라이브러리 로딩은 
# library()또는 require()를 이용해서 로딩할 수 있는데
# require() 의 경우는 에러메세지를 보여준다.

# 열 병합하기

names1 <- c('jennie', 'lisa', 'rose')
names2 <- c('jennie', 'rose', 'jisoo')

kor <- c(100, 85, 63)
eng <- c(100, 90, 85)

black1 <- data.frame(name=names1, kor)
black1

black2 <- data.frame(name=names2, eng)
black2

# 첫번째 data frame 기준으로 결합
black <- left_join(black1, black2)
black

# 양쪽 모두 있는 데이터만 결합
pink <- inner_join(black1, black2)
pink

# 양쪽 데이터를 모두 표현하고 없는 데이터는 NA로 입력
blackpink <- full_join(black1, black2)
blackpink

# 데이터프레임 조작하기

# 파일 읽기
df <- read.xlsx('mtcars1.xlsx')
df

tmp <- df[,1]

# 참고 ] 문자열 조작 함수들

# 1. strsplit() : 문자데이터를 구분자를 기준으로 잘라내는 함수
txt <- 'jennie,lisa,rose,jisoo'
strsplit(txt, ',')

# 2. paste()  :  여러문자데이터를 하나로 합쳐주는 함수
ctxt <- c('jennie', 'lisa', 'rose', 'jisoo')
ctxt

cresult <- paste(ctxt, collapse=',') # collapse : java의 delims
cresult

# 3. toupper()/tolower() 대문자/소문자 변환함수
txt <- 'BlackPink'
tolower(toupper(txt))

# 4. substr() : 문자데이터의 일부만 추출해주는 함수
# 5. nchar() : 문자데이터의 길이 추출해주는 함수
txt <- 'Black Pink'
length(txt)
substr(txt, start=7, stop=nchar(txt))

# 6. gsub() : 문자데이터내의 특정패턴을 다른 문자패턴으로 대체해주는 기능
#     gsub('찾을 패턴', '바꿀패턴', 문자데이터)
gsub(' ' , '-/-', txt)

# tmp
tmp

# tmp를 공백을 기준으로 분리
sp_model <- strsplit(tmp, ' ')
sp_model

sp_model[[1]][1]

length(sp_model[[6]])

length(sp_model[])

brand <- sapply(sp_model, function(x) x[1]) # forEach 함수와 비슷한 기능
brand
model <- sapply(sp_model, function(x) ifelse(length(x) == 1, x[1], 
                                             ifelse(length(x)==2, x[2], paste(x[2], x[3]))))
model

df <- data.frame(brand, model, df[,-1])

df

df1 <- df[, -c(1,2)]
df1

df2 <- cbind(brand, model, df1)
df2

# model 열의 결측치 처리

is.na(df2$model)

df2[is.na(df2$model),]


# 참고 ] ifelse() : java의 삼항연산자와 같은 기능의 함수
#     형식 ]  ifelse(조건식, 참일때 반환값, 거짓일때 반환값)
s1 <- 'OK1'

ifelse(s1 == 'OK', 1, 2)

# 문자열 결합 방법
gsub(' ', '', paste('black', 'pink'))

paste(c('black', 'pink'), collapse='')

paste(c('jennie', 'lisa'), 'rose')

strsplit(paste(paste('jennie', 'lisa'), 'rose'),' ')


# homework ] for 명령을 이용해서 처리해보기

########################################################################################################

blackpink

bp <- blackpink

# bp의 결측치 카운트
sum(is.na(bp))

# kor 열의 결측치 카운트
sum(is.na(bp$kor))

# eng 열의 결측치 카운트
sum(is.na(bp$eng))

# 결측치를 제외한 국어점수의 평균
bp[!is.na(bp$kor), 2]

# 평균값으로 결측치 대입
bp[is.na(bp$kor), 2] <- mean(bp[!is.na(bp$kor), 2])

bp

# 영어점수 결측치를 영어점수 평균으로 대체
bp[is.na(bp$eng), 3] <- mean(bp[!is.na(bp$eng), 3])

bp

# bp의 통계데이터 조회
summary(bp)

# 국어 점수 결측치를 99 점으로 대체하세요.
bool1 <- is.na(bp$kor)
bool1

bp[bool1, 2] <- 99

bp

# 영어점수 결측치를 80점으로 채워넣으세요.
bp[is.na(bp$eng),3] <- 80

bp

################################################################################
# 기술통계학과 추측통계학

# 기술통계학 : 자료를 수집하여 표 또는 그래프나 그림 등으로 나타내거나
#              자료가 갖는 수치적 특성을 분석하고 설명하는 방법을 
#              다루는 통계학의 한 분야

# 추측통계학 : 표본을 대상으로 얻은 정보로 부터 모집단에 대한 불확실한 특성을
#              과학적으로 추론하는 방법을 다루는 통계학의 한 분야

# 통계의 의미
#       수치로 표현되는 사실이나 자료를 수집 분석하고
#       이것을 표 또는 그림으로 만들어 어떤 주제에 대한 의미 있는 
#       정보를 얻어내는 일련의 과정

# 통계학(Statistics)
#       효과적인 의사결정을 내리기 위해
#       자료를 수집하고
#       요약하고
#       분석하고
#       표현하고
#       판단하는      과학

# 자료(Data) : 어떤 통계적 목적에 맞춰 수집된 정보

# 변수
#     독립변수  : 원인 변수
#     종속변수  : 독립변수의 영향으로 만들어진 변수



################################################################################################################

library(ggplot2)

# iris(붓꽃) 데이터셋
#       붓꽃 데이터 150 셋트를 수집해 놓은 데이터
#       Sepal     : 꽃받침
#       Petal     : 꽃잎
#       Species   : 품종
data('iris')

iris

plot(x=iris$Petal.Width, y=iris$Petal.Length,
     col='blue',
     pch=1, main ='붓꽃 꽃잎 사이즈',
     xlab='petal width', ylab='petal length'
     )

# iris 데이터의 품종을  distict하게 꺼내보자.
unique(iris$Species)

# 품종별로 마커 생성
pch <- ifelse(iris$Species == 'setosa', 1, ifelse(iris$Species == 'versicolor', 2, 3))

pch

plot(x=iris$Petal.Width, y=iris$Petal.Length,
     col='blue',
     pch=pch, main ='붓꽃 꽃잎 사이즈',
     xlab='petal width', ylab='petal length'
)


scolor <- ifelse(iris$Species == 'setosa', 'blue', ifelse(iris$Species == 'versicolor', 'red', 'green'))

scolor
# 마커 색상 적용
plot(x=iris$Petal.Width, y=iris$Petal.Length,
     col=scolor,
     pch=pch, main ='붓꽃 꽃잎 사이즈',
     xlab='petal width', ylab='petal length'
)
# 범례 추가
legend('bottomright', legend=unique(iris$Species),
       pch=unique(pch), col=unique(scolor),
       title='붗꽃 품종'
       )

pch

# x : x 축 데이터, y : y 축 데이터
# col : 데이터가 표현될 점들의 색상
# pch : 데이터가 표현될 점들의 스타일 

















