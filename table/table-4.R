library('data.table')

table_4 <- function(Posts, Users){
  data_answers<- as.data.table(Posts)
  data_answers<-data_answers[PostTypeId==2,.(AnswersNumber = .N),OwnerUserId]
  
  data_questions <- as.data.table(Posts)
  data_questions <- data_questions[PostTypeId==1, .(QuestionsNumber = .N),OwnerUserId]
  
  data <- as.data.table(merge(data_answers,data_questions,by="OwnerUserId"))
  data <- data[AnswersNumber > QuestionsNumber]
  data <- data[order(-AnswersNumber)]
  data <- data[1:6]
  
  data <- merge(data,Users,by.x="OwnerUserId",by.y="Id")
  data<-data[,.(DisplayName, QuestionsNumber, AnswersNumber, Location, Reputation, UpVotes, DownVotes)]
  
}