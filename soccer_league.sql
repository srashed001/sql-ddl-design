DROP DATABASE IF EXISTS soccer_league_db; 

CREATE DATABASE soccer_league_db;

\c soccer_league_db; 

CREATE TABLE league_seasons (
    id SERIAL PRIMARY KEY, 
    start_date DATE NOT NULL, 
    end_date DATE NOT NULL
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL, 
    location TEXT NOT NULL, 
    standing INTEGER NOT NULL,
    season_id INTEGER REFERENCES league_seasons ON DELETE SET NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL, 
    birthday DATE NOT NULL, 
    team_id INTEGER REFERENCES teams ON DELETE SET NULL 
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL 
);
CREATE TABLE matches (
    id SERIAL PRIMARY KEY, 
    season_id INTEGER REFERENCES league_seasons ON DELETE SET NULL, 
    location TEXT NOT NULL, 
    date DATE NOT NULL, 
    home_team INTEGER REFERENCES teams ON DELETE SET NULL, 
    away_team INTEGER REFERENCES teams ON DELETE SET NULL, 
    home_team_goals INTEGER DEFAULT 0, 
    away_team_goals INTEGER DEFAULT 0, 
    winning_team INTEGER REFERENCES teams DEFAULT NULL,
    losing_team INTEGER REFERENCES teams DEFAULT NULL,
    primary_referee INTEGER REFERENCES referees ON DELETE SET NULL, 
    ass_referee_1 INTEGER REFERENCES referees ON DELETE SET NULL, 
    ass_referee_2 INTEGER REFERENCES referees ON DELETE SET NULL

);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY, 
    match_id INTEGER REFERENCES matches ON DELETE SET NULL, 
    player_id INTEGER REFERENCES players ON DELETE CASCADE
     
);