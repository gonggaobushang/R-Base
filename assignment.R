#同时多个赋值
a<-b<-c<-c()
data=c(-12:12)
ifelse(data< -5,"YES","NO")
#不空格的话会出错
ifelse(data<-5,"YES","NO")
#替换factor格式的内容
factor(iris$Species,labels = c(1,2,3))
#可以批量生成变量
assign(x=paste0("a2",3),value = iris$Sepal.Length)

#矩阵命名
a=matrix(c(1,2,3,4),ncol=2,byrow = T)
dimnames(a)<-list(c(1,2),c(3,4)) 

#执行第几个语句
switch (3,
  "1",2,"cha"
)
