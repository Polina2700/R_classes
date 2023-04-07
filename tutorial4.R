browseURL(".")
dir(recursive = T,pattern="store|word")
install.packages("lubridate")
library("lubridate")
library("readxl")
library("tidyverse")
#A
today() 

today() %>% month(label = T, abbr = F)
today() %>% month() %>% month.name[.]
today() %>% format("%B")

today() %>% format("%A")
today() %>% wday(label=T,abbr=F)
today() %>% weekdays()

v1<-c("13.1.2021","3.Jan.2011","4 March 14")
v1 %>% lubridate::dmy()

"1.Feb.2020" %>% dmy() %>% {today()-.}

"1.1.2023" %>% dmy() %>% {.+years(1)-.}

"25.12.2010" %>% dmy() %>% {.+years(0:9)} %>% weekdays()
"25.12.2010" %>% dmy() %>% {.+years(0:9)} %>% .[wday(.)!=1 & weekdays(.)!=7] %>% year()

"3.1.2021" %>% dmy() %>% {.+years(0:100)} %>% {.[wday(.)==1]<-.[wday(.)==1]+days(1);.} %>% {.[wday(.)==7]<-.[wday(.)==7]+days(2);.}

#B
dB1<-"April 5th 22";dB2<-"30.1.2020"; dB3<-"2/14/00"; dB4<-"2010-6-19"; dB5<-"4. Jan 1999"

dB1 %>% mdy() %>% format("%d.%m.%Y")
dB2 %>% dmy() %>% format("%m/%d/%y")
dB3 %>% mdy() %>% as.character()
dB4 %>% ymd() %>% as.character(format="%d. %b %Y")
dB5 %>% dmy()

dir(recursive = T,pattern="store|word")
"DataTutorial/Sample - Superstore.xls" %>% read_excel()->store

#store %>% sapply(class)
store %>% { .$`Order delay` <- .$`Order delay`-.$`Order delay` ;.}

as.Date(store$`Ship Date`)-as.Date(store$`Order Date`)
difftime(store$`Ship Date`,store$`Order Date`, units = "days")->store$`Order delay`

#C
"2009-1-14 18:30:00" %>% ymd_hms() %>% class()

"24.10.1999" %>% dmy() %>% {c(day(.),month(.),year(.))}
"24.10.1999" %>% str_split("") #for each character
"24.10.1999" %>% str_split("1") 
"24.10.1999" %>% str_split("\\.") %>% unlist() #or [[1]]
"24.10.1999" %>% str_split("\\.") %>% unlist() %>% as.numeric()

"1/1/2017 9:15" %>% dmy_hm() %>% as.Date()

"9:15:00 5 Jan 2020" %>% str_split(" ",n=2) %>% unlist() %>% {paste(.[2],.[[1]])} %>% dmy_hms()

#D
"Zive naj vsi narodi
ki hrepene docakat dan,
da koder sonce hodi,
prepir iz sveta bo pregnan,
da koder sonce hodi,
prepir iz sveta bo pregnan,
da rojak
prost bo vsak,
ne vrag, le sosed bo mejak."->hymn
hymn

hymn %>% cat()
hymn %>% str_count("\n") #each chaarcter
hymn %>% str_count("\n") #the new one
hymn %>% str_count("\n") %>% {.+1} #number of lines
hymn %>% str_split(" |\n") %>% .[[1]] %>% length()
hymn %>% str_count(" |\n") %>% {.+1}

dir(recursive = T,pattern = "word")
"DataTutorial/word.txt" %>% read.table() %>% .[,1]->word
word %>% .[grep("age",.)]
word %>% .[str_detect(., "age")]
word %>% str_split("") %>% unlist() %>% factor() %>% summary() %>% .[order(.,decreasing = T)]
#other solution, not sesitive for Upper and lower case 
word %>% str_count("a|A") %>% sum()
letters %>% str_c("|", LETTERS) %>% sapply(\(x){word %>% str_count("a|A") %>% sum()})