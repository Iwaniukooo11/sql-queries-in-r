base_4 <- function(Posts, Users){
  
  data_answers <- Posts
  data_answers<-data_answers[data_answers$PostTypeId==2,]
  data_answers<-aggregate(cbind(Id)~OwnerUserId,data=data_answers,FUN=length,na.action = NULL)
  colnames(data_answers) <- c("OwnerUserId", "AnswersNumber")
  
  data_questions <- Posts
  data_questions<-data_questions[data_questions$PostTypeId==1,]
  data_questions <- aggregate(Id ~ OwnerUserId,data=data_questions,FUN=length,na.action = NULL)
  colnames(data_questions) <- c( "OwnerUserId","QuestionsNumber")
  
  data_postcounts <- merge(data_answers,data_questions,by.x="OwnerUserId",by.y="OwnerUserId")
  data_postcounts<- data_postcounts[data_postcounts$AnswersNumber > data_postcounts$QuestionsNumber,]
  data_postcounts<- data_postcounts[order(data_postcounts$AnswersNumber,decreasing=TRUE),]
  data_postcounts=data_postcounts[1:5,]
  
  data <- merge(data_postcounts,Users,by.x="OwnerUserId",by.y="Id")
  data<- data[c("DisplayName", "QuestionsNumber", "AnswersNumber", "Location","Reputation","UpVotes" , "DownVotes")]
  
}