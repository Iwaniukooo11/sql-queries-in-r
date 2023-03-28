library('microbenchmark')

#1
microbenchmark(
  sql_1(Users),
  base_1(Users),
  dplyr_1(Users),
  table_1(Users),
  times=10
)

#2
microbenchmark(
  sql_2(Posts),
  base_2(Posts),
  dplyr_2(Posts),
  table_2(Posts),
  times=10
)

#3
microbenchmark(
  sql_3(Posts,Users),
  base_3(Posts,Users),
  dplyr_3(Posts,Users),
  table_3(Posts,Users),
  times=10
)

#4
microbenchmark(
  # sql_4(Posts,Users), #no sense in using it - it's too slow
  base_4(Posts,Users),
  dplyr_4(Posts,Users),
  table_4(Posts,Users),
  times=10
)

#5
microbenchmark(
  # sql_5(Posts,Comments,Users), #no sense in using it - it's too slow
  base_5(Posts,Comments,Users),
  dplyr_5(Posts,Comments,Users),
  table_5(Posts,Comments,Users),
  times=10
)

#Conclusion - data.table > dplyr > base > sqldf