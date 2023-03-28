library ('magrittr')
library ('dplyr')

dplyr_4 <- function(Posts, Users){
  
  data_answers <- Posts
  data_answers<- data_answers %>%
    filter(PostTypeId==2) %>%
    group_by(OwnerUserId) %>%
    summarise(AnswersNumber=n())
  
  data_question <- Posts
  data_question<- data_question %>%
    filter(PostTypeId==1) %>%
    group_by(OwnerUserId) %>%
    summarise(QuestionsNumber = n())
  
  
  data_answers <- data_answers %>%
    filter(!is.na(OwnerUserId)) %>%
    inner_join(data_question,by="OwnerUserId")%>%
    filter(AnswersNumber > QuestionsNumber)%>%
    arrange(desc(AnswersNumber)) %>%
    head(5) %>%
    inner_join(Users ,by=c("OwnerUserId"="Id"))%>%
    select(DisplayName, QuestionsNumber, AnswersNumber, Location, Reputation, UpVotes, DownVotes)
  
  data <-data_answers
}