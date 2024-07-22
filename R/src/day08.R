# day08

# 공분산
#     두 변수 사이의 관계에 대한 형태, 방향 
#     그리고 밀접관계의 강도를 알 수 있는 척도
#     변수는 독립변수와 종속변수가 있다.
#   반응변수와 응답변수의 관계를 갖는 자료점이 
#   어떤 적합선에 의하여 설명될 수 있으며,
#   모든 자료점가 이 직선에 가까우면 선형적 관계가 강하고 
#   자료점들이 직선을 중심으로 폭넓게 나타나면 선형적 관계가 약하다고 한다.
#   이때 이 직선을 "회귀직선(regression line)"이라 한다.


# 위키백과사전
# 공분산(共分散, 영어: covariance)은 2개의 확률변수의 
# 선형 관계를 나타내는 값이다.
# 만약 2개의 변수중 하나의 값이 상승하는 경향을 보일 때 
# 다른 값도 상승하는 선형 상관성이 있다면 양수의 공분산을 가진다.
# 반대로 2개의 변수중 하나의 값이 상승하는 경향을 보일 때 
# 다른 값이 하강하는 선형 상관성을 보인다면 공분산의 값은 음수가 된다. 
# 이렇게 공분산은 상관관계의 상승 혹은 하강하는 경향을 이해할 수 있으나 
# 2개 변수의 측정 단위의 크기에 따라 값이 달라지므로 
# 상관분석을 통해 정도를 파악하기에는 부적절하다. 
# 상관분석에서는 상관관계의 정도를 나타내는 단위로 
# 모상관계수로는 그리스 문자 ρ를, 표본상관계수로는 알파벳 s를 사용한다.

##########################################################################
# 

##########################################################################
library(openxlsx)

naver1 <- read.xlsx('naver_search02.xlsx')

naver1

getwd()

names(naver1)

# 열이름 변경
names(naver1) <- c('date', 'wth', 'dust')

names(naver1)

naver1


wth <- (naver1$wth - mean(naver1$wth)) / sd(naver1$wth)
wth

dust <- (naver1$dust - mean(naver1$dust)) / sd(naver1$dust)
dust

nom_nv <- data.frame(date=naver1$date, wth, dust)
nom_nv

summary(nom_nv)

# dplyr 을 이용해서 처리하는 방법
library(dplyr)
scale(naver1$wth)
scale(naver1$dust)
naver <- naver1 %>% mutate(
                            across(c('wth', 'dust'), scale, .names='{.col}_stdd')
                           )
# {.col} : across 함수를 적용시키는 열이름을 의미
# scale() 를 naver1의 wth와 dust에 적용시키는데 열을 추가하는 형식으로 덧붙인다.

naver

###########################################################################
# 문제 ]
#     어느 회사에서 생산되는 핸드폰의 
#     베터리 사용시간은 정규분포를 따른다고 한다.
#     이 회사에서 생산되는 핸드폰을 64개를 임의 추출하여 
#     베터리사용시간을 조사했더니
#     평균이 8시간이고 표준편차가 1시간이다.
#     이 휴대전화의 베터리 사용시간의 모평균 m을 신뢰도 95%로 추정하세요.

#x' : 8, s: 1, n:64

low <- 8 - 1.96*1/sqrt(64)
low

high <- 8 + 1.96*1/ sqrt(64)
high

# 7.755 <= m <= 8.245

################################################################################

evmile <- read.csv('evmile_p.csv')

head(evmile)
unique(evmile$모델)

# 정규성 테스트 nomality
evm1 <- subset(evmile, evmile$모델 == 1)
evm1

evm2 <- subset(evmile, evmile$모델 == 2)
evm2

shapiro.test(evm1$주행거리) # ==> W = 0.95356, p-value = 0.653 : 정규성을 띈다.
shapiro.test(evm2$주행거리) # ==> W = 0.86691, p-value = 0.05972 : 정규성을 띈다.

# 등분산성 테스트(Leven's Test)
install.packages('car')
library(car)
leveneTest(evmile$주행거리, evmile$모델)

var.test(evmile$주행거리 ~ evmile$모델)
evmile
# t-test
t.test(evmile$주행거리 ~ evmile$모델)
