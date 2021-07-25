setwd("C://R_data")
install.packages("forcats")
install.packages("scales")
library("dplyr")
library("stringr")
library("forcats")
library("tidyverse")
library("scales")
###gather 설명
stocks <- tibble(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10,0,1),
  Y = rnorm(10,0,2),
  Z = rnorm(10,0,4))
stocks
gather(stocks, stock, price, -time)

#전공별 급여
df_deg <- read.csv("degrees-that-pay-back.csv")

#학교타입별 급여
df_col <- read.csv("salaries-by-college-type.csv")

#지역별 급여
df_reg <- read.csv("salaries-by-college-type.csv")

##gsub(a,b,c c열에서 a값을 찾아 b값으로 대신해라)
df_deg$salary <- as.numeric(gsub('[$,]','',df_deg$Starting.Median.Salary))
df_deg

ggplot(df_deg, aes(x=salary)) + geom_histogram(fill="blue", alpha=0.15)

ggplot(df_deg, aes(x=salary)) + geom_density(outline.type="full")

df_col %>% group_by(School.Name) %>% 
  mutate(count=n()) %>% 
  filter(count>1)

##duplicated행 단위로 중복데이터가 제거됨
df_col_nodup <- df_col[!duplicated(df_col),]
nrow(df_col_nodup)

##ggplot 그래프만들기##
d <- ggplot(df_deg, aes(x=salary))
d + stat_bin(geom ="bar", bins=10)
d + stat_bin(geom = "area", bins=10)
d + stat_bin(aes(size=..ndensity..), geom="point", bins=10)


str(df_reg)
df_start_vs_med <- df_deg %>% 
  select(Starting.Median.Salary, Mid.Career.Median.Salary) %>% 
  gather(timeline, salary) %>% 
  mutate(timeline = as_factor(timeline))

df_start_vs_med$salary <- as.numeric(gsub('[$,]','',df_start_vs_med$salary))



ggplot(df_start_vs_med, aes(x=salary, fill=timeline)) +
  geom_density(alpha=0.2, color=NA) +
  geom_histogram(aes(y=..density..), alpha=0.5, position='dodge') +
  scale_fill_manual(values = c('darkgreen', 'purple4')) +
  theme(legend.position = "top", axis.ticks.y = element_blank())


ggplot(df_start_vs_med, aes(salary, fill=timeline)) + geom_density()
ggplot(df_start_vs_med, aes(salary, fill=timeline)) + geom_density(alpha=0.2)
ggplot(df_start_vs_med, aes(salary, fill=timeline)) + geom_density(alpha=0.2, color=NA) ##경꼐선의 컬러가 없어짐

ggplot(df_start_vs_med, aes(salary, fill=timeline)) +
  geom_density(alpha=0.2, color=NA) + geom_histogram(aes(y=..density..))

ggplot(df_start_vs_med, aes(salary, fill=timeline)) +
  geom_density(alpha = 0.2, color=NA) +
  geom_histogram(aes(y=..density..), alpha=0.5, position = "dodge")+
  scale_fill_manual(values=c('darkgreen', 'purple4'))
