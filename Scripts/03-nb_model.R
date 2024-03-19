home_goals_nb_model <- glm.nb(home_team_goal ~ home_team_api_id + away_team_api_id,
                              data = matches_cleaned)
away_goals_nb_model <- glm.nb(away_team_goal ~ home_team_api_id + away_team_api_id,
                              data = matches_cleaned)

saveRDS(home_goals_nb_model, file = "home_goals_nb_model.rds")
saveRDS(away_goals_nb_model, file = "away_goals_nb_model.rds")