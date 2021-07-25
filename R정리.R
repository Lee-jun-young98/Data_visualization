################################### R함수정리 ###################################################

연속적인 숫자값 입력
seq(from = x,to = y ,by= )

생성한 변수 확인
objects()

y 다음 위치에 x 값을 넣으라는 의미
append(변수, x, after = y)

데이터형이 다를 경우 연산 변수 x 변수 y
union(x,y)

x에 있는데 y에 없는 요소 출력하기
setdiff(x,y)

x와 y에 공통적으로 있는 요소 찾기
intersect(x,y)

x의 각 컬럼에 이름 지정하기
names(x) <- c('hi','bye','hello')

벡터에 연속적인 데이터 할당 a부터 b까지 c만큼 증가시키면서 할당
x <- seq(a,b,c)

반복할당
x <- rep(1:3,2)
1 2 3 1 2 3
x <- rep(1:3,each=2)
1 1 2 2 3 3

특정 문자 포함 여부
x %in% y y에서 x가 있는지 검색함 있으면 true 없으면 false

#################################### 매트릭스 ###################################################
매트릭스 만들기
x <- matirx(c(1,2,3,4)
            
매트릭스 만들기(2행으로 만들기)
x <- matirx(c(1,2,3,4), nrow=2)
            
매트릭스 만들기(2행으로 만들고 가로부터 채워넣기)
x <- matirx(c(1,2,3,4), nrow=2, byrow=T)
            
새로운 행추가하기(x에 y z w벡터를 추가)
x <- rbind(x,c(y,z,w))
            
새로운 열추가하기(x에 y z w 벡터를 추가)
x <- cbind(x,c(y,z,w))
            
컬럼 이름 지정하기 x에 'hi','bye','hello' 이름을 지정
colnames(x) <- c('hi','bye','hello')
                      

##########################################배열##################################################

배열 만들기(a에서 b까지의 값으로 y행 z열의 배열을 생성)
x <- array(c(a:b), dim=c(y,z))

배열 만들기(3차원배열 생성, w가 높이)
x <- array(c(a:b), dim=c(y,z,w))

##########################################리스트#################################################

List(키 값 a b c d 그에 대응하는 value값 y z w v를 생성)
x <- list(a='y',b='z',c='w',d='v' )

List 특정 key만 조회하고 싶은 경우
x$key
x$a
x[[a]]
x[1:2]

List 요소추가 x에 key에 value를 추가
x$key <- 'value'

List 요소 삭제
x$key <- NULL

1번째 값을 원소의 속성(벡터)로 출력
x[[1]] 

리스트 길이
legnth(x)

key값 확인
names(x)

value를 얻고싶으면 unlist() 사용
ulj <- unlist(x)
ulj

벡터에 이름을 제거하고 싶으면 unlist()사용
ulj <- unlist(x)

재귀리스트
b <- list(u=5, v=12)
c <- list(w=13)
a <- list(b,c)
a
##[[1]]
##[[1]]$u
##[1] 5
##
##[[1]]$v
##[1] 12
##
##
##[[2]]
##[[2]]$w
##[1] 13


#######################################데이터프레임#############################################

x <- data.frame(첫번째열이름=벡터,두번째열이름=벡터2,세번째열이름=벡터3) 까먹지마 ㅡㅡ

행렬로부터 데이터 프레임 생성하기 a행 b열
x <- matrix(c(a,b,c,d),a,b)

변수명 <- data.frame(x)

데이터프레임라벨명 지정
names(변수명) <- c('이름')

특정조건에 맞는 데이터만 골라서 보고 싶은 경우
subset(변수명,조건)

데이터프레임 합치기 행과열의 개수가 같을때 x,y 둘다 데이터프레임
변수명 <- cbind(x,y)
변수명 <- rbind(x,y)

행과 열의 개수가 다를경우 merge라는 명령 사용
merge(x,y) x를 기준으로 y와 공통으로 있는 컬럼데이터출력

merge(x,y, all=T) 데이터가 없는 것도 모두 나오게 all=T 옵션 지정함

데이터프레임에 행과 열 추가하기
행추가
a <- data.frame()
x <- rbind(x,a)
열추가
x <- cbind(x,a)

데이터프레임 특정 컬럼만 지정 y라는 데이터프레임
x <- subset(y, select=c(지정할 컬럼))

데이터프레임 특정 컬럼만 제외 y라는 데이터프레임
x <- subset(y, select= -제외할 컬럼)

데이터프레임 열 이름 변경하기 y라는 데이터프레임
colnames(y) <- c(열이름)

data frame 함수

데이터 프레임의 열의 개수
ncol(dataframe)

데이터 프레임의 행의 개수
nrow(dataframe)

데이터 프레임의 열 이름 출력
names(dataframe)

데이터 프레임의 행 이름 출력
rownames(dataframe) / row.names(dataframe)

데이터 프레임의 열 이름 출력
colnames(dataframe) / col.names(dataframe)

1,2,3,4,5 행의 순서대로 출력
dataframe[c(1,2,3,4,5),]

1,2,3,4,5 열의 순서대로 출력
dataframe[c(1,2,3,4,5)]

##################################apply, lapply, sapply, tapply, aggregate#######################
apply()
apply(대상,행/열,적용함수) 1이 행기준 2가 열기준


lapply()와 sapply()
lapply는 리스트로 반환
lapply(대상, 적용함수)

2

27

sapply(대상, 적용함수)
2 27


tapply(출력값,기준값,함수)


aggregate(계산될컬럼~기준될컬럼,데이터,함수)
오른쪽에 나옴  왼쪽에 나옴

g <- c('M','F','F','I','M','M','F')
lapply(c('M','F','I'),function(gender),which(g==gender))
##[[1]]
##[1] 1 5 6
##
##[[2]]
##[1] 2 3 7
##
##[[3]]
##[1] 4

##############################dplyr패키지################
library(dplyr)
library(tidyverse)
setwd("C://R_data")
exam <- read.csv("csv_exam.csv")
조건식에 맞는 데이터를 가져옴
x %>% filter(조건식)

##클래스가 1인 데이터만 뽑아줌 true,false
exam %>% filter(class==1)

##클래스가 1이거나 수학점수가 50점이상인 행 추출하기
exam %>% filter(class==1 & math>=50)

##수학점수가 90점이상이거나 영어점수가 90점이상인 행 추출하기
exam %>%  fliter(math >=90 | english >=90)

##1,3,5반에 해당되면 추출
exam %>% filter(class==1 | class ==3 | class==5)

##평균구하기 
mean(displ1$hwy)

## %in% 1,3,5를 포함하는 거 찾기기
exam %>% filter(class %in% c(1,3,5))

##dplyr 함수 조합하기 클래스가 1인행만 추출한 다음 english 추출
exam %>% filter(class==1) %>% select(english)

##exam에서 math열을 가지고옴
exam %>% select(math)

##exam에서 math열만 빼고 가지고옴
exam %>% select(-math)

##exam에서 class,math,english열을 가지고옴
exam %>% select(class,math,english)

##위에서부터 10행까지 가지고옴
exam %>% select(id,math) %>% head(10)

##오름차순 정렬
exam %>% arrange(math)

##내림차순 정렬
exam %>% arrange(desc(math))

##mpg파일에서 제조회사가 audi에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차 데이터 출력
mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  select(hwy) %>% 
  head(5)

##mutate 함수를 이용하여 math+english+science를 더해 total이라는 열을 만듬
exam %>% 
  mutate(total = math + english + science) %>% 
  head

##mutate 함수를 이용하여 mean이라는 열을 동시에 추가
exam %>% mutate(total = math + english + science,
                mean = (math+english+science)/3) %>% head
##mutate 함수를 이용하여 ifelse()적용 true, false 순
exam %>% 
  mutate(test=ifelse(science >=60, "pass", "fail")) %>% head

##smmarise math 평균산출
exam %>% summarise(mean_math=mean(math))

##집단별로 요약하기 class별로 분리
exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math))

