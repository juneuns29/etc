# day10

# 참고 ] 정규성은 표본의 크기가 30개 이상이면 갖춰진 것으로 본다.

# 분산성에 따른 t-test 검사
# t.test(종속변수 ~ 독립변수)               --> 등분산 t-검정
# t.test(종속변수 ~ 독립변수, var.equal=F)  --> 이분산 t-검정

# t_ttest.csv 파일읽기
rr1 <- read.csv('r_ttest.csv', fileEncoding='EUC-KR')
rr1

# 만족도 최대/최소값을 출력하세요.
max(rr1$만족도)
min(rr1$만족도)
# 만족도가 1인 행 추출
rr1[rr1$만족도 == 1,]

summary(rr1)
summary(rr1[,c('성별1', '자격증', '만족도', '조직몰입')])

# 등분산 테스트
var.test(rr1$만족도 ~ rr1$성별1)
# ==> 분산이 동일하지 않다라는 결과가 만들어 졌으므로 이분산 t-test를 수행한다.

t.test(rr1$만족도 ~ rr1$성별1, var.equal=F)
# 귀무가설 : 성별 만족도 차이가 없다.
# 대립가설 : 성별 만족도 차이가 있다.
# ==> p-value = 2.601e-08 이므로 귀무가설(그룹별 만족도가 같다.)이 기각되고
#       대립가설(그룹별 만족도의 차이가 있다.)가 채택


# 대응표본 t-test
before <- c(66,51,69,74,100,63,86,90,69,83,75,72,98,69,67,88,55,56,74,57,56,76,71,85,76,78,62,60,67,67)
after  <- c(90,87,75,73,65,81,96,70,95,71,71,90,95,73,72,67,97,97,71,92,87,95,69,81,81,93,88,96,95,67)

diff <- after - before
diff

# 정규성 검사
shapiro.test(diff)
# p-value = 0.4654 ==> 유의수준보다 크므로 정규성을 띈다.

# 등분산성 테스트는 불필요, paired 속성 추가
t.test(before, after, paired=T)
# 귀무가설 : before와 after의 평균이 같다. 변화가 없다. 같다.
# p-value = 0.005927 이므로 전 후의 차이가 있다.의 결과. 
#         before와 after가 통계적으로 유의미하게 차이가 있다.

# MRI_FA_P.csv 파일 읽기
mrifa <- read.csv('MRI_FA_P.csv')
mrifa


# 열이름 변경
names(mrifa) <- c('pre', 'post')
head(mrifa)

mrifa$diff <- mrifa$post - mrifa$pre

mrifa

summary(mrifa)


# 정규성검사
shapiro.test(mrifa$diff)
# ==> p-value = 0.0896 : 유의수준 0.05보다 크므로 정규분포를 따른다.라는 
#                       귀무가설을 기각할 충분한 이유가 안된다.

# 대응표본 t-test
t.test(mrifa$pre, mrifa$post, paired=T)
# p-value = 1.244e-15 ==> 전후의 차이가 통계적으로 유의하다.


