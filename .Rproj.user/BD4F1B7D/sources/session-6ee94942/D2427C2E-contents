# package.install('sqldf')
# package.install('data.table')
# package.install('dplyr')
# package.install('compare')
# package.install('microbenchmark')
# package.install('margrittr')


library('sqldf')
library('data.table')
library('dplyr')
library('compare')
library('microbenchmark')
library ('magrittr')

Users <- read.csv('./data/Users.csv')
Comments <- read.csv('./data/Comments.csv')
Posts <- read.csv('./data/Posts.csv')

source('./sqldf/sqldf-1.R')
source('./sqldf/sqldf-2.R')
source('./sqldf/sqldf-3.R')
source('./sqldf/sqldf-4.R')
source('./sqldf/sqldf-5.R')

source('./dplyr/dplyr-1.R')
source('./dplyr/dplyr-2.R')
source('./dplyr/dplyr-3.R')
source('./dplyr/dplyr-4.R')
source('./dplyr/dplyr-5.R')

source('./base/base-1.R')
source('./base/base-2.R')
source('./base/base-3.R')
source('./base/base-4.R')
source('./base/base-5.R')

source('./table/table-1.R')
source('./table/table-2.R')
source('./table/table-3.R')
source('./table/table-4.R')
source('./table/table-5.R')

#1
data_sqldf_1=sql_1(Users)
data_base_1=base_1(Users)
data_dplyr_1=dplyr_1(Users)
data_table_1=table_1(Users)

compare(data_sqldf_1,data_dplyr_1,allowAll=TRUE)
compare(data_sqldf_1,data_base_1,allowAll=TRUE)
compare(data_sqldf_1,data_table_1,allowAll=TRUE)

#2

data_sqldf_2=sql_2(Posts)
data_base_2=base_2(Posts) 
data_dplyr_2=dplyr_2(Posts)
data_table_2=table_2(Posts)

compare(data_sqldf_2,data_dplyr_2,allowAll=TRUE)
compare(data_sqldf_2,data_base_2,allowAll=TRUE)
compare(data_sqldf_2,data_table_2,allowAll=TRUE)

#3
# data_sqldf_3=sql_3(Posts,Users)
data_base_3=base_3(Posts,Users)
data_dplyr_3=dplyr_3(Posts,Users)
data_table_3=table_3(Posts,Users)

# compare(data_sqldf_3,data_dplyr_3,allowAll=TRUE)
compare(data_dplyr_3,data_base_3,allowAll=TRUE)
compare(data_dplyr_3,data_table_3,allowAll=TRUE)

#4
# data_sqldf_4=sql_4(Posts,Users)
data_base_4=base_4(Posts,Users)
data_dplyr_4=dplyr_4(Posts,Users)
data_table_4=table_4(Posts,Users)

# compare(data_sqldf_4,data_dplyr_4,allowAll=TRUE)
compare(data_dplyr_4,data_base_4,allowAll=TRUE)
compare(data_dplyr_4,data_table_4,allowAll=TRUE)

#5
# data_sqldf_5=sql_5(Posts,Comments,Users)
data_base_5=base_5(Posts,Comments,Users)
data_dplyr_5=dplyr_5(Posts,Comments,Users)
data_table_5=table_5(Posts,Comments,Users)

# compare(data_sqldf_5,data_dplyr_5,allowAll=TRUE)
compare(data_dplyr_5,data_base_5,allowAll=TRUE)
compare(data_dplyr_5,data_table_5,allowAll=TRUE)






