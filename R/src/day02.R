# 벡터 값 연산

k <- c(10, 40, 30, 70, 80)

k

k + 30

# k의 데이터 중 50보다 큰 데이터만 추출
k > 50

k[c(T, F, F, F, F)] # T : TRUE, F : FALSE

k[k > 50]

k[3:5] # k의 데이터중 3번째에서 5번째 데이터 추출해서 벡터를 만든다.

max(k[1:3])

sort(k) # 반환값만 정렬되어서 반환된다. 원 벡터는 정렬되어있지 않다.

k

k <- sort(k)
k

k1 <- sort(k, T)

k

k1

score <- rep(70, 50)

score

nums <- 1:10
nums

nums <- seq(1, 10)
nums

nums1 <- c(1:10)
nums1

nums <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
nums

no = 10
is.double(no)
is.integer(no) # R에서 숫자 데이터의 기본 타입은 double이다.

is.integer(as.integer(no))

chars <- rep(c('a', 'b', 'c'), 5)
chars

nos <- seq(from=10, to=100, by=20)
nos

seq(10, 100, 20)
seq(10, to=100, 20)


x <- 1:5
y <- 3:7

x + y

x * y

################################################################################
#################################### matrix ####################################

# matrix(행열) - 행과 열로 구성된 자료구조
# 만드는 방법
#         matrix(데이터, 행수, 열수)
matrix(1, 5, 2) # 데이터 1을 5개의 행 2개의 열로 이루어진 행열을 만든다.

matrix(1, nrow=2, ncol=5)

vec1 <- c(1:12)
vec1

matrix(vec1, 4, 3)

matrix(vec1, 6, 2)

matrix(vec1, 1, 12)
matrix(vec1, 12, 1)

# matrix는 기본적으로 첫번째 열부터 채워진다.

# 행부터 먼저 채우고 싶은 경우는
m1 <- matrix(vec1, 4, 3, byrow=T)
m1

x1 <- 1:5
x2 <- 6:10
x1
x2

# 벡터를 컬럼단위로 결합
m2 <- cbind(x1, x2)
m2

# 벡터를 행단위로 결합
m3 <- rbind(x1, x2)
m3

x3 <- 11:14

m4 <- rbind(x1, x3) # 결합하는 벡터의 갯수는 동일해야 한다.

a <- matrix(1:30, nrow=5, ncol=6)
a

a[1,]

a[,1]

a[3,] # 3번째 행 추출

a[2:5, 4:6]

a[2:4, 3:4]

a[c(2, 4), c(1, 3, 5)]

###############################################################################

grade <- matrix(c(95, 87, 79, 85,
                  95, 93, 56, 86,
                  92, 85, 77, 65),
                nrow=4, ncol=3, byrow=T
                )
grade

# 행 이름 추가
rownames(grade) <- c('제니', '리사', '로제', '지수')
grade

# 열 이름 추가
colnames(grade) <- c('java', 'oracle', 'spring')
grade


grade['리사', 'oracle']
grade['지수', 'spring']

# 제니의 열이름들 추출
colnames(grade) # 열이름
rownames(grade) # 행이름

thirdname <- colnames(grade)[3]
thirdname

jisoo <- rownames(grade)[4]
jisoo

matrix(c('jennie', 'lisa', 'rose', 'jisoo',
          80, 70, 100, 60,
          100, 90, 80, 50
         ),
       nrow=4, ncol=3, byrow=F
       )

# matrix의 데이터들의 타입은 하나로만 정할 수 있다.

# 함수
#   nrow()
#   ncol()
#   rowSums()
#   colSums()
#   rowMeans()
#   colMeans()

grade
nrow(grade) # 행갯수 추출
ncol(grade) # 열갯수 추출

rowSums(grade) # 행별 합계. ==> 각 학생별 총점
colSums(grade) # 열별 합계. ==> 각 과목별 총점

rowMeans(grade) # 행별 평균 ==> 각 학생별 평균
colMeans(grade) # 열별 평균 ==> 각 과목 평균

