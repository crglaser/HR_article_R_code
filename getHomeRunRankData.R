getHomeRunRankData <- function(){
  #load Lahman package
  library("Lahman")
  
  #load other scripts
  source('~/HomeRunKings/firstInBoth.R')
  source('~/HomeRunKings/addTopValuesForYear.R')
  source('~/HomeRunKings/homeRunRankByYear.R')
  
  #Load Team data from Lahman package
  data(Teams)
  head(Teams)
  
  #subset data to include only the columns of interest
  Teams <- Teams[c("yearID", "lgID", "teamID", "HR", "HRA")]
  
  #Filter to just MLB, AL and NL
  teams_mlb <- subset(Teams, lgID == "AL" | lgID == "NL")
  teams_nl <- subset(Teams, lgID == "NL")
  teams_al <- subset(Teams, lgID == "AL")
  
  #Add HRrank and HRArank to each of the filtered data sets
  teams_mlb <- homeRunRankByYear(teams_mlb)
  teams_nl <- homeRunRankByYear(teams_nl)
  teams_al <- homeRunRankByYear(teams_al)
  
  #Add top HR and HRA values and distance back for each team
  teams_mlb <- addTopValuesForYear(teams_mlb)
  teams_nl <- addTopValuesForYear(teams_nl)
  teams_al <- addTopValuesForYear(teams_al)
  
  return(list(mlb=teams_mlb, nl = teams_nl, al=teams_al))
}