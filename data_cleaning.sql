-- Substitue for missing values in deliveries table
UPDATE deliveries
SET player_dismissed = ISNULL(player_dismissed,'None')
WHERE player_dismissed IS NULL;
UPDATE deliveries
SET dismissal_kind = ISNULL(dismissal_kind,'None')
WHERE dismissal_kind IS NULL;
UPDATE deliveries
SET fielder = ISNULL(fielder,'None')
WHERE fielder IS NULL;

-- Substitue for missing values in matches table
UPDATE matches
SET city = ISNULL(city,'Dubai')
WHERE city IS NULL;
UPDATE matches
SET winner = ISNULL(winner,'None')
WHERE winner IS NULL;
UPDATE matches
SET player_of_match = ISNULL(player_of_match,'None')
WHERE player_of_match IS NULL;

/* Count of rows where umpire3 is missing 
SELECT COUNT(*)
FROM matches
WHERE umpire3 IS NULL;
-- Count of all rows in matches
SELECT COUNT(*)
FROM matches;
-- Drop umpire3 column
ALTER TABLE matches
DROP COLUMN umpire3;*/

-- Check for all teams and rename duplicates if any ('Rising Pune Supergiants' to 'Rising Pune Supergiant')
UPDATE matches
SET team1=REPLACE(team1,'Rising Pune Supergiants','Rising Pune Supergiant')
WHERE team1='Rising Pune Supergiants';
UPDATE matches
SET team2=REPLACE(team2,'Rising Pune Supergiants','Rising Pune Supergiant')
WHERE team2='Rising Pune Supergiants';
UPDATE matches
SET toss_winner=REPLACE(toss_winner,'Rising Pune Supergiants','Rising Pune Supergiant')
WHERE toss_winner='Rising Pune Supergiants';
UPDATE matches
SET winner=REPLACE(winner,'Rising Pune Supergiants','Rising Pune Supergiant')
WHERE winner='Rising Pune Supergiants';
UPDATE deliveries
SET batting_team=REPLACE(batting_team,'Rising Pune Supergiants','Rising Pune Supergiant')
WHERE batting_team='Rising Pune Supergiants';
UPDATE deliveries
SET bowling_team=REPLACE(bowling_team,'Rising Pune Supergiants','Rising Pune Supergiant')
WHERE bowling_team='Rising Pune Supergiants';

