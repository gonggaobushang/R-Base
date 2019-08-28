#类似数据框，但又有list的功能
library(tidyverse)
tibble(1:10,b=LETTERS[1:10])
glimpse(mtcars)#相当于str
str(mtcars)
df <- tibble(x = 1:3, y = 3:1)
add_column(df, z = -1:1, w = 0)
lst(n = 5, x = runif(n)) #创建一个具有tibble特性的list
enframe(c(a = 5, b = 7)) #快速创建tibble


#不是tibble包
#其他data.frame的操作
cities <- read.csv(textConnection("City,Lat,Long,Pop
                                  Boston,42.3601,-71.0589,645966
                                  Hartford,41.7627,-72.6743,125017
                                  New York City,40.7127,-74.0059,8406000
                                  Philadelphia,39.9500,-75.1667,1553000
                                  Pittsburgh,40.4397,-79.9764,305841
                                  Providence,41.8236,-71.4222,177994"))
read.csv(textConnection("City,Lat,Long,Pop
                                  1,42.3601,-71.0589,645966
                        2,41.7627,-72.6743,125017
                        2 ,40.7127,-74.0059,8406000
                        3,39.9500,-75.1667,1553000
                        4,40.4397,-79.9764,305841
                        4,41.8236,-71.4222,177994"))

a=data.frame(a=c(1,2,3),b=c("1","2","3"))
#可以建立不对等的数据框
a=read.csv(textConnection("a,b
                          1,'a'
                          2,'s'
                          31"))
a[["a"]] #相当于a$a
