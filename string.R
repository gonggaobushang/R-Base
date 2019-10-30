# %s 字符变量
a <- "string"
sprintf("This is where a %s goes.", a)
# %d 表示位数
x <- 8
sprintf("Regular:%d", x)
sprintf("Leading spaces:%4d", x)
sprintf("Leading zeros:%02d", x) #只能有0
#%f浮点数
# %m.nf m为输出字符宽度，即最小包含的字符量；字符串没有达到m长度，那么补0或者空格，n表示小数的精度
sprintf("%f", pi)         
sprintf("%.3f", pi)       
sprintf("%1.0f", pi)      
sprintf("%5.1f", pi)      #前面补空格
sprintf("%05.1f", pi)     #前面补0
sprintf("%+f", pi)        
sprintf("% f", pi)        
sprintf("%-10f", pi)      # 右边空格
sprintf("%e", pi)         #"3.141593e+00"
sprintf("%E", pi)         
sprintf("%g", pi)         
sprintf("%g",   1e6 * pi) 
sprintf("%.9g", 1e6 * pi) 
sprintf("%G", 1e-6 * pi)  
x <- "string"
sprintf("Substitute in multiple strings: %s %s", x, "string2")
sprintf("Substitute in multiple strings: %s", x, "string2") #后面的会被忽视
sprintf("A single percent sign here %%") #这样才能输入%

format(23.123456789, digits = 9)
format(c(6, 13.14521), scientific = TRUE)
format(23.47, nsmall = 5)
format(13.7, width = 6)
format("Hello",width = 8, justify = "l")
format("Hello",width = 8, justify = "c") #centre
format(Sys.time(),format="%Y-%m-%d_%b_%B_%y")  
Sys.time()%>%weekdays()
Sys.time()%>%months()
Sys.time()%>%quarters()

as.POSIXlt(Sys.time())%>%unclass
as.POSIXct(Sys.time())%>%unclass#距离1970-1-1的秒数


library(stringr)
grep(pattern = "[wW]",x=c("statesw","W","SD"),value = T)#[]匹配括号内的任意字符
strsplit(x="strsplit.aslo.uses.regular.expressions", split="\\.")
str_extract_all(c("123","456","321"),"[^3]")#^取反义
str_extract_all(c("123","456$","321"),"[3$]")#$匹配字符串的结束
str_extract_all(c("A！","a是？","a是一。"), pattern ="A|狗")#|或者
str_extract_all(string = c("abc","ac","bc"),pattern = "ab?c")#?前面的字符可有可无且最多被匹配一次
str_extract_all(string = c("abababab","abc","ac"),pattern = "(ab)*")#*前面的字符被匹配零次或多次
str_extract_all(string = c("abababab","abc","ac"),pattern = "(ab)+")#+前面的字符匹配一次或多次
str_extract_all(string = c("abababab","ababc","ababababc"),pattern = "(ab){2,3}")
#( )表示一个字符组，括号内的字符串将作为一个整体被匹配
#{n}重复n次 {n,}重复n次或更多次 {n,m}重复n次到m次
str_extract_all(string = "my cridit card number: 34901358932236",pattern = "\\d")
str_extract_all(string = "my cridit card number: 34901358932236",pattern = "[:digit:]")
#[:digit:]	数字：0-9  [:lower:]	小写字母：a-z  [:upper:]	大写字母：A-Z
#[:alpha:]	字母：a-z及A-Z  [:alnum:]	所有字母及数字  [:punct:]	标点符号，如. , ;等
#[:blank:]	空字符，即：Space和Tab
#\w	字符串，等价于[:alnum:] \W	非字符串，等价于[^[:alnum:]]
#\s	空格字符，等价于[:blank:] \S	非空格字符，等价于[^[:blank:]]
#\d	数字，等价于[:digit:] \D	非数字，等价于[^[:digit:]]
#\b	Word edge（单词开头或结束的位置） \B	No Word edge（非单词开头或结束的位置）
#\<	Word beginning（单词开头的位置） \>	Word end（单词结束的位置）

library(stringr)
#大小写转换
dog <- "The Quick brown dog"
str_to_upper(dog)
str_to_lower(dog)
str_to_title(dog)

numbers <- "1 and 2 and 4 and 456"
num_loc <- str_locate_all(numbers, "[0-9]+")[[1]] #正则表达式，筛选出数字部分
str_sub(numbers, num_loc[, "start"], num_loc[, "end"]) #数字部分
text_loc <- invert_match(num_loc) #除了上面筛选出来的数字外的其余部分
str_sub(numbers, text_loc[, "start"], text_loc[, "end"])

str_c("Letter: ", letters)
str_c("Letter", letters, sep = ": ") #相当于paste()
str_c(letters, collapse = ", ")
str_c(c("a", NA, "b"), "-d") #NA不是字符串
str_c(str_replace_na(c("a", NA, "b")), "-d") #将NA变成字符串

fruit <- c("apple", "banana", "pear", "pineapple")
str_count(fruit, "a")
#出现的次数
str_count(c("a.", "...", ".a.a"), ".")
str_count(c("a.", "...", ".a.a"), fixed(".")) #fixed后才计数正确

fruit <- c("apple", "banana", "pear", "pinapple")
str_detect(fruit, "a") #都包含a
str_detect(fruit, "^a") #a开头
str_detect(fruit, "a$") #a结尾