##여러 요약 통계랑 한번에 산출하기
exam %>% 
  group_by(class) %>%              ##클래스별로 분리
  summarise(mean_math=mean(math),  ##math 평균
            sum_math=sum(math),    ##math 합계
            median_math=median(math), ## math 중앙값
            n=n())                 #학생 수
##자주 사용하는 요약통계량 함수
함수	의미
mean()	평균
sd()	표준편차
sum()	합계
median()	중앙값
min()	최솟값
max()	최댓값
n()	빈도

##분석절차	기능	dplyr 함수
1	회사별로 분리	group_by()
2	suv 추출	filter()
3	통합 연비 변수 생성	mutate()
4	통합 연비 평균 산출	summarise()
5	내림차순 정렬	arrange()
6	1~5위까지 출력	head()

##클래스가 compact에서 회사별로 묶고 차종수를 세고 내림차순 정렬
mpg %>% filter(class=="compact") %>% 
  group_by(manufacturer) %>%
  summarise(count=n()) %>% 
  arrange(desc(count)

x와 y를 각각 함수식에 넣어서 계산한다.
summarise_each(funs(함수식), x,y)

##id를 기준으로 합친다(변수명 앞 뒤에 겹따옴표 입력)
test1 <- data.frame(id=c(1,2,3,4,5), midterm=c(60,80,70,90,85))
test2 <- data.frame(id=c(1,2,3,4,5), final = c(70,83,65,95,80))
total <- left_join(test1, test2, by="id")

##bind_rows(group_a, group_b)
group_a <- data.frame(id=c(1,2,3,4,5), test=c(60,80,70,90,85))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(70,83,65,95,80))
group_all <- bind_rows(group_a, group_b)

