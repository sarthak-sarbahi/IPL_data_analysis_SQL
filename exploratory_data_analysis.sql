-- View head of deliveries table 
SELECT TOP(10) *
FROM deliveries;

-- View head of matches table 
SELECT TOP(10) *
FROM matches;

-- Total number of matches played in IPL editions between 2008 and 2017
SELECT DISTINCT COUNT(id)
FROM matches;

-- Team wins (count) across all seasons
SELECT season,winner AS Team,COUNT(winner) AS Wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner,season
ORDER BY Wins DESC;

-- Team wins - total count
SELECT winner AS Team,COUNT(winner) AS Wins
FROM matches
WHERE winner IS NOT NULL
GROUP BY winner
ORDER BY Wins DESC;

-- Match winning on batting first vs fielding first (after winning the toss)
SELECT season,toss_decision,COUNT(toss_decision) AS wins, SUM(COUNT(toss_decision)) OVER (PARTITION BY season)  AS season_wins_total, ROUND(CAST(COUNT(toss_decision) AS FLOAT)/CAST((SUM(COUNT(toss_decision)) OVER (PARTITION BY season))AS FLOAT),2) AS percent_wins
FROM matches
WHERE toss_winner=winner
GROUP BY toss_decision,season
ORDER BY percent_wins DESC;

-- Total number of matches in all seasons
SELECT season, COUNT(id) AS no_of_matches
FROM matches
GROUP BY season
ORDER BY season;

-- Tie matches
SELECT *
FROM matches
WHERE result = 'tie';

-- Matches were decision was determined by DL Method
SELECT *
FROM matches
WHERE dl_applied=1;
-- Teams that have won matches determined by DL Method
SELECT winner, COUNT(winner) AS toal_mataches_won
FROM matches
WHERE dl_applied=1
GROUP BY winner
ORDER BY toal_mataches_won DESC;

-- Max win by runs margins for all teams across all years
SELECT season, winner, MAX(win_by_runs) AS max_win_by_runs
FROM matches
GROUP BY season, winner
ORDER BY max_win_by_runs DESC;

-- Max win by wickets margins for all teams across all years
SELECT season, winner, MAX(win_by_wickets) AS max_win_by_wickets
FROM matches
GROUP BY season, winner
ORDER BY max_win_by_wickets DESC;

-- Most player of the match awards
SELECT DISTINCT player_of_match AS player, COUNT(player_of_match) AS total_awards
FROM matches
GROUP BY player_of_match
ORDER BY total_awards DESC;

-- List of all umpires who have made appearance in IPL editions between 2008 and 2017 and their number of match appearances
WITH umpire_table(umpire_name,match_appearances) AS (SELECT umpire1 AS umpire_name, COUNT(umpire1) AS match_appearances
FROM matches
WHERE umpire1 IS NOT NULL
GROUP BY umpire1
UNION ALL
SELECT umpire2 AS umpire_name, COUNT(umpire2) AS match_appearances
FROM matches
WHERE umpire2 IS NOT NULL
GROUP BY umpire2)
SELECT umpire_name, SUM(match_appearances) AS match_appearances
FROM umpire_table
GROUP BY umpire_name
ORDER BY match_appearances DESC; 

-- Overall most runs by batsman (Between 2008 and 2017)
SELECT batsman, SUM(batsman_runs) AS total_runs
FROM deliveries
GROUP BY batsman
ORDER BY total_runs DESC;

-- Overall most runs by any batsman in a single season
SELECT m.season, d.batsman, SUM(d.batsman_runs) AS total_runs
FROM deliveries d
INNER JOIN matches m
ON d.match_id = m.id
GROUP BY m.season, d.batsman
ORDER BY total_runs DESC;

-- Players with most runs in every season (Orange Cap winners!)
WITH players_table (season, batsman, total_runs, row_num) AS
(SELECT m.season, d.batsman, SUM(d.batsman_runs) AS total_runs, ROW_NUMBER() OVER (PARTITION BY season ORDER BY SUM(d.batsman_runs) DESC) AS row_num
FROM deliveries d
INNER JOIN matches m
ON d.match_id = m.id
GROUP BY m.season, d.batsman)
SELECT season, batsman, total_runs	
FROM players_table
WHERE row_num = 1;

-- Most fours by a batsman in IPL between 2008 and 2017
SELECT batsman, COUNT(batsman_runs) AS fours
FROM deliveries
WHERE batsman_runs = 4
GROUP BY batsman
ORDER BY fours DESC;

