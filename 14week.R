library(tidyverse)

ggplot(mpg)+
  geom_point(aes(x=displ, y=hwy,color=class))+
  theme_minimal()+
  facet_wrap(vars(class), scale="free")+
  scale_color_brewer(palette=4)

#One of the great things about facets is that they share the axes between the different panels. Sometimes this is undiserable though, and the behaviour can be changed with the `scales` argument. Experiment with the different possible settings in the plot below:

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) + 
  facet_wrap(~ drv, scales="free")+
  theme_gray()

#Usually the space occupied by each panel is equal. This can create problems when different scales are used. Modify the code below so that the y scale differs between the panels in the plot. What happens?
  
ggplot(mpg) + 
  geom_bar(aes(y = manufacturer)) + 
  facet_grid(class ~ ., scales="free", space = "free")

ggplot(mpg)+
  geom_bar(aes(x=manufacture))+
  coord_flip()

ggplot(mpg)+
  geom_bar(aes(x=class))+
  coord_polar()


ggplot(mpg)+
  geom_bar(aes(x = class))+
  coord_polar(theta = 'y')+
  expand_limits(y = 70)+
  scale_fill_brewer(type="qual",palette=8)

ggplot(mpg) + 
  geom_bar(aes(x = class)) + 
  scale_y_continuous(limits = c(0, 40))

ggplot(mpg) + 
  geom_bar(aes(x = class)) + 
  coord_cartesian(ylim = c(0, 40))

ggplot(mpg)+
  geom_bar(aes(x = class, fill=class))+
  scale_fill_brewer(type="qual",palette=8)+
  scale_y_continuous(limits = c(0,40))

library(ggthemes)
library(extrafonts)
font_import()
ggplot(mpg) + 
  geom_bar(aes(x = class, fill=class)) + 
  scale_fill_brewer(type="qual",palette=8)+
  coord_cartesian(ylim = c(0, 15))+
  geom_hline(yintercept = 12, linetype="dashed", color="black", linewidth=1.5)+
  geom_text(aes(x=2,y=13,label="It is not difficult!"))+
  theme_minimal()+
  ylab("no. of sold cars")+
  xlab("classes of cars")+
  theme(axis.title.x = element_text(color = "blue",size=12),axis.title.y = element_text(color="grey20", size=12),axis.text.x = element_text(angle=45,hjust=1))



library(patchwork)
p1<-ggplot(mpg) + 
  geom_bar(aes(x = class)) + 
  coord_polar()


p2<-ggplot(mpg) + 
  geom_bar(aes(x = class, fill=class)) + 
  scale_fill_brewer(type="qual",palette = 8)+ 
  scale_y_continuous(limits = c(0, 40))

p3<-ggplot(mpg) + 
  geom_bar(aes(x = class, fill=class)) + 
  scale_fill_brewer(type="qual",palette = 8)+
  coord_cartesian(ylim = c(0, 15))+
  geom_hline(yintercept = 12, linetype="dashed", color="black", linewidth=1.5)+
  geom_text(aes(x=2, y=13, label="It is not difficult!"))+
  theme_minimal()+
  ylab("no. of sold cars")+
  xlab("classes of cars")+
  theme(axis.title.x = element_text(color="blue", size=14),
        axis.title.y = element_text(color="gray20", size=14),
        axis.text.x=element_text(angle=45,vjust=0.8))


(p1 | p2)/p3 + plot_layout(guides='collect')


#regex
library(stringr)
string <- "car"
pattern <- "car"
grepl(pattern, string)
str_match(string, pattern)

string <- c("car", "cars", "in a car", "truck", "car's trunk")
pattern <- "car"
grep(pattern, string)
string <- c("car", "cars", "in a car", "truck", "car's trunk")
pattern <- "car"
str_detect(pattern, string)

string[grepl(pattern,string)]


#special characters: . \ | ( ) [ { ^ $ * + ?
#\- escape character
#. - any (just one) character
#^ - begining of a string
#$ - end of string

string <- c("car", "cars", "in a car", "truck", "car's trunk","transcarmission","ca.s","..cars", " ", "o is a number, 1 is also number","\t","\n","\r")
pattern<-"\\D"
string[grepl(pattern,string)]
#\\D or d for digits
#\\S or s for spaces