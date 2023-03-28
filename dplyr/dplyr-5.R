library ('magrittr')
library ('dplyr')

dplyr_5 <- function(Posts, Comments, Users){
  data_cmt <- Comments
  data_cmt <- data_cmt %>%
    group_by(PostId) %>%
    summarise(CommentsTotalScore =sum(Score)) %>%
    inner_join(Posts,by=c("PostId"="Id")) %>%
    filter(PostTypeId==1) %>%
    inner_join(Users,by=c("OwnerUserId"="Id")) %>%
    arrange(desc(CommentsTotalScore)) %>%
    head(10) %>%
    select("Title", "CommentCount", "ViewCount", "CommentsTotalScore", "DisplayName", "Reputation", "Location")
}