firstInBoth <- function(df){
  df.filt <- subset(df, HRrank == 1 & HRArank == 1)
  return(df.filt)
}