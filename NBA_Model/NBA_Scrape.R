#install.packages('rvest' <- uncomment if package is not installed on your device
library(rvest)

Schedule_Names <- read_html('https://www.basketball-reference.com/leagues/NBA_2022_games-november.html') %>%
  html_nodes('.poptip') %>%
  html_text()

## Must update url every month to get correct schedule for current month
Schedule <-  read_html('https://www.basketball-reference.com/leagues/NBA_2022_games-november.html') %>%
  html_element('tbody') %>%
  html_table()


names(Schedule) <- Schedule_Names[1:10]
#Schedule$Date <- read_html('https://www.basketball-reference.com/leagues/NBA_2022_games-november.html') %>%
 # html_nodes('date_game') %>%
  #html_text()

Schedule <- data.frame(Schedule)

Stats_HTML <- read_html('https://www.basketball-reference.com/leagues/NBA_2022.html#per_game-team') 
Stats_Tables <- html_table(Stats_HTML)
Stats_PerGame <- data.frame(Stats_Tables[5])
stats <- subset(Stats_PerGame, select=c('Team', 'FG.', 'X3P.', 'FT.', 'TRB', 'AST', 'TOV'))
names(stats) <-  c('Team', "AVG_FG", "AVG_FT", "AVG_FG3", "AVG_AST", "AVG_REB", "AVG_TOV")


Injury_HTML <- read_html('https://www.basketball-reference.com/friv/injuries.fcgi#injuries')
injuries <- data.frame(html_table(Injury_HTML))