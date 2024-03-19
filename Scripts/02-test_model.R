# Calculate residual.
home_residuals <- residuals(home_goals_model, type = "pearson")
away_residuals <- residuals(away_goals_model, type = "pearson")

# Calculate variance.
home_residuals_var <- var(home_residuals)
away_residuals_var <- var(away_residuals)

# Calculate resicual mean.
home_residuals_mean <- mean(home_residuals^2)
away_residuals_mean <- mean(away_residuals^2)

home_chisq <- sum(home_residuals^2)
away_chisq <- sum(away_residuals^2)

home_df <- nrow(matches_cleaned) - length(coef(home_goals_model))
away_df <- nrow(matches_cleaned) - length(coef(away_goals_model))

# Calculate p-value.
home_pvalue <- pchisq(home_chisq, home_df, lower.tail = FALSE)
away_pvalue <- pchisq(away_chisq, away_df, lower.tail = FALSE)

home_overdispersion <- home_residuals_var > 1
away_overdispersion <- away_residuals_var > 1