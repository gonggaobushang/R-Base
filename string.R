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



