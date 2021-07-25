##################################ggplot theme 종류###################################################
theme_bw()
theme_lindraw()
theme_light()
theme_dark()
theme_minimal()
theme_classic()



###########################################facet_grid#############################################################
## facet_grid 다이아몬드 데이터에서 cut종류별로 그래프 그리는법
ggplot(data=diamonds, aes(x=price)) +
  geom_histogram(binwidth = 3000) + ##binwidth가 작을 수록 촘촘해짐
  facet_grid(~cut)

##facet_wrap 다이아몬드 데이터를 cut종류별로 그림 wrap은 nrow=, ncol=로 나누는 거 지정해 줄 수 있음
ggplot(data=diamonds, aes(x=price)) + 
  geom_histogram(binwidth = 3000) +
  facet_wrap(~cut, nrow=3,ncol=2)

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



#######################################################theme_classic()######################################################
##mpg 데이터로 displ이 x축 hwy가 y축으로 geom_point그리기 
base <- ggplot(mpg, aes(displ, hwy)) + geom_point()
base +
  theme_classic()

##########################################################stat_bin()#######################################################

count 각 빈 bin에 해당하는 관측값의 개수
density 각 빈의 밀도(전체의합이 1)
ncount count와 같으나 [0,1] 로 스케일링됨
ndensity density와 같으나 값의 범위가 [0,1로] 스케일링

##stat_bin 통계를 사용해서 기하객체를 설정
d <- ggplot(diamonds, aes(x=price))
d+stat_bin(geom="bar", bins=46)
d+stat_bin(geom="area", binwidth=1000)
?stat_bin

##ndensity density와 같으나 범위가 0,1로 스케일링 됨
d+stat_bin(aes(size=..ndensity..), geom="point")
d+stat_bin(aes(fill=..ndensity.., bins=30), geom="bar")


#################################scale_사용#######################################################

##scaling 예제 scale_x_continuous xlim대신 사용
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point() + 
  scale_x_continuous(limits=c(5,6))


x,y축 : x축과 y축
size : geom의 크기
shape : geom의 모양
linetype : geom의 라인종류
colour : 표면색상
fill : 채움 색상
alpha : geom의 투명도
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



####################################################테마로 그리기##################################################
##완성테마이용
g <- ggplot(mpg, aes(x=displ, y=hwy)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE) +  ##TRUE로 주면 회색선이 나옴
  theme_bw()
g

g+theme(panel.background = element_rect(fill = 'khaki'), ##뒷배경 khaki
        panel.grid.major = element_line(color = "burlywood", size=1.5), ##주안내선
        panel.grid.minor = element_line(color = "tomato", size=0.25,  linetype = "dashed"), ## 보조안내선
        panel.border =  element_blank(), ##틀 없애기
        axis.line.x = element_line(color = "darkorange", ##x축
                                   size=1.5,
                                   lineend ="butt"),
        axis.line.y = element_line(color = "darkorange", ##y축
                                   size=1.5)) +
  labs(title="Modified Background",
       subtitle="하이")


###########################################################그림 삽입###################################################
##이미지 저장
library(png)
library(grid)

img <- readPNG("C://R_data//rogo.png")
g_pic <- rasterGrob(img, interpolate=TRUE)

##베이스 플롯
g <- ggplot(mpg, aes(x=displ, y=hwy)) + 
  geom_point() +
  geom_smooth(method="lm", se=FALSE ) +
  theme_bw()

##그림 삽입 
g + annotation_custom(g_pic, xmin=5, xmax=7, ymin=30, ymax=45)

###################################################x,y축 변경########################################################
## x,y축 변경하는 법(coord_flip)
ggplot(data=mpg, aes(x=class, y=hwy)) + geom_boxplot()
ggplot(data=mpg, aes(x=class, y=hwy)) + geom_boxplot() + 
  coord_flip()

##show.legend 범례지우기
bar <- ggplot(data=diamonds) + geom_bar(mapping=aes(x=cut, fill=cut), show.legend=FALSE, width=1)

## x,y축 바꾸기
bar+coord_flip()

##sta형으로 바꾸기
bar+coord_polar()


#####################################################ggplot연결형 도형 그리기##########################################
##위경도가 포함된 지도 데이터 불러오기
nz <- map_data("nz")

##ggplot 연결형 도형 그리기
ggplot(data=nz,aes(x=long, y=lat, group=group)) + geom_polygon(fill="white", color="black")


##등고선 그리기
d <- ggplot(diamonds, aes(carat, depth))
d+geom_density2d()
## cut종류에 따라 등고선의색을 다르게하기
ggplot(data=diamonds, aes(x=carat, y=depth, color=cut)) + geom_density2d()

