library(tidyverse)
"SportsDatabase.xlsx" -> filename
filename %>% readxl::excel_sheets() %>% sapply(\(x){readxl::  read_excel(filename,sheet=x)})->L

#A1 dfA<-data.frame(Day=1:50,Infected=round(1.2^(1:50))) stores information about the cumulative total infected by day. Add a column that tells the number of new infected each day. 

#A2 In dfA reverse the row order, and then recalculate the number of new infected.

dfA<-data.frame(Day=1:50, Infected=round(1.2^(1:50)))
dfA

c(1,4,10)%>%lead()
c(1,4,10)%>%lag()
c(1,4,10)%>%diff()

dfA%>% mutate(New=Infected-lag(Infected))
dfA%>%mutate(New=c(NA, diff(Infected)))

dfA%>%arrange(desc(Day))%>% mutate(New=c(diff(-Infected),NA))
dfA%>%.[50:1,]
dfA%>%arrange(nrow(.):1)%>%mutate(New=Infected-lead(Infected))

library(tidyverse)
dir(recursive = T,pattern = "SportsDatabase.xlsx")[1] -> filename
filename %>% readxl::excel_sheets() %>% sapply(\(x){readxl::  read_excel(filename,sheet=x)})->L

#B1 In L$Coaches unite() the first and last name into one with a space in between.

L$Coaches%>%unite("Name",2:3,sep=" ")

#B2 In L$Teams seperate() the colors and return a column with unique colors and second column with the number of times it appears as a primary color and a third column with the number of times as secondary. Use pivot_longer or gather.

L$Teams%>%separate(Colors,c("Primary","Secondary"))%>%
  pivot_longer(3:4) %>% group_by(value)%>%summarise(P=sum(name=="Primary"),S=sum(name=="Secondary"))
L$Teams%>%separate(Colors,c("Primary","Secondary"))%>%
  pivot_longer(3:4) %>% count(name,value)%>%pivot_wider(names_from = name,values_from = n) %>% {.[is.na(.)]<-0;.}

#C1 For each team, return the birth year of the oldest player in it.

L$Players %>% inner_join(L$Teams,by=c("TeamID"="TeamID"))%>%
  select(BirthDate, matches("[Nn]ame"))%>% mutate(BirthDate=lubridate::mdy(BirthDate))%>% group_by(Nickname)%>% slice_min(BirthDate) %>% mutate(Year=year(BirthDate))

#%>%you can use .[,5] instead of %>% mutate(Year=year(BirthDate))

#C2 Separate the address from L$Players into three columns, the first with the number, second with names (can be multiple) and the third with the type of road (road,drive,lane, …).  
L$Players%>% select(Address)%>%separate(Address,c("Num","b"),extra = "merge") %>% separate(b,c("c","d","Roads"),sep = " ",fill = "left")%>%unite("cd",c:d,sep = " ",na.rm = T)

#D1 Change the lines with sapply() in the Intro with an appropriate/similar map family function.
#D2 Show the first 2 lines of each dataframe in the list L.
#D3 In the dataframe L$Games, calculate the arithmetic mean of each numeric column. Aftewards, also calcualte the time difference between the oldest and newest day. Hint: lubridate::is.timepoint()/lubridate::is.POSIXct()
for this use purrr::map