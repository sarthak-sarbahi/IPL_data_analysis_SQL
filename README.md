# IPL Data Analysis using SQL

## Objective
Extract insights from the IPL dataset from 2008 and 2017 
## Data Source
Kaggle: https://www.kaggle.com/manasgarg/ipl
## Technologies used
* Programming Language: **T-SQL (SQL Server)**
* Software used: **Microsoft SQL Server Management Studio 18**
## T-SQL functionalities used
* SELECT, FROM, WHERE, GROUP BY & ORDER BY statements
* ALTER statement
* UPDATE statement
* ALTER TABLE statement
* Aggregate functions - SUM, COUNT, etc.
* INNER JOIN, UNION ALL, etc.
* User defined functions (**percent_toss_win_function.sql**)
* Window functions
* Common Table Expressions
## Dataset
**The dataset consisted of two .CSV files:**
* **deliveries.csv**
  * match_id: Unique match ids
  * inning: Tells if the first set of batting was going on or second. 1: First Innings 2: Second Innings
  * batting_team: The team name which is currently batting
  * bowling_team: The team name which is currently bowling
  * over: Describe the current over number
  * ball: Describe the current bowl no of the current over
  * batsman: Name of the batsman on striking end
  * non_striker: Name of the batsman on non-striking end
  * bowler: Name of the bowler
  * is_super_over: Boolean value to determine if the over is super-over
  * wide_runs: Total wide runs on the delivery
  * bye_runs: Total bye runs on the delivery
  * legbye_runs: Total legbye runs on the delivery
  * noball_runs: Total noball runs on the delivery
  * penalty_runs: Total penalty runs on the delivery
  * batsman_runs: Total batsman runs on the delivery
  * extra_runs: Total extra runs on the delivery
  * total_runs: Total runs on the delivery
  * player_dismissed: Name of the player dismissed
  * dismissal_kind: Dismissal type
  * fielder: Name of the fielder
* **matches.csv**
  * id: Unique match id
  * season: IPL season
  * city: City where the match was conducted
  * date: Match date
  * team1: First team participating in the match
  * team2: Second team participating in the match
  * toss_winner: Team that wins the toss
  * toss_decision: Toss decision (bat or field)
  * result: Result of the match
  * dl_applied: Duckworth Lewis method
  * winner: The team that won the match
  * win_by_runs: Win by runs margin
  * win_by_wickets: Win by wickets margin
  * player_of_match: Player of the match
  * venue: Venue of the match
  * umpire1: First umpire of the match
  * umpire2: Second umpire of the match
  * umpire3: Third umpire of the match
## Methodology
* **Data Cleaning** (**change_datatypes.sql** & **data_cleaning.sql**)
  * Update columns with correct datatypes 
  * Substitue for missing values in deliveries table
  * Substitue for missing values in matches table
  * Drop umpire3 column as it contained only missing values
  * Check for all teams and rename duplicates if any ('Rising Pune Supergiants' to 'Rising Pune Supergiant')
* **Exploratory Data Analysis** (**exploratory_data_analysis.sql**, **percent_toss_win_function.sql** & **percent_toss_winners_match_winners.sql**)
## Insights
The insights that were obtained have been recorded in the **IPL data analysis insights.pdf** file. For a visually appealing report, please refer **IPL_Project_Report.pdf**.
