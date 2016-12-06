-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Create tournament database
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;

-- Connect to tournament database
\c tournament;


-- Crete Players table 
CREATE TABLE IF NOT EXISTS "players" 
(
    "id"   SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL	
);


-- Create Matches table
CREATE TABLE IF NOT EXISTS "matches" 
(
    "winner"   INTEGER REFERENCES players(id),
    "loser"    INTEGER REFERENCES players(id),
    PRIMARY KEY (winner,loser)
);

-- We will populate a few views in order to populate standings

-- Create games_won view to calcuşate wins for each player
DROP VIEW IF EXISTS games_won;
CREATE VIEW games_won AS 
SELECT p.id, p.name, count(m.winner) wins 
       FROM players p 
LEFT JOIN matches m ON p.id = m.winner 
GROUP BY p.id;


DROP VIEW IF EXISTS games_lost;
CREATE VIEW games_lost AS
SELECT p.id, p.name, count(m.loser) as loses
       FROM players p
LEFT JOIN matches m ON p.id = m.loser 
GROUP BY p.id;


DROP VIEW IF EXISTS standings;
CREATE VIEW standings AS 
SELECT w.id, w.name, w.wins, w.wins + l.loses as matches 
       FROM games_won w
JOIN games_lost l ON w.id = l.id 
ORDER BY wins DESC; 





