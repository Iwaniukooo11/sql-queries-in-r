library('data.table')

table_5 <- function(Posts, Comments, Users){
  data_cmt <- as.data.table(Comments)
  data_cmt <- data_cmt[,.(CommentsTotalScore=sum(Score)),PostId]
  
  data_posts_best_comments <- as.data.table( merge(data_cmt,Posts,by.x="PostId",by.y="Id"))
  data_posts_best_comments <- data_posts_best_comments[PostTypeId==1]
  
  data <- merge(data_posts_best_comments,Users,by.x="OwnerUserId",by.y="Id")
  data <- data[order(-CommentsTotalScore)]
  data <- data[1:10]
  data <- data[,.(Title, CommentCount, ViewCount, CommentsTotalScore, DisplayName, Reputation, Location)]
}