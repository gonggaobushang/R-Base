#异常处理
tryCatch({
  a="hello"
  a+1
},warning = function(w){print("警告")},
error=function(e){cat("错误",conditionMessage(e),"\n\n")},
finally={
  print("yes")
  a=1
  print(a)
  }
)