############################ddply패키지#########################################################
ddply(data,기준컬럼,적용함수나 결과들) name을 기준컬럼으로 qty와 price의 합을 따로구해 출력한
ddply(fruits,'name',summarise,sum_qty=sum(qty),sum_price=sum(price))

각행별로 각각 출력하고 싶은경우 transform키워드를 쓴다.
ddply(fruits,'name',transform,sum_qty=sum(qty), pct_qty=(100*qty)/sum(qty))

setwd("C://R_data")
library(dplyr)
library(plyr)
fruits <- read.csv("fruits_10.csv", header=T)
fruits
행과열을 합계로 표시해줌
ddply(fruits,'name',summarise,sum_qty=sum(qty),sum_price=sum(price))
각행과 각열도 같이 표시 할려면 transform
ddply(fruits,'name',transform,sum_qty=sum(qty),sum_price=sum(price))


###################################tidyverse#####################################################
library(dplyr)
library(tidyverse)
setwd("C://R_data")
flights.csv를 불러와서 flights에 저장
flights <- read_csv("flights.csv")

TIME을 포함한 자료를 출력
select(flights,contains("TIME"))

끝이 DELAY로 끝나는 자료를 출력
flights_sml <- select(flights,YEAR:DAY,ends_with("DELAY"), DISTANCE)
flights_sml

ARRIVAL_DELAY 0행부터 60행까지 출력
flights%>%filter(between(ARRIVAL_DELAY,0,60))
flights

테이플 하나하나씩 저장
write_rds(flights,"flights.rds")
read_rds("flights.rds")

width형으로 보여줌
table4a %>% gather('1999', '2000', key="year", value="cases") %>% spread(key="year", value="cases")


long형으로 보여줌
table4a %>% gather('1999', '2000', key="year", value="cases")

두 변수 합치기
table5 %>% unite(new,century,year)

티블로 stocks에 저장
stocks <- tibble(year=c(2015,2015,2015,2015,2016,2016,2016), qtr=c(1,2,3,4,2,3,4), return=c(1.88,0.59,0.36,NA,0.92,0.17,2.66))


변수의 수준을 모든 데이터에 대해 표현하도록 하는 방법
stocks %>% complete(year,qtr)

NA값 채우기
stocks%>% fill(return)

##########################################그래픽기초#############################################
Plot함수

plot(y축데이터, 옵션)
plot(x축데이터, y축데이터, 옵션)
x값을 안주면 자동으로 y값의 개수만큼 x값이 설정됨

main="메인 제목"
sub="서브제목"
xlab="문자", ylab="문자"
ann=F x,y축 제목을 지정하지 않음
tmag=2 제목 등에 사용되는 문자의 확대율 지정
axes=F x,y 축을 표시 하지 않음
axis x,y축을 사용자의 지정값으로 표시

