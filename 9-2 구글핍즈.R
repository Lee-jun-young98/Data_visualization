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
