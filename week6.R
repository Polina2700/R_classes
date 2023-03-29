library(tidyverse)
library(lubridate)
my_age<-now()-ymd_hms("1975-09-11 13:15:00")
do<-as.duration(my_age)
seconds_to_period(do)
dminutes(15)
ddays(1)

library(arrow)
data<-read_parquet("nicename.parquet")
head(data)
data$duration<-data$tpep_dropoff_datetime-data$tpep_pickup_datetime
do<-as.duration(data$duration)
meanDuration<-mean(do, na.rm=TRUE)
seconds_to_period(meanDuration)

as.Date("09/28/2008", format = "%m / %d / %Y")
format(today(), "%A, %Y-%B-%d")
currentL<- Sys.getlocale()
Sys.setlocale("LC_ALL","German")
Sys.setlocale("LC_ALL", "English_Slovenia")

library(stringr)

#base
number<-100

paste0("There were ", number, " customers that day!")
paste("There were", number, "customers that day!", sep=" ")

#stringr

str_c("There were", number, "customers that day!", sep=" ")
str_length(c("Bruce", "Wayne"))

str_sub(c("Bruce", "Wayne"), 1,4)
str_sub(c("Bruce", "Wayne"), -3,-1)

pizzas<-c("cheese", "pepperoni", "sausage and green peppers")

str_detect(pizzas, pattern = "pepper")
date_ranges <- c("23.01.2017 - 29.01.2017", "30.01.2017 - 06.02.2017")

split_dates <- str_split(date_ranges, pattern = fixed(" - "))

split_dates

ids <- c("ID#: 192", "ID#: 118", "ID#: 001")

# Replace "ID#: " with ""
id_nums <- str_replace(ids, "ID#: ", "")

id_nums

phone_numbers <- c("510-555-0123", "541-555-0167")

str_replace_all(phone_numbers, "-", ".")

names<-c("Sophia Abbe", "Olivia Abbett", "Emma Abbey", "Ava Abbitt", "Isabella Abbot", "Mia Abbott", "Aria Abbs", "Riley Abby", "Zoe Abdon", "Amelia Able", "Layla Abner", "Charlotte Abney", "Aubrey Aborn", "Lily Abrahams", "Chloe Abram", "Harper Abram", "Evelyn Ace", "Adalyn Acey", "Emily Acker", "Abigail Ackerley", "Madison Ackerly", "Aaliyah Ackerman", "Avery Ackers", "Ella Ackert", "Scarlett Ackland", "Maya Ackland", "Mila Ackley", "Nora Acklin", "Camilla Ackroyd", "Arianna Acock", "Eliana Acomb", "Hannah Acomb", "Leah Acors", "Ellie Acre", "Kaylee Acreman", "Kinsley Acres", "Hailey Acton", "Madelyn Acuff", "Paisley Acy", "Elizabeth Adams", "Addison Adcock", "Isabelle Adcox", "Anna Addams", "Sarah Adderley", "Brooklyn Adderly", "Mackenzie Addicott", "Victoria Addington", "Luna Addy", "Penelope Ade", "Grace Ades")
str_sub(names)


split_names <- str_split(str_sub(names), pattern = fixed(" "), simplify = TRUE)
split_names

nameC = str_sub(split_names[,1], 1, 1)

new_names = str_c(nameC, ". ", split_names[,2])
new_names

sum(str_count(split_names, pattern = "a$"))
sum(str_count(split_names, pattern = "h$"))
sum(str_count(split_names, pattern = "s$"))
sum(str_count(split_names, pattern = "e$"))


x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")

x <- c(2,5,3,9,8,11,6)

count <- 0

for (val in x) {
  if(val %% 2 == 0)  count = count+1
}
print(count)

a = c(2,5,3,9,8,11,6)
ifelse(a %% 2 == 0,"even","odd")

a <- 1:10
b <- 1:10
res <- numeric(length = length(a))
for (i in seq_along(a)) {
  res[i] <- a[i] + b[i]
}
res

res1<-a+b
a<-1:10
b<-1:5
a+b


#create 500 random numbers between 1 and 10.000

vector_of_random_numbers<-c()
for (i in 1:500){
  vector_of_random_numbers[i]<-sample(1:10000,1)
}
#calculate the number of even and odd numbers
vectorEven<-c()
vectorOdd<-c()
for(j in vector_of_random_numbers){
  if(j%%2==0){
    vectorEven<-c(vectorEven,j)
  }
  else {
    
    vectorOdd<-c(vectorOdd,j)
  }
}

resultEven<-length(vectorEven)
resultOdd<-length(vectorOdd)
resultEven
resultOdd
#show result

# create 500 random numbers between 1 and 10.000
resultEven <- c()
resultOdd <- c()

for (z in 1:100) {
  vector_of_random_numbers <- c()
  
  for (i in 1:500) {
    vector_of_random_numbers[i] <- sample(1:10000, 1)
    
  }
  
  vectorEven <- c()
  vectorOdd <- c()
  # calculate the number of even and odd numbers
  for (j in vector_of_random_numbers) {
    if (j %% 2 == 0) {
      vectorEven <- c(vectorEven, j)
      
    } else {
      vectorOdd <- c(vectorOdd, j)
    }
    
  }
  
  resultEven <- c(resultEven, length(vectorEven))
  resultOdd <- c(resultOdd, length(vectorOdd))
  
}
mean(resultEven)
mean(resultOdd)