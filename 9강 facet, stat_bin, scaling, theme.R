library(ggplot2)

## facet_grid 다이아몬드 데이터에서 cut종류별로 그래프 그리는법
ggplot(data=diamonds, aes(x=price)) +
  geom_histogram(binwidth = 3000) + ##binwidth가 작을 수록 촘촘해짐
  facet_grid(~cut)

##facet_wrap 다이아몬드 데이터를 cut종류별로 그림 wrap은 nrow=, ncol=로 나누는 거 지정해 줄 수 있음
ggplot(data=diamonds, aes(x=price)) + 
  geom_histogram(binwidth = 3000) +
  facet_wrap(~cut, nrow=3,ncol=2)

##mpg 데이터로 displ이 x축 hwy가 y축으로 geom_point그리기 
base <- ggplot(mpg, aes(displ, hwy)) + geom_point()
base +
  theme_classic()
  
##base를 class별로 나누어서 열이 3개가 되도록 그리기
base + facet_wrap(~class, ncol=3) +
  theme_classic()


##facet_grid(.~cyl) 뒤에나오면 위에 표시
base + facet_grid(.~cyl) +
  theme_classic()

##facet_grid(drv~.) 앞에나오면 오른쪽 가로에 표시
base + facet_grid(drv~.) +
  theme_classic()

## drv와 cyl를 기준으로 표현
base + facet_grid(drv~cyl) +
  theme_classic()

##stat_bin 통계를 사용해서 기하객체를 설정
d <- ggplot(diamonds, aes(x=price))
d+stat_bin(geom="bar", bins=46)
d+stat_bin(geom="area", binwidth=1000)
?stat_bin

##count 각 빈 bin에 해당하는 관측값의 개수
##density 각 빈의 밀도(전체의합이 1)
##ncount count와 같으나 [0,1] 로 스케일링됨
##ndensity density와 같으나 값의 범위가 [0,1로] 스케일링

##ndensity density와 같으나 범위가 0,1로 스케일링 됨
d+stat_bin(aes(size=..ndensity..), geom="point")
d+stat_bin(aes(fill=..ndensity.., bins=30), geom="bar")



##scaling 예제 scale_x_continuous xlim대신 사용
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point() + 
  scale_x_continuous(limits=c(5,6))


##입력데이터가 연속형 값이라면 scale_color_gradient가 기본
d <- ggplot(diamonds, aes(carat,depth,color=price)) + geom_point() 
d
##scale_colour_gradient 추가하나 안하나 똑같음
d + scale_colour_gradient()

##R에서의 요소형과 같은 이상형 값인 경우 scale_colour_hue가 동작
d2 <- ggplot(diamonds, aes(carat,depth,color=color)) + geom_point()

##색조 Hue(h) 명도 Luminance(l) 채도 Chroma(c)
d2 + scale_colour_hue(h=c(100,360) + 20, c=100, l=65)
##Blues로 파레트 줌
d2 + scale_colour_brewer(palette = "Blues")


##이산데이터 색조정하기
ggplot(iris, aes(Sepal.Width, Sepal.Length)) + geom_point(aes(color=Species))
ggplot(iris, aes(Sepal.Width, Sepal.Length)) + geom_point(aes(color=Species)) + scale_color_hue()
ggplot(iris, aes(Sepal.Width, Sepal.Length)) + geom_point(aes(color=Species)) + scale_color_hue(h=c(0,360) + 5, l=70, c=50)


##diamonds 데이터를 color, clarity별로 가격의 차이를 알 수 있는 그래프
ggplot(data=diamonds, aes(x=price)) + 
  geom_histogram(binwidth=1000)+
  facet_grid(color~clarity) +
  theme_classic() +
  theme(axis.text.x=element_text(angle=45))
 
##그래프마다 테마 사용법
ggplot() + geom_point() + theme_bw()

##모든 그래프에 하나의 테마를 적용하는 방법
theme_set(theme_classic()) ##이후 그리는 그래프마다 theme_classic 이 적용됨
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point()