그래프타입선택
type = "p" 점모양 그래프(기본)
type = "l"  선모양 그래프(꺾은선 그래프)
type = "b" 점과 선모양 그래프
type = "s" 왼쪽값을 기초로 계단
type = "S" 오른쪽 값을 기초로 계단
type = "n" 축만 그리고 그래프 그리지 않음
type = "c" "b"에서 점을 생략한 모양
type = "h" 각점에서 x축까지 수직선 그래프
type = "o" 점과 선을 겹쳐서그림

선의 모양 선택
lty=0 lty="blank" 투명선
lty=1 lty="solid" 실선
lty=2 lty="dashed" 대쉬선
lty=3 llty="dotted" 점선
lty=4 lty="dotdash" 점선과 대쉬선
lty=5 lty="longdash" 긴 대쉬선
lty=6 lty="twodash" 2개의 대쉬선

색,기호 등
col=1, col="blue" 색지정 1검정 2빨강 3초록 4파랑 5연파랑 6보라 7노랑 8회색
pch=0, pch="문자" 점의 모양지정
bg="blue" 그래프배경색 지정
lwd="숫자" 선을 그릴때 선의 굵기 지정
cex="숫자" 점이나 문자를 그릴때 점이나 문자의 굵기 지정

#####################################그래프 만들기##############################################
그래프만들기

axis에서 1은 x축 2는 y축

제목 추가 
title(main="제목", col.main="색깔", 옵션)
X축 제목 추가
title(xlab="X축제목", col.lab="색깔", 옵션)
Y축 제목추가
title(ylab="Y축제목", col.lab="색깔", 옵션)

그래프 배치조정
par(mfrow - c(행의개수, 열의개수))
par(new=T) 그래프 중복허용
par(mgp=c(0,1,0)) mgp=c(제목위치,지표값위치,지표선위치))
par(oma=c(2,1,0,0)) 그래프 전체 여백 조정 (아래,왼쪽,위쪽,오른쪽순)

그래프 겹쳐그리기
plot(v1,type="s",col="red",ylim=c(1,10))
lines(v2,type="o",col="blue",ylim=c(1,5))
lines(v3,type="l",col="green",ylim=c(1,10)) lines() 함수를 사용하면 쉽게 그릴 수 있음

그래프에 범례추가하기 까먹지마 ㅡㅡ
legend(x축위치, y축위치, 내용, cex=글자크기, col=색상, pch=크기, lty=선모양)


####################################막대그래프그리기#############################################
angle=, density=, col= 막대를 칠하는 선분의 각도, 선분의 수, 선분의 색을 지정
legend() 오른쪽 상단에 범례를 그림
names() 각 막대의 라벨을 정하는 문자열 벡터를 정함 까먹지마 ㅡㅡ
width 각 막대의 상대적인 폭을 벡터로 지정
space 각 막대 사이의 간격을 지정함
beside= TRUE를 지정하면 각각의 값마다 막대를 그림
horiz= TRUE를 지정하면 막대를 옆으로 눕혀서 그림

rainbow(nrow(qty)) qty의 행개수만큼 레인보우
t전치하면 length(qty)로 해야함
전치하면 x축값 줄때 names.arg=c()로 줘야함
legend(x,y, c(이름), 나머지 옵션,fill=, cex=)
cex.axis= 축 이름 크기


barplot 옵션
space 각 bar들의 간격

las = 0 기본
las = 1 y축 이름 180도 회전
las = 2 x축 이름 180도 회전
las = 3 y축 180도 회전

#############################히스토그램, pie차트, 상자차트#######################################
히스토그램 그래프 그리기 hist()

x로 히스토그램을 그림 y 제목
hist(x, main="y")

pie모양의 차트 그리기 pie()
angle= 각도
density= 수
col= 색상
labels= 각 pie 부분의 이름을 지정하는 문자벡터 지정
radius= 원형의 크기를 지정 pie(x, radius=)
clockwise= 시계방향(T)으로 회전할지 반 시계방향(F)로 회전할지 지정 clockwise=F가 기본값
init.angle= 시작되는 지점의 각도지정 왼쪽으로 돌음
paste(x,y) x와 y를 붙어 하나처럼 만듬

상자차트boxplot()
boxplot(x,y,z) x,y,z벡터로 상자 플롯을 만듬
v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)

