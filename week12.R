airquality%>%
  select(Ozone)%>%
  map_dfc(mean, na.rm=T)

files<-list.files(pattern = "*.csv", path = "./Mtcars/",  full.names = TRUE)

allDF<-map_df(files, read.csv2)


airquality%>%select(Ozone)%>%invoke_map(.f=c("mean", "max"),na.rm=TRUE)

airquality%>%
  select(Month, Day)%>%
  mutate(Something=map2_int(Month,Day,sum),Something=as.character(Something))%>%
  as_tibble()


airquality%>%select(Month, Day)%>%mutate(Something=map2_chr(Month,Day,sum))%>%
  head(3)%>%as_tibble()


stupidFunction<-function(x,y){return(sum(x,y))}

airquality%>%
  select(Month, Day)%>%
  mutate(Something=map2_chr(Month,Day,stupidFunction))%>%
  as_tibble()

airquality%>%select(Wind,Temp, Month, Day)%>%
  mutate(Something=pmap_dbl(list(Wind,Temp,Month,Day),sum))%>%
  head(3)%>%as_tibble()

airquality%>%
  select(Ozone,Day)%>%
  dplyr::filter(is.na(Ozone))%>%
  mutate(Something=map2_int(Ozone,Day,max, na.rm=TRUE))%>%
  as_tibble()

x <- list(1, list(2, 3), list(4, list(5)))
x %>% str()
unlist(x[[3]][[2]][1]) #as usually

y<- x %>% list_flatten() |> #pipe was created in package tidyverse 
  list_flatten()
y[[5]]

x<-map(1:100,function(x) Sys.sleep(0.1), .progress = "Pausing...")
x<-map(1:100,\(x) Sys.sleep(0.1), .progress = "Pausing...")

x<- sample(500)
f<- function(x) {
  
  if (!x %in% c(1,2,3)) {
    
    x*2
  } else {
    
    stop("Error!")
  }
}

map(x,f)


map_vec(1:3, \(x) Sys.Date()+x)

map(1:3, \(x) rep(x,x)) |> unlist()
map(1:3, \(x) rep(x,x))%>%list_c()


files <- list.files(pattern = "*.csv", path = "./Mtcars/",  full.names = TRUE)

lst_of_frames <-list()
for (i in 1:length(files)){
  
  x<-files[i]
  df<-read.csv2(x)
  lst_of_frames[[i]]<-df
}
dfAll<-do.call("rbind",lst_of_frames)

f<-list.files(pattern = "*.csv", path = "./Mtcars/",  full.names = TRUE) 

res<-map(f, \(x) read.csv2(x)) %>% list_rbind()


data.frame(value=c(sample(10,20,size=20)))%>%
  distinct() %>%
  summarise(number=n())
unique(c(sample(10,20, size=20)))

n_unique<-function(y) {
  length(unique(y))  
}

mtcars %>% 
  map_int(n_unique) %>% max()

mtcars %>%
  map_dbl(sd, na.rm=TRUE)

library(gt)
library(lubridate)
library(tidyverse)
library(glue)


df<-sp500 %>%
  dplyr::filter(between(date,ymd("2015-12-24"),ymd("2015-12-31"))) %>%
  select(-adj_close) %>% arrange(date) 
df %>% gt()

dfGT<-df %>% gt() %>%
  tab_header(title="SP500", 
             subtitle="Last week of 2015") %>% 
  fmt_date(columns = c(date),date_style = 7) %>% 
  fmt_currency(columns = vars(open, high, low, close),
               currency = "EUR")

dfGT


dfgt <- sp500 %>% 
  mutate(year=year(date),wday=wday(date, label=TRUE, abbr=FALSE, locale = "english"))%>%
  select(year, wday, high, low) %>% 
  group_by(year, wday) %>% 
  summarise(high=mean(high), low=mean(low)) %>% 
  dplyr::filter(year %in% c(2014,2015)) %>% 
  ungroup()

dfgt %>%
  gt()

dfgt %>% gt(rowname_col = "year") %>% 
  fmt_currency(columns=vars(high,low), currency = "EUR")

dfgtL<-dfgt %>% gt(groupname_col = "year") %>% fmt_currency(columns=vars(high,low),                           currency = "EUR")
dfgtL

dfgt %>% dplyr::filter(wday %in% c("Monday","Tuesday")) %>% 
  gt(groupname_col = "year") %>% fmt_currency(columns=vars(high,low),             
                                              currency = "EUR") %>% 
  summary_rows(
    columns = vars(high, low),
    fns = list(average = "mean"))


dfgt %>% dplyr::filter(wday %in% c("Monday","Tuesday")) %>% 
  gt(groupname_col = "year", rowname_col ="wday") %>% 
  fmt_currency(columns=vars(high,low),currency = "EUR") %>% 
  summary_rows(
    groups = TRUE,
    columns = vars(high, low),
    fns = list(
      avg = ~mean(., na.rm = TRUE),
      total = ~sum(., na.rm = TRUE),
      s.d. = ~sd(., na.rm = TRUE)
    )
  )
