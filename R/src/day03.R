# day03

data("mtcars")

mtcars
cars1 <- mtcars

cars1

# csv 로 저장하기
#     write.csv(데이터, file='파일이름')
getwd()
write.csv(cars1, file='cars1.csv')

# csv 파일 읽기 : read.csv()
car2 <- read.csv('cars1.csv', header=F)

car2

head(car2, 5)

car2 <- read.csv('cars1.csv', header=T)

car2

head(car2, 5)


car3 <- car2[1:3,]

car3

# car2 의 5번째 행을 car3의 두번째 행에 추가

car3[2,] <- car2[5,]
car3

# car3의 2번째 행 삭제
car4 <- car3[-2,]

car3
car4

car4[,-1]

# car4의 X, cyl, wt, gear 를 추출해서 car5를 만든다.
car5 <- car4[,c('X', 'cyl', 'wt', 'gear')]
car5

# 위 처럼 데이터의 일부를 잘라서 추출해내는 작업을 슬라이싱 작업이라 한다.

# 조건을 주고 데이터중 일부만 선택하기 : subset()

# cars1에서 cyl이 8인 데이터만 추출해서 car6에 기억하기
cars1
car6 <- subset(cars1, cyl==8)

car6

# car7 에 cyl이 4이거나 6인 데이터만 추출해서 기억
car7 <- subset(cars1, cyl==c(4,6))# 확인....
tail(car7, 3)
# 행 갯수
nrow(car7)
# 열 갯수
ncol(car7)

# hp가 짝수인 데이터 추출해서 car8에 기억
car8 <- subset(cars1, hp %% 2 == 0)
car8

# subset() 특정열만 선택하는 방법

# 열 이름 확인
colnames(cars1)
names(cars1)


# mpg, cyl, hp, gear 컬럼만 추출해서  car9에 기억
car9 <- subset(cars1, select=c('mpg', 'cyl', 'hp', 'gear'))
car9

car10 <- cars1[, c('mpg', 'cyl', 'hp', 'gear')]
car10

# car6에 cars1의 cyl이 4인 행들을 추가

tmp <- subset(cars1, cyl==4)
tmp

len1 <- nrow(tmp)
len1

#################################################################################################

# 패키지 설치하기
#     형식 ] install.packages('패키지이름')
# 패키지 로딩
#     형식 : library(패키지이름)

# ggplot 패키지 설치
install.packages('ggplot')

# readxl 패키지 설치
install.packages('readxl')

# openxlsx  패키지 설치 - read, write 기능
install.packages('openxlsx')

# readxl 추가
library(readxl)
library(openxlsx)

cars1

write.xlsx(
  cars1,# 데이터셋
  file = 'mtcars.xlsx', # 저장파일이름
  rowNames=F # TRUE : 행이름 기록, F : 행이름 기록 안함
)


write.xlsx(
  cars1,# 데이터셋
  file = 'mtcars1.xlsx', # 저장파일이름
  rowNames=T # TRUE : 행이름 기록, F : 행이름 기록 안함
)

# 저장된 엑셀 파일 읽기

mtcars1 <- read_excel('mtcars.xlsx') # readxl 패키지 함수
mtcars1

mtcars1_1 <- read_excel('mtcars.xlsx', col_names=F)
mtcars1_1

# openxlsx 함수로 읽기
mtcars2 <- read.xlsx('mtcars1.xlsx')
mtcars2

mtcars3 <- mtcars2[mtcars2$cyl == 4 | mtcars2$cyl == 6,]

nrow(mtcars3)

# mtcars2에서 hp가 100 미만인 행 추출
mtcars4 <- mtcars2[mtcars2$hp < 100,]

nrow(mtcars4)

mtcars2[which(mtcars2$hp < 100),]

install.packages('dplyr')

library(dplyr)
slice(mtcars1, 5:10)
filter(mtcars1, cyl==4)

apply(mtcars1[, c('mpg', 'hp')], 2, mean) # 1: 행 으로 적용, 2: 열기준 적용

