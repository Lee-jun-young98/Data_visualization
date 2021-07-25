library(ggplot2)
library(png)
library(grid)
setwd("C://R_data")


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

##이미지 저장
img <- readPNG("C://R_data//rogo.png")
g_pic <- rasterGrob(img, interpolate=TRUE)

##베이스 플롯
g <- ggplot(mpg, aes(x=displ, y=hwy)) + 
  geom_point() +
  geom_smooth(method="lm", se=FALSE ) +
  theme_bw()

##그림 삽입 
g + annotation_custom(g_pic, xmin=5, xmax=7, ymin=30, ymax=45)


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


##위경도가 포함된 지도 데이터 불러오기
nz <- map_data("nz")

##ggplot 연결형 도형 그리기
ggplot(data=nz,aes(x=long, y=lat, group=group)) + geom_polygon(fill="white", color="black")


##등고선 그리기
d <- ggplot(diamonds, aes(carat, depth))
d+geom_density2d()
## cut종류에 따라 등고선의색을 다르게하기
ggplot(data=diamonds, aes(x=carat, y=depth, color=cut)) + geom_density2d()
