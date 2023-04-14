#A
factorial2<-\(n){prod(1:n)}
factorial2(5)
1:5 %>% factorial()

if(F){1}else{3;"b"}
factorial3<-\(n){if(n<=1){1}else{n*factorial3(n-1)}}
factorial3(5)
1:5 %>% sapply(factorial3)
factorial4<-\(n){ifelse(n<=1,1,n*factorial4(n-1))}
1:5 %>% factorial4()

1 %>% class()
1:3 %>% class()
is.natural<-\(x){if(x>0 & round(x)==x){T}else{F}
is.natural<-\(x){x>0 & round(x)==x}
is.natural<-\(x){ifelse(sapply(x, class) %in% c("integer", "numeric"),x>0 & round(x)==x, F)}
is.natural("banana")

#B
plot(3,4)
x<-seq(0,1,0.1); y<-x
plot(x,y)
#Implicit formula for circle: x^2+y^2=1
#Explicit formula plot(x,f(x)) in this case of circle 
plot(x<-seq(-1,1,0.1),sqrt(1-x^2), type = "l")
plot(x<-seq(-1,1,0.1),-sqrt(1-x^2), type = "l")
#Parametrized t=interval plot(x(t),y(t))
t=c(seq(0,2*pi,0.1),2*pi)
plot(cos(t),sin(t),type = "l")
x<-seq(0,1,0.1); y<-x
points(x,y)
incircle<-\(x,y){x^2+y^2<=1}
mapply(incircle,x,y)
sapply(x,incircle,y=0.5) #only for 1 parameter
points(x,rep(0.5, length(x))) #y repeats until x length

ntr<-\(x,n){x^(1/n)} 
ntr(27,3)
ntr<-\(x,n=2){x^(1/n)} 
ntr(16)

#C
1:24 %>% sample() %>% matrix(6,4)->shuffled
shuffled %>% apply(2,min) #min in a column
shuffled %>% apply(1,min) #min in a row
min_col<-\(m){m %>% apply(2,min)}
min_col(shuffled)
shuffled %>% as.data.frame() %>% sapply(min)