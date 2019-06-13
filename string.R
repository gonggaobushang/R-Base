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