-- Maximum fours by players (season wise)
WITH batsman_fours (season, batsman, fours, row_num) AS
(SELECT season, batsman, COUNT(batsman_runs) AS fours, ROW_NUMBER() OVER (PARTITION BY season ORDER BY COUNT(batsman_runs) DESC) AS row_num
FROM deliveries
INNER JOIN matches
ON deliveries.match_id = matches.id
WHERE batsman_runs = 4
GROUP BY season, batsman)
SELECT season, batsman, fours
FROM batsman_fours
WHERE row_num = 1;

-- Most six by a batsman in IPL between 2008 and 2017
SELECT batsman, COUNT(batsman_runs) AS sixes
FROM deliveries
WHERE batsman_runs = 6
GROUP BY batsman
ORDER BY sixes DESC;

-- Maximum sixes by players (season wise)
WITH batsman_sixes (season, batsman, sixes, row_num) AS
(SELECT season, batsman, COUNT(batsman_runs) AS sixes, ROW_NUMBER() OVER (PARTITION BY season ORDER BY COUNT(batsman_runs) DESC) AS row_num
FROM deliveries
INNER JOIN matches
ON deliveries.match_id = matches.id
WHERE batsman_runs = 6
GROUP BY season, batsman)
SELECT season, batsman, sixes
FROM batsman_sixes
WHERE row_num = 1;

-- Bowlers with maximum wickets
SELECT bowler, COUNT(*) AS total_wickets
FROM deliveries
WHERE player_dismissed NOT IN ('None') AND dismissal_kind IN (SELECT DISTINCT dismissal_kind
FROM deliveries
WHERE dismissal_kind NOT IN ('None','retired hurt','run out','obstructing the field')
)
GROUP BY bowler
ORDER BY total_wickets DESC;

-- Players with maximum wickets in each season (Purple Cap winners!)
WITH bowler_wickets (season, bowler, total_wickets, row_num) AS
(SELECT season, bowler, COUNT(*) AS total_wickets, ROW_NUMBER() OVER (PARTITION BY season ORDER BY COUNT(*) DESC) AS row_num
FROM deliveries
INNER JOIN matches
ON deliveries.match_id = matches.id
WHERE player_dismissed NOT IN ('None') AND dismissal_kind IN (SELECT DISTINCT dismissal_kind
FROM deliveries
WHERE dismissal_kind NOT IN ('None','retired hurt','run out','obstructing the field')
)
GROUP BY season, bowler)
SELECT season, bowler, total_wickets
FROM bowler_wickets
WHERE row_num = 1;

-- Bowler with maximum wides
SELECT bowler, COUNT(wide_runs) AS wides
FROM deliveries
WHERE wide_runs > 0
GROUP BY bowler
ORDER BY wides DESC;

-- Bowlers with maximum wides season wise
WITH bowler_wides (season, bowler, wides, row_num) AS (
SELECT season, bowler, COUNT(wide_runs) as wides, ROW_NUMBER() OVER (PARTITION BY season ORDER BY COUNT(wide_runs) DESC) AS row_num
FROM deliveries
INNER JOIN matches
ON deliveries.match_id = matches.id
WHERE wide_runs > 0
GROUP BY season, bowler)
SELECT season, bowler, wides
FROM bowler_wides
WHERE row_num = 1;

-- Most catches by a player as a fielder or wicketkeeper
SELECT fielder AS catcher, COUNT(*) AS catches
FROM deliveries
WHERE dismissal_kind = 'caught' AND player_dismissed NOT IN ('None')
GROUP BY fielder
ORDER BY catches DESC;

-- Most caught and bowled by a bowler
SELECT bowler AS catcher, COUNT(*) AS catches
FROM deliveries
WHERE dismissal_kind = 'caught and bowled'
GROUP BY bowler
ORDER BY catches DESC;

-- Cities which have hosted the maximum numer of matches in IPL editions between 2008 and 2017
SELECT DISTINCT city, COUNT(*) AS matches_num
FROM matches
GROUP BY city
ORDER BY matches_num DESC;

-- Venue which have hosted the maximum numer of matches in IPL editions between 2008 and 2017
SELECT DISTINCT venue, COUNT(*) AS matches_num
FROM matches
GROUP BY venue
ORDER BY matches_num DESC;




