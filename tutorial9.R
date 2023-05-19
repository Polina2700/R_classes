library(tidyverse)
"SportsDatabase.xlsx" -> filename
filename %>% readxl::excel_sheets() %>% sapply(\(x){readxl::  read_excel(filename,sheet=x)})->L

#A1 Return the column with team names and a column with the number of players in each.
L$Teams %>% inner_join(L$Players,by=c("TeamID"="TeamID"))%>%group_by(Nickname)%>%summarise(NumOfPlayers=n())

#A2
L$Teams %>% inner_join(L$Players,by=c("TeamID"="TeamID"))%>%filter(grepl("Blue",Colors))%>%select("FirstName","LastName")

#B1 Do a double inner join, L$Teams inner_join L$Games inner_join L$Teams, the first time across HomeTeamID and the second time VisitTeamID. Which teams played on 2005-09-12?

dfB<-L$Teams %>%inner_join( L$Games,by=c("TeamID"="HomeTeamID")) %>%inner_join(L$Teams,by=c("VisitTeamID"="TeamID"))
dfB1<-dfB%>%filter(as.character(DatePlayed)=="2005-09-12")%>%select(contains("Nickname"))
dfB1

#B2 Use pivot_longer() or gather() and return a column with “home” or “visit” values and a column with the names of the teams.
L$Teams %>% inner_join(L$Games,by=c("TeamID"="HomeTeamID")) %>% inner_join(L$Teams,by=c("VisitTeamID"="TeamID")) %>% select(HomeTeam=Nickname.x,DatePlayed,VisitTeam=Nickname.y) %>% gather(,"Team",-DatePlayed) %>% as.data.frame()

#C1 Make a table of teams x teams (one home one visiting) with NA if they didnt play and the date otherwise. Use pivot_wider or spread.
L$Teams %>% inner_join(L$Games,by=c("TeamID"="HomeTeamID")) %>% inner_join(L$Teams,by=c("VisitTeamID"="TeamID")) %>% select(HomeTeam=Nickname.x,DatePlayed,VisitTeam=Nickname.y) %>% pivot_wider(names_from = VisitTeam,values_from = DatePlayed) %>% .[order(.$HomeTeam),order(colnames(.))] %>% relocate(HomeTeam,.before=Bulldogs)

#OR

L$Teams %>% inner_join(L$Games,by=c("TeamID"="HomeTeamID")) %>% inner_join(L$Teams,by=c("VisitTeamID"="TeamID")) %>% select(HomeTeam=Nickname.x,DatePlayed,VisitTeam=Nickname.y) %>% spread(VisitTeam,DatePlayed)

L$Teams %>% inner_join(L$Games,by=c("TeamID"="HomeTeamID")) %>% inner_join(L$Teams,by=c("VisitTeamID"="TeamID")) %>% select(HomeTeam=Nickname.x,DatePlayed,VisitTeam=Nickname.y) %>% {data.frame(HomeTeam=c(.$HomeTeam,.$VisitTeam),DatePlayed=c(.$DatePlayed,.$DatePlated),VisitTeam=c(.$VisitTeam,.$HomeTeam))}

#C2 Write a function using case_when, that given two numerical values returns 3 if first>second, 1 if first=second and 0 otherwise.

udf<-\(x,y){if(x>y){3}else{if(x==y){1}else{0}}}
udf(1,2)
#udf(1:3,3:1) vector vision doesnt work

udf2<-\(x,y){case_when(x>y~3,x==y~1,T~0)}
udf2(1:3,3:1)

#D2 For each team return the total points of all the games played where a win is worth 3, tie worth 1 and defeat worth 0. Use the user defined function from the previous excercise and if needed rowwise().

L$Teams %>% inner_join(L$Games,by=c("TeamID"="HomeTeamID")) %>% inner_join(L$Teams,by=c("VisitTeamID"="TeamID")) %>% select(Home=Nickname.x,HomeScore,VisitScore,Visit=Nickname.y) %>% rowwise()%>% mutate(HomePoints=udf2(HomeScore,VisitScore),VisitPoints=udf(VisitScore,HomeScore)) %>% select(-2,-3) %>% {data.frame(Team=c(.$Home,.$Visit),Points=c(.$HomePoints,.$VisitPoints))} %>% group_by(Team) %>% summarise(Total=sum(Points)) %>% arrange(-Total)

#D1 How many games did each coach play on their home field?

L$Coaches %>% left_join(L$Games,by=c("TeamID"="HomeTeamID")) %>% select(FirstName,LastName,TeamID) %>% group_by(FirstName,LastName) %>% summarise(sum(!is.na(TeamID)))