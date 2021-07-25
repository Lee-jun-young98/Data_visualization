library(plyr)
library(tidyverse)
library(ggplot2)

diamonds1 <- diamonds
mtcars
mtcars1 <- mtcars
rownames(mtcars)
mtcars2<- mtcars1 %>% mutate(car_names=rownames(mtcars))
windows()
ggplot(mtcars2, aes(x=car_names, y=mpg)) +
  geom_bar(stat="identity",fill="blue")

windows()
ggplot(mtcars2, aes(x=mpg, y=reorder(car_names,mpg))) +
  geom_segment(aes(yend=car_names),xend=0, color="blue") +
  geom_point(color="green", size=6)

windows()
ggplot(mtcars2, aes(x=wt, y=mpg, color=factor(am))) +
  geom_point(aes(size=wt)) +
  labs(title="wt와 mpg의 관계")
windows()
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point(aes(color=clarity)) + geom_smooth(aes(group=clarity))

  
  