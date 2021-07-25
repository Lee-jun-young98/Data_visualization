setwd("C://R_data") ##195번남음
register_google(key="AIzaSyDii6c0OZzdUmsV6rr9h_3mTj8ULcK4GSA")
library(ggmap)
library(googleVis)
library(stringr)
loc <- read.csv("서울_강동구_공영주차장_위경도.csv", header=T)
loc
#지도 받아오기 경도,위도순으로 입력
kd <- get_map(location=c(lon, lat), zoom=13)

kd <- get_map(location=c(127.130900, 37.557346), zoom=13)
ggmap(kd)

kor.map <- ggmap(kd)+geom_point(data=loc, aes(x=LON, y=LAT),
                                size=3, alpha=0.7, color="red")
kor.map
kor.map+geom_text(data=loc, aes(x=LON, y=LAT+0.001, label=주차장명), size=3)


loc2 <- str_sub(loc$주차장명, start=-2, end=-2)
loc2

##for문 한줄로 쓰기
colors <- ifelse(loc2=="구","red","blue")
colors

colors <- c()
for(i in 1:length(loc2)){
  if(loc2[i] == '구'){
    colors <- c(colors, "red")
  } else {
    colors <- c(colors, "blue")
  }
}
kd <- get_map("Amsa-dong", zoom=13, maptype="roadmap")
kor.map <- ggmap(kd) + geom_point(data=loc, aes(x=LON, y=LAT),
                                  size=3, alpha=0.7, color=colors)
kor.map
kor.map + geom_text(data=loc, aes(x = LON, y = LAT+0.001, label=주차장명), size=3)

jeju <- read.csv("제주도여행코스_1일차.csv", header=T)
jeju

jeju1 <- get_map(c(126.528499,33.484355), zoom=10, maptype="roadmap")
jeju.map <- ggmap(jeju1) + geom_point(data=jeju, aes(x=LON, y=LAT), size=3, alpha=0.7, col="red")
jeju.map + geom_path(data=jeju, aes(x=LON, y=LAT), size=1, linetype=2, col="blue") + geom_text(data=jeju, aes(x=LON, y=LAT+0.01, label=장소), size=3)


loc <- read.csv("서울지하철2호선위경도정보.csv", header=T)
loc2 <- read.csv("서울지하철3호선역위경도정보.csv", header=T)
lab_name <- c("2호선", "3호선")
lab_color <- c("green", "red")
center <- c(mean(loc2$LON)-0.03, mean(loc2$LAT))
kor <- get_map(center, zoom=11, maptype = "roadmap")

kor.map <- ggmap(kor) + geom_point(data=loc, aes(x=LON, y=LAT), size=3, color="green") + geom_point(data=loc2, aes(x=LON, y=LAT), size=3, color="red")

kor.map + geom_text(data=loc, aes(x=LON, y=LAT, label=역명), size=3) +
  geom_text(data=loc2,aes(x=LON, y=LAT+0.005, label=역명), size=3)


loc_lib <- read.csv("지역별장애인도서관정보.csv", header=T)
loc_lib
lib <- c(mean(loc_lib$LON)-0.03, mean(loc_lib$LAT))
lib_map <- get_map(lib, zoom=11, maptype="roadmap")
lib_map
lib.map <- ggmap(lib_map) + geom_point(data=loc_lib, aes(x=LON, y=LAT), size=3, color="black")
lib.map + geom_text(data=loc_lib, aes(x=LON, y=LAT+0.01, label=자치구명), size=3)
