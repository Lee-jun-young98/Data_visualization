##Renviron KAKAO키 저장하는 공간 만들기
library(usethis)
edit_r_environ()
##키가 잘 저장됐는지 확인
Sys.getenv('KAKAO_MAP_API_KEY')
KAKAO_MAP_API_KEY = 'KakaoAK 9e15ab84e40724ab9e2ced5bdae17f58'
register_google(key="AIzaSyDii6c0OZzdUmsV6rr9h_3mTj8ULcK4GSA")
Sys.getenv('GOOGLE_MAP_KEY')
library(httr)
library(tidyverse)
library(jsonlite)
library(ggmap)

#지역이름 넣기
addr <- '충남 아산시 신창면'
#HTTP 요청 실행하기
res <- GET(url = 'https://dapi.kakao.com/v2/local/search/address.json',
           query = list(query = addr),
           add_headers(Authorization = Sys.getenv('KAKAO_MAP_API_KEY')))
print(x=res)


coord <- res %>% content(as = 'text') %>% fromJSON()
coord
coord$documents
y <- coord$documents$y
x <- coord$documents$x
y
x
keyword <- "헬스"

res <- GET(url = 'https://dapi.kakao.com/v2/local/search/keyword.json',
           query = list(query = keyword,
                        x=x,
                        y=y,
                        radius = 1000,         ##중심점으로부터 반경(단위:미터)
                        page = 1,              ##이동 가능한 페이지 : 1~45
                        size = 15,             ##페이지당 검색 결과 : 1~15
                        sort = 'distance' ),   ##'accuracy' or 'distance'
           add_headers(Authorization = Sys.getenv('KAKAO_MAP_API_KEY')))

keyword <- "헬스"
res <- GET(url = 'https://dapi.kakao.com/v2/local/search/keyword.json',
           query = list(query = keyword,
                        x = x,
                        y = y,
                        radius = 10000,       # 중심점으로부터 반경 (단위:미터)
                        page = 1,            # 이동 가능한 페이지 : 1 ~ 45
                        size = 15,           # 페이지당 검색 결과 : 1 ~ 15
                        sort = 'distance'
           ),
           add_headers(Authorization = KAKAO_MAP_API_KEY))

place <- content(x = res, as = 'text') %>% fromJSON()
place
place$documents
place

center <- c(mean(as.double(place$documents$x)), mean(as.double(place$documents$y)))
place$documents$x
place$documents$y
sch <- get_map(location=center, zoom=11, maptype="roadmap")
sch
windows()
ggmap(sch) + geom_point(place$documents, mapping=aes(x=as.numeric(x), y=as.numeric(y)),
                        shape=1,
                        color='yellow',
                        stroke=2,
                        size=2) +
  geom_text(place$documents, mapping=aes(x=as.numeric(x),
                                         y=as.numeric(y)+0.007),
            label=place$documents$place_name)


