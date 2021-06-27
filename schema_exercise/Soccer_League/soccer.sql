DROP DATABASE IF EXISTS soccer_db;

CREATE DATABASE soccer_db;

\c soccer_db


CREATE TABLE leagues (
    
    id SERIAL PRIMARY KEY, 
    name TEXT, 
    NOT NULL
    
);

CREATE TABLE teams (
    
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL, 
    league INTEGER REFERENCES leagues (id) NOT NULL
    
);

CREATE TABLE referees (
    
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL
    
);

CREATE TABLE players (
    
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL, 
    team INTEGER REFERENCES teams (id) NOT NULL, 
    league INTEGER REFERENCES leagues (id) NOT NULL
    
);

CREATE TABLE seasons (
    
    id SERIAL PRIMARY KEY, 
    start DATE NOT NULL, 
    end DATE NOT NULL
    
);

CREATE TABLE games (
    
    id SERIAL PRIMARY KEY, 
    team1 INTEGER REFERENCES teams (id) NOT NULL, 
    team2 INTEGER REFERENCES teams (id) NOT NULL, 
    winner INTEGER REFERENCES teams (id)
    
);

CREATE TABLE games_refs (
    
    id SERIAL PRIMARY KEY, 
    game INTEGER REFERENCES games (id) NOT NULL, 
    ref INTEGER REFERENCES referees (id) NOT NULL
    
);

CREATE TABLE goals (
    
    id SERIAL PRIMARY KEY, 
    game INTEGER REFERENCES games (id) NOT NULL, 
    team INTEGER REFERENCES teams (id) NOT NULL, 
    player INTEGER REFERENCES players (id) NOT NULL
    
);


INSERT INTO leagues 
(name) 
VALUES 
  ('Dallas');

INSERT INTO teams 
(name, league) 
VALUES 
  ('Gators', 1),
  ('Wild Cats', 1),
  ('Vikings', 1),
  ('Bulldogs', 1);

INSERT INTO referees 
(name) 
VALUES 
  ('Jim Thorne'),
  ('Rebecca Little'),
  ('Damian Routh'),
  ('Heather Moody');

INSERT INTO players 
(name, team, league) 
VALUES 
  ('Samantha Dill', 1, 1),
  ('Jennifer Beal', 1, 1),
  ('Shane Troy', 1, 1),
  ('Ingrid Kantola', 2, 1),
  ('Rita Olsen', 2, 1),
  ('Amanda Mangonee', 2, 1),
  ('Katie Hinds', 3, 1),
  ('Ellen Ford', 3, 1),
  ('Josephine Kelly', 3, 1),
  ('Monica Garcia', 4, 1),
  ('Rachel Evers', 4, 1),
  ('Danica Patrick', 4, 1);

INSERT INTO seasons 
(start, end) 
VALUES 
  (14/03/2020, 14/10/2020);

INSERT INTO games 
(team1, team2, winner) 
VALUES 
  (1, 2, 2),
  (1, 3, 1),
  (1, 4, 1),
  (2, 1, 2),
  (2, 3, 2),
  (2, 4, 4),
  (3, 1, 3),
  (3, 2, 3),
  (3, 4, 4),
  (4, 1, 1),
  (4, 2, 2),
  (4, 3, 4);

INSERT INTO games_refs 
(game, ref) 
VALUES 
  (1, 1),
  (1, 4),
  (2, 2),
  (2, 3),
  (3, 3),
  (3, 1),
  (4, 4),
  (4, 2),
  (5, 1),
  (5, 3),
  (6, 2),
  (6, 3),
  (7, 3),
  (7, 4),
  (8, 1),
  (8, 4),
  (9, 1),
  (9, 2),
  (10, 2),
  (10, 4),
  (11, 1),
  (11, 3),
  (12, 3),
  (12, 2);

INSERT INTO goals 
(game, team, player) 
VALUES 
  (1, 2, 3),
  (1, 1, 1),
  (1, 2, 2),
  (2, 1, 1),
  (2, 1, 2),
  (2, 1, 3),
  (2, 1, 2),
  (3, 1, 3),
  (4, 2, 1),
  (4, 2, 1),
  (5, 2, 3),
  (5, 3, 3),
  (5, 2, 1),
  (6, 4, 2),
  (6, 4, 3),
  (7, 3, 2),
  (7, 1, 1),
  (7, 3, 3),
  (7, 3, 1),
  (8, 3, 1),
  (8, 3, 3),
  (8, 3, 2),
  (9, 4, 1),
  (10, 4, 3),
  (10, 1, 2),
  (10, 1, 2),
  (11, 2, 2),
  (11, 2, 2),
  (11, 2, 1),
  (11, 2, 3),
  (11, 4, 1),
  (11, 4, 1),
  (11, 4, 1),
  (12, 4, 1),
  (12, 3, 3),
  (12, 4, 1),
  (12, 4, 3),
  (12, 3, 2);








