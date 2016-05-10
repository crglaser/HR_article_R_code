addTopValuesForYear <- function(df){
  library("plyr")
  
  #Get top HR and HRA by year
  topHR <- subset(df, HRrank == 1)
  topHRA <- subset(df, HRArank == 1)
  
  #Filter to just columns to join and rename to facilitate join
  topHR <- topHR[c("yearID", "HR")]
  colnames(topHR) <- c("yearID", "mostHR")
  topHRA <- topHRA[c("yearID", "HRA")]
  colnames(topHRA) <- c("yearID", "fewestHRA")
  
  #Join top values by year
  df <- join(df, topHR, by="yearID", match="first")
  df <- join(df, topHRA, by="yearID", match="first")
  
  #calculate distance from lead
  df$HRback <- df$mostHR - df$HR
  df$HRAback <- df$HRA - df$fewestHRA
  df$backCombined <- df$HRback + df$HRAback
  
  #calculate HR differential
  df$HRdifferential <- df$HR - df$HRA
  
  return(df)
}