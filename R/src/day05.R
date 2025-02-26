# day05

# 정규분포
#       가우스가 처음 정립했기 때문에 가우스 분포라고도 한다.
#       인간과 자연세상에서 일어나는 수많은 일을 설명하는 핵심 개념
#       통계학에서 사용하는 각종 확률 분포중에서도 가장 중요하게 다루는 분포

# 중심 위치의 척도
#     : 자료가 집중하는 경향을 수치적으로 나타내는 척도
#   모평균    : Population Mean - N개로 구성된 모집단의 각 자료값의 산술평균
#             (x1 + x2 + x3 + .... + xN) / N
#   표본평균  : Sample Mean     - n개로 구성된 샘플집단의 각 자료값의 산술평균
#             (x1 + x2 + x3 + ... + xn) / n


data('iris')
# boxplot : 사분위수(25% 50% 75%)

boxplot(Petal.Length ~ Species, data=iris,
        col=c('blue', 'red', 'green'),
        main='품종별 꽃잎 길이',
        xlab='품종',
        ylab='꽃잎 길이'
        )

# ~ : R 의 공식용어로 데이터프레임을 표현하는 표현식의 하나
# ~ 왼쪽은 y축(종속변수)으로 오른쪽은 x축(독립변수)으로 생각하면 된다.