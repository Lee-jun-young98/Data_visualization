setwd("C://R_data")
library(tidyverse)
library(lubridate)
library(DT)
library(corrplot)
library(tidytext)
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(wordcloud2)
require(devtools)
library(devtools)
install_github("lchiffon/wordcloud2")
ca <- read_csv("CAvideos.csv")
gb <- read_csv("GBvideos.csv")
fr <- read_csv("FRvideos.csv")
us <- read_csv("USvideos.csv")
de <- read_csv("DEvideos.csv")


summary(iris)
##rbind로 데이터합치기
videos <- rbind(gb,fr,ca,us,de)

##년,일,월을 datetime 형태로 변경
videos$trending_date <- ydm(videos$trending_date)

#년,월,일
videos$publish_time <- ymd(substr(videos$publish_time, start=1, stop=10))
videos$dif_days <- videos$trending_date-videos$publish_time
videos

##arrange를 사용해서 video_id로 정렬
videos <- arrange(videos, video_id)
videos
colnames(videos)

##video_id 별로 조회수, 좋아요, 싫어요, 코멘트 수를 집게
mvideo <- aggregate(cbind(views,likes,dislikes,comment_count)~video_id+title+thumbnail_link,videos,sum)
mvideo
str(mvideo)


##내림차순을 정렬
mvideo <- arrange(mvideo, desc(views))
mvideo

##paste0은 공백을 없애주는 함수 데이터 서식은 class로 지정 option은 스크롤바같은거
mvideo %>% mutate(image = paste0('<img width="80%"height="80%"src="',thumbnail_link,'"></img>')) %>% 
  arrange(-views) %>% 
  top_n(10,wt=views) %>% 
  select(image, title, views) %>% 
  datatable(class="nowrap hover row-border", escape = FALSE, options = list(dom='t', scrollX=TRUE, autoWidth=TRUE))


##mvideo 탑10 시각화
mvideo %>% mutate(image = paste0('<img width="80%"height="80%"src="',thumbnail_link,'"></img>')) %>% 
  arrange(-views) %>% 
  top_n(10,wt=views) %>% 
  select(image, title, views) %>% 
  datatable(escape = FALSE)


datatable(iris)
##0.8 이상이면 많은 상관관계를 가지고있음
corrplot.mixed(corr=cor(videos[,c("views","likes","dislikes","comment_count")]))

mvideo_channel <- aggregate(cbind(views,likes,dislikes,comment_count)~channel_title,videos,sum)

windows()

##mvideo_channel에서 상위 10개만 뽑기
ggplot(mvideo_channel %>% top_n(10,views), aes(reorder(channel_title,-views),views, fill=channel_title)) +
  coord_flip() +
  geom_bar(stat="identity") +
  geom_label(aes(label=views)) +
  guides(fill="none") +
  theme(axis.text.x=element_text(angle=45,hjust=1)) +
  labs(caption = "Donyoe", title="Top trending channel titles in all countries") + xlab(NULL) + ylab(NULL)



##가이드라인 없애고 xlab, ylab 없앰
ggplot(mvideo_channel %>% top_n(10,views), aes(reorder(channel_title,-views),views, fill=channel_title)) +
  coord_flip() +
  geom_bar(stat="identity") +
  geom_label(aes(label=views)) +
  guides(fill="none") +
  theme(axis.text.x=element_text(angle=45,hjust=1)) +
  labs(caption = "Donyoe", title="Top trending channel titles in all countries") + xlab(NULL) + ylab(NULL)



##대세가 되기까지의 시간
ggplot(videos %>% subset(dif_days<30),
       aes(as.factor(dif_days),
           fill=as.factor(dif_days))) +
  geom_bar() +
  guides(fill="none") +
  labs(caption="Donyoe", title="Time between published and trending", subtitle = "In days") + xlab(NULL) + ylab(NULL)


##국가별로 나타내기
videos <- rbind(gb %>% mutate(c_code="GB"), fr %>% mutate(c_code="FR"),
                ca %>% mutate(c_code="CA"),
                us %>% mutate(c_code="US"),
                de %>% mutate(c_code="DE"))

videos$trending_date <- ydm(videos$trending_date)
videos$publish_time <- ymd(substr(videos$publish_time, start=1, stop=10))
videos$dif_days <- videos$trending_date-videos$publish_time


##연습문제

ggplot(videos %>% subset(dif_days<30), aes(dif_days, fill=as.factor(dif_days))) + geom_bar() + guides(fill="none")+
  labs(caption="Donyoe", title="Time between published and trending",
       subtitle="In days") + xlab(NULL) + ylab(NULL) +
  facet_wrap(~c_code,nrow=2) +
  scale_x_continuous(breaks=seq(0,max(as.numeric(videos$dif_days)), by=4))


a <- subset(videos, filter=(c_code="GB"))
b <- videos %>% filter(c_code=="GB")


##bi-gram 도출  
biga <- unnest_tokens(videos,bigram,title,token="ngrams",n=2)
biga_agg <- count(biga, bigram, sort=TRUE)
temp <- head(biga_agg, 20)

##워드 클라우드 그리기 전에 분포 살펴보기
ggplot(temp, aes(x=bigram, y=n, fill=bigram)) + geom_bar(stat="identity")

##워드클라우드 그리기
windows()
wordcloud(videos$title, min.freq=5, colors=rainbow(100), random.order = F, rot.per=0.3, scale=c(4,.5), max.words=400) +
  title(main = "videos$title word cloud", font.main=3, cex.main=1.5) +
  theme_dark()

wordcloud2(videos)


wordcloud2(data=biga_agg, size=0.5, fontFamily = '나눔바른고딕')

letterCloud(data=biga_agg, word="R", size=2)

wordcloud2(data=biga_agg, size=1.6, color='random-light', backgroundColor = "black") 

windows()
wordcloud(videos$title, min.freq=5, colors=1:1000, random.order = F, rot.per=0.3, scale=c(10,0.2), max.words=600)



  