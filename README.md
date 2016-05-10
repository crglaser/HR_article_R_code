# HR article R code

Run getHomeRunRankData() which will return a list with three data frames (mlb, nl and al).
Each of these data frames includes yearID, lgID, teamID, HR, HRA, HRrank, HRArank, mostHR, fewestHRA, HRback, HRAback, backCombined and HRdifferential.

HRrank/HRArank are the team's rank in the league which the data frame's title represents
mostHR/fewestHRA are the totals which represent the league leaders for that year
HRback/HRAback are the differences between the team and the leader that year
backCombined is HRback + HRAback
HRdifferential is each team's (HR - HRA)

There is also a simple script firstInBoth which takes one of these data frames and returns a list of teams which led the league with most HR and fewest HRA.
