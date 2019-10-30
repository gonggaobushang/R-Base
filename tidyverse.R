#类似数据框，但又有list的功能
library(tidyverse)
tibble(1:10,b=LETTERS[1:10])
glimpse(mtcars)#相当于str
str(mtcars)
df <- tibble(x = 1:3, y = 3:1)
add_column(df, z = -1:1, w = 0)
lst(n = 5, x = runif(n)) #创建一个具有tibble特性的list
enframe(c(a = 5, b = 7)) #快速创建tibble

band_members %>%
  inner_join(band_instruments) #默认都用包含的列进行连接
band_members %>% 
  inner_join(band_instruments2, by = c("name" = "artist")) #保留第一个表的列名
band_members %>% 
  left_join(band_instruments)
band_members %>% 
  right_join(band_instruments)
band_members %>% 
  full_join(band_instruments)

d1 <- tibble(
  x = letters[4:6],
  y = LETTERS[4:6],
  a = rnorm(3)
  )
d1
d2 <- tibble(
  x2 = letters[6:4],
  y2 = LETTERS[6:4],
  b = rnorm(3)
  )
d2
left_join(d1, d2, by = c("x" = "x2", "y" = "y2"))

band_members %>% 
  semi_join(band_instruments)#共有，只返回A表
band_members %>% 
  anti_join(band_instruments)#不同，只返回A表

mtcars %>% as_tibble() -> mtcars1
mtcars1

mtcars1 %>%
  group_by(cyl) %>% #根据cyl进行分组
  slice(1:3) #取每个分组的1~3个记录
mtcars1 %>%
  group_by(cyl) %>% 
  slice(1:3) %>% 
  ungroup()
mtcars1 %>%
  group_by(cyl) %>% #根据cyl分组
  arrange(desc(hp)) %>% #根据hp做降序排列
  slice(1:3) %>% #取每组前三个记录
  ungroup() #取消分组
mtcars1 %>%
  group_by(cyl) %>%
  filter(hp > 150) %>%
  ungroup()
mtcars1 %>%
  group_by(cyl) %>%
  summarise(hp_max = max(hp)) %>%
  ungroup()


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
