getwd()
dir()
#Solve A
a<- 3 + 5 -10
a
3+5-10->b
b
c<-4**5
c
log(3*4)
sin(pi) #essentially zero
sqrt(4)/log10(100)
abs(-10)+floor(4.6)+ceiling(3.2)
#Solve B
v0<-c("table", 'chair', "closet", "window")
v0
v0[4]<-"shelf"
v0
v1<-c(1, 4, 3, 15, 75)
v1
v2<-c(5,6,0,sqrt(2), -4)
v2
v1+3->v1
v2*2->v2
v1+v2
1:2+1:4
v1 %*% v2
v1
v2
sum(v1*v2)
c(v1,v2)
#Solve C
d<-c(1, "a", TRUE)
d
f<-(1:100)
f
sum(f)
g<-c((1:100)*(1:100))
sum(g)
mean(f) # the arithmetic mean
min(f)
max(f)
f[-(1:70)]<-0
f[71:length(f)]
f[-1:-70]
f
seq(5,100,5)
f[-(1:20*5)]<--1
f
#Solve D
v<-(100:1)
v<-(-100:-1)
v<-(-1:-100)
seq(50,1000,10)
-5:100*10
seq(1,106,3)
0:35*3+1
1:36*3-2
#Solve E
# ctrl+shift+C
# lst1<-NULL
# lst1[[1]]<-1
# lst1<-c(1, "a", T)
# lst1<-c(2,3,2,"banana", 1:10)
# lst1
l1<-list(1, "a", T)
l1

l2<-list(2,3,2,"banana", 1:10)
l2

l1[[2]]<-"A"
l1

#l1[2:1]

l3<-c(l1,l2)
l3

l2[[5]][4]

l4<-list("beer", 4.3, l1,"KOPER", l2)
l4[[3]][[3]]<--2
l4

l5<-list(4,5.3,1.4,0,-3,3,3)
library(tidyverse)
l5 %>% unlist() %>% sum()
sum(unlist(l5))

#Solve F
matrix(1:35,,7,T)
m1<-matrix(1:9,3,,T)
m2<-matrix(9:1,3)
m3<-matrix(1:4,2,6)

m1+m2

m3-10->m3

m1*3->m1

rbind(cbind(m1,m2),m3)
# %>%
library(tidyverse)
m1 %>% cbind(m2) %>% rbind(m3)
#pipe usage
#a %>% f()      f(a)
#a %>% f(b)     f(a,b)
#a %>% f(b,.)   f(b,a)
#a %>% {f(b)}   f(b)
#a %>% .{2}     a[2]
1:4 %>% {a<-3; b<-10; a+b+sum(.)}

m1^2

#Solve G

m3 %>% dim() 
m3 %>% dim() %>% .[1]
m3 %>% dim() %>% .[2]
ncol(m3)
nrow(m3)

m1[2,1]<--1
m2[,2]
m2[,2,drop=F]
m2[2:3,1:2]<-0
m2
m1[-1,]<-5
m1
m4<-matrix(c("a","b","c","d"),2,,T)
m4
m4 %>% cbind(m3)
iris %>% sapply(class)

# Data frame
data.frame(1:26, letters, A=LETTERS)
m1<-matrix(1:9,3,,T)
m1
df1<-data.frame(A=c("Peter", "Klavdija", "Uros"), B=c("Mursic", "Kutnar", "Godnov"), C=c(T,F,T))
df1

colnames(m1)<-c("column1", "column2", "column3")
rownames(m1)<-c("row1", "row2", "row3")
m1
m1 %>% {rownames(.)<-c("A", "B", "C"):.} #->m1
rownames(m1)[2]<-"mouse"
m1
m1[2,3]
m1["mouse", "column3"]

m1[c(F,T,F),c(F,F,T)]<-100
m1[,"column2"]<-10:12

m1
colnames(df1)<-c("Name", "Surname","Gender")
df1
df1[,1]
df1$Name
df1[,4]<-1:3
df1$Year<-c(88,80,75)
df1[,-4]->df1
df1

#cbind
#iris[iris$Sepal.Length>6,]

df1<-data.frame(A=c("Peter", "Klavdija", "Uros"), 
                B=c("Mursic", "Kutnar", "Godnov"), 
                C=c(T,F,T))
colnames(df1)<-c("Name", "Surname", "Gender")
df1$Year<-c(88,80,75)
df1[4,]<-list("Ademir", "Hujdurovic", T,87)
df1 %>% sapply(class)
v<-1:10
names(v)<-letters[2:11]
v
v1<-1:26
names(v1)<-LETTERS
v1[c("A", "E","I","O", "U")]
l1<-list(m1,df1,v1,5)
l1<-list(matrix=m1,dataframe=df1,vector=v1,number=5)
names(l1)
l1[[4]]
l1$number<-6
l1 %>% .[4:1]
l1[4:1][[1]]
l1$vector %>% {c(.[1:19],sh=19,5,.[20:26])}->l1$vector

l1
#letters[1:2]
#c(1:2,4:5)

#2B6
library(tidyverse)
list(matrix=matrix(1:9,3),dataframe=iris,vector=1:10,number=5) %>% .$dataframe %>% head(2)
#%>% .[[2]] %>% head(2)

#2c
iris$Species
factor(c("good", "bad", "medium", "bad", "medium", "medium"), levels=c("bad", "medium", "good"), ordered = T)->f
f>="medium"
#levels, summary, factor, cut
f1<-factor(c(1,2,3,1,2,3,2,0,3,4))
f1 %>% levels()
#f1 %>% summary() #vector naps?
f1 %>% summary() %>% .["3"]

levels(f1)[3]<-"6"

airquality$Month %>% factor() %>% levels() %>% as.numeric()
month.name
airquality$Month %>% unique %>% month.name[.]

mtcars$cyl %>% unique() %>% length()
mtcars$cyl %>% factor() %>% summary()
#tapply (loop) will discuses later
?mtcars

vpH<-runif(100,0,14)

vpH %>% cut(c(0,3,6,8,11,14), c("s.acid", "w.acid", "neutral", "w.base", "s.base")) %>% summary() %>% .["s.acid"]

children<-sample(0:6,65,replace=T)
children %>% cut(c(-Inf,1,2,6),c("0","1",">=2"),ordered_result = T)

rep(c("Coffee","Beer","Tea", "Juice"),30) %>% factor() %>% sample() %>% .[order(.)]
c("a","c", "b","e","d")[order(c("a","c", "b","e","d"))]

iris %>% .[1:5,1:4] %>% .[order(.$Sepal.Width),]

iris[iris$Species=="setosa" & iris$Petal.Length <1.5,]

airquality %>% .[.$Temp>=50 & .$Temp <=60,]
airquality %>% .[,c("Wind", "Day", "Month")] %>% .[.$Wind>=15/1.6,]
