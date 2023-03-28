base_5 <- function(Posts, Comments, Users){
  data_cmt <-Comments
  data_cmt <- aggregate(Score ~ PostId,data=data_cmt,FUN=sum)
  colnames(data_cmt) <- c("PostId","CommentsTotalScore")
  
  data_posts_best_comments = merge(data_cmt,Posts,by.x="PostId",by.y="Id")
  data_posts_best_comments=data_posts_best_comments[data_posts_best_comments$PostTypeId==1,]
  
  data<- merge(data_posts_best_comments,Users,by.x="OwnerUserId",by.y="Id")
  data<- data[order(data$CommentsTotalScore,decreasing=TRUE),]
  data<-data[1:10,]
  data <- data[c("Title", "CommentCount", "ViewCount", "CommentsTotalScore", "DisplayName", "Reputation", "Location")]
}