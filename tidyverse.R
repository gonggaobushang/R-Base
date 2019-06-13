#类似数据框，但又有list的功能
library(tidyverse)
tibble(1:10,b=LETTERS[1:10])
glimpse(mtcars)#相当于str
str(mtcars)
df <- tibble(x = 1:3, y = 3:1)
add_column(df, z = -1:1, w = 0)
lst(n = 5, x = runif(n)) #创建一个具有tibble特性的list
enframe(c(a = 5, b = 7)) #快速创建tibble
