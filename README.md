# NBA_Spread_Model
NBA prediction model using the glm package to use lasso regression in binary classification to pick point spread winners.
To test in Rstudio cloud please follow this link https://rstudio.cloud/project/3156938
If not testing in cloud, change source in scripts to corresponding file locations on your device.

To predict all games of the day use predict_today function.
To use predict_today function first source the R file then enter predict_today(date).
Example: predict_today('Tue, Oct 19, 2021').
Then enter the home team spreads as prompted.

To predict a single game use predict_game function.
To use predict_game function first source the R file then enter predict_game('home team', 'away team', 'home team spread').

Example: predict_game('New York Knicks', 'Philadelphia 76ers', -2) (-2 referring to Knicks point spread).

Enjoy!
