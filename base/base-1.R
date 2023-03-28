base_1 <- function(Users){
  
  data<- Users[Users$Location!="",]
  data <- aggregate(UpVotes ~ Location ,data=data,FUN=sum)
  
  data <- data[order(data$UpVotes,decreasing=TRUE),]
  colnames(data)[colnames(data)=="UpVotes"]="TotalUpVotes"
  data<-data[1:10,]
}