##################################구글비즈####################################################
library(tidyverse)
library(googleVis)
setwd("C://R_data")

##서울 지하철 1-4호선 이용승객현황
line <- read.csv("1-4호선승하차승객수.csv", header=T, sep=",")
line


##열이름 영문으로 변경
colnames(line) <- c("line_no", "time", "out", "in")
line


##google 모션 차트 찍기
t1 <- gvisMotionChart(line,idvar="line_no",timevar="time",
                      options=list(width=1000, height=500))
plot(t1)


##구글맵을 이용한 이동경로 표시
data(Andrew)


##gvisMap(데이터, 위치정보, 맵에 표시할 텍스트)
storm1 <- gvisMap(Andrew, "LatLong", "Tip")
plot(storm1)


##구글 Gauge 차트로 실적표시하기
CityPopularity

ex1 <- gvisGauge(CityPopularity)
plot(ex1)

##구글 Gauge차트 실적 표시 심화
ex2 <- gvisGauge(CityPopularity, options=list(min=0, max=800, #최소 최대값 설정
                                              greenFrom=500, greenTo=800, #색영역 지정
                                              yellowFrom=300, yellowTo=500,
                                              redFrom=0, redTo=300,
                                              width=400, height=300)) #프레임 넓이,높이 설정

plot(ex2)


##구글 파이차트
CityPopularity
pie1 <- gvisPieChart(CityPopularity, options=list(width=400, height=300))
plot(pie1)

######################################googleViz 시각화#########################################
library(googleVis)
f1 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")
f1
plot(f1)

##MotionChart
f1 <- gvisMotionChart(Fruits, idvar="Fruit", timevar='Year')
f2 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Date")
plot(f1)
plot(f2)




##PieChart
p1 <- gvisPieChart(CityPopularity, options = list(width=400,height=200))
plot(p1)

p2 <- gvisPieChart(CityPopularity, options = list(width=400,height=200,
                                                  title='City Popularity',
                                                  legend='none',
                                                  pieSliceText='label',
                                                  pieHole=0.5))
plot(p2)
##CandlestickChart

c1 <- gvisCandlestickChart(OpenClose, options = list(title="Candlestick",
                                                     legend='none',
                                                     height=400, width=500))
plot(c1)


##BubbleChart
str(Fruits)
Fruits$Year <- as.factor(Fruits$Year)
b1 <- gvisBubbleChart(Fruits, idvar = 'Fruit', xvar='Sales',
                      yvar = 'Expenses', colorvar='Year', sizevar='Profit',
                      options=list(height=500, weight=800,
                                   hAxis='{minValue:75, maxValue:125}'))
plot(b1)


##AnnotationChart
A1 <- gvisAnnotationChart(data=Stock, datevar="Date",numvar="Value",
                          idvar="Device", titlevar="Title",
                          annotationvar="Annotation",
                          options=list(width=1000, height=500, fill=10, colors="['red', 'blue']"))
plot(A1)




##ScatterChart
M <- matrix(nrow=6, ncol=6)
M[col(M)==row(M)] <- 1:6
d <- data.frame(x=1:6, M)
d

