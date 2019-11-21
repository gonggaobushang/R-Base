# https://blog.csdn.net/wltom1985/article/details/54973811 
library(dplyr)
#################过滤行
filter(mtcars, cyl < 6 & vs == 1)
filter(mtcars, cyl < 6, vs == 1)#且
filter(mtcars, cyl < 6 | vs == 1)
#过滤出cyl 为4或6的行
filter(mtcars, cyl %in% c(4, 6))
#################按行数选取数据
#选取第一行数据
slice(mtcars, 1L)
filter(mtcars, row_number() == 1L)
#选取最后一行数据
slice(mtcars, n())
#选取第5行到最后一行所有数据
slice(mtcars, 5:n())
filter(mtcars, between(row_number(), 5, n()))
####################################################################排序
#以cyl和disp联合升序排序
arrange(mtcars, cyl, disp)
#以disp降序排序
arrange(mtcars, desc(disp))
#################按列选取数据
select(iris, starts_with("Petal")) #即列名称
#选取变量名前缀不包含Petal的列
select(iris, -starts_with("Petal"))
#选取变量名后缀包含Width的列
select(iris, ends_with("Width"))
#选取变量名中包含etal的列
select(iris, contains("etal"))
#正则表达式匹配，返回变量名中包含t的列
select(iris, matches(".etal.W."))
select(iris, Sepal.Length:Petal.Width)
#选择字符向量中的列，select中不能直接使用字符向量筛选，需要使用one_of函数
vars <- c("Petal.Length", "Petal.Width")
select(iris, one_of(vars))
select(iris, everything())
#调整列顺序，把Species列放到最前面
select(iris, Petal.Width,Species, everything())
df <- as.data.frame(matrix(runif(100), nrow = 10))
#选择V4，V5，V6三列
select(df, V4:V6)
select(df, num_range("V", 4:6))
#重命名列Petal.Length，返回子数据集只包含重命名的列
select(iris, petal_length = Petal.Length)
#重命名所有以Petal为前缀的列，返回子数据集只包含重命名的列
select(iris, petal = starts_with("Petal"))
#重命名列Petal.Length，返回全部列
rename(iris, petal_length = Petal.Length)
#################添加列
#添加新列wt_kg和wt_t,在同一语句中可以使用刚添加的列
mutate(mtcars, wt_kg = wt * 453.592, wt_t = wt_kg / 1000)
#计算新列wt_kg和wt_t，返回对象中只包含新列
transmute(mtcars, wt_kg = wt * 453.592, wt_t = wt_kg / 1000)
#################去重
df <- data.frame(
  x = sample(10, 100, rep = TRUE),
  y = sample(10, 100, rep = TRUE)
)
#以全部两个变量去重，返回去重后的行数
nrow(distinct(df))
nrow(distinct(df, x, y))
#以变量x去重，只返回去重后的x值
distinct(df, x)
#以变量y去重，只返回去重后的y值
distinct(df, y)
#以变量x去重，返回所有变量
distinct(df, x, .keep_all = TRUE)
#以变量y去重，返回所有变量
distinct(df, y, .keep_all = TRUE)
#对变量运算后的结果去重
distinct(df, diff = abs(x - y))
#################直接处理数据
#返回数据框中变量disp的均值
summarise(mtcars, mean(disp))
#返回数据框中变量disp的标准差
summarise(mtcars, sd(disp))
#返回数据框中变量disp的最大值及最小值
summarise(mtcars, max(disp), min(disp))
#返回数据框mtcars的行数
summarise(mtcars, n())
#返回unique的gear数
summarise(mtcars, n_distinct(gear))
#返回disp的第一个值
summarise(mtcars, first(disp))
#返回disp的最后个值
summarise(mtcars, last(disp))
#################抽样
#随机无重复的取10行数据
sample_n(mtcars, 10)
#随机有重复的取50行数据
sample_n(mtcars, 50, replace = TRUE)
#随机无重复的以mpg值做权重取10行数据
sample_n(mtcars, 10, weight = mpg)
#默认size=1，相当于对全部数据无重复重新抽样
sample_frac(mtcars)
#随机无重复的取10%的数据
sample_frac(mtcars, 0.1)
#随机有重复的取总行数1.5倍的数据
sample_frac(mtcars, 1.5, replace = TRUE)
#随机无重复的以1/mpg值做权重取10%的数据
sample_frac(mtcars, 0.1, weight = 1 / mpg)
#################分组
#返回每条记录所在分组id组成的向量
group_indices(mtcars, cyl)
####################################################################数据框连接
df1 = data.frame(CustomerId=c(1:6), sex = c("f", "m", "f", "f", "m", "m"), Product=c(rep("Toaster",3), rep("Radio",3)))
df2 = data.frame(CustomerId=c(2,4,6,7),sex = c( "m", "f", "m", "f"), State=c(rep("Alabama",3), rep("Ohio",1)))
#内连接，默认使用"CustomerId"和"sex"连接
inner_join(df1, df2)
#左连接，默认使用"CustomerId"和"sex"连接
left_join(df1, df2)
#右连接，默认使用"CustomerId"和"sex"连接
right_join(df1, df2)
#全连接，默认使用"CustomerId"和"sex"连接
full_join(df1, df2)
#内连接，使用"CustomerId"连接，同名字段sex会自动添加后缀
inner_join(df1, df2, by = c("CustomerId" = "CustomerId"))
#以CustomerId连接，返回df1中与df2匹配的记录
semi_join(df1, df2, by = c("CustomerId" = "CustomerId"))
#以CustomerId和sex连接，返回df1中与df2不匹配的记录
anti_join(df1, df2)
####################################################################集合
mtcars$model <- rownames(mtcars)
first <- mtcars[1:20, ]
second <- mtcars[10:32, ]
#取两个集合的交集
intersect(first, second)
#取两个集合的并集，并去重
union(first, second)
#取两个集合的差集，返回first中存在但second中不存在的记录
setdiff(first, second)
#取两个集合的交集，返回second中存在但first中不存在的记录
setdiff(second, first)
#取两个集合的交集, 不去重
union_all(first, second)
#判断两个集合是否相等，返回TRUE
setequal(mtcars, mtcars[32:1, ])
#################数据合并
one <- mtcars[1:4, ]
two <- mtcars[11:14, ]
#按行合并数据框one和two
bind_rows(one, two)
#按行合并元素为数据框的列表
bind_rows(list(one, two))
#按行合并数据框，生成id列指明数据来自的源数据框，id列的值使用数字代替
bind_rows(list(one, two), .id = "id")
#按行合并数据框，生成id列指明数据来自的源数据框，id列的值为数据框名
bind_rows(list(a = one, b = two), .id = "id")
#按列合并数据框one和two
bind_cols(one, two)
bind_cols(list(one, two))
#合并数据框，列名不匹配，因此使用NA替代，使用rbind直接报错
bind_rows(data.frame(x = 1:3), data.frame(y = 1:4))
#合并因子
f1 <- factor("a")
f2 <- factor("b")
c(f1, f2)
unlist(list(f1, f2))
#因子level不同，强制转换为字符型
combine(f1, f2)
combine(list(f1, f2))
#################条件语句
x <- c(-5:5, NA)
#替换所有小于0的元素为NA，为了保持类型一致，因此使用NA_integer_
if_else(x < 0, NA_integer_, x)
#使用字符串missing替换原数据中的NA元素
if_else(x < 0, "negative", "positive", "missing")
#if_else不支持类型不一致，但是ifelse可以
ifelse(x < 0, "negative", 1)

