-- Function to determine percentage of matches won where team winning toss wins the match
CREATE FUNCTION PercentTossWin (@season_year INT)
RETURNS NUMERIC AS BEGIN
RETURN (
SELECT ROUND(((CAST((SELECT COUNT(*) FROM matches WHERE toss_winner=winner AND season=@season_year) AS FLOAT)/CAST((SELECT COUNT(*) FROM matches WHERE season=@season_year)AS FLOAT))*100),0)
) END;