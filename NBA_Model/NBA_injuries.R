injury <- function(x, y) {
  #injuries <- subset(injuries,)
  injury_df <- subset(injuries, injuries$Team == (x) | injuries$Team == (y))
  #print(injury_df$Description)
  if(nrow(injury_df) == 0) {
    print("No Injuries")
  } else {
    print(subset(injury_df, select = c(Player, Team)))
      print(injury_df$Description)
            }
}
