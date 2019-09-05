library(RMySQL)
con <- dbConnect(MySQL(), host="172.29.7.75", dbname="db", user="dbuser", password="aa123456")
summary(con)
dbGetInfo(con)
dbListResults(con)
dbListTables(con) #所有table
dbReadTable(con, "hangzhou1")
tmp <- sprintf("SELECT * FROM hangzhou1 WHERE tick =  %s", "a")
dbEscapeStrings(con, tmp) #转义sql
dbGetQuery(con, "SELECT * FROM hangzhou1 limit 3")
res <- dbSendQuery(con, "SELECT * FROM hangzhou1")
data <- dbFetch(res, n = 2)
data

dbWriteTable(con, "test_19_5_5", mtcars, overwrite = TRUE) #建立表
dbRemoveTable(con, "test_19_5_5") #删除表

dbDisconnect(con) #关闭连接
