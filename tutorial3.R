#A
getwd()
dir()
dir.create("DataTutorial")
browseURL("DataTutorial")
dir("DataTutorial")
dir(recursive = T) #download file from e-classroom and put inside the new folder

install.packages("readxl")
install.packages("writexl")
library("readxl")
library("writexl")
readxl::read_excel("DataTutorial/file_example_XLS_50.xls", skip = 2)->df1
df1
library(tidyverse)
df1 %>% as.data.frame() %>% as_tibble()

"https://datahub.io/core/country-list/r/data.csv" %>% read.csv()->df2
df2 %>% writexl::write_xlsx("DataTutuorial/countries.xlsx")
df2[df2$Name=="Slovenia",]


#B
dir(recursive = T)
"DataTutorial/time_series_covid19_confirmed_global.csv" %>% read.csv()->df3
df3 %>% as_tibble()
df3$X3.9.23 #this is the last available date
#lets pretend for the exercises that this date was yesterday
df3 %>% .[.$Country.Region=="Slovenia",ncol(.)-6:0] %>% write.csv("DataTutorial\\sloveniaCovid.csv") 
#6:0 like a vector 0 1 2 3 4 5 6 and we use \\ or /, \ doesn't work(cuz \n \t)

df3$X3.9.23 %>% sum() #cumulative
sum(df3$X3.9.23)-sum(df3$X3.8.23) #just new

df3[,c(2,ncol(df3))] %>% write.csv(qzfile("DataTutorial/covidyesterday.csv.gz"))

#C
dir(recursive = T)
"DataTutorial/SI.zip" %>% unzip(list = T)
"DataTutorial/SI.zip" %>% unzip(exdir="DataTutorial")
"DataTutorial/SI.txt" %>% read.table(sep="\t") %>% .[,-4:-9]->df4
"DataTutorial/SI.txt" %>% read.csv(sep="\t") #,read.delim()

grep("na",c("Banana", "Nanos", "nanny", "mango", "nonsence"))
grep("(n|N)a",c("Banana", "Nanos", "nanny", "mango", "nonsence"))
grepl("[nN]a",c("Banana", "Nanos", "nanny", "mango", "nonsence"))
c("Banana", "Nanos", "nanny", "mango", "nonsence") %>% .[grep("na",.)]
df4$V3 %>% .[grep("z",.)]
df4 %>% .[grep("h|H",.$V3),2:3]
df4 %>% .[grep("r$",.$V3),2:3] #names that end with f
df4 %>% .[grep("r$",.$V3),3,drop=F]

df4 %>% .[.$V2>= 6000 & .$V2 <= 7000, 2:3] %>% write.table(file="DataTutorial/coast.txt", sep="\t", row.names=F)

#D
dir(recursive = T)
"DataTutorial/Sample - Superstore.xls" %>% readxl::read_excel()->df5
"DataTutorial/Sample - Superstore.xls" %>% readxl::excel_sheets()

df5$`Customer Name` %>% unique()
df5$`Customer Name` %>% unique() %>% .[grep(" .* ",.)]
df5$`Customer Name` %>% unique() %>% .[grep(" .+ ",.)]