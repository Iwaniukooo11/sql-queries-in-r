base_3 <- function(Posts, Users){
  
  data_questions <- Posts
  data_questions<- data_questions[data_questions$PostTypeId==1,]
  data_questions <- aggregate(cbind( ViewCount) ~ OwnerUserId,data=data_questions,FUN=sum)
  
  data <- merge(data_questions,Users,by.x="OwnerUserId",by.y="Id")
  data<- data[order(data$ViewCount,decreasing=TRUE),]
  data <- data[,c('OwnerUserId',"DisplayName","ViewCount")]
  colnames(data)<-c('Id','DisplayName','TotalViews')
  data<- data[1:10,]
}