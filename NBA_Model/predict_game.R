#spread referring to home team spread

predict_game <- function(x,y,spread) {
  
  
  source("/cloud/project/NBA_injuries.R")
  
  injury(x, y)
  names <- c("AVG_FG", "AVG_FT", "AVG_FG3", "AVG_AST", "AVG_REB", "AVG_TOV", "AWAY_AVG_FG_PCT", "AWAY_AVG_FT_PCT", "AWAY_AVG_FG3_PCT", "AWAY_AVG_AST","AWAY_AVG_REB", "AWAY_AVG_TOV", "Bovada_Line_Spread")
  stats_df <- data.frame(matrix(0,1,13))
  names(stats_df) <- names
  #stats <- subset(stats, select = -c(X))
  home_df <- subset(stats, stats$Team == x)
  away_df <- subset(stats, stats$Team == y)
  home_df <- home_df[,2:7]
  away_df <- away_df[,2:7]
  stats_df[1,1:6] <- home_df
  stats_df[1,7:12] <- away_df
  stats_df[1,13] <- spread
  probs <- predict(model1, stats_df, type="response") + 0.1
  result <- ifelse(probs > 0.5, 1, 0)
    if (probs > 0.5){
      print(paste("Spread:", spread))
      print(paste(x,"Cover"))
      print(paste("Probability is :", probs*100))
      take = x
      return(take)
      }
        else {
          probs <- 1 - probs
          print(paste("Spread:", spread))
          print(paste(y,"Cover"))
          print(paste("Probability is :", probs*100))
          take = y
          return(take)
    }
  
  
}