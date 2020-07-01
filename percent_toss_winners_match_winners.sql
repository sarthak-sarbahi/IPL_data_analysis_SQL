-- Total number of matches where team winning toss wins the match
DECLARE @toss_winner_win FLOAT
SET @toss_winner_win = (SELECT COUNT(*) FROM matches WHERE toss_winner=winner)
-- Total matches played
DECLARE @total_matches_played FLOAT
SET @total_matches_played = (SELECT COUNT(*) FROM matches)
-- Percentage of matches where team winning toss wins the match
SELECT ROUND(@toss_winner_win/@total_matches_played,2)*100 AS Overall;

DECLARE @season_one INT SET @season_one=2008
DECLARE @season_two INT SET @season_two=2009
DECLARE @season_three INT SET @season_three=2010
DECLARE @season_four INT SET @season_four=2011
DECLARE @season_five INT SET @season_five=2012
DECLARE @season_six INT SET @season_six=2013
DECLARE @season_seven INT SET @season_seven=2014
DECLARE @season_eight INT SET @season_eight=2015
DECLARE @season_nine INT SET @season_nine=2016
DECLARE @season_ten INT SET @season_ten=2017

-- Percentage of matches where team winning toss wins the match in 2008

SELECT dbo.PercentTossWin (@season_one) AS season_one
SELECT dbo.PercentTossWin (@season_two) AS season_two
SELECT dbo.PercentTossWin (@season_three) AS season_three
SELECT dbo.PercentTossWin (@season_four) AS season_four
SELECT dbo.PercentTossWin (@season_five) AS season_five
SELECT dbo.PercentTossWin (@season_six) AS season_six
SELECT dbo.PercentTossWin (@season_seven) AS season_seven
SELECT dbo.PercentTossWin (@season_eight) AS season_eight
SELECT dbo.PercentTossWin (@season_nine) AS season_nine
SELECT dbo.PercentTossWin (@season_ten) AS season_ten