boxplot(v1,v2,v3, col=c("blue","yellow","pink"), horizontal=T, names=c("Blue","Yellow","Pink"))

col 박스내부의 색깔 지정
names 각 막대의 라벨을 지정할 문자벡터 지정
horizontal true로 지정하면 상자를 수평으로 그림 아래부터 차례로 나열
range 박스의 끝에서 수염까지의 길이 지정 기본은 1.5
notch true로 지정할 경우 상자의 허리부분을 가늘게 표시
width 박스의 폭을 지정

treemap
x라는 데이터로 같은y를 가진걸 기준으로 출력 a.b로 그룹
treemap(x, vSize="y", index=c("a","b"))


###########################################스타차트#############################################
stars() 스타차트

각행번호로 되어있는 것을 y로 변경해줌
row.names(x) <- x$y

stars(x,flip.labels=FALSE, draw.segment=FALSE, frame.plot=TRUE, full=TRUE, main="y")

flip.labels=TRUE로 적으면 겹칠 수 있음
draw.segment=TRUE 차트가 원으로 나타나고 색깔이 들어감
full = TRUE 차트가 온전히 출력됨, FALSE면 반만 출력됨
frame.plot =FALSE 틀이 사라짐 왜워 ㅡㅡ


##########################################레이더차트#############################################
radarchart() 레이더차트 출력

