#Example: predict_day(Tue, Oct 19, 2021) 

predict_today <- function(date){
  
  source("/cloud/project/NBA_Scrape.R")
  matchups <- subset(Schedule, Schedule[['Date']] == date, select = c('Visitor.Neutral', 'Home.Neutral'))
  games <- nrow(matchups)
  source('/cloud/project/predict_game.R')
  

  for(i in 1:games){
    home = matchups[['Home.Neutral']][i]
    away = matchups[['Visitor.Neutral']][i]
    cat(paste("\nHome:", home,"Away:", away))
    #ENTER SPREAD AS POSTED
    spread <- as.numeric(readline(prompt = "Enter Spread: "))
    take = predict_game(home, away, spread)
  }
}
