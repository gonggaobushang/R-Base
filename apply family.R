#sapply
data(quakes)
getColor <- function(quakes) {
  sapply(quakes$mag, function(mag) {
    if(mag <= 4) {
      "green"
    } else if(mag <= 5) {
      "orange"
    } else {
      "red"
    } } )
}
getColor(quakes[c(1:20),])

data(iris)
irisiri<-function(iris){
  sapply(iris$Species,function(Specise){
    if(Specise=="setosa" ){
      "1"
    }else if(Specise=="versicolor"){
      "2"
    }else{
      3
    }
  }
         )
}
irisiri(iris[c(1:12),])
