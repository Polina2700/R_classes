library(lubridate)

Sys.time()
Sys.Date()

#yyyy-mm-dd use this, other are complicated


date<-"2019-05-05"
time<-"18:51:32"

datetime<-paste(date,time)

as.POSIXct(datetime) ## base R
## [1] "2019-05-05 18:51:32 CEST"
as.POSIXlt(datetime) ## base R
## [1] "2019-05-05 18:51:32 CEST"

#lubridate functions below
as_datetime(datetime)
today()
now()

date1<-as_date(date)

date2<-now()
date2-date1
ymd("2017-01-31")
## [1] "2017-01-31"
mdy("Januar 31, 2017")
## [1] "2017-01-31"
dmy("31-Jan-2017")
## [1] "2017-01-31"
dmy("17/10/2018")
## [1] "2018-10-17"
mdy("Январь 31, 2017")
mdy("Z 31, 2017", locate="Russian_Russia.1251")
ymd_hms("2017-01-31 20:11:59")
## [1] "2017-01-31 20:11:59 UTC"
mdy_hm("01/31/2017 08:01")
make_date()
class(as_datetime(today()))
class(today())
x<-ymd_hms("2019-05-05 19:23:13")
x
//class(x)
year(x)
month(x)
#month(x, label = FALSE, abbr = TRUE, locale = Sys.getlocale("LC_TIME"))
month(x, label=TRUE, abbr=FALSE, locale="French_France.1252")
wday(x, label=TRUE, abbr=FALSE, locale="French_France.1252")
