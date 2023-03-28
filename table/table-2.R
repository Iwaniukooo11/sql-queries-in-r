library('data.table')

table_2 <- function(Posts){
  data <- as.data.table(Posts)
  data <-data[, Year:=format(as.Date(CreationDate), "%Y")]
  data <-data[, Month:=format(as.Date(CreationDate), "%m")]
  data<- data[PostTypeId==1 | PostTypeId==2, .(MaxScore = max(Score), PostsNumber=.N),by=.(Year,Month)]
  data<-data[PostsNumber>1000]
}