apply(mtcars1, 2, mean)

mtcars1[, c('mpg', 'hp')]

# 조건에 맞는 데이터 위치 검색하기
which(mtcars1$cyl == 4)
which(mtcars1$hp < 100)
# hp가 100미만인 데이터중 최대값의 위치 조회
which.max(mtcars1$hp < 100)
mtcars1[which.max(mtcars1$hp < 100),]

# 
max(mtcars1[mtcars1$hp < 100,]$hp)

# dplyr 패키지 함수들
#   filter() : 데이터셋 필터링 함수
#         filter(데이터셋, 조건)
filter(mtcars1, cyl == 4 | cyl == 6)
#   select() : 열을 추출해주는 함수
#       select(데이터셋, 열이름, 열이름, ...)
select(mtcars1, mpg, hp, gear)
#   arrange() : 데이터를 정렬
#       arrange(데이터셋, desc(컬럼이름)) - desc(컬럼이름):내림차순정렬
arrange(mtcars1, cyl, desc(hp))
mtcars1
#   mutate()
#     데이터셋에 열 추가
head(mutate(mtcars1, years='2024'), 3)

nrow(mtcars1)

r <- 2001:2032

r <- sample(2001:2032, 32)

r

head(mutate(mtcars1, years=r))

# rank 구하기
rank(mtcars1$hp)

# mtcars1에 hp 기준으로 내림차순 정렬하고 rank 열을 만들어서 추가하세요.
#   arrange(), mutate()
rk <- 1:32

mtcars1_rank <- arrange(mtcars1, desc(hp))
mtcars1_rank <- mutate(mtcars1_rank, rank=rk)
mtcars1_rank

mutate(arrange(mtcars1, desc(hp)), rank=rk)

arrange(mutate(mtcars1, rank=floor(rank(-mtcars1$hp))), desc(hp))

################################################################################################
# 조건에 따른 실행문

work.type <- 'K'

if(work.type == '0') {
  win <- 500
} else {
  win <- 100
}

print(win)
win

s <- 80

if(s > 90){
  grade <- '참잘했어요!'
} else if(s >= 80){
  grade <- '잘했어요!'
} else if(s >= 70){
  grade <- '보통입니다.'
} else if(s >= 60){
  grade <- '더 노력하세요!'
} else {
  grade <- '많이 노력하세요!'
}

grade

# 반복문
for(x in 1:10){
  print(x)
}

# 구구단
for(dan in 2:9){
  for(gop in 1:9){
    cat(dan, 'x', gop, '=', dan*gop, '\n')
  }
  cat('\n')
}

# 5 * 5
for(x in 1:5){
  for(y in 1:5){
    cat('*')
  }
  cat('\n')
}

# 사용자 정의 함수

res <- function(a, b){
  res.max <- a
  if(b > a){
    res.max <- b
  }
  return(res.max)
}

res(1, 5)

div <- function(a, b=5){
  result <- a %/% b
  return(result)
}

div(10, 3)

div(13)


# ggplot2 install
install.packages('ggplot2')
library(ggplot2)

###############################################################################
# dplyr 패키지의 파이프 연산자 활용

m <- mtcars1

m %>% arrange(desc(hp)) %>% mutate(rank=1:32)

cy4 <- mtcars1 %>% filter(cyl==4)
cy4

cy6 <- mtcars1 %>% filter(cyl==6)
cy6

# 행으로 결합하기 : bind_rows
cy46 <- bind_rows(cy4, cy6)
cy46

cy4cyl <- select(cy4, cyl)
cy4cyl

cy4hp <- select(cy4, hp)
cy4hp

# 열단위로 결합하기 : bind_cols(데이터셋1, 데이터셋2)
cy4cyhp <- bind_cols(cy4cyl, cy4hp)
cy4cyhp

# bind_cols()
# left_join()
# inner_join()
# full_join()

################################################################################
# 데이터 프레임 조작하기.....

