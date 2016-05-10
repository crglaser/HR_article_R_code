homeRunRankByYear <- function(df){
  df <- transform(df, HRrank = ave(-HR, yearID, FUN = function(x) rank(x, ties.method = "min")))
  df <- transform(df, HRArank = ave(HRA, yearID, FUN = function(x) rank(x, ties.method = "min")))
  return(df)
}