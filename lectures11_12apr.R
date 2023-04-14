#11 April
x<-1:5
for(val in x){
  if(val==3){
    next
  }
  print(val)
}

x<-1
repeat{
  print(x)
  x=x+1
  if(x==6){
    break
  }  
}
#replace 11 and 12 lines
x<-1
repeat{
  x=x+1
  print(x)
  if(x==6){
    break
  }  
}

Exercise 1
For the first exercise, write a repeat{} loop that prints all the even numbers from 2 – 10, via incrementing the variable, “i <- 0“.

Exercise 2
Using the following variables:
  
msg <- c("Hello")
i <- 1

Write a repeat{} loop that breaks off the incrementation of, “i“, after 5 loops, and prints “msg” at every increment.

Exercise 3
With, i <- 1, write a while() loop that prints the odd numbers from 1 through 7.

Exercise 4
Using the following variables:
  
msg <- c("Hello")
i <- 1

#Function Apply
apply(airquality,2,mean, na.rm=T)
apply(airquality,1,mean, na.rm=T) #output is average number by rows 

m<-matrix(1:12,3,4)
apply(m,1,mean, na.rm=T)

#Function lapply (goes only by columns)
l=list(a=1:10,b=11:20)
lapply(l, mean)
lapply(airquality,mean, na.rm=T)

#Function sapply 
sapply(airquality,mean, na.rm=T, simplify = T) #vector
lapply(airquality,mean, na.rm=T, simplify= F) #list

#Function tapply
mtcars %>%
  head()
mean(mtcars$mpg)

tapply(mtcars$mpg, mtcars$cyl,mean)
mtcars %>%
  group_by(cyl) %>%
  summarise(mean(mpg))


#SOME EXERSICES

#Defined function

pow <- function(x, y) {
  # function to print x raised to the power y
  result <- x^y
  print(paste(x, "raised to the power", y, "is", result))
}

pow(2,8)

pow <- function(x=2, y=8) {
  result <- x^y
  print(paste(x, "raised to the power", y, "is", result))
}
pow(10)# "10 raised to the power 8 is 1e+08"
pow(y=10)# or pow(,10)    "2 raised to the power 10 is 1024"

check <- function(x) {
  if (x > 0) {
    result <- "Positive"
  }
  else if (x < 0) {
    result <- "Negative"
  }
  else {
    result <- "Zero"
  }
  return(result)
}
check(0)
check(1)
check(-1)


prepareDF<-function(){
  return(list(airquality, mtcars))
}
airquality
mtcars
prepareDF()
prepareDF()[[1]]
prepareDF()[[2]]


multi_return <- function() {
  my_list <- list("color" = "red", "size" = 20, "shape" = "round")
  return(my_list) 
}
a <- multi_return()
str(a)

#Function outer_func
outer_func <- function() {
  a <- 20
  inner_func <- function() {
    a <- 30
    print(a)
  }
  inner_func()
  print(a)
}
a <- 10
outer_func()

#other way 
outer_func <- function() {
  a <- 20
  inner_func <- function() {
    print(a)
    a <- 30
    print(a)
  }
  inner_func()
  print(a)
}
a <- 10
outer_func()
print(a)

#idk
inner_func <- function() {
  print(a)
  a <- 30
  print(a)
}
  outer_func <- function() {
    a <<- 20
    inner_func()
    print(a)
  }
a <- 10
outer_func()
print(a)

vector<-c(1,2,3)
dummy<-function(x){
  return(3*x)
}
sapply(vector, dummy)
sapply(vector, function(x) {x*3})

sapply(vector, function(x,y) { 3 * x*y }, y=1:3)

mapply(function(x,y,z) { 3 * x*y*z},vector,MoreArgs=list(y=1:3,z=1:6))

#12 April

sqrt("a")

tryCatch(sqrt("a"), error=function(e) print("You can't take the square root of a character!"))
i<-1
while (i<5){
  print(i)
  try(sqrt("a"),silent = T)
  i<-i+1
}

sqrt(c(4, 9, "Covid19"))

tryCatch(sqrt(c(4, 9, "Covid19",16)), error=function(e) NA)

sapply(c(4, 9, "Covid19"), function(x) tryCatch(sqrt(x), error=function(e) NA))
sapply(c(4, 9, "Covid19",16), function(x) tryCatch(sqrt(as.numeric(x)), error=function(e) NA))
lapply(c(4, 9, "Covid19",16), function(x) tryCatch(sqrt(as.numeric(x)), error=function(e) NA))

for (x in c(4, 9, "Covid19", 16)) {
  tryCatch(
    print(sqrt(as.numeric(x))), error = function(e) NA)
}

divide<-function(x,y) {
  if (y!=0){
    print(x/y)
  } else {print("Cannot divide by zero!")}
}
divide(4,2)
divide(4,0)

#Rewrite this code with tryCatch()
divide<-function(x,y) {
  tryCatch(x/y, error=function(e) print("Cannot divide by zero or use strings as parametrs!"))
}
divide(4,2)
divide(4,0)
divide("a",4)

library(tidyverse)
head(airquality)
df<- airquality %>%
    rename("Solar_R"="Solar.R") %>% #new version of value = old version
    select(-c(Month, Day)) %>%
    #dplyr::select(-c(Month, Day)) %>%
    dplyr::filter(Temp>70) %>%
    arrange(desc(Temp)) 

df %>% head()