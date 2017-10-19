download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data/gapminder-FiveYearData.csv")
gapminder <- read.csv("data/gapminder-FiveYearData.csv")
mean(gapminder$lifeExp)
max(gapminder$year)
gapminder$year == 2007

gapminder2007 <- gapminder[gapminder$year == 2007,]
mean(gapminder2007$lifeExp)
min (gapminder$year)
gapminder1952 <- gapminder[gapminder$year == 1952,]
mean (gapminder1952$lifeExp)
plot(gapminder$lifeExp,gapminder$gdpPercap)
# These are comments
library(tidyverse)
ggplot(data=gapminder,aes(x=gdpPercap,y=lifeExp)) + geom_point()
ggplot(data=gapminder,aes(x=lifeExp,y=year)) + geom_point()
ggplot(data=gapminder,aes(x=year,y=lifeExp)) + geom_point()
ggplot(data=gapminder,aes(x=year,y=lifeExp,by=country,color=continent)) + geom_point() + geom_line()
ggplot(data=gapminder,aes(x=lifeExp,y=year,by=country,color=continent)) + geom_point() + geom_line()
ggplot(data=gapminder,aes(x=year,y=lifeExp,by=country,color=continent)) + geom_point() + geom_line()

ggplot(data=gapminder[gapminder$continent=="Americas",],aes(x=gdpPercap,y=lifeExp,color=continent,by=country)) +
  geom_point()+
  scale_x_log10()+
  geom_smooth(method="lm")+
  facet_wrap( ~ country)

# interactive plotting with plotly
if(!require("plotly")){install.packages("plotly")}

library(plotly)

p <- ggplot(data=gapminder[gapminder$continent=="Americas",],aes(x=gdpPercap,y=lifeExp,color=continent,by=country)) +
  geom_point()+
  scale_x_log10()+
  geom_smooth(method="lm")+
  facet_wrap( ~ country)

p+
  geom_abline()

ggplotly(p)

# making nice labels
 p + labs(x="GDP Capita (x)", y="Life Expectancy in Years (y)", title="Figure 1")+
   scale_color_discrete(name="Continent")
 
 