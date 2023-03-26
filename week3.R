mylist<-list(x=c(1,5,7), y=c(4,2,6), z=c(0,3,4))

mylist

mylist[2]

mylist[[2]][3]

mylist$y[3]

x <- c(2.1, 4.2, 3.3, 5.4)
x[3]

mylist[2]

masterlist<-list()
masterlist[[1]]<-mylist
masterlist[[2]]<-mtcars

str(masterlist)

masterlist[[2]][[6]][2]
masterlist[[2]]$wt[2]


model<-lm(Ozone~Temp, data=airquality)
str(model)

model[[13]][[2]][7]

summary(model)


# Ozone=-146+2.4*Temp

library(report)
report(model)

x <- c(2.1, 4.2, 3.3, 5.4)
order(x)
x[order(x, decreasing = TRUE)]

a <- matrix(1:9, nrow = 3)
colnames(a) <- c("A", "B", "C")

a[c(1,3),2, drop=FALSE]
a[-2,-2, drop=FALSE]

x
x[-2]

a[,"A", drop=FALSE]
a[,c("A","B"), drop=FALSE]

cars<-as_tibble(cars)

cars[cars$speed>=15 & cars&speed<=20,]
## and &
## or |

airquality<-as_tibble(airquality)
airquality

## day 1,5 10, 15
## %in%

airquality[airquality$Day %in% c(1,5,10,15),]
airquality[airquality$Wind > 10 & airquality$Temp>80 & airquality$Ozone>=50 & !is.na(airquality$Ozone),c("Ozone","Solar.R")]




## subset(dataframe, filter for rows, for colunms)

subset(airquality, Day %in% c( 1, 5,10,15), c("Ozone", "Solar.R"))

subset(airquality, Wind>10 & Temp>80, c("Ozone", "Solar.R"))


##5/ Subset "airquality" for "Ozone" greater than "28", 
##or "Temp" greater than "70". Return the first five rows.
subset(airquality, Ozone>28 | Temp>70)[1:5,]

##1/ Subset the vector, "mtcars[,1]", for values greater than "15.0"
mtcars
mtcars[mtcars[,1]>15.0, 1]

##3 Subset "mtcars" for rows wih "cyl" less than "6",
##and "gear" exactly equal to "4".
mtcars
subset(mtcars, cyl<6 & gear==4)

# arrow
# readxl
# writexl

#write.csv

# c:\work\temp
# c:/work/temp

write.csv2(airquality, "airquality.csv", row.names=FALSE)
head(airquality)

library(writexl)
write_xlsx(airquality, "airquality.xlsx")

data<-read.csv("https://raw.githubusercontent.com/urosgodnov/datasets/master/Airquality.csv")


data2<-data1[,-1]



library(arrow)
start<-Sys.time()
nyc<-read_parquet("data.parquet")
Sys.time()-start

write.csv2(nyc, "nyc.csv")


start<-Sys.time()
nyc1<-read.csv2("nyc.csv")
Sys.time()-start