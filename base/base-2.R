base_2 <- function(Posts){
  
  data <- Posts
  data$Year <- format(as.Date(data$CreationDate), "%Y")
  data$Month <- format(as.Date(data$CreationDate), "%m")
  
  data <- subset(data, PostTypeId %in% c(1, 2))
  
  data <- aggregate(list(PostsNumber = data$Score), data[, c("Year", "Month")], function(x) {
    c(PostsNumber = length(x), MaxScore = max(x)) 
  })#Question - How to go without nested columns
  
  test <- data$PostsNumber
  test[,'MaxScore']
  
  data <- data.frame(Year=data$Year,Month=data$Month,PostsNumber=test[,'PostsNumber'],MaxScore=test[,'MaxScore'])
  data <- data[data$PostsNumber>1000,]
  

}