x <- factor(sample(letters[1:5], 10, replace = TRUE))
#if_else会保留原有数据类型
if_else(x %in% c("a", "b", "c"), x, factor(NA))
ifelse(x %in% c("a", "b", "c"), x, factor(NA))

#顺序执行各语句对原向量进行替换，因此越普遍的条件需放在最后
x <- 1:50
case_when(
  x %% 35 == 0 ~ "fizz buzz",
  x %% 5 == 0 ~ "fizz",
  x %% 7 == 0 ~ "buzz",
  TRUE ~ as.character(x)
)


















###############################################对着包还不够熟悉，在学习一遍
# https://mp.weixin.qq.com/s/9xmXkB9McLoPqm3z2UmXrA
iris
sample_n(iris,3) #随机选择行数
sample_frac(iris,0.1) #随机返回0.1倍总行数的行数
distinct(iris)#删除重复项
distinct(iris,Sepal.Length) #删除某列重复项
distinct(iris,iris$Sepal.Length,iris$Sepal.Width,.keep_all=T) #保留所有其他列
select(iris,Sepal.Length,Species) #只选择两列
select(iris,-Species)
select(iris,ends_with("es"))
#starts_with ends_with contains matches num_range one_of everything
select(iris,contains("es"))
rename(iris,Species1=Species)#重命名后的名字在前面
filter(iris,Species=="setosa")
filter(iris,Species %in% c("setosa","virginica")& Sepal.Length>7 |Sepal.Length<7)
filter(iris,grepl(5,Sepal.Length)) #grepl是寻找包含*的记录
summarise(iris,iq=mean(Sepal.Length))
summarise_at(iris,vars(Sepal.Length,Sepal.Width),funs(n(),mean,median,#多个变量
                                        missing=sum(is.na(.)))) #.表示前面的参数
summarise_if(iris,is.numeric,funs(n(),mean))
summarise_all(iris["Sepal.Length"],funs(nlevels))
arrange(iris,Sepal.Length,desc(Petal.Length))         
group_by(iris,Sepal.Length)
iris%>%filter(Species %in% c("setosa"))%>%group_by(Species)%>%do(head(.,2))
slice(iris,3) #选择第三行
min_rank(iris=="virginica")
mutate(iris,iris=rep(c(1,2),75)) #创建一个新变量
mutate_all(iris,funs("iris"=.*10))
mutate_at(iris,vars("Petal.Length","Sepal.Length"),funs(min_rank(.)))
