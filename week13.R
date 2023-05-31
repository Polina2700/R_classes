library(ggplot2)

ggplot(mtcars, aes(x=mpg, y=wt, fill=as.factor(am)))+geom_point()


ggplot(faithful)+
  aes(x=eruptions,y=waiting)+
  geom_point()

ggplot(faithful)+
  geom_point(aes(x=eruptions,y=waiting))

ggplot(data=faithful)+
  geom_point(mapping=aes(x=eruptions,
                         y=waiting))
ggplot()+
  geom_point(data=faithful,mapping=aes(x=eruptions,
                                       y=waiting))

#color
ggplot(data=faithful)+
  geom_point(mapping=aes(x=eruptions,y=waiting,
                         colour=eruptions<3))

ggplot(mtcars, aes(x=mpg,y=wt,
                         colour=mpg<25))+geom_point()

#different geometry
ggplot(data=faithful)+
  geom_histogram(mapping=aes(x=eruptions))

#many layers
ggplot(data=faithful,
       mapping=aes(x=eruptions,
                   y=waiting))+
  geom_density_2d()+
  geom_point()

#1.) Modify the code below to make the points larger squares and slightly transparent. See `?geom_point` for more information on the point layer.

ggplot(faithful) + 
  geom_point(aes(x = eruptions, y = waiting), shape=15, size=4, alpha=0.1)

#Hint: transparency is controlled with `alpha`, and shape with `shape`

#2.)Colour the two distributions in the histogram with different colours


ggplot(faithful) + 
  geom_histogram(aes(x = eruptions, fill=eruptions<3.1))


#Hint 1: For polygons you can map two different colour-like aesthetics: `colour` (the colour of the stroke) and `fill` (the fill colour)

#3.) Colour the distributions in the histogram by whether `waiting` is above or below `60`. What happens?

ggplot(faithful) + 
  geom_histogram(aes(x = eruptions, fill=waiting<60),position = "dodge")


#Change the plot above by setting `position = 'dodge'` in `geom_histogram()` (while keeping the colouring by `waiting`). 

#4.)Add a line that separates the two point distributions. See `?geom_abline` for how to draw straight lines from a slope and intercept.

ggplot(faithful) + 
  geom_point(aes(x = eruptions, y = waiting))+
  geom_vline(aes(xintercept=3))+
  geom_hline(aes(yintercept=70))+
  geom_text(x=2,y=75,label="Hi world")


library(tidyverse)

df<-mpg |>
  group_by(class) |>
  summarise(n=n()) |>
  ungroup()

mpg
df

ggplot(df) + 
  geom_bar(aes(x = class, y=n),stat="identity")


#5.)Use `stat_summary()` to add a red dot at the mean `hwy` for each group

ggplot(mpg) + 
  geom_point(aes(x = class, y = hwy))

ggplot(mpg) + 
  geom_jitter(aes(x = class, y = hwy), width = 0.2)+
  stat_summary(aes(x = class, y = hwy),fun="mean",color="red",size=5, geom="point")

#Hint: You will need to change the default geom of `stat_summary()`

library(esquisse)

library(ggplot2)
ggplot(mpg)+
  aes(x=class, y= hwy)+
  geom_jitter(size=1.2,width = 0.2)+
  labs(title="Class vs. Hwy", subtitle = "Just random cgart",
       caption="Cha, cha, cha")+
  theme_minimal()


ggplot(mpg) + 
  geom_point(
    aes(x = displ, 
        y = hwy, 
        colour = class))

library(ggrepel)

ggplot(mtcars, aes(x=mpg, y=wt,label=row.names(mtcars)))+
  geom+point()+
  geom_label_repel()

ggplot(mpg)+
  geom_point(aes(x=displ,y=hwy,colour=class))+
  scale_color_brewer(type='qual')

ggplot(mpg)+
  geom_point(aes(x=displ,y=hwy,colour=class))+
  scale_color_brewer(palette = "BrBG")

#7.)Modify the code below to create a bubble chart (scatterplot with size mapped to a continuous variable) showing `cyl` with size. Make sure that only the present amount of cylinders (4, 5, 6, and 8) are present in the legend.


ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy, colour = class, size=cyl)) + 
  scale_colour_brewer(type = 'qual')+
  scale_size_continuous(breaks=c(4,6,8),labels = c(4,6,8))


#Hint: The `breaks` argument in the scale is used to control which values are present in the legend.


library(ggplot2)

ggplot(mpg) +
 aes(x = displ, y = hwy) +
 geom_point(shape = "circle", size = 1.5, colour = "#112446") +
 theme_minimal() +
 facet_grid(vars(class))















