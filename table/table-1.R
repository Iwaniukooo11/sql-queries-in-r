library('data.table')

table_1 <- function(Users){
  dt <- data.table(Users)
  dt <- dt[Location!=""]
  dt<- dt[,.(TotalUpVotes=sum(UpVotes)),by=Location]
  dt<- dt[order(-TotalUpVotes)]
  dt<-dt[1:10]
}