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


