# %>% 将左边的发送到右边并作为第一个参数，减少赋值，节省内存
library(sqldf)
library(rvest)
web<-read_html('http://blog.sciencenet.cn/home.php?mod=space&uid=556556&do=blog&view=me&page=')
a=web %>% html_nodes("dl.bbda dt.xs2 a") %>% html_text()
web %>% html_nodes("dl.bbda dt.xs2 a") %>% html_text()%>% .[seq(2,20,2)] #即a[seq(2,20,2)]
gsub("\\?source\\=search","",web %>% html_nodes("dl.bbda dt.xs2 a") %>% html_attr("href"))%>% .[c(seq(2,20,2))]
web %>% html_nodes("dl.bbda dd span.xg1") %>% html_text() %>% as.Date()

count_of_read <- web %>% html_nodes("dl.bbda dd.xg1 a") %>% html_text()
count_of_read <- as.data.frame(count_of_read)
count_of_read <- sqldf("select * from count_of_read where count_of_read like '%次阅读'")

library(magrittr)
################################################### %>% 向右操作符
# 设置随机种子
 set.seed(1)
# 开始 
n1<-rnorm(10000)            # 第1步
n2<-abs(n1)*50              # 第2步
n3<-matrix(n2,ncol = 100)   # 第3步
n4<-round(rowMeans(n3))     # 第4步
hist(n4%%7)                 # 第5步

set.seed(1)

rnorm(10000) %>%
     abs %>% `*` (50)  %>%
     matrix(ncol=100)  %>%
     rowMeans %>% round %>% 
     `%%`(7) %>% hist       #不用加括号
################################################### %T>% 向左操作符
#相当于过渡一个环节，比如画图
rnorm(10000) %>%
  abs %>% `*` (50)  %>%
  matrix(ncol=100)  %>%
  rowMeans %>% round %>% 
  `%%`(7) %T>% hist  %>% sum  

################################################### %$% 解释操作符
data.frame(x=1:10,y=rnorm(10),z=letters[1:10]) %$% .[which(x>5),]

rnorm(10) %>% `*`(5) %>% `+`(5)

rnorm(10)    %>%
      multiply_by(5) %>%
     add(5)         %>%
    { 
         cat("Mean:", mean(.), #括号中加.
                       "Var:", var(.), "\n")
         sort(.) %>% head                  #不用加,
       }  #代码块的传递

iris %>%
       (function(x) {
             if (nrow(x) > 2) 
                   rbind(head(x, 1), tail(x, 1))
             else x   #省略了(){}
         })  #函数的传递

