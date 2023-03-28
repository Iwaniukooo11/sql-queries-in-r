library('sqldf')

sql_2 <- function(Posts){
  sql_data<-sqldf("SELECT STRFTIME('%Y', CreationDate) AS Year, STRFTIME('%m', CreationDate) AS Month,
COUNT(*) AS PostsNumber, MAX(Score) AS MaxScore
FROM Posts
WHERE postTypeId IN (1, 2)
GROUP BY Year, Month
HAVING PostsNumber > 1000")
}