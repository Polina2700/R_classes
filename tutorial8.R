library(tidyverse)
airquality%>%head()
##A
# 3 == NA don't use this
is.na(3)
is.na(NA)
c(1,2,3,56,NA) %>% sum()
c(1,2,3,56,NA) %>% sum(na.rm=T)
#remove all rows which contain NA
airquality%>%.[!is.na(.$Ozone),]
airquality%>%filter(!is.na(Ozone))

airquality%>%drop_na()
#other way to do drop_na()
airquality%>%filter(!is.na(apply(.,1,max)))

# a %>% f   f(a)
# a %>% f(.)   f(a)
# a %>% f(b)   f(a,b)
# a %>% {f(b)}   f(b)
# a %>% f(b,.)   f(b,a)

#show 4 last columns 
airquality%>%.[,tail(colnames(.),4)]
airquality%>%select(tail(colnames(.),4))
airquality%>%select(3:6)
airquality%>%select(Wind:Day)

#show 1/15 of rows
airquality%>%.[sample(1:nrow(.),nrow(.)/15),]%>% {rownames(.)<-1:nrow(.);.}
airquality%>%slice_sample(prop=1/15)
airquality%>%sample_frac(1/15)

#show only columns which contain letter "o"
airquality%>%.[,grep("o",colnames(.))]
airquality%>%select(contains("o"))
?select

#Add a new column that shows temp in Celsius
airquality%>%{.$Celsius<-(.$Temp-32)*5/9;.}
airquality%>%mutate(Celsius=(.$Temp-32)*5/9)

#Show the min,max and average temp
airquality%>%mutate(Celsius=(.$Temp-32)*5/9)%>%{c(Max=max(.$Celsius),Min=min(.$Celsius),Avg=mean(.$Celsius))}
airquality%>%mutate(Celsius=(.$Temp-32)*5/9)%>%summarise(max(Celsius),min(Celsius),mean(Celsius))

#Find the safest and the dangerous day to sunbath
airquality%>%filter(max(Solar.R,na.rm = T)==Solar.R |min(Solar.R,na.rm = T)==Solar.R)

##B
#By using rownames_to_column() add the rownames into a column names “Type”, save the new dataframe and from now on use the new one
mtcars%>%rownames_to_column()%>%rename(Type=rowname)->altcars
mtcars%>%{.$Type=rownames(.);rownames(.)<-NULL;.[,c(ncol(.),1:(ncol(.)-1))]}

#How much horsepower do the Mercedes brand cars have on average?
altcars%>%filter(grepl("Merc",Type))%>%summarise(mean(hp))
#for each brand avg hp
altcars%>%mutate(Brand=sapply(str_split(Type," "), \(x){x[1]}))
altcars%>%mutate(Brand=str_extract(Type,"[^ ]*")) %>% group_by(Brand) %>% summarise(mean(hp))

#Count how many cars come in 4, 6 and 8 cylinders.
altcars%>%.$cyl %>% factor %>% summary()
altcars%>%group_by(cyl) %>% summarise(n())
altcars%>%group_by(cyl) %>% summarise(length(cyl))
altcars%>% count(cyl)

#return the min and max value for each numerical column.
altcars%>% select_if(sapply(.,is.numeric))
altcars%>% select_if(is.numeric)
altcars%>% .[,sapply(., is.numeric)]

altcars%>% select_if(is.numeric)%>%summarise_all(c(Min=min,Max=max))
altcars%>% summarise_if(is.numeric,c(Min=min,Max=max))

##C
#How many states are there in the USA?
USArrests%>%nrow()
USArrests%>%count()

#Which are the top three most dangerous states in each of the arrest categories?
USArrests%>%slice_max(order_by=Murder,n=3)
USArrests%>%.[order(.$Assault),]%>%tail(3)

#Sort the states based on the total number of arrests from all three crime categories.
USArrests %>% mutate(Sum=Murder+Assault+Rape) %>% arrange(desc(Sum))
