library(RSQLite)
library(dplyr)

database_path <- 'database.sqlite'
conn <- dbConnect(RSQLite::SQLite(), database_path)

# List all tables in the SQLite database
tables <- dbListTables(conn)

# For each table, list all columns
for (table in tables) {
  cat("Table:", table, "\n")
  cat("Columns:", toString(dbListFields(conn, table)), "\n\n")
}

query <- "SELECT * FROM Match"
matches <- dbGetQuery(conn, query)

# Disconnect
dbDisconnect(conn)

matches_cleaned <- matches %>%
  dplyr::select(id, season, home_team_api_id, away_team_api_id, home_team_goal, away_team_goal)

write_csv(matches_cleaned, "matches_cleaned.csv")