apply(grade, 1, sum)
apply(grade, 2, sum)

apply(grade, 1, mean)
apply(grade, 2, mean)

# 행열에서 결측치 처리

# 1. 결측치가 있는 행열을 만든다.
v1 <- matrix(1:8, 3, 4, byrow=F)
v1

v1[2, 2] <- NA

v1

# 결측치 확인
is.na(v1)
v1[is.na(v1)]
v1[is.na(v1)] <-              0
v1

# 참고 : 결측치 갯수 확인
v1[2,2] <- NA

v1[3, 3] <- NA 

v1

is.na(v1)

# 전체 결측치 갯수
sum(is.na(v1)) # R에서는 TRUE는 1, FALSE는 0으로 평가된다.

# 행별 결측치 갯수
rowSums(is.na(v1))
# 열별 결측치 갯수
colSums(is.na(v1))

# 참고 ] 무작위수로 행렬 만들기
sample(1:10, 5)

rnorm(5)

rnorm(5, mean=100, sd=5)

# rnorm(갯수, mean=평균, sd=표준편차)

# 1~10사이의 랜덤한 숫자로 4x2의 행열 생성
matrix(sample(1:10, 8), 4, 2)

matrix(rnorm(8, mean=5.5, sd=5), nrow=2, ncol=4)

################################################################################
################################ DataFrame #####################################
# DataFrame : R에서 핵심이 되는 자료 구조
#             다양한 타입의 데이터를 모아서 기억할 수 있는 자료 구조
#           행열과 같은 구조이지만
#           각 열의 데이터가 다르다는 점이 행열과 차이가 있다.

matrix(c(10, 20, 'A', 'B'), nrow=2, ncol=2)

# 만드는 방법
# 벡터를 만든다.
irum <- c('아냐', '본드', '요르', '로이드')
naee <- c(5, 3, 25, 29)

# data.frame(열이름=데이터벡터, 열이름=데이터벡터, ...)

spy <- data.frame(names=irum, ages=naee) # 열이름 정하면서 만드는 방법
spy

gajok <- data.frame(irum, naee) # 변수명이 열이름으로 만들어진다.
gajok

# 자료구조 확인하는 함수 : str(데이터프레임)
str(spy)

# 데이터 꺼내는 방법
spy$names # 열이름으로 꺼내는 방법
spy[,1] # 열 인덱스로 꺼내는 방법
spy[,'names']

colnames(spy)
rownames(spy)

####################################################################
# 내장 데이터 목록 조회
library(help='datasets')

# 내장 데이터 불러오기
data(Titanic)

df <- data.frame(Titanic)

data(cars)

head(cars, 10)
tail(cars, 5)

View(cars)

getwd()

jeju <- read.csv('train.csv')
jeju

head(jeju, 5) # 앞부분 5개 보기
tail(jeju, 10) # 뒷부분 10개 보기

View(jeju)

jeju1 <- readLines('test.csv')
jeju1


jeju2 <- read.table('test.csv', header=T, sep=',')
# header : 첫번째 행을 컬럼이름으로 사용할지를 정하는 속성. 기본값은 FALSE
# sep     : 데이터 구분문자를 지정하는 속성
#           no  name  gen id  pw  의 형식으로 데이터가 저장 된 경우 \t로 구분문자를 지정한다.
jeju2

#################################################################################################################

data(cars)

car1 <- cars

head(car1, 5)
tail(car1, 3)

# 결측치 확인
sum(is.na(car1))

# 특정행 추출해서 변수에 기억하기
car2 <- car1[10,]
car2

car3 <- car1[11:15,]
car3

car4 <- car3[-3,]
car4

car5 <- car4[-c(2),]
car5

car3
car6 <- car3[-c(1, 3),]
car6

car3
car7 <- car3[,'speed']
car7

car8 <- car3[,1]
car8

car9 <- car3[, -2]
car9
car3


