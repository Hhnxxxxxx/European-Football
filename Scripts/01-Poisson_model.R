# Model for home team goals
home_goals_model <- glm(home_team_goal ~ home_team_api_id + away_team_api_id, 
                        family = poisson(link = "log"), data = matches_cleaned)

# Model for away team goals
away_goals_model <- glm(away_team_goal ~ home_team_api_id + away_team_api_id, 
                        family = poisson(link = "log"), data = matches_cleaned)

# Examine the summary of the model to see the estimated parameters
summary(home_goals_model)
summary(away_goals_model)

saveRDS(home_goals_model, file = "home_goals_model.rds")
saveRDS(away_goals_model, file = "away_goals_model.rds")