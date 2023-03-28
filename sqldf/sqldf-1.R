library('sqldf')

sql_1 <- function(Users){
  data<-sqldf("SELECT Location, SUM(UpVotes) as TotalUpVotes FROM Users
        WHERE Location != ''
        GROUP BY Location
        ORDER BY TotalUpVotes DESC
        LIMIT 10")
}
