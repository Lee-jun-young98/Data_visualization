library(googleVis)
data(Fruits)
Fruits1 <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")
plot(Fruits1)

line <- read.csv("1-4호선승하차승객수.csv",header=T, sep=",")
line

line2 <- read.csv("서울지하철_5-8호선_이용현황_시간대별.csv", header=T, sep=",")
colnames(line) <- c("line_no","time","out","in")

t1 <- gvisMotionChart(line, idvar="line_no", timevar="time",
                      options=list(width=1000, height=500))
plot(t1)

colnames(line2) <- c("line_no","time","out","in")
t2 <- gvisMotionChart(line2, idvar="line_no", timevar="time",
                      options=list(width=1000,height=500))
plot(t2)

CityPopularity

ex1 <- gvisGauge(CityPopularity)
plot(ex1)

v1 <- c("korea","china","japan")
v2 <- c(200,300,400)
v3 <- data.frame("hi"=v1, "bye"=v2)
v3
ex2 <- gvisGauge(v3)
plot(ex2)

