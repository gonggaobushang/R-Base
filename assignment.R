#同时多个赋值
a<-b<-c<-c()
data=c(-12:12)
ifelse(data< -5,"YES","NO")
#不空格的话会出错
ifelse(data<-5,"YES","NO")
