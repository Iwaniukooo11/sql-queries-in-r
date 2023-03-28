library ('magrittr')
library ('dplyr')

dplyr_3 <- function(Posts, Users){
  data_questions <- Posts
  data_questions <- data_questions %>%
    filter(PostTypeId==1) %>%
    group_by(OwnerUserId) %>%
    summarise(TotalViews = sum(ViewCount),across(everything(),first)) %>%
    inner_join(Users,by=c("OwnerUserId" = "Id")) %>%
    arrange(desc(TotalViews)) %>%
    mutate(Id=OwnerUserId) %>%
    select(Id,DisplayName,TotalViews) %>%
    head(10)
}