library('data.table')

table_3 <- function(Posts, Users){
  data_questions <-as.data.table(Posts)
  data_questions <- data_questions[PostTypeId==1, .(TotalViews = sum(ViewCount)),OwnerUserId]
  data <- as.data.table(merge(data_questions,Users,by.x="OwnerUserId",by.y="Id"))
  data<-data[order(-TotalViews)]
  data<-data[1:10]
  data<-data[,.(Id=OwnerUserId,DisplayName,TotalViews)]
}