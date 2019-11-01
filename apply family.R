########################################################################apply
#apply(X, MARGIN, FUN, ...) MARGIN: 按行计算或按按列计算，1表示按行，2表示按列
#矩阵、数据框、数组(二维、多维)，按行或列进行循环计算
x<-matrix(1:12,ncol=3)
apply(x,1,sum)
apply(x,2,mean) 

x <- cbind(x1 = 3, x2 = c(4:1, 2:5)); x
myFUN<- function(x, c1, c2) {
     c(sum(x[c1],1), mean(x[c2])) 
}
t1=apply(x,1,myFUN,c1='x1',c2=c('x1','x2'))
data.frame(x1=x[,1]+1,x2=rowMeans(x))
system.time(t1)
#r内置的向量运算如 rowMeans>apply>for、while
########################################################################lapply
#lapply(X, FUN, ...) 适用于列表和数据框
x <- list(a = 1:10, b = rnorm(6,10,5), c = c(TRUE,FALSE,FALSE,TRUE));x
lapply(x,fivenum)#五分位数
#lapply把list数据集进行循环操作，可以用data.frame数据集按列进行循环
#但如果数据集是一个向量或矩阵对象，那么直接使用lapply就不能达到想要的效果了
x <- cbind(x1=3, x2=c(2:1,4:5))
lapply(x,sum)#矩阵的效果不好
lapply(data.frame(x), sum)#数据框的效果就好,但是自动按列组合
########################################################################sapply
#简化版的lapply，返回值为向量，而不是list对象。
#sapply(X, FUN, ..., simplify=TRUE, USE.NAMES = TRUE)
#simplify: 是否数组化，当值array时，输出结果按数组进行分组
#USE.NAMES: 如果X为字符串，TRUE设置字符串为数据名，FALSE不设置
x <- cbind(x1=3, x2=c(2:1,4:5))
apply(x,2,sum)
sapply(x,sum) #不对
sapply(data.frame(x), sum)
a<-1:2
sapply(a,function(x) matrix(x,2,2), simplify='array')
sapply(a,function(x) matrix(x,2,2))
val<-head(letters)
sapply(val,paste,USE.NAMES=TRUE)# 默认设置数据名
sapply(val,paste,USE.NAMES=FALSE)#不设置数据名
########################################################################sapply
#类似于sapply，用来控制返回值的行名
#vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)
#FUN.VALUE: 定义返回值的行名row.names
x <- data.frame(cbind(x1=3, x2=c(2:1,4:5)))
vapply(x,cumsum,FUN.VALUE=c('a'=123123,'b'=0,'c'=0,'d'=0))
y=sapply(x, cumsum);y
row.names(y)<-c("a","b","c","d");y
       
data(quakes)
getColor <- function(quakes) {
  sapply(quakes$mag, function(mag) {
    if(mag <= 4) {
      "green"
    } else if(mag <= 5) {
      "orange"
    } else {
      "red"
    } } )
}
getColor(quakes[c(1:20),])

data(iris)
irisiri<-function(iris){
  sapply(iris$Species,function(Specise){
    if(Specise=="setosa" ){
      "1"
    }else if(Specise=="versicolor"){
      "2"
    }else{
      3
    }
  }
         )
}
irisiri(iris[c(1:12),])

########################################################################mapply
#sapply的变形函数
#mapply(FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE,USE.NAMES = TRUE)
set.seed(1)
x<-1:10
 y<-5:-4
 z<-round(runif(10,-5,5))
 mapply(max,x,y,z)
 n<-rep(4,4)
 m<-v<-c(1,10,100,1000)
 mapply(rnorm,n,m,v)
 ########################################################################tapply
 #用于分组的循环计算
 #tapply(X, INDEX, FUN = NULL, ..., simplify = TRUE)
 #INDEX: 用于分组的索引
 tapply(iris$Petal.Length,iris$Species,mean)
 x<-y<-1:10;x;y 
 t<-round(runif(10,1,100)%%2);t
 tapply(x,t,sum)#即按t中的分类将x累加
 ########################################################################rapply
#只处理list数据，对list的每个元素进行递归遍历，如果list包括子元素则继续遍历
#rapply(object,f,classes="ANY",deflt = NULL,how = c("unlist", "replace", "list"))
#当how为replace时，则用调用f后的结果替换原list中原来的元素
#当how为list时，新建一个list，类型匹配调用f函数，不匹配赋值为deflt
#当how为unlist时，会执行一次unlist(recursive = TRUE)的操作
 x=list(a=12,b=1:4,c=c('b','a'))
  y=pi
  z=data.frame(a=rnorm(10),b=1:10)
  a <- list(x=x,y=y,z=z)
 
 # 进行排序，并替换原list的值
 rapply(a,sort, classes='numeric',how='replace')
 class(a$z$b)
 rapply(a,function(x) paste(x,'++++'),
        classes="character",deflt=NA, how = "list")
 ########################################################################eapply
#对一个环境空间中的所有变量进行遍历
#eapply(env, FUN, ..., all.names = FALSE, USE.NAMES = TRUE)

