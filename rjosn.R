#json转化
library(rjson)
fromJSON('[1,2,3]', simplify=TRUE)
fromJSON('[1,2,3]', simplify=FALSE)
x <- toJSON( iris )