fruit <- c("apple", "pear", "banana")
str_dup(fruit, 2) #相当于str_c本身
str_dup(fruit, 1:3)

shopping_list <- c("apples x4", "bag of flour", "bag5233 of sugar", "milk x2")
str_extract(shopping_list, "\\d") #第一个出现的数字
str_extract(shopping_list, "[a-z]+") #数字开头的词
str_extract(shopping_list, "[a-z]{1,4}") #最多出现4个字母
str_extract(shopping_list, "\\b[a-z]{1,4}\\b") #最长只能4个字母的单词

str_extract_all(shopping_list, "[a-z]+")
str_extract_all(shopping_list, "\\b[a-z]+\\b")
str_extract_all(shopping_list, "\\d")

str_extract_all(shopping_list, "\\b[a-z]+\\b", simplify = TRUE)
str_extract_all(shopping_list, "\\d", simplify = TRUE)

str_extract_all("This is, suprisingly, a sentence.", boundary("word")) #抽离所有单词

name <- "Fred"
age <- 50
anniversary <- as.Date("1991-10-12")
str_glue(
  "My name is {name}, ",
  "my age next year is {age + 1}, ",
  "and my anniversary is {format(anniversary, '%A, %B %d, %Y')}."
)
str_glue(
  "My name is {name}, ",
  "and my age next year is {age + 1}.",
  name = "Joe",
  age = 40
)
mtcars %>% str_glue_data("{rownames(.)} has {hp} hp") #可以是一个数据框

str_length(c("i", "like", "programming", NA))

fruit <- c("apple", "banana", "pear", "pineapple")
str_locate(fruit, "$")
str_locate(fruit, "a")
str_locate_all(fruit, "a")

strings <- c(" 219 733 8965", "329-293-8753 ", "banana", "595 794 7569",
             "387 287 6718", "apple", "233.398.9187 ", "482 952 3315",
             "239 923 8115 and 842 566 4692", "Work: 579-499-7527", "$1000",
             "Home: 543.355.3679")
phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})" #正则表达式
str_extract(strings, phone)
str_match(strings, phone)
str_extract_all(strings, phone)
str_match_all(strings, phone)
x <- c("<a> <b>", "<a> <>", "<a>", "", NA)
str_match(x, "<(.*?)> <(.*?)>")
str_match_all(x, "<(.*?)>")
str_extract(x, "<.*?>")
str_extract_all(x, "<.*?>")

str_order(letters) #排序，不够精准
str_sort(letters)

rbind(
  str_pad("hadley", 30, "left"),
  str_pad("hadley", 30, "right"),
  str_pad("hadley", 30, "both")
)
str_pad(c("a", "abc", "abcdef"), 10)
str_pad("a", c(5, 10, 20))
str_pad("a", 10, pad = c("-", "_", " "))

fruits <- c("one apple", "two pears", "three bananas")
str_remove(fruits, "[aeiou]") #只删除第一个匹配的
str_remove_all(fruits, "[aeiou]") #删除全部匹配的

fruits <- c("one apple", "two pears", "three bananas")
str_replace(fruits, "[aeiou]", "-")
str_replace_all(fruits, "[aeiou]", "-")
str_replace_all(fruits, "[aeiou]", toupper)
str_replace_all(fruits, "b", NA_character_)
str_replace(fruits, "([aeiou])", "")
str_replace(fruits, "([aeiou])", "\\1\\1")
str_replace(fruits, "[aeiou]", c("1", "2", "3"))
str_replace(fruits, c("a", "e", "i"), "-")

str_replace_na(c(NA, "abc", "def"))

fruits <- c(
  "apples and oranges and pears and bananas",
  "pineapples and mangos and guavas"
)
str_split(fruits, " and ")
str_split(fruits, " and ", simplify = TRUE)
str_split(fruits, " and ", n = 3)
str_split(fruits, " and ", n = 2)

fruit <- c("apple", "banana", "pear", "pinapple")
str_starts(fruit, "p")
str_starts(fruit, "p", negate = TRUE) #相反的结果
str_ends(fruit, "e")
str_ends(fruit, "e", negate = TRUE)

hw <- "Hadley Wickham"
str_sub(hw, c(1, 8), c(6, 14))

str_sub(hw, -1)
str_sub(hw, -7)
str_sub(hw, end = -7)

fruit <- c("apple", "banana", "pear", "pinapple")
str_subset(fruit, "a")
str_which(fruit, "a")
str_subset(fruit, "^a")
str_subset(fruit, "a$")

str_trim(" String with trailing and leading white space\t")
str_trim("\n\nString with trailing and leading white space\n\n")
str_squish(" String with trailing, middle, and leading white space\t")
str_squish("\n\nString with excess, trailing and leading white space\n\n")

x <- "This string is moderately long"
rbind(
  str_trunc(x, 20, "right"),
  str_trunc(x, 20, "left"),
  str_trunc(x, 20, "center")
)

str_view(c("abc", "def", "fgh"), "[aeiou]")
str_view(c("abc", "def", "fgh"), "^")
str_view(c("abc", "def", "fgh"), "..")
str_view_all(c("abc", "def", "fgh"), "d|e")
