library ('magrittr')
library ('dplyr')

dplyr_1 <- function(Users){
  data <- Users
  data <- data %>% filter(Location!='')
  data <- data %>% group_by(Location) %>% summarise(TotalUpVotes = sum(UpVotes)) %>%arrange(desc(TotalUpVotes))
  data<-data[1:10,]
}