-- Change data types of deliveries columns
ALTER TABLE deliveries
ALTER COLUMN match_id INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN inning INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN over_number INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN ball INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN is_super_over INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN wide_runs INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN bye_runs INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN legbye_runs INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN noball_runs INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN penalty_runs INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN batsman_runs INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN extra_runs INT NOT NULL;
ALTER TABLE deliveries
ALTER COLUMN total_runs INT NOT NULL;
-- Change data types of matches columns
ALTER TABLE matches
ALTER COLUMN id INT NOT NULL;
ALTER TABLE matches
ALTER COLUMN dl_applied INT NOT NULL;
ALTER TABLE matches
ALTER COLUMN win_by_runs INT NOT NULL;
ALTER TABLE matches
ALTER COLUMN win_by_wickets INT NOT NULL;
