# day06
data('iris')

# table() : 자료들의 카운트를 만들어주는 함수
p_len <- table(iris$Petal.Length)

p_len

names(p_len)

# R에서 반복문은  for명령과 while명령이 있고
# for (변수 in 데이터){ 실행내용 }
# while(조건식){ 실행내용 }
# R에서도 마찬가지로 실행내용이 명령 하나인 경우는 {} 블럭기호를 생략할 수 있다.
# 이때 반복문을 제어하는 명령으로
#       break, next 를 이용해서 반복문을 제어한다.

# dplyr 패키지
#     데이터 처리과정에 특화된 R 패키지
#     데이터프레임(data.frame)처리에 필요한 함수들이 포함되어 있다.
#   특징 ]
#         데이터 전처리 과정으로 구성 -> 데이터 정제에 필요한 형태로 구성
#         모델링이나 시각화에 적합한 유형의 데이터 ---> 실무데이터 분석에 적용
#         데이터 분석 프로젝트에서 전처리, 변화, 필터링 을 쉽게 할 수 있다.
#   함수 ]
#         arrange()     - 행단위 정렬
#         filter()      - 행단위 추출
#         group_by()    - 행단위 그룹
#         mutate()      - 새로운열 추가
#         select()      - 특정열 선택
#         summerise()   - 지정행 요약
#         slice()       - 특정행 추출

################################################################################
# lineplot(선그래프)

# 데이터 생성
x <- 1:10
x

y <- seq(2, 20, by=2)
y

# line plot 그리기
plot(x, y,
     type="b",# line의 약자
     main="선그래프",
     col="green",
     #pch=2,
     xlab="X 축",
     ylab="Y 축"
)
points(x, y, col="red", pch=2)
text(x, y, col="blue", pos=2, labels=y)

# plot() type 속성
#   p : 점그래프(point plot)
#   l : 선그래프(line plot)
#   b : 점과 선을 모두 표현
#   o : 데이터 포인트를 점으로 표현하는데 겹치는 경우는 마지막에 그려진 데이터포인트만 표현
#   h : 각 데이터 포인트를 수직으로 표현
#   s : step
#   n : nothing

# barplot: 막대그래프
iris

iris[iris$Species == 'setosa',]

# dplyr 패키지 이용한 슬라이싱
setosa_pwidth <- iris %>% filter(Species == 'setosa') %>% select(Petal.Width)
setosa_pwidth

tbl <- table(setosa_pwidth)
tbl

barplot(tbl,
#        col='yellowgreen',
        col=heat.colors(length(tbl)),
#        col=rainbow(length(tbl)),
        main="Setosa 꽃잎 너비",
        xlab='꽃잎 너비',
        ylab='출현빈도수',
        ylim=c(0,30)
)

# 히스토그램 : hist()
unique(iris$Species)

hist(
  iris[iris$Species == 'setosa',]$Petal.Width,
  col='orange',
  main='Setosa 꽃잎 너비',
  xlab='꽃잎 너비',
  ylab='출현빈도'
)

iris[iris$Species == 'setosa',]$Petal.Width

sum(tbl / 50)

tbl2 <- tbl / 50

# 출현빈도 테이블
tbl
# 출현 비율 테이블
tbl2

col1 <- c('yellow', 'orange', 'pink', 'purple', 'lightblue', 'lightgreen')
#pie chart
pie(
  tbl2,
  main="Setosa 꽃잎 너비 비율",
  col=heat.colors(length(tbl2)),
  radius=1, # 원의 반지름
  init.angle=0 # 그래프의 시작 각도 설정
)
text()



