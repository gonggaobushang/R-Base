#文件管理

setwd("")
list.dirs()                                        #查看当前目录的子目录
dir()                                              #当前目录的子目录和文件
dir(path="F:\\",all.files=TRUE)
file.info(".")                                     #查看当前目录权限
dir.create("create")                               #在当前目录下，新建一个目录
dir.create(path="a1/b2/c3",recursive = TRUE)       #创建一个3级子目录
system("tree")                                     #通过系统命令查看目录结构
file.exists(".")                                   #目录存在

df<-dir(full.names = TRUE)
file.access(df, 0) == 0                            #检查文件或目录是否存在
file.access(df, 1) == 0                            #检查文件或目录是否可执行
file.access(df, 2) == 0                            #检查文件或目录是否可写
file.access(df, 4) == 0                            #检查文件或目录是否可读

Sys.chmod("./create",mode ="0",use_umask = TRUE)   #修改目录权限，所有用户只读

file.rename("tmp", "tmp2")                         #对tmp目录重命名
unlink("tmp2", recursive = TRUE)                   #删除tmp2目录

file.create("A.txt")                               #创建一个空文件
cat("file B\n", file = "B.txt")                    #创建一个有内容的文件
readLines("B.txt")
file.append("A.txt", rep("B.txt", 10))             #再写文件
file.copy("A.txt", "C.txt")                        #复制文件