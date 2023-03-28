library ('magrittr')
library ('dplyr')

dplyr_2 <- function(Posts){
  data<-Posts
  data<-Posts %>%
    filter(PostTypeId %in% c(1,2)) %>%
    mutate(Year=format(as.Date(CreationDate),"%Y"),Month = format(as.Date(CreationDate),"%m")) %>%
    group_by(Year,Month) %>%
    summarise(Score=max(Score),PostsNumber = n()) %>%
    select(Year,Month,PostsNumber,Score) %>%
    filter(PostsNumber>1000)
  
  data <- data%>% rename(MaxScore=Score)
  
}