runif(n,min,max) 최소 최대 사이중 n개만큼 값출력
rnorm(n,mean,sd) 평균과 표준편차를 정해주고 n개만큼 값출력
par(mar=c(bottom,left,top,right)
    
axistype=0 값없음 1 퍼센트로 나타냄 2 각요소에 나타냄 3 퍼센트와 요소 4 상대도수 5 상대도수와 각요소
seg=오각형의 개수
plty=선 모양 lty
pcol=색깔
axislabcol= 표현값 색깔
pty=pch 점의 모양
plwd=선굵기
na.itp=FALSE 빈값 0표기
na.itp=TRUE 빈값을 전값하고 이어줌
    
저수준작도함수
점 points()
직선 lines(), segments(),abline(),
격자 grid(nrow,ncol) nrow와 ncol의 숫자만큼 격자를 만듬
화살표 arrows()
직사각형 rect(bottom,left,top,right)
문자 text(), mtext(), title()
테두리와 축 box(), axis()
범례 legend()
다각형 polygon()
    
segments(2,2,3,3) 점 2,2와 3,3을 지나는 선분 그리기
arrows(5,5,7,7) 점 5,5와 7,7을 지나는 화살표그리기
text(a,b,labels) a,b위치에 문자열 labels 출력
text(2,8, "테스트", str=45) 2,8 지점에 "테스트" 라는 글자를 45도 기울여 출력
    
    
##########################################ggplot2################################################
ggplot2
plyr먼저받고 tidyverse받아요
ggplot(dataframe, aes(x=x축데이터, y=y축데이터)) + geom함수
aes 부분에는 x축데이터 y축데이터 점의 모양, 점의크기, 점의색깔 과 같은 값들이 올 수 있음

aes 뒷부분에 +로 geom함수가 나옴
geom_point()는 반드시 x,y값이 있어야함
geom_bar()는 ymax 값과 bar그래프의 테두리색상과 내부 색상들을 조정할 수 있음

geom부분에 사용될수있는 설정값
stat 주어진 데이터에서 geom에 필요한 데이터 생성
stat_bin 아래에 같은 데이터를 갖는 dataframe출력
count 각 항목의 빈도수
density 각 항목의 밀도수
nucount count와 같으나 값의 범위가 (0,1)로 스케일링
ndensity density와 같으나 값의 범위가 (0,1)로 스케일링
설정값을 지정하지 않으면 count가 기본값

geom_bar(stat="identity") y축에 설정되어있는 값을 그대로 작성
geom_bar(stat="identity",position="dodge")position_dodge는 beside 각각
범레 건들때 사용 거꾸로 뒤집어줌
guides(fill=guide_legend(reverse=T))

theme() 글자와 관련된 기능을 담당
axis.text.x x축 텍스트 수정 axis.text.y y축 텍스트 수정
각도 45도 파랑색 사이즈 8로 객체수정 hjust값이 커지면 왼쪽으로 vjust값이 커지면 위로
theme(axis.text.x=element_text(angle=45 , color="blue", size=8 ,hjust=1,vjust=1)
ggplot이름넣기
labs(title, x, y)

##sort_kem2 ##geom_text쓰는법
ggplot(sort_kem2, aes(x=이름,y=점수,fill=과목)) +
    geom_bar(stat="identity")+
    geom_text(aes(label=paste(점수,'점','\r\n',누적합계,'점')),color="black",size=4,
    position=position_stack(vjust=0.5))
position_stack은 누적합계

cumsum누적합계 더할때 사용


theme_bw() 정해져있는 테마 가져와서 사용하기(하얀색테마)

ggplot에서는 라인타입을 linetype으로 해야함
theme(panel.grid.major.x=element_blank())
주요한 x축 격자를 빈칸처리
theme(panel.grid.major.y=element_line(color="red",linetype="dashed"))
주요한 y축 격자 빨간대쉬선 처리

geom_segment y끝은 이름 x끝은 0 파랑색
geom_segment(aes(yend=이름),xend=0, color="blue")

###########################################스캐터플롯############################################
scatter plot
두 변수간의 관계를 표현
두변수를 x,y에 넣고 관계를 분석할 수 있음
reorder(x,y)내림차순으로 정렬됨
geom_point() 안에 들어갈 함수
colour="색깔"
aes(color=factor(am)) 종류별로 다른 색상 지정하기
size="크기" 크기 지정하기
aes(size=wt) 값별로 다른 크기 지정하기
aes(shape=factor(am), size=wt)) 종류별로 크기와 모양 지정하기
shape=22 22번모양 정사각형
aes(group=이름,fill=이름) 이름으로 그룹을 묶음 이름으로 색깔을채움
+ scale_color_manual(values=c("red","green")) 색깔 지정
scale_color_manual(values=c("red","green"))
values에 해당하는 값이 들어옴
geom_point() 뒤에 +geom_line() 선추가하기
+ labs(x="이름", y="이름y") x축 y축 이름바꾸기

평균선 추가하기
평균값구하기
aver <- mean(x$평균값구하고싶은열)

abline(h=aver, col="색깔") h는 높이

text(x, y, col="색깔", cex=글자크기, labels=paste넣고싶은말)

text(x=bp*1.01, y=data$연봉대비출루율*1.05, col="black", cex=0.7, labels=paste(넣고싶은말))

##2중축 그래프겹쳐그리기
line1 <- data$연봉대비출루율
line2 <- data$출루율
line1
line2
plot(line1, main="한국프로야구선수별 기록분석",xlab="",ylab="",axes=T, lty=2,col="blue", type="o", ylim=c(0,50))
par(new=T)
plot(line2, axes=F, ylab="", xlab="", lty=2, col="red", type="o")
axis(4,las=1)
이중축만들기
axis(넣고싶은곳 , las=) 1하단 2 좌측 3 상단 4 우측

#####################################ggplot 2중축만들기####################################################
pressure2 <- pressure %>% mutate(date=seq(Sys.Date()-18,Sys.Date(),1))
pressure2       
ggplot(pressure2, aes(x=date)) +
  geom_line(aes(y=temperature, color="temperature")) +
  geom_line(aes(y=pressure, color="pressure"), lty=2)


###################################geom_smooth##############################################################
s <- ggplot(data=diamonds,aes(x=carat,y=price))
s

ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point(aes(color=clarity)) + geom_smooth(aes(group=clarity),se=FALSE)
##################################날짜데이터만들기########################################################
date <- Sys.Date() - seq(0,18,by=1)

month <- as.character(date,'%m')
day <- as.character(date,'%d')
day
month
month <- month.abb[as.numeric(month)]
date <- paste(month,day)
date

###################################geom_histogram#############################################################
ggplot(data=diamonds,
       aes(x=price)) + 
  geom_histogram(aes(fill=cut), binwidth=1000)

###beside기능 = position="dodge"
ggplot(data=diamonds,
       aes(x=price)) + 
  geom_histogram(aes(fill=cut), binwidth=1000, position="dodge")

##position="fill" 시각화플롯 전체채움
ggplot(data=diamonds,
       aes(x=price)) +  geom_bar(aes(fill=cut), binwidth=1000,
                                 position="fill")






