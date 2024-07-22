# day13

data(cars)

install.packages('ggplot2')
library(ggplot2)

reg1 <- lm(dist ~ speed, data=cars)
x <- cars$speed
y <- cars$dist

ggplot(cars, aes(x=x, y=y)) +
    geom_point(color='blue', alpha=0.6) + # 포인트 출력
    geom_smooth(method='lm', se=FALSE, color='red') + # 회귀선
    ggtitle('Atual vs Predicted with R-squared') + # 제목
    xlab('Independent Variable (speed)') + 
    ylab('Dependent Variable (dist)') + 
    annotate('text', x=10, y=100,
             label=paste('R-squared = ',
                          round(summary(reg1)$r.squared, 2)),
             color='black', size=5
             )

# 회귀선 그리기
par(mfrow=c(1,1))
plot(cars$speed, cars$dist)
# 회귀선 추가
abline(reg1, col='red')

# 신뢰구간 및 예측구간 구하기
cnf_int <- predict(reg1, newdata=data.frame(speed=1:100), interval='confidence')
pred_int <- predict(reg1, newdata=data.frame(speed=1:100), interval='predict')

# 그래프
matplot(1:100, cnf_int, type='l', col='blue')
matlines(1:100, pred_int, type='l',  col='red')

##########################################################
# csv 읽기
df2 <- read.csv('Organization2.csv')
head(df2)

reg2 <- lm(Commit ~ Trust+Org_Cult+Stress+HR_Policy+Org_Innv, data=df2)
summary(reg2)

# 다중 공선성분석
# ==> 다중공선성이란 회귀분석에서 독립변수들 간에 강한 상관관계나 선형의존성이 존재하는 경우를 의미하고
#     다중공선성이 존재하면 회귀 모델의 해석 및 예측에 문제 생길 수 있다.

#     회귀 계수의 불안정성
#     통계적 유의미성이 감소
#     모델의 예측력이 감소

library(car)
vif(reg2)

# vif : 특정 독립변수가 다른 독립변수들로부터 얼마나 선형적으로 예측할 수 잇는 지를 나타내는 지표
#       1보다 크면 다중 공선성의 가능성이 있고, 10 이상이면 다중 공선성이 심각할 수 있다.
# 결과해석은 모든 독립변수의 vif가 1보다 크므로 다중공선성의 가능성이 있다.
# 따라서 이것을 해결하고 분석해야 한다.