s2 <- gvisScatterChart(d, options=list(
  title="Customizing points",
  legend="right",
  pointSize=30,
  series="{
  0: {pointShape: 'circle'},
  1: {pointShape: 'triangle'},
  2: {pointShape: 'square' },
  3: {pointShape: 'diamond' },
  4: {pointShape: 'star' },
  5: {pointShape: 'polygon' }
  }", width=800, height=400))
plot(s2)

s1 <- gvisScatterChart(women, options=list(
  legend="left",
  lineWidth=2,
  pointSize=0,
  title="Women", vAxis="{title:'weight(lbs)'}",
  hAxis="{title: 'heigth(in)'}",
  width=300, height=300))
plot(s1)

##Table
t1 <- gvisTable(Population,formats=list(Population="#,###",
                                        '% of World Population'='#.#%'),
                options=list(page='enable'))
plot(t1)



##OrgChart
o1 <- gvisOrgChart(Regions, options=list(width=600, height=400,
                                         size='large',allowCollapse=TRUE))
plot(o1)

o2 <- gvisOrgChart(Regions,
                   options=list(width=600, height=400,
                                size='medium', allowCollapse=FALSE))

plot(o2)

##TreeMap
r1 <- gvisTreeMap(Regions, "Region", "Parent", "Val", options=list(fontsize=16))
plot(r1)


##gvisMerge
v1 <- gvisGeoChart(Exports, "Country", "Profit",
                   options=list(width=300, height=300))
plot(v1)

v2 <- gvisGeoChart(Exports,
                   options=list(width=220, height=300))
plot(v2)

M1 <- gvisMerge(v1,v2,horizontal = TRUE)
plot(M1)

##gvisLineChart
df=data.frame(country=c("US","GB","BR"),
              val1=c(10,13,14),
              val2=c(23,12,32))
Line <- gvisLineChart(df)
plot(Line)


##gvisBarChart
Bar <- gvisBarChart(df)
plot(Bar)


##gvisColumnChart
Column <- gvisColumnChart(df)
plot(Column)


##gvisArea
Area <- gvisAreaChart(df)
plot(Area)


##gvisWordTree
wt1 <- gvisWordTree(Cats, textvar="Phrase")
plot(wt1)

##Gauge
Gauge <- gvisGauge(CityPopularity, options=list(min=0, max=800,greenFrom=500, greenTo=800, yellowFrom=300, yellowTo=500,redFrom=0, redTo=300, width=400, height=300))
plot(Gauge)


######################################################월급시각화######################################################
library(tidyverse)
library(dplyr)
library(stringr)
library(forcats)
library(scales)
library(ggplot2)
setwd("C://R_data")

##전공별 급여
df_deg <- read.csv("degrees-that-pay-back.csv")

##학교타입별 급여
df_col <- read.csv("salaries-by-college-type.csv")

##지역별 급여
df_reg <- read.csv("salaries-by-region.csv")


##문자로 되어있는 부분을 숫자로 변경 gsub(찾을것, 바꿀것, 열지정)
df_deg$salary <- as.numeric(gsub('[$,]','',df_deg$Starting.Median.Salary))
df_deg

##df_deg데이터에서 salary의 분포를 histogram으로 그리기
ggplot(data=df_deg, aes(x=salary)) + geom_histogram(binwidth=1200, fill="blue", alpha=0.25)

##df_deg데이터에서 salary의 발생분포를 density plot으로 그리기
ggplot(data=df_deg, aes(x=salary)) + geom_density(outline.type="full")


##중복데이터 확인
df_col %>% group_by(School.Name) %>% 
  mutate(count=n()) %>% 
  filter(count>1) %>% 
  summarise(types=str_c(School.Type, collapse='-'))

##중복 데이터 제거하기[!duplicated(var),]
df_col_nodup <- df_col[!duplicated(df_col),]
nrow(df_col_nodup)

##데이터에 대한 통계량을 제공하여 그래프 형태 결정
d <- ggplot(data=df_deg, aes(x=salary))
d + stat_bin(geom="bar", bins=10)
d + stat_bin(aes(size = ..ndensity..),geom="point", bins=10)
d + stat_bin(geom="area", bins=10)


#################################급여의 분포도 확인######################################
df_start_vs_med <- df_reg %>% 
  select(Starting.Median.Salary, Mid.Career.Median.Salary) %>% 
  gather(timeline, salary) %>%  ##long형으로 변경
  mutate(timeline = fct_rev(as_factor(timeline))) ##timeline을 character형을 factor 형으로 변경 factor의 수준을 내림차순으로 정렬

##gather(data, key="key", value="value",..., na.rm=FALSE, convert=FALSE)


##gather예제
stocks <- tibble(time=as.Date('2009-01-01') + 0:9,
                 X=rnorm(10,0,1),
                 Y=rnorm(10,0,2),
                 Z=rnorm(10,0,4))
stocks
## time빼고 X,Y,Z가 collapse가 되어 stock변수에 들어가고, 각변수가 가지던 값을 Price로 들어감
stocks2 <- gather(stocks, stock, price, -time)
stocks2
stocks2 %>% spread(stock,price)

##salary열을 수치형으로 변경
df_start_vs_med$salary <- as.numeric(gsub('[$,]','',df_start_vs_med$salary))

##6개만 표시
head(df_start_vs_med)


##급여테이블 완성
ggplot(df_start_vs_med, aes(x=salary, fill=timeline)) +
  geom_density(alpha=0.2, color=NA) + ##color=NA를 줘서 경계선을 없앰
  geom_histogram(aes(y=..density..), alpha=0.5, position = 'dodge') + ##position = 'dodge'를 줘서 서로 떨어지게함
  scale_fill_manual(values=c('darkgreen', 'purple4')) + ##색 내맘대로 정하기
  theme(legend.position = "top", axis.ticks.y = element_blank()) ##ticks는 그래프의 해당하는 값과 표시하는 값을 이어주